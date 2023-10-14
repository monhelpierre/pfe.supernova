<%-- 
    Document   : personnel
    Created on : Aug 29, 2020, 10:03:53 PM
    Author     : GIRLS
--%>

<%@include file="part/firstpart.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/vendors.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/tables/datatable/datatables.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/extensions/toastr.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/plugins/forms/selectivity/selectivity.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/extensions/datedropper.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/extensions/timedropper.min.css">

<div class="content-body">
    <div class="content-overlay"></div>
    <section class="row all-contacts">
        <div class="col-12">
            <div class="card">
                <div class="card-head">
                    <div class="card-header">
                        <div class="heading-elements mt-0">
                            <%if (r != null && r.get(2).getCAN_ADD().equals("1") || r != null && r.get(2).getCAN_EDIT().equals("1")) {%>
                            <button class="btn btn-primary btn-sm " onclick="holdModal('AddFournisseurModal')"><i class="d-md-none d-block ft-plus white"></i>
                                <span class="d-md-block d-none">Nouveau ${active_menu}</span></button>
                                <%}%>

                            <div class="modal fade" id="AddFournisseurModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1"
                                 aria-hidden="true">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <section class="contact-form">
                                            <form id="add_form" class="contact-input" method="post">
                                                <input name="id" id="EDITID" type="hidden"/>
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel1"><span id="modaltitle">NOUVEAU</span> ${active_menu.toUpperCase()}</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="resetData()">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="col-xl-6 col-lg-12">
                                                            <fieldset class="form-group col-12">
                                                                <h5>Nom de l'entreprise</h5>
                                                                <input type="text" name="NOMENTREPRISE" id="NOMENTREPRISE" class="contact-name form-control" placeholder="Nom de l'entreprise">
                                                            </fieldset>

                                                            <fieldset class="form-group col-12">
                                                                <h5>T&eacute;l&eacute;phone</h5>
                                                                <input type="text" name="TELEPHONE" id="TELEPHONE" class="contact-name form-control" placeholder="T&eacute;l&eacute;phone">
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-xl-6 col-lg-12">
                                                            <fieldset class="form-group col-12">
                                                                <h5>Si&egrave;ge social</h5>
                                                                <input type="text" name="SIEGESOCIAL" id="SIEGESOCIAL" class="contact-name form-control" placeholder="Si&egrave;ge social">
                                                            </fieldset>

                                                            <fieldset class="form-group col-12">
                                                                <h5>Adresse m&eacute;l</h5>
                                                                <input type="email" name="EMAIL" id="EMAIL" class="contact-phone form-control" placeholder="Adresse m&eacute;l">
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-xl-6 col-lg-12">
                                                            <fieldset class="form-group col-12">
                                                                <h5>Adresse compl&egrave;te</h5>
                                                                <input type="text" name="ADRESSE" id="ADRESSE" class="contact-email form-control" placeholder="Adresse compl&egrave;te">
                                                            </fieldset>

                                                            <fieldset class="form-group col-12">
                                                                <h5>Num&eacute;ro de passeport</h5>
                                                                <input type="text" name="NUMEROPASSPORT" id="NUMEROPASSPORT" class="contact-email form-control" placeholder="Num&eacute;ro de passeport">
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-xl-6 col-lg-12">
                                                            <fieldset class="form-group col-12">
                                                                <h5>Repr&eacute;sentant</h5>
                                                                <input type="text" name="REPRESENTANT" id="REPRESENTANT" class="contact-name form-control" placeholder="Repr&eacute;sentant">
                                                            </fieldset>

                                                            <fieldset class="form-group col-12">
                                                                <h5>CIN</h5>
                                                                <input type="text" name="CIN" id="CIN" class="contact-name form-control" placeholder="CIN">
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-xl-6 col-lg-12">
                                                            <fieldset class="form-group col-12">
                                                                <h5>Site web</h5>
                                                                <input type="url" name="SITEWEB" id="SITEWEB" class="contact-name form-control" placeholder="Site web">
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-xl-6 col-lg-12">
                                                            <fieldset class="form-group col-12">
                                                                <h5>Num&eacute;ro de patente</h5>
                                                                <input type="text" name="PATENTE" id="PATENTE" class="contact-name form-control" placeholder="Num&eacute;ro de patente">
                                                            </fieldset>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                                        <button onclick="saveData()" type="button" class="btn btn-info addadd-contact-item"><i
                                                                class="la la-paper-plane-o d-block d-lg-none"></i> <span class="d-none d-lg-block" id="modalbtn">Ajouter</span></button>
                                                    </fieldset>
                                                </div>
                                            </form>
                                        </section>
                                    </div>
                                </div>
                            </div>

                            <div class="modal fade" id="DelFournisseurModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1"
                                 aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <section class="contact-form">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel1">Supprimer ${active_menu}</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <span id="del_id" style="display: none"></span>
                                                <p>&Ecirc;tes vous s&ucirc;r de vouloir supprimer le fournisseur '<b id="fullname"></b>' ?</p>
                                            </div>
                                            <div class="modal-footer">
                                                <fieldset class="form-group position-relative has-icon-left mb-0">
                                                    <button onclick="deleteFournisseur()" type="button" class="btn btn-info addadd-contact-item"><i
                                                            class="la la-paper-plane-o d-block d-lg-none"></i> <span class="d-none d-lg-block">Valider</span></button>
                                                </fieldset>
                                            </div>
                                        </section>
                                    </div>
                                </div>
                            </div>
                            <button class="btn btn-default btn-sm"><i class="ft-settings white"></i></button>
                        </div>
                    </div>
                </div>
                <div class="card-content">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="mydatatable" class="table table-white-space table-bordered row-grouping display no-wrap icheck table-middle text-center">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>NOMENTREPRISE</th>
                                        <th>SIEGESOCIAL</th>
                                        <th>TELEPHONE</th>
                                        <th>EMAIL</th>
                                        <th>ADRESSE</th>
                                        <th>REPRESENTANT</th>
                                        <th>NUMEROPASSPORT</th>
                                        <th>CIN</th>
                                        <th>PATENTE</th> 
                                        <th>SITEWEB</th>
                                            <%if (r != null && (r.get(2).getCAN_EDIT().equals("1") || r.get(2).getCAN_DELETE().equals("1"))) {%>
                                        <th>ACTIONS</th>
                                            <%}%>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="m" items="${fournisseur}" >
                                        <tr>
                                            <td>${m.ID()}</td>
                                            <td>${m.NOMENTREPRISE()}</td>
                                            <td>${m.SIEGESOCIAL()}</td>
                                            <td>${m.TELEPHONE()}</td>
                                            <td class="text-center">
                                                <a class="email" href="mailto:${m.EMAIL()}">${m.EMAIL()}</a>
                                            </td>
                                            <td class="add-todo">${m.ADRESSE()}</td>
                                            <td class="add-todo">${m.REPRESENTANT()}</td>
                                            <td class="add-todo">${m.NUMEROPASSPORT()}</td>
                                            <td class="add-todo">${m.CIN()}</td>
                                            <td class="add-todo">${m.PATENTE()}</td> 
                                            <td class="add-todo">${m.SITEWEB()}</td> 
                                            <%if (r != null && (r.get(2).getCAN_EDIT().equals("1") || r.get(2).getCAN_DELETE().equals("1"))) {%>
                                            <td>
                                                <%if (r != null && r.get(2).getCAN_EDIT().equals("1")) {%>
                                                <a title="Modifier" href="#" onclick="showEditModal('${m.ID()}')" class="primary edit mr-1"><i class="la la-pencil"></i></a>
                                                    <%}%>
                                                    <%if (r != null && r.get(2).getCAN_DELETE().equals("1")) {%>
                                                <a title="Supprimer" href="#" onclick="validateDeletion('${m.ID()}')" class="danger delete mr-1"><i class="la la-trash-o"></i></a>
                                                    <%}%>
                                            </td>
                                            <%}%>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>ID</th>
                                        <th>NOMENTREPRISE</th>
                                        <th>SIEGESOCIAL</th>
                                        <th>TELEPHONE</th>
                                        <th>EMAIL</th>
                                        <th>ADRESSE</th>
                                        <th>REPRESENTANT</th>
                                        <th>NUMEROPASSPORT</th>
                                        <th>CIN</th>
                                        <th>PATENTE</th>
                                        <th>SITEWEB</th>
                                            <%if (r != null && (r.get(2).getCAN_EDIT().equals("1") || r.get(2).getCAN_DELETE().equals("1"))) {%>
                                        <th>ACTIONS</th>
                                            <%}%>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
</div>
</div>
</div>

<%@include file="part/lastpart.jsp" %>
<script src="${pageContext.request.contextPath}/assets/vendors/js/extensions/datedropper.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/js/extensions/timedropper.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scripts/extensions/date-time-dropper.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/js/forms/select/selectivity-full.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scripts/forms/select/form-selectivity.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/js/extensions/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scripts/extensions/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/js/tables/datatable/datatables.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scripts/tables/datatables/datatable-basic.min.js"></script>
<script>
                                                    $("#datefondation").dateDropper({
                                                        dropWidth: 200,
                                                        init_animation: "bounce",
                                                        lang: "fr",
                                                        format: "j F Y",
                                                        dropPrimaryColor: "#d4002a",
                                                        dropBorder: "1px solid #d4002a"
                                                    });

                                                    function resetData() {
                                                        $('#add_form')[0].reset();
                                                        $("#modaltitle").html("NOUVEAU");
                                                        $("#modalbtn").html("Ajouter");
                                                    }

                                                    function validateDeletion(id) {
                                                        $("#del_id").html(id);
                                                        $.ajax({
                                                            url: '${pageContext.request.contextPath}/assets/services/fournisseur/getStock.jsp',
                                                            type: "POST",
                                                            data: {ID: id},
                                                            dataType: 'json',
                                                            success: function (res) {
                                                                if(res.link != 'null'){window.location.href = res.link;} 
                                                                if (res.msg.includes("Success")) {
                                                                    $.ajax({
                                                                        url: '${pageContext.request.contextPath}/assets/services/fournisseur/getFournisseurDetails.jsp',
                                                                        type: "POST",
                                                                        data: {ID: id},
                                                                        dataType: 'json',
                                                                        success: function (res) {
                                                                            var member = res.data.split("\t");
                                                                            $("#fullname").html(member[1]);
                                                                            holdModal("DelFournisseurModal");
                                                                        },
                                                                        error: function (res) {
                                                                        }
                                                                    });
                                                                } else {
                                                                    toastr.error("Impossible de supprimer un fournisseur ayant un vehicule en stock", "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} ");
                                                                }
                                                            },
                                                            error: function (res) {
                                                            }
                                                        });
                                                    }

                                                    function saveData() {
                                                        var ID = $("#EDITID").val();
                                                        var NOMENTREPRISE = $("#NOMENTREPRISE").val();
                                                        var SIEGESOCIAL = $("#SIEGESOCIAL").val();
                                                        var TELEPHONE = $("#TELEPHONE").val();
                                                        var EMAIL = $("#EMAIL").val();
                                                        var ADRESSE = $("#ADRESSE").val();
                                                        var REPRESENTANT = $("#REPRESENTANT").val();
                                                        var NUMEROPASSPORT = $("#NUMEROPASSPORT").val();
                                                        var CIN = $("#CIN").val();
                                                        var PATENTE = $("#PATENTE").val();
                                                        var SITEWEB = $("#SITEWEB").val();

                                                        $.ajax({
                                                            url: '${pageContext.request.contextPath}/assets/services/fournisseur/addEditFournisseur.jsp',
                                                            type: "POST",
                                                            data: {ID: ID, NOMENTREPRISE: NOMENTREPRISE, SIEGESOCIAL: SIEGESOCIAL,
                                                                TELEPHONE: TELEPHONE, EMAIL: EMAIL, ADRESSE: ADRESSE, REPRESENTANT: REPRESENTANT, NUMEROPASSPORT: NUMEROPASSPORT,
                                                                CIN: CIN, PATENTE: PATENTE, SITEWEB: SITEWEB},
                                                            dataType: 'json',
                                                            success: function (res) {
                                                                if(res.link != 'null'){window.location.href = res.link;} 
                                                                if (!res.message.includes("succes")) {
                                                                    toastr.error(res.message, "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} ");
                                                                } else {
                                                                    setTimeout(toastr.success(res.message, "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} "), 5000);
                                                                    window.location.reload(true);
                                                                }
                                                            },
                                                            error: function () {
                                                                toastr.error("Erreur", "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} ");
                                                            }
                                                        });
                                                    }

                                                    function deleteFournisseur() {
                                                        var id = $("#del_id").html();
                                                        $.ajax({
                                                            url: '${pageContext.request.contextPath}/assets/services/delete.jsp',
                                                            type: "POST",
                                                            data: {ID: id, table: "fournisseur"},
                                                            dataType: 'json',
                                                            success: function (data) {
                                                                setTimeout(toastr.success(data.message, "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} "), 5000);
                                                                window.location.reload(true);
                                                            },
                                                            error: function (data) {
                                                                toastr.error(data.message, "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} ");
                                                            }
                                                        });
                                                    }

                                                    function showEditModal(id) {
                                                        $.ajax({
                                                            url: '${pageContext.request.contextPath}/assets/services/fournisseur/getFournisseurDetails.jsp',
                                                            type: "POST",
                                                            data: {ID: id},
                                                            dataType: 'json',
                                                            success: function (res) {
                                                                if(res.link != 'null'){window.location.href = res.link;} 
                                                                var member = res.data.split("\t");
                                                                $("#EDITID").val(member[0]);
                                                                $("#NOMENTREPRISE").val(member[1]);
                                                                $("#SIEGESOCIAL").val(member[2]);
                                                                $("#TELEPHONE").val(member[3]);
                                                                $("#EMAIL").val(member[4]);
                                                                $("#ADRESSE").val(member[5]);
                                                                $("#REPRESENTANT").val(member[6]);
                                                                $("#NUMEROPASSPORT").val(member[7]);
                                                                $("#CIN").val(member[8]);
                                                                $("#PATENTE").val(member[9]);
                                                                $("#SITEWEB").val(member[10]);
                                                                $("#modaltitle").html("MODIFIER");
                                                                $("#modalbtn").html("Modifier");
                                                                holdModal("AddFournisseurModal");
                                                            },
                                                            error: function (res) {
                                                            }
                                                        });
                                                    }

                                                    var TELEPHONE = IMask(
                                                            document.getElementById('TELEPHONE'),
                                                            {
                                                                mask: [
                                                                    {
                                                                        mask: '00000000'
                                                                    }
                                                                ]
                                                            });

                                                    var CIN = IMask(
                                                            document.getElementById('CIN'),
                                                            {
                                                                mask: [
                                                                    {
                                                                        mask: '00-00-00-0000-00-00000'
                                                                    }
                                                                ]
                                                            });

                                                    if ("<%=request.getSession().getAttribute("welcome")%>" != "null") {
                                                        toastr.info("<%=request.getSession().getAttribute("welcome")%>", "${company.getCOMPANYNAME().toUpperCase()} - TABLEAU DE BORD");
                                                        removeSession("welcome");
                                                    }

</script>