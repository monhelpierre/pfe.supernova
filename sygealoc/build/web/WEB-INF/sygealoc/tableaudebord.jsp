<%@page import="java.util.ArrayList"%>
<%@page import="supernova.pfe.dao.D_Vehicule"%>
<%@page import="supernova.pfe.model.Vehicule"%>
<%@page import="supernova.pfe.dao.D_Location"%>
<%@page import="supernova.pfe.model.Location"%>
<%@page import="supernova.pfe.dao.D_Auth"%>
<%@include file="part/firstpart.jsp" %>

<%  
    if(m!=null && m.PSEUDO()!=null){
        MySession.setPosition(m.PSEUDO(), "tableaudebord");   
    }    
    ArrayList<Vehicule> v = new D_Vehicule().get();
    int nbemployee = new D_Auth().get().size();
    int nbuser = new D_Auth().getUsers().size();
    int pfu = (nbemployee / nbuser) * 100;
    int pfp = 100 - pfu;
    int nbloc = new D_Auth().getTotalFrom("location");
    int nbclient = new D_Auth().getTotalFrom("client");
    int nbfournisseur = new D_Auth().getTotalFrom("fournisseur");
    int nblate = 0;
    int nbprogress = 0;
    int nbrepar = 0;
    int nbveh = 0;

    for (Location lc : new D_Location().get()) {
        if (!lc.ETAT().equals("Actif")) {
            nblate++;
        } else {
            nbprogress++;
        }
    }
    int nbvfree = 0;
    for (Vehicule ve : v) {
        if (ve.ETAT().equals("En reparation")) {
            nbrepar++;
        }
        nbveh++;
        if (ve.ETAT().equals("Libre")) {
            nbvfree++;
        }
    }
    int pve = (nblate * 100) / (nbveh==0?1:nbveh);
    int pvrepar = (nbrepar * 100) / (nbveh==0?1:nbveh);
    int pvfree = (nbvfree * 100) / (nbveh==0?1:nbveh);
    int pvprogress = (nbprogress * 100) / (nbloc==0?1:nbloc);
%>

<div class="content-body"><!-- Revenue, Hit Rate & Deals -->
    <div class="row">
        <div class="col-xl-6 col-12">
            <div class="card" style="display:none">
                <div class="card-header">
                    <h4 class="card-title">Statistiques</h4>
                    <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                    <div class="heading-elements">
                        <ul class="list-inline mb-0">
                        </ul>
                    </div>
                </div>
                <div class="card-content collapse show" >
                    <div class="card-body pt-0">
                        <div class="chartjs">
                            <canvas id="thisYearRevenue" width="400" class="position-absolute"></canvas>
                            <canvas id="lastYearRevenue" width="400"></canvas>
                        </div>
                    </div>                    
                </div>
            </div>

            <div class="card" height="400">
                <div class="card-content">
                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="4"></li>
                        </ol>
                        
                        <div class="carousel-inner" role="listbox">
                            <div class="carousel-item active">
                                <img src="${pageContext.request.contextPath}/assets/images/carousel/01.jpg" class="d-block w-100" alt="First slide">
                            </div>
                            <div class="carousel-item">
                                <img src="${pageContext.request.contextPath}/assets/images/carousel/02.jpg" class="d-block w-100" alt="Second slide">
                            </div>
                            <div class="carousel-item">
                                <img src="${pageContext.request.contextPath}/assets/images/carousel/03.jpg" class="d-block w-100" alt="Third slide">
                            </div>
                            <div class="carousel-item">
                                <img src="${pageContext.request.contextPath}/assets/images/carousel/04.jpg" class="d-block w-100" alt="Fourth slide">
                            </div>
                            <div class="carousel-item">
                                <img src="${pageContext.request.contextPath}/assets/images/carousel/05.jpg" class="d-block w-100" alt="Fifth slide">
                            </div>
                        </div>
                            
                        <a class="carousel-control-prev" href="#carousel-example-generic" role="button" data-slide="prev">
                            <span class="la la-angle-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carousel-example-generic" role="button" data-slide="next">
                            <span class="la la-angle-right icon-next" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-6 col-12">
            <div class="row">
                <div class="col-md-6 col-12">
                    <div class="card pull-up">
                        <div class="card-header bg-hexagons">
                            <h4 class="card-title">Chart concernant le pourcentage de la location des vehicules</h4>
                            <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                            <div class="heading-elements">
                                <ul class="list-inline mb-0">
                                </ul>
                            </div>
                        </div>
                        <div class="card-content collapse show bg-hexagons">
                            <div class="card-body pt-0">
                                <div class="chartjs">
                                    <canvas id="hit-rate-doughnut" height="275"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-12">
                    <div class="card pull-up">
                        <div class="card-content collapse show bg-gradient-directional-danger">
                            <div class="card-body bg-hexagons-daner">
                                <h4 class="card-title white">Chart concernant le pourcentage de l'etat du nombre de locations
                                </h4>
                                <div class="chartjs">
                                    <canvas id="deals-doughnut" height="275"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 col-12">
                    <div class="card pull-up">
                        <div class="card-content">
                            <div class="card-body">
                                <div class="media d-flex">
                                    <div class="media-body text-left">
                                        <h6 class="text-muted">Les locations </h6>
                                        <h3><%=nbloc < 10 ? "0" + nbloc : nbloc%></h3>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="icon-trophy success font-large-2 float-right"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-12">
                    <div class="card pull-up">
                        <div class="card-content">
                            <div class="card-body">
                                <div class="media d-flex">
                                    <div class="media-body text-left">
                                        <h6 class="text-muted">Les clients</h6>
                                        <h3><%=nbclient < 10 ? "0" + nbclient : nbclient%></h3>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="icon-call-in danger font-large-2 float-right"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-12 col-md-3">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Location & Vehicule</h4>
                    <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                    <div class="heading-elements">
                        <ul class="list-inline mb-0">
                        </ul>
                    </div>
                </div>
                <div class="card-content collapse show">
                    <div class="card-body pt-0">
                        <p>En retard/annulee <span class="float-right text-bold-600"><%=nblate < 10 ? "0" + nblate : nblate%></span></p>
                        <div class="progress progress-sm mt-1 mb-0 box-shadow-1">
                            <div class="progress-bar bg-gradient-x-danger" role="progressbar" style="width: <%=pve%>%" aria-valuenow="<%=pve%>%"
                                 aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <p class="pt-1">Vehicule en reparation <span class="float-right"><span class="text-bold-600"><%=nbrepar < 10 ? "0" + nbrepar : nbrepar%></span></span>
                        </p>
                        <div class="progress progress-sm mt-1 mb-0 box-shadow-1">
                            <div class="progress-bar bg-gradient-x-success" role="progressbar" style="width: <%=pvrepar%>%" aria-valuenow="<%=pvrepar%>"
                                 aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12 col-md-3">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Vehicule & Details</h4>
                    <div class="heading-elements">
                        <ul class="list-inline mb-0">
                            <li><a href="stock">voir</a></li>
                        </ul>
                    </div>
                </div>
                <div class="card-content collapse show">
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table mb-0">
                                <tbody>
                                    <% int i = 0;
                                        for (Vehicule vc : v) {
                                            i++;%>
                                    <tr>
                                        <th scope="row" class="<%=(i == 1) ? "border-top-0" : ""%>"><%=vc.MARQUE()%></th>
                                        <td class="<%=(i == 1) ? "border-top-0" : ""%> text-right"><%=vc.NUMPLAQUE()%></td>
                                    </tr>
                                    <% if (i == 3) {
                                                break;
                                            }
                                        }%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12 col-md-6">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title text-center">Personnel & Utilisateur</h4>
                </div>
                <div class="card-content collapse show">
                    <div class="card-body pt-0">
                        <div class="row">
                            <div class="col-md-6 col-12 border-right-blue-grey border-right-lighten-5 text-center">
                                <h4 class="font-large-2 text-bold-400"><%=nbemployee < 10 ? "0" + nbemployee : nbemployee%></h4>
                                <p class="blue-grey lighten-2 mb-0">Personnel</p>
                            </div>
                            <div class="col-md-6 col-12 text-center">
                                <h4 class="font-large-2 text-bold-400"><%=nbuser < 10 ? "0" + nbuser : nbuser%></h4>
                                <p class="blue-grey lighten-2 mb-0">Utilisateur</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
</div>
</div>

<%@include file="part/lastpart.jsp" %>
<script src="${pageContext.request.contextPath}/assets/vendors/js/charts/chart.min.js"></script>
<script>
    $(window).on("load",
            (function () {
                Chart.defaults.derivedLine = Chart.defaults.line;
                var t = Chart.controllers.line.prototype.draw,
                        e = Chart.controllers.line.extend(
                                {draw: function () {
                                        t.apply(this, arguments);
                                        var e = this.chart.chart.ctx, o = e.stroke;
                                        e.stroke = function () {
                                            e.save(),
                                                    e.shadowColor = "#ffb6c0",
                                                    e.shadowBlur = 30,
                                                    e.shadowOffsetX = 0,
                                                    e.shadowOffsetY = 20,
                                                    o.apply(this, arguments),
                                                    e.restore()
                                        }
                                    }});

                Chart.controllers.derivedLine = e;
                var o = document.querySelector("#thisYearRevenue").getContext("2d"),
                        a = (new Chart(o, {type: "derivedLine",
                            data: {labels: ["Lun", "Mar", "Mer", "Jeu", "Ven", "Sam", "Dim", "Lun"],
                                datasets: [{data: [5e3, 1e4, 4e3, 14500, 8e3, 18500, 8e3, 2e4],
                                        borderWidth: 4,
                                        borderColor: "#FF4961",
                                        pointBackgroundColor: "#FFF",
                                        pointBorderColor: "#FF4961",
                                        pointHoverBackgroundColor: "#FFF",
                                        pointHoverBorderColor: "#FF4961",
                                        pointRadius: 0,
                                        pointHoverRadius: 6, fill: !1}]},
                            options: {responsive: !0,
                                tooltips: {displayColors: !1,
                                    callbacks: {
                                        label: function (t, e) {},
                                        title: function () {}}},
                                legend: {display: !1}, scales: {
                                    xAxes: [{gridLines: {display: !1}}],
                                    yAxes: [{ticks: {padding: 10, stepSize: 5e3, max: 2e4, min: 0},
                                            gridLines: {display: !0, drawBorder: !1, lineWidth: 1, color: "#e9ebf5"}}]}}}),
                                document.querySelector("#lastYearRevenue").getContext("2d"));
                new Chart(a, {type: "line",
                    data: {labels: ["Lun", "Mar", "Mer", "Jeu", "Ven", "Sam", "Dim", "Lun"],
                        datasets: [{data: [7e3, 15e3, 6e3, 10500, 3e3, 11500, 4e3, 1e4],
                                borderWidth: 4, borderDash: [8, 4],
                                borderColor: "#c3c3c3",
                                pointBackgroundColor: "#FFF",
                                pointBorderColor: "#c3c3c3",
                                pointHoverBackgroundColor: "#FFF",
                                pointHoverBorderColor: "#c3c3c3",
                                pointRadius: 0, pointHoverRadius: 6, fill: !1}]},
                    options: {responsive: !0
                        , tooltips: {displayColors: !1,
                            callbacks: {label: function (t, e) {},
                                title: function () {}}},
                        legend: {display: !1}, scales: {
                            xAxes: [{gridLines: {display: !1}}],
                            yAxes: [{ticks: {padding: 10,
                                        stepSize: 5e3, max: 2e4, min: 0},
                                    gridLines: {display: !0, drawBorder: !1, zeroLineColor: "#e5e5e5"}}]}}});
                Chart.defaults.hitRateDoughnut = Chart.defaults.doughnut;
                t = Chart.controllers.doughnut.prototype.draw;
                var r = Chart.controllers.doughnut.extend({draw: function () {
                        t.apply(this, arguments);
                        var e = this.chart.chart.ctx, o = e.fill,
                                a = this.chart.width, r = this.chart.height, i = (r / 114).toFixed(2);
                        this.chart.ctx.font = i + "em Verdana", this.chart.ctx.textBaseline = "middle";

                        var l = "<%=pvfree%>%", n = Math.round((a - this.chart.ctx.measureText(l).width) / 2),
                                d = r / 2;
                        this.chart.ctx.fillStyle = "#28D094", "rtl" == $("html").data("textdirection") && (n = Math.round((a - this.chart.ctx.measureText(l).width) / 1.15)),
                                this.chart.ctx.fillText(l, n, d),
                                e.fill = function () {
                                    e.save(), e.shadowColor = "#bbbbbb", e.shadowBlur = 30,
                                            e.shadowOffsetX = 0, e.shadowOffsetY = 12, o.apply(this, arguments), e.restore()
                                }
                    }});
                var pvfree = "<%=pvfree%>"
                Chart.controllers.hitRateDoughnut = r;
                o = document.getElementById("hit-rate-doughnut"),
                        new Chart(o, {type: "hitRateDoughnut", data: {labels: ["Pourcentage de vehicules libres", "Poucentage de vehicules non-libres"],
                                datasets: [{label: "Favourite", backgroundColor: ["#28D094", "#FF4961"], data: [pvfree, 100 - pvfree]}]},
                            options: {responsive: !0, title: {display: !1}, legend: {display: !1},
                                layout: {padding: {left: 16, right: 16, top: 16, bottom: 16}},
                                cutoutPercentage: 62, animation: {animateScale: !1, duration: 2500}}});
                Chart.defaults.dealsDoughnut = Chart.defaults.doughnut;
                t = Chart.controllers.doughnut.prototype.draw;
                var i = Chart.controllers.doughnut.extend({draw: function () {
                        t.apply(this, arguments);
                        var e = this.chart.chart.ctx, o = e.fill, a = this.chart.width,
                                r = this.chart.height, i = (r / 114).toFixed(2);
                        this.chart.ctx.font = i + "em Verdana", this.chart.ctx.textBaseline = "middle";
                        var l = "<%=pvprogress%>%", n = Math.round((a - this.chart.ctx.measureText(l).width) / 2), d = r / 2;
                        this.chart.ctx.fillStyle = "#fff", "rtl" == $("html").data("textdirection") && (n = Math.round((a - this.chart.ctx.measureText(l).width) / 1.15)), this.chart.ctx.fillText(l, n, d), e.fill = function () {
                            e.save(), e.shadowColor = "#FF4961", e.shadowBlur = 30, e.shadowOffsetX = 0, e.shadowOffsetY = 12, o.apply(this, arguments), e.restore()
                        }
                    }});
                Chart.controllers.dealsDoughnut = i;
                o = document.getElementById("deals-doughnut"),
                        new Chart(o, {type: "dealsDoughnut",
                            data: {labels: ["Pourcentage de location en cours", "Pourcentage de location annulee/retard"], color: "#fff",
                                datasets: [{label: "Favourite", borderWidth: 0, backgroundColor: ["#FFF", "#ff7b8c"], data: [<%=new D_Location().get().size()==0?0: 100 - pvprogress%>, <%=pvprogress%>, ]}]},
                            options: {responsive: !0, title: {display: !1}, legend: {display: !1},
                                elements: {}, layout: {padding: {left: 16, right: 16, top: 16, bottom: 16}},
                                cutoutPercentage: 62, animation: {animateScale: !1, duration: 5e3}}});
                var l = document.getElementById("earning-chart").getContext("2d");
                new Chart(l, {type: "line", options: {responsive: !0, maintainAspectRatio: !1, datasetStrokeWidth: 3, pointDotStrokeWidth: 4, tooltipFillColor: "rgba(0,0,0,0.8)", legend: {display: !1, position: "bottom"}, hover: {mode: "label"}, scales: {xAxes: [{display: !1}], yAxes: [{display: !1, ticks: {min: 0, max: 70}}]}, title: {display: !1, fontColor: "#FFF", fullWidth: !1, fontSize: 40, text: "82%"}}, data: {labels: ["January", "February", "March", "April", "May", "June", "July"],
                        datasets: [{label: "My First dataset", data: [28, 35, 36, 48, 46, 42, 60], backgroundColor: "rgba(255,117,136,0.12)", borderColor: "#FF4961", borderWidth: 3, strokeColor: "#FF4961", capBezierPoints: !0, pointColor: "#fff", pointBorderColor: "#FF4961", pointBackgroundColor: "#FFF", pointBorderWidth: 3, pointRadius: 5, pointHoverBackgroundColor: "#FFF", pointHoverBorderColor: "#FF4961", pointHoverRadius: 7}]}});
                $("#world-map-markers").vectorMap({map: "world_mill", backgroundColor: "#fff", zoomOnScroll: !1,
                    series: {regions: [{values: visitorData, scale: ["rgb(212,0,42)", "#fdd6db"], normalizeFunction: "polynomial"}]},
                    onRegionTipShow: function (t, e, o) {
                        e.html(e.html() + " (Visitor - " + visitorData[o] + ")")
                    }}), Morris.Donut({element: "sessions-browser-donut-chart", data: [{label: "Chrome", value: 3500}, {label: "Firefox", value: 2500}, {label: "Safari", value: 2e3}, {label: "Opera", value: 1e3}, {label: "Internet Explorer", value: 500}], resize: !0, colors: ["#40C7CA", "#FF7588", "#2DCEE3", "#FFA87D", "#16D39A"]})
            }));

    if ("<%=request.getSession().getAttribute("welcome")%>" != "null") {
        toastr.info("<%=request.getSession().getAttribute("welcome")%>", "${company.getCOMPANYNAME().toUpperCase()} - TABLEAU DE BORD");
        removeSession("welcome");
    }
</script>
