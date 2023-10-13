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

<div class="content-body"><div class="content-overlay"></div>
    <section class="row all-contacts">
        <div class="col-12">
            <div class="card">
                <div class="card-head">
                    <div class="card-header">
                        <div class="heading-elements mt-0">
                            <%if (r != null && r.get(0).getCAN_ADD().equals("1") || r != null && r.get(0).getCAN_EDIT().equals("1")) {%>
                            <button class="btn btn-primary btn-sm " onclick="holdModal('AddEmployeModal')"><i class="d-md-none d-block ft-plus white"></i>
                                <span class="d-md-block d-none">Nouveau ${active_menu}</span></button>
                                <%}%>

                            <div class="modal fade" id="AddEmployeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1"
                                 aria-hidden="true">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <section class="contact-form">
                                            <form id="add_form" class="contact-input" method="post">
                                                <input name="ID" id="EDITID" type="hidden"/>
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel1"><span id="modaltitle">NOUVEAU</span> ${active_menu.toUpperCase()}</h5>
                                                    <button onclick="resetData()" type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="col-xl-6 col-lg-12">
                                                            <fieldset class="form-group col-12">
                                                                <h5>Nom complet</h5>
                                                                <input type="text" name="NOMCOMPLET" id="NOMCOMPLET" class="contact-name form-control" placeholder="Nom Complet">
                                                            </fieldset>
                                                            <fieldset class="form-group col-12">
                                                                <h5>Sexe</h5>
                                                                <select name="SEXE" class="form-control" id="SEXE" placeholder="Sexe">
                                                                    <option disabled value="">Sexe</option>
                                                                    <option>MASCULIN</option>
                                                                    <option>FEMININ</option>
                                                                    <option>INDETERMINÉ</option>
                                                                </select>
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-xl-6 col-lg-12">
                                                            <fieldset class="form-group col-12">
                                                                <h5>Poste</h5>
                                                                <select name="POSTE" class="form-control" id="POSTE" placeholder="Profession">
                                                                    <option disabled value="">Poste</option>
                                                                    <option  class="otherposte">Secretaire</option>
                                                                    <option  class="otherposte">Comptable</option>
                                                                    <option  class="otherposte">Informaticien</option>
                                                                    <option  class="otherposte">Administrateur</option>
                                                                    <option  class="otherposte">Mecanicien</option>                                                                    
                                                                    <option id="superadmin" style="display:none">Superadmin</option>
                                                                    <option  class="otherposte">Autre</option>
                                                                </select>
                                                            </fieldset>
                                                            <fieldset class="form-group col-12">
                                                                <h5>Date de naissance</h5>
                                                                <input type="text" name="DATENAISSANCE" id="DATENAISSANCE" class="contact-email form-control" placeholder="Date de naissance">
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-xl-6 col-lg-12">
                                                            <fieldset class="form-group col-12">
                                                                <h5>T&eacute;l&eacute;phone</h5>
                                                                <input type="text" name="TELEPHONE" id="TELEPHONE" class="contact-phone form-control" placeholder="T&eacute;l&eacute;phone">
                                                            </fieldset>

                                                            <fieldset class="form-group col-12">
                                                                <h5>NIF</h5>
                                                                <input type="text" name="NIF" id="NIF" class="contact-phone form-control" placeholder="NIF">
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-xl-6 col-lg-12">
                                                            <fieldset class="form-group col-12">
                                                                <h5>Adresse compl&egrave;te</h5>
                                                                <input type="text" name="ADRESSE" id="ADRESSE" class="contact-name form-control" placeholder="Adresse compl&egrave;te">
                                                            </fieldset>

                                                            <fieldset class="form-group col-12">
                                                                <h5>Adresse m&eacute;l</h5>
                                                                <input type="text" name="EMAIL" id="EMAIL" class="contact-name form-control" placeholder="Adresse m&eacute;l">
                                                            </fieldset>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <fieldset class="form-group position-relative has-icon-left mb-0">
                                                            <button onclick="saveData()" type="button" class="btn btn-info add-contact-item"><i
                                                                    class="la la-paper-plane-o d-block d-lg-none"></i> <span class="d-none d-lg-block" id="modalbtn">Ajouter</span></button>
                                                        </fieldset>
                                                    </div>
                                            </form>
                                        </section>
                                    </div>
                                </div>
                            </div>

                            <div class="modal fade" id="DelEmployeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1"
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
                                                <p>&Ecirc;tes vous s&ucirc;r de vouloir supprimer l'employ&eacute; '<b id="fullname"></b>' ?</p>
                                            </div>
                                            <div class="modal-footer">
                                                <fieldset class="form-group position-relative has-icon-left mb-0">
                                                    <button onclick="deleteEmploye()" type="button" class="btn btn-info add-contact-item"><i
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
                                        <th>NOM COMPLET</th>
                                        <th>SEXE</th>
                                        <th>POSTE</th>
                                        <th>NIF</th>
                                        <th>TELEPHONE</th>
                                        <th>ADRESSE</th>
                                        <th>EMAIL</th>
                                            <%if (r != null && (r.get(0).getCAN_EDIT().equals("1") || r.get(0).getCAN_DELETE().equals("1"))) {%>
                                        <th>ACTIONS</th>
                                            <%}%>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="m" items="${member}" >
                                        <tr>
                                            <td>${m.ID()}</td>
                                            <td>${m.NOMCOMPLET()}</td>
                                            <td>${m.SEXE()}</td>
                                            <td>${m.POSTE()}</td>
                                            <td>${m.NIF()}</td>
                                            <td class="phone">${m.TELEPHONE()}</td>
                                            <td class="-todo">${m.ADRESSE()}</td>
                                            <td class="text-center">
                                                <a class="email" href="mailto:${m.EMAIL()}">${m.EMAIL()}</a>
                                            </td>
                                            <%if (r != null && (r.get(0).getCAN_EDIT().equals("1") || r.get(0).getCAN_DELETE().equals("1"))) {%>
                                            <td>
                                                <%if (r != null && r.get(0).getCAN_EDIT().equals("1")) {%>
                                                <a href="#" onclick="showEditModal('${m.ID()}')" class="primary edit mr-1" title="Modifier"><i class="la la-pencil"></i></a>
                                                    <%}%>                                                
                                                    <%if (r != null && r.get(0).getCAN_DELETE().equals("1")) {%>
                                                <a ${m.ID()=="123456"?"style='display:none'":""}  href="#" onclick="validateDeletion('${m.ID()}')" class="danger delete mr-1" title="Supprimer"><i class="la la-trash-o"></i></a>
                                                    <%}%>
                                            </td>
                                            <%}%>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>ID</th>
                                        <th>NOM COMPLET</th>
                                        <th>SEXE</th>
                                        <th>POSTE</th>
                                        <th>NIF</th>
                                        <th>TELEPHONE</th>
                                        <th>ADRESSE</th>
                                        <th>EMAIL</th>
                                            <%if (r != null && (r.get(0).getCAN_EDIT().equals("1") || r.get(0).getCAN_DELETE().equals("1"))) {%>
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
<script src="${pageContext.request.contextPath}/assets/vendors/js/forms/select/selectivity-full.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scripts/forms/select/form-selectivity.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/js/extensions/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scripts/extensions/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/js/tables/datatable/datatables.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scripts/tables/datatables/datatable-basic.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/js/forms/extended/inputmask/jquery.inputmask.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/js/forms/extended/typeahead/typeahead.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/js/forms/extended/typeahead/bloodhound.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/js/forms/extended/typeahead/handlebars.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/js/forms/extended/formatter/formatter.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/js/forms/extended/maxlength/bootstrap-maxlength.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/js/forms/extended/card/jquery.card.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scripts/forms/extended/form-inputmask.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scripts/forms/extended/form-typeahead.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scripts/forms/extended/form-formatter.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scripts/forms/extended/form-maxlength.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scripts/forms/extended/form-card.min.js"></script>

<script>
                                                    $("#DATENAISSANCE").dateDropper({
                                                        dropWidth: 200,
                                                        init_animation: "bounce",
                                                        lang: "fr",
                                                        format: "j/m/Y",
                                                        dropPrimaryColor: "#d4002a",
                                                        dropBorder: "1px solid #d4002a"
                                                    });

                                                    function resetData() {
                                                        $('#add_form')[0].reset();
                                                        $("#POSTE").val("Poste");
                                                        $("#modaltitle").html("NOUVEAU");
                                                        $("#modalbtn").html("Ajouter");
                                                    }

                                                    function validateDeletion(id) {
                                                        $("#del_id").html(id);
                                                        $.ajax({
                                                            url: '${pageContext.request.contextPath}/assets/services/employe/getMemberDetails.jsp',
                                                            type: "POST",
                                                            data: {ID: id},
                                                            dataType: 'json',
                                                            success: function (res) {
                                                                if(res.link != 'null'){window.location.href = res.link;} 
                                                                var member = res.data.split("\t");
                                                                $("#fullname").html(member[1]);
                                                                if (member[9].trim().length == 0) {
                                                                    holdModal("DelEmployeModal");
                                                                } else {
                                                                    toastr.error("Impossible de supprimer un employe ayant deja un compte utilisateur.", "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} ");
                                                                }
                                                            },
                                                            error: function (res) {
                                                            }
                                                        });
                                                    }

                                                    function saveData() {
                                                        var ID = $("#EDITID").val();
                                                        var NOMCOMPLET = $("#NOMCOMPLET").val();
                                                        var EMAIL = $("#EMAIL").val();
                                                        var TELEPHONE = $("#TELEPHONE").val();
                                                        var POSTE = $("#POSTE").val();
                                                        var ADRESSE = $("#ADRESSE").val();
                                                        var DATENAISSANCE = $("#DATENAISSANCE").val();
                                                        var NIF = $("#NIF").val();
                                                        var SEXE = $("#SEXE").val();

                                                        $.ajax({
                                                            url: '${pageContext.request.contextPath}/assets/services/employe/addEditMember.jsp',
                                                            type: "POST",
                                                            data: {ID: ID, NOMCOMPLET: NOMCOMPLET, EMAIL: EMAIL, TELEPHONE: TELEPHONE,
                                                                TELEPHONE: TELEPHONE, POSTE: POSTE, ADRESSE: ADRESSE, DATENAISSANCE: DATENAISSANCE,
                                                                NIF: NIF, SEXE: SEXE
                                                            },
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

                                                    function deleteEmploye() {
                                                        var id = $("#del_id").html();
                                                        $.ajax({
                                                            url: '${pageContext.request.contextPath}/assets/services/delete.jsp',
                                                            type: "POST",
                                                            data: {ID: id, table: "employe"},
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
                                                            url: '${pageContext.request.contextPath}/assets/services/employe/getMemberDetails.jsp',
                                                            type: "POST",
                                                            data: {ID: id},
                                                            dataType: 'json',
                                                            success: function (res) {
                                                                if(res.link != 'null'){window.location.href = res.link;} 
                                                                var member = res.data.split("\t");
                                                                $("#EDITID").val(member[0]);
                                                                $("#NOMCOMPLET").val(member[1]);
                                                                $("#SEXE").val(member[2]);
                                                                $("#DATENAISSANCE").val(member[3]);
                                                                $("#ADRESSE").val(member[4]);
                                                                $("#NIF").val(member[5]);
                                                                $("#POSTE").val(member[6]);
                                                                if(member[6]=="Superadmin"){
                                                                    $("#superadmin").attr("style", "");
                                                                    $(".otherposte").attr("style", "display:none");
                                                                }else{
                                                                    $(".otherposte").attr("style", "");
                                                                    $("#superadmin").attr("style", "display:none");
                                                                }
                                                                $("#TELEPHONE").val(member[7]);
                                                                $("#EMAIL").val(member[8]);
                                                                $("#modaltitle").html("MODIFIER");
                                                                $("#modalbtn").html("Modifier");
                                                                holdModal("AddEmployeModal");
                                                            },
                                                            error: function (res) {
                                                            }
                                                        });
                                                    }
                                                    
                                                    var NIF = IMask(
                                                            document.getElementById('NIF'),
                                                            {
                                                                mask: [
                                                                    {
                                                                        mask: '000-000-000-0'
                                                                    }
                                                                ]
                                                            });

                                                    var TELEPHONE = IMask(
                                                            document.getElementById('TELEPHONE'),
                                                            {
                                                                mask: [
                                                                    {
                                                                        mask: '00000000'
                                                                    }
                                                                ]
                                                            });

                                                    if ("<%=request.getSession().getAttribute("welcome")%>" != "null") {
                                                        toastr.info("<%=request.getSession().getAttribute("welcome")%>", "${company.getCOMPANYNAME().toUpperCase()} - TABLEAU DE BORD");
                                                        removeSession("welcome");
                                                    }
</script>