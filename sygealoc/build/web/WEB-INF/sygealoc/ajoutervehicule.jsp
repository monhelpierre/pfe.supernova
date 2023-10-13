<%-- 
    Document   : client
    Created on : Aug 30, 2020, 10:46:26 AM
    Author     : GIRLS
--%>

<%@page import="java.util.Enumeration"%>
<%@page import="supernova.pfe.model.Vehicule"%>
<%@page import="supernova.pfe.dao.D_Fournisseur"%>
<%@page import="supernova.pfe.model.Fournisseur"%>
<%@page import="supernova.pfe.tool.MyID"%>
<%@include file="part/firstpart.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/vendors.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/tables/datatable/datatables.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/extensions/toastr.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/plugins/forms/selectivity/selectivity.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/extensions/datedropper.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/extensions/timedropper.min.css">

<%
    Vehicule v = new Vehicule();
    String option = request.getAttribute("option").toString();
    if (((Vehicule) request.getAttribute("v")) != null) {
        v = ((Vehicule) request.getAttribute("v"));
    } else {
        v.ID(request.getSession().getAttribute("ID") == null ? "" : request.getSession().getAttribute("ID").toString());
        v.ANNEE(request.getSession().getAttribute("ANNEE") == null ? "" : request.getSession().getAttribute("ANNEE").toString());
        v.COULEUR(request.getSession().getAttribute("COULEUR") == null ? "" : request.getSession().getAttribute("COULEUR").toString());
        v.MARQUE(request.getSession().getAttribute("MARQUE") == null ? "" : request.getSession().getAttribute("MARQUE").toString());
        v.MODEL(request.getSession().getAttribute("MODEL") == null ? "" : request.getSession().getAttribute("MODEL").toString());
        v.NUMMOTEUR(request.getSession().getAttribute("NUMMOTEUR") == null ? "" : request.getSession().getAttribute("NUMMOTEUR") == null ? "" : request.getSession().getAttribute("NUMMOTEUR").toString());
        v.FOURNISSEUR(request.getSession().getAttribute("FOURNISSEUR") == null ? "" : request.getSession().getAttribute("FOURNISSEUR").toString());
        v.NUMPLAQUE(request.getSession().getAttribute("NUMPLAQUE") == null ? "" : request.getSession().getAttribute("NUMPLAQUE").toString());
        v.TYPE(request.getSession().getAttribute("TYPE") == null ? "" : request.getSession().getAttribute("TYPE").toString());
        v.PRIXPARJOUR(request.getSession().getAttribute("PRIXPARJOUR") == null ? "" : request.getSession().getAttribute("PRIXPARJOUR").toString());
        v.ETAT(request.getSession().getAttribute("ETAT") == null ? "" : request.getSession().getAttribute("ETAT").toString());
        v.TYPEMOTEUR(request.getSession().getAttribute("TYPEMOTEUR") == null ? "" : request.getSession().getAttribute("TYPEMOTEUR").toString());
        v.TRANSMISSION(request.getSession().getAttribute("TRANSMISSION") == null ? "" : request.getSession().getAttribute("TRANSMISSION").toString());
    }
%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/vendors.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/tables/datatable/datatables.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/extensions/toastr.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/plugins/forms/selectivity/selectivity.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/dropzone/dropzone.css">


<div class="content-body">
    <section class="inputmask" ID="inputmask">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                        <div class="heading-elements">
                            <ul class="list-inline mb-0">
                                <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-content collapse show">
                        <div class="card-body">
                            <form action="#" method="post" id="vehiculeform" enctype="multipart/form-data">
                                <input type="hidden" name="ID" id="ID" value="<%=v.ID() != null ? v.ID() : ""%>" />
                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-xl-4 col-lg-12">
                                            <field>
                                                <h5>Fournisseur</h5>
                                                <div class="form-group">
                                                    <select name="FOURNISSEUR" id="FOURNISSEUR" class="form-control" value="<%=(v == null) ? "" : v.FOURNISSEUR()%>">
                                                        <option disabled="" value="" selected="">Fournisseur</option>
                                                        <%for (Fournisseur f : new D_Fournisseur().get()) {%>
                                                        <option <%=(v == null) ? "" : (v.FOURNISSEUR().equals(f.ID()) ? "selected" : "")%> ID="<%=f.ID()%>" value="<%=f.ID()%>"><%=f.NOMENTREPRISE()%></option>
                                                        <%}%>
                                                    </select>
                                                </div>
                                            </field>

                                            <field>
                                                <h5>Mod&egrave;le</h5>
                                                <div class="form-group">
                                                    <input value="<%=v.MODEL()%>" id="MODEL" name="MODEL" class="form-control" type="text" placeholder="Modele">
                                                </div>
                                            </field>

                                            <field>
                                                <h5>Num&eacute;ro de plaque (xx-xxxxx)</h5>
                                                <div class="form-group">
                                                    <input value="<%=(v == null) ? "" : v.NUMPLAQUE()%>" id="NUMPLAQUE" name="NUMPLAQUE" class="form-control" type="text" placeholder="Numero de plaque">
                                                </div>
                                            </field>

                                            <field>
                                                <h5>Prix par jour</h5>
                                                <div class="form-group">
                                                    <input value="<%=(v == null) ? "" : v.PRIXPARJOUR()%>" ID="PRIXPARJOUR" name="PRIXPARJOUR" class="form-control" type="text"  placeholder="Prix par jour">
                                                </div>
                                            </field>
                                        </div>

                                        <div class="col-xl-4 col-lg-12">
                                            <field>
                                                <h5>Type de v&eacute;hicule</h5>
                                                <div class="form-group">
                                                    <select name="TYPE" class="form-control" id="TYPEVEH" value="<%=(v == null) ? "" : v.TYPE()%>">
                                                        <option disabled="" value="" selected="">Type de v&eacute;hicule</option>
                                                        <option <%=(v == null) ? "" : (v.TYPE().equals("Berline") ? "selected" : "")%>>Berline</option>
                                                        <option <%=(v == null) ? "" : (v.TYPE().equals("Coupe") ? "selected" : "")%>>Coupe</option>
                                                        <option <%=(v == null) ? "" : (v.TYPE().equals("Familiale") ? "selected" : "")%>>Familiale</option>
                                                        <option <%=(v == null) ? "" : (v.TYPE().equals("Cabriolet") ? "selected" : "")%>>Cabriolet</option>
                                                        <option <%=(v == null) ? "" : (v.TYPE().equals("Roadster") ? "selected" : "")%>>Roadster</option>
                                                        <option <%=(v == null) ? "" : (v.TYPE().equals("Pickup") ? "selected" : "")%>>Pickup</option>
                                                        <option <%=(v == null) ? "" : (v.TYPE().equals("4×4") ? "selected" : "")%>>4×4</option>
                                                        <option <%=(v == null) ? "" : (v.TYPE().equals("VUS") ? "selected" : "")%>>VUS</option>
                                                        <option <%=(v == null) ? "" : (v.TYPE().equals("Crossover") ? "selected" : "")%>>Crossover</option>
                                                        <option <%=(v == null) ? "" : (v.TYPE().equals("Minivan") ? "selected" : "")%>>Minivan</option>
                                                        <option <%=(v == null) ? "" : (v.TYPE().equals("Voiture sportive") ? "selected" : "")%>>Voiture sportive</option>
                                                    </select>
                                                </div>
                                            </field>

                                            <field>
                                                <h5>Couleur</h5>
                                                <div class="form-group">
                                                    <input value="<%=(v == null) ? "" : v.COULEUR()%>" id="COULEUR" name="COULEUR" class="form-control" type="text" placeholder="Couleur">
                                                </div>
                                            </field>

                                            <field>
                                                <h5>Ann&eacute;e (xxxx)</h5>
                                                <div class="form-group">
                                                    <input value="<%=(v == null) ? "" : v.ANNEE()%>" id="ANNEE" name="ANNEE" class="form-control" type="text" placeholder="Ann&eacute;e">
                                                </div>
                                            </field>

                                            <field>
                                                <h5>Type de moteur</h5>
                                                <div class="form-group">
                                                    <select name="TYPEMOTEUR" class="form-control" id="TYPEMOTEUR" value="<%=v.TYPEMOTEUR()%>">
                                                        <option disabled="" value="" selected="">Type de moteur</option>
                                                        <option <%=(v == null) ? "" : (v.TYPEMOTEUR().equals("DIESEL") ? "selected" : "")%>>Diesel</option>
                                                        <option <%=(v == null) ? "" : (v.TYPEMOTEUR().equals("GASOLINE") ? "selected" : "")%>>Gasoline</option>
                                                    </select>
                                                </div>
                                            </field>
                                        </div>

                                        <div class="col-xl-4 col-lg-12">
                                            <field>
                                                <h5>Marque</h5>
                                                <div class="form-group">
                                                    <input value="<%=(v == null) ? "" : v.MARQUE()%>" id="MARQUE" name="MARQUE" class="form-control" type="text" placeholder="Marque">
                                                </div>
                                            </field>

                                            <field>
                                                <h5>Numero de moteur</h5>
                                                <div class="form-group">
                                                    <input value="<%=(v == null) ? "" : v.NUMMOTEUR()%>" id="NUMMOTEUR" name="NUMMOTEUR" class="form-control" type="text" placeholder="Numero de moteur">
                                                </div>
                                            </field>

                                            <field>
                                                <h5>Tye de transmission</h5>
                                                <div class="form-group">
                                                    <select name="TRANSMISSION" id="TRANSMISSION"  class="form-control" value="<%=v.TRANSMISSION()%>">
                                                        <option disabled="" value="" selected="">Type de transmission</option>
                                                        <option <%=(v == null) ? "" : (v.TRANSMISSION().equals("MANUEL") ? "selected" : "")%>>Manuel</option>
                                                        <option <%=(v == null) ? "" : (v.TRANSMISSION().equals("AUTOMATIQUE") ? "selected" : "")%>>Automatique</option>
                                                    </select>
                                                </div>
                                            </field>

                                            <field>
                                                <h5>&Eacute;tat</h5>
                                                <div class="form-group">
                                                    <select name="ETAT" class="form-control" id="ETAT"  value="<%=v.ETAT()%>" placeholder="Etat">
                                                        <option disabled="" value="">&Eacute;tat</option>
                                                        <% if (v != null && !v.ID().isEmpty()) {
                                                            if (v.ETAT().equals("LIBRE") || v.ETAT().equals("EN REPARATION") && !v.ETAT().isEmpty()) {%>
                                                                <option <%=(v == null) ? "" : (v.ETAT().equals("LIBRE") ? "selected" : "")%>>Libre</option>                
                                                                <option <%=(v == null) ? "" : (v.ETAT().equals("EN REPARATION") ? "selected" : "")%>>En reparation</option>                                        
                                                            <%}%>

                                                            <% if (v.ETAT().equals("RESERVÉ")) {%> 
                                                                <option <%=(v == null) ? "" : (v.ETAT().equals("RESERVÉ") ? "selected" : "")%> readony class="addcar">Reservé</option>
                                                            <%}%>

                                                            <% if (v.ETAT().equals("LOUÉ")) {%> 
                                                                <option <%=(v == null) ? "" : (v.ETAT().equals("LOUÉ") ? "selected" : "")%> readonly class="addcar">Loué</option>
                                                            <%}%>

                                                            <% if (v.ETAT().equals("EN RETARD")) {%> 
                                                                <option <%=(v == null) ? "" : (v.ETAT().equals("EN RETARD") ? "selected" : "")%> readony class="addcar">retard</option>
                                                            <%}
                                                        } else {%>
                                                            <option selected>Libre</option>  
                                                        <%}%>  
                                                    </select>
                                                </div>
                                            </field>
                                        </div>

                                        <div class="col-xl-12 col-lg-12">
                                            <field>
                                                <div <%=v.ID() != null && !v.ID().isEmpty() ? "style=display:none" : ""%> id="imageUpload" class="dropzone">
                                                    <div class="dz-default dz-message"></div>
                                                    <div class="dz-message" data-dz-message><span>Cliquez ici pour charger un image du véhicule ou draggez en un</span></div>
                                                </div>
                                            </field>
                                        </div>
                                    </div>
                                </div><br/>
                                <input name="action" type="hidden" class="btn btn-primary" value="${option}"/>
                            </form>
                            <div class="form-actions">
                                <div class="text-right">
                                    <input id="sendbtn" type="button" class="btn btn-primary" value="<%=option%>"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
</div>
</div>

<%@include file="part/lastpart.jsp" %>
<script src="${pageContext.request.contextPath}/assets/dropzone/dropzone.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/js/forms/select/selectivity-full.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scripts/forms/select/form-selectivity.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/js/extensions/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scripts/extensions/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/js/tables/datatable/datatables.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scripts/tables/datatables/datatable-basic.min.js"></script>
<%@include file="part/mask_js.jsp" %>

<input type="file" id="IMGTOTEST" class="hidden">

<script>
    Dropzone.autoDiscover = false;
    var myDropzone;
    $("#imageUpload").dropzone({
        url: "${pageContext.request.contextPath}/assets/services/vehicule/addEditVehicle.jsp",
        addRemoveLinks: true,
        uploadMultiple: false,
        maxFiles: 1,
        autoProcessQueue: false,
        method: 'POST',
        clickable: true,
        maxFilesize: 22,
        maxThumbnailFilesize: 200,
        acceptedFiles: 'image/*,.jpg,.png,.jpeg',
        timeout: 60000,
        accept: function (file, done) {
            done();
        },
        error: function (file, msg) {
        },
        init: function () {
            myDropzone = this;
            var path = "${pageContext.request.contextPath}/" + "<%=v.IMAGE()%>";

            if (!path.includes("null")) {
                var file = {name: "vehicule" + path.substr(path.length - 4, 4), upload: {filename: path}, size: 900, accepted: true};
                myDropzone.emit("addedfile", file);
                myDropzone.emit("thumbnail", file, path);
                myDropzone.emit("complete", file);
            }

            this.on("sending", function (file, xhr, formData) {
                formData.append("IMAGE", file);
                $("#vehiculeform").find("input").each(function () {
                    formData.append($(this).attr("name"), $(this).val());
                });
                $("#vehiculeform").find("select").each(function () {
                    formData.append($(this).attr("name"), $(this).val());
                });
            });

            this.on('complete', function (file) {
                window.location.reload(true);
            });

            this.on('maxfilesexceeded', function (file) {
                toastr.error("Un seul image est permis.", "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} ");
            });

            this.on("sendingmultiple", function (file, xhr, formData) {
                $("#vehiculeform").find("input").each(function () {
                    formData.append($(this).attr("name"), $(this).val());
                });
                $("#vehiculeform").find("select").each(function () {
                    formData.append($(this).attr("name"), $(this).val());
                });
            });
        }
    });

    $("#PRIXPARJOUR").on('keyup', function () {
        if (new Number($("#PRIXPARJOUR").val()) == 0) {
            $("#PRIXPARJOUR").val();
        }
    });

    $("#sendbtn").on('click', function (e) {
        e.preventDefault();
        if (myDropzone.getQueuedFiles().length > 0) {
            myDropzone.processQueue();
        } else {
            if ($("#ID").val()) {
                $.ajax({
                    url: '${pageContext.request.contextPath}/assets/services/vehicule/addEditVehicle.jsp',
                    type: "POST",
                    data: {
                        ID: $("#ID").val(),
                        TYPE: $("#TYPEVEH").val(),
                        TYPEMOTEUR: $("#TYPEMOTEUR").val(),
                        COULEUR: $("#COULEUR").val(),
                        MARQUE: $("#MARQUE").val(),
                        MODEL: $("#MODEL").val(),
                        FOURNISSEUR: $("#FOURNISSEUR").val(),
                        ETAT: $("#ETAT").val(),
                        TRANSMISSION: $("#TRANSMISSION").val(),
                        MODEL: $("#MODEL").val(),
                        PRIXPARJOUR: $("#PRIXPARJOUR").val(),
                        NUMPLAQUE: $("#NUMPLAQUE").val(),
                        NUMMOTEUR: $("#NUMMOTEUR").val(),
                        ANNEE: $("#ANNEE").val()
                    },
                    dataType: 'json',
                    success: function (res) {
                        if (res.message.includes("succes")) {
                            if (res.link != 'null') {
                                window.location.href = res.link;
                            }
                            toastr.success(res.message, "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} ");
                            window.location.reload(true);
                        } else {
                            toastr.error(res.message, "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} ");
                        }
                        removeSession("msgi");
                    },
                    error: function (data) {
                        alert(data.responseText);
                    }
                });
            } else {
                toastr.error("Veuillez preciser un image du vehicule", "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} ");
            }
        }
    });

    function Data(f) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $("#img").attr('src', e.target.result);
        };
        reader.readAsDataURL(f.files[0]);
    }

    var msgi = "<%=request.getSession().getAttribute("msgi")%>";
    if (msgi != "null" && msgi.length > 0) {
        if (!msgi.includes("succes")) {
            toastr.error(msgi, "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} ");
            window.location.reload(true);
        } else {
            toastr.success(msgi, "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} ");
        }
        removeSession("msgi");
    }

    if ("<%=v.ID()%>" != "null" && "<%=v.ID()%>".length > 0) {
        $("#<%=v.FOURNISSEUR()%>").attr("selected", true);
        $("#<%=v.TYPEMOTEUR()%>").attr("selected", true);
        $("#<%=v.TRANSMISSION()%>").attr("selected", true);
    }

    var ANNEE = IMask(
            document.getElementById('ANNEE'),
            {
                mask: [
                    {
                        mask: Number,
                        min: 1900,
                        max: new Date().getFullYear() + 1
                    }
                ]
            });

    var PRIXPARJOUR = IMask(
            document.getElementById('PRIXPARJOUR'),
            {
                mask: '$ num',
                blocks: {
                    num: {
                        mask: Number,
                        thousandsSeparator: ' ',
                        max: 1000000
                    }
                }
            }
    );



    var NUMPLAQUE = IMask(
            document.getElementById('NUMPLAQUE'),
            {
                mask: [
                    {
                        mask: 'LO-`[00000]'
                    }
                ]
            });

    if ("<%=v != null && !v.ID().isEmpty()%>" == "true") {
        $(".addcar").attr("style", "");
    } else {
        $(".addcar").attr("style", "display:none");
    }
</script>