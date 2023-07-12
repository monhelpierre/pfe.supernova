<%-- 
    Document   : personnel
    Created on : Aug 29, 2020, 10:03:53 PM
    Author     : GIRLS
--%>

<%@page import="supernova.pfe.dao.D_UserPermission"%>
<%@page import="supernova.pfe.model.PermissionCategory"%>
<%@page import="supernova.pfe.dao.D_PermissionCategory"%>
<%@page import="supernova.pfe.model.Module"%>
<%@page import="supernova.pfe.dao.D_Module"%>
<%@page import="java.util.ArrayList"%>
<%@page import="supernova.pfe.dao.D_Auth"%>
<%@page import="supernova.pfe.model.Employe"%>
<%@include file="part/firstpart.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/vendors.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/tables/datatable/datatables.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/extensions/toastr.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/plugins/forms/selectivity/selectivity.min.css">

<div class="content-body"><div class="content-overlay"></div>

    <section class="row all-contacts">
        <div class="col-12">
            <div class="card">
                <div class="card-head">
                    <div class="card-header">
                        <div class="heading-elements mt-0">
                            <%if (r != null && r.get(5).getCAN_ADD() == 1 || r != null && r.get(5).getCAN_EDIT() == 1) {%>
                            <button class="btn btn-primary btn-sm " onclick="holdModal('AddEmployeModal')"><i class="d-md-none d-block ft-plus white"></i>
                                <span class="d-md-block d-none">Nouveau ${active_menu}</span></button>
                                <%}%>

                            <div class="modal fade" id="AddEmployeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1"
                                 aria-hidden="true">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <section class="contact-form">
                                            <form id="add_form" class="contact-input" method="post">
                                                <input type="hidden" name="ID" id="EDITID"/>
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel1"><span id="modaltitle">NOUVEAU</span> ${active_menu.toUpperCase()}</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="resetData()">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div id="personneldiv" class="col-xl-6 col-lg-12">
                                                            <fieldset class="form-group col-12">
                                                                <h5 id="personneltitle">Employe</h5>
                                                                <select name="personnel" class="form-control" id="personnel" placeholder="Personnel">
                                                                    <option disabled="" selected="" value="">Employe</option>
                                                                    <%for (Employe mb : new D_Auth().get()) {%>
                                                                    <option <%=!mb.PSEUDO().isEmpty() ? "class='hidden'" : ""%> id="<%=mb.ID()%>" value="<%=mb.ID()%>"><%=mb.NOMCOMPLET()%></option>
                                                                    <%}%>
                                                                </select>
                                                            </fieldset>
                                                            <fieldset class="form-group col-12 onlyadd">
                                                                <h5>Mot de passe</h5>
                                                                <input type="password" name="motdepasse" id="motdepasse" class="contact-email form-control" placeholder="Mot de passe">
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-xl-6 col-lg-12"id="psd">
                                                            <fieldset class="form-group col-12">
                                                                <h5>Pseudo</h5>
                                                                <input type="text" name="pseudo" id="pseudo" class="contact-name form-control" placeholder="Pseudo">
                                                            </fieldset>

                                                            <fieldset class="form-group col-12 onlyadd">
                                                                <h5>Confirmation</h5>
                                                                <input type="password" name="confirmer" id="confirmer" class="contact-phone form-control" placeholder="Confirmer">
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-xl-12 col-lg-12">
                                                            <fieldset class="form-group col-12">
                                                                <h5>&Eacute;tat</h5>
                                                                <select name="etat" class="form-control" id="etat" placeholder="Etat">
                                                                    <option disabled="" value="">&Eacute;tat</option>
                                                                    <option selected>Actif</option>
                                                                    <option class="hidden" id="Inactif">Inactif</option>
                                                                </select>
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-12">
                                                            <div class="table-responsive">
                                                                <table class="table mt-1">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>MODULES</th>
                                                                            <th>VOIR</th>
                                                                            <th>AJOUTER</th>
                                                                            <th>MODIFIER</th>
                                                                            <th>SUPPRIMER</th>
                                                                            <th>IMPRIMER</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <% for (Module mod : new D_Module().get()) {%>
                                                                        <tr>
                                                                            <td><%=mod.getNOM()%></td>
                                                                            <% PermissionCategory pc = new D_PermissionCategory().getForModule(mod.getID()).get(0); %>

                                                                            <td>
                                                                                <%if (pc.getCAN_VIEW() == 1) {%> 
                                                                                <div class="custom-control custom-checkbox">
                                                                                    <input onchange="checkValues('<%=mod.getID()%>', 'canview')" name="canview<%=mod.getID()%>"
                                                                                           type="checkbox" id="canview<%=mod.getID()%>"
                                                                                           class="<%=mod.getID()%>1 custom-control-input">
                                                                                    <label class="custom-control-label" for="canview<%=mod.getID()%>"></label>
                                                                                </div>
                                                                                <%}%>
                                                                            </td>

                                                                            <td>
                                                                                <%if (pc.getCAN_ADD() == 1) {%>
                                                                                <div class="custom-control custom-checkbox">
                                                                                    <input onchange="checkValues('<%=mod.getID()%>', 'canadd')" name="canadd<%=mod.getID()%>"
                                                                                           type="checkbox" id="canadd<%=mod.getID()%>"
                                                                                           class="<%=mod.getID()%>2 custom-control-input">
                                                                                    <label class="custom-control-label" for="canadd<%=mod.getID()%>"></label>
                                                                                </div>
                                                                                <%}%>
                                                                            </td>

                                                                            <td> 
                                                                                <%if (pc.getCAN_EDIT() == 1) {%>
                                                                                <div class="custom-control custom-checkbox">
                                                                                    <input onchange="checkValues('<%=mod.getID()%>', 'canedit')" name="canedit<%=mod.getID()%>"
                                                                                           type="checkbox" id="canedit<%=mod.getID()%>"
                                                                                           class="<%=mod.getID()%>3 custom-control-input">
                                                                                    <label class="custom-control-label" for="canedit<%=mod.getID()%>"></label>
                                                                                </div>
                                                                                <%}%>
                                                                            </td>

                                                                            <td>
                                                                                <%if (pc.getCAN_DELETE() == 1) {%>
                                                                                <div class="custom-control custom-checkbox">
                                                                                    <input onchange="checkValues('<%=mod.getID()%>', 'candelete')" name="candelete<%=mod.getID()%>"
                                                                                           type="checkbox" id="candelete<%=mod.getID()%>"
                                                                                           class="<%=mod.getID()%>4 custom-control-input">
                                                                                    <label class="custom-control-label" for="candelete<%=mod.getID()%>"></label>
                                                                                </div>
                                                                                <%}%>
                                                                            </td>

                                                                            <td> 
                                                                                <%if (pc.getCAN_PRINT() == 1) {%>
                                                                                <div class="custom-control custom-checkbox">
                                                                                    <input onchange="checkValues('<%=mod.getID()%>', 'canprint')" name="canprint<%=mod.getID()%>"
                                                                                           type="checkbox" id="canprint<%=mod.getID()%>"
                                                                                           class="<%=mod.getID()%>5 custom-control-input">
                                                                                    <label class="custom-control-label" for="canprint<%=mod.getID()%>"></label>
                                                                                </div>
                                                                                <%}%>
                                                                            </td>
                                                                        </tr>
                                                                        <% }%>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>

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
                                                <p>Etes vous sur de vouloir supprimer l'utilisateur '<b id="fullname"></b>' ?</p>
                                            </div>
                                            <div class="modal-footer">
                                                <fieldset class="form-group position-relative has-icon-left mb-0">
                                                    <button onclick="deleteUser()" type="button" class="btn btn-info add-contact-item"><i
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
                                        <th>PSEUDO</th>
                                        <th>POSTE</th>
                                        <th>&Eacute;TAT</th>
                                            <%if (r != null && (r.get(5).getCAN_EDIT() == 1 || r.get(5).getCAN_DELETE() == 1)) {%>
                                        <th>ACTIONS</th>
                                            <%}%>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (Employe me : ((ArrayList<Employe>) request.getAttribute("member"))) {%>
                                    <tr>
                                        <td><%=me.ID()%></td>
                                        <td><%=me.PSEUDO()%></td>
                                        <td><%=me.POSTE()%></td>
                                        <td><%=me.ETAT()%></td>
                                        <%if (r != null && (r.get(0).getCAN_EDIT() == 1 || r.get(0).getCAN_DELETE() == 1)) {%>
                                        <td>
                                            <%
                                                if (me != null && m != null && me.ID() != m.ID()) {
                                                    if (!me.PSEUDO().equals("admin")) {
                                                        if (r != null && r.get(5).getCAN_EDIT() == 1) {%>
                                            <a title="Modifier" href="#" onclick="showEditModal('<%=me.ID()%>')" class="primary edit mr-1"><%=me.PSEUDO().equals("admin") ? "" : "<i class='la la-pencil'></i>"%></a>
                                            <%}%>
                                            <%if (r != null && r.get(5).getCAN_DELETE() == 1) {%>
                                            <a title="Supprimer" href="#" onclick="validateDeletion('<%=me.ID()%>')" class="danger delete mr-1"><%=me.PSEUDO().equals("admin") ? "" : "<i class='la la-trash'></i>"%></a>
                                            <%}
                                                    }
                                                }%>
                                        </td>
                                        <%}%>
                                    </tr>
                                    <%}%>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>ID</th>
                                        <th>PSEUDO</th>
                                        <th>POSTE</th>
                                        <th>&Eacute;TAT</th>
                                            <%if (r != null && (r.get(5).getCAN_EDIT() == 1 || r.get(5).getCAN_DELETE() == 1)) {%>
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
<script src="${pageContext.request.contextPath}/assets/vendors/js/forms/select/selectivity-full.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scripts/forms/select/form-selectivity.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/js/extensions/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scripts/extensions/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/js/tables/datatable/datatables.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scripts/tables/datatables/datatable-basic.min.js"></script>

<script>
                                                function resetData() {
                                                    $('#add_form')[0].reset();
                                                    $("#modaltitle").html("NOUVEAU");
                                                    $("#personneldiv").attr("class", "col-xl-6 col-lg-12");
                                                    $("#personneltitle").attr("hidden", false);
                                                    $("#personnel").attr("hidden", false);
                                                    $("#onlyadd").attr("hidden", false);
                                                    $("#psd").attr("class", $("#psd").attr("class").replace("12", "6"));
                                                    $("#modalbtn").html("Ajouter");
                                                }

                                                function validateDeletion(id) {
                                                    $("#del_id").html(id);
                                                    $.ajax({
                                                        url: '${pageContext.request.contextPath}/assets/services/utilisateur/getUserDetails.jsp',
                                                        type: "POST",
                                                        data: {ID: id},
                                                        dataType: 'json',
                                                        success: function (res) {
                                                            if(res.link != 'null'){window.location.href = res.link;} 
                                                            var member = res.data.split("\t");
                                                            $("#fullname").html(member[1]);
                                                            holdModal("DelEmployeModal");
                                                        },
                                                        error: function (res) {
                                                        }
                                                    });
                                                }

                                                function saveData() {
                                                    var ID = $("#EDITID").val();
                                                    var PERSONNEL = $("#personnel").val();
                                                    var PSEUDO = $("#pseudo").val();
                                                    var MOTDEPASSE = $("#motdepasse").val();
                                                    var CONFIRMER = $("#confirmer").val();
                                                    var ETAT = $("#etat").val();

                                                    var r = "";
                                                    $("#add_form").find("input").each(function () {
                                                        if ($(this).attr("name").includes("can")) {
                                                            r += $(this).attr("name") + "=" + (this.checked ? 1 : 0) + ",";
                                                        }
                                                    });

                                                    $.ajax({
                                                        url: '${pageContext.request.contextPath}/assets/services/utilisateur/addUser.jsp',
                                                        type: "POST",
                                                        data: {RIGHTS: r, ID: ID, personnel: PERSONNEL, pseudo: PSEUDO, motdepasse: MOTDEPASSE, confirmer: CONFIRMER, etat: ETAT},
                                                        dataType: 'json',
                                                        success: function (res) {
                                                            if(res.link != 'null'){window.location.href = res.link;} 
                                                            if (!res.message.includes("succes")) {
                                                                toastr.error(res.message, "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} ");
                                                            } else {
                                                                setTimeout(toastr.success(res.message, "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} "), 1000);
                                                                window.location.reload(true);
                                                            }
                                                        },
                                                        error: function () {
                                                            toastr.error("Erreur", "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} ");
                                                        }
                                                    });
                                                }

                                                function deleteUser() {
                                                    var id = $("#del_id").html();
                                                    $.ajax({
                                                        url: '${pageContext.request.contextPath}/assets/services/utilisateur/deleteUser.jsp',
                                                        type: "POST",
                                                        data: {PERSONNEL: id},
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
                                                        url: '${pageContext.request.contextPath}/assets/services/utilisateur/getUserDetails.jsp',
                                                        type: "POST",
                                                        data: {ID: id},
                                                        dataType: 'json',
                                                        success: function (res) {
                                                            if(res.link != 'null'){window.location.href = res.link;} 
                                                            var member = res.data.split("\t");
                                                            $("#EDITID").val(member[0]);
                                                            $("#" + member[0]).attr("selected", true);

                                                            $("#personneldiv").attr("class", "col-xl-12 col-lg-12");
                                                            $("#personneltitle").attr("hidden", true);
                                                            $("#personnel").attr("hidden", true);
                                                            $(".onlyadd").attr("hidden", true);

                                                            $("#psd").attr("class", $("#psd").attr("class").replace("6", "12"));

                                                            $("#pseudo").val(member[1]);
                                                            $("#pseudo").attr("readonly", true);

                                                            $("#motdepasse").val(member[2]);
                                                            $("#confirmer").val(member[2]);

                                                            $("#etat").val(member[3]);

                                                            $("#modaltitle").html("MODIFIER");
                                                            $("#modalbtn").html("Modifier");

                                                            $("#Inactif").attr("class", "");

                                                            $.ajax({
                                                                url: '${pageContext.request.contextPath}/assets/services/utilisateur/getUserPermission.jsp',
                                                                type: "POST",
                                                                data: {ID: member[0]},
                                                                dataType: 'json',
                                                                success: function (r) {
                                                                    var permlist = r.perm.split("\t");
                                                                    for (var i = 0; i < permlist.length; i++) {
                                                                        var singleperm = permlist[i].split("-");
                                                                        $("#canview" + singleperm[0]).prop("checked", singleperm[1] == 1 ? true : false);
                                                                        $("#canadd" + singleperm[0]).prop("checked", singleperm[2] == 1 ? true : false);
                                                                        $("#canedit" + singleperm[0]).prop("checked", singleperm[3] == 1 ? true : false);
                                                                        $("#candelete" + singleperm[0]).prop("checked", singleperm[4] == 1 ? true : false);
                                                                        $("#canprint" + singleperm[0]).prop("checked", singleperm[5] == 1 ? true : false);
                                                                    }
                                                                    holdModal("AddEmployeModal");
                                                                },
                                                                error: function (res) {
                                                                }
                                                            });
                                                        },
                                                        error: function (res) {
                                                        }
                                                    });
                                                }

                                                function checkValues(id, type) {
                                                    if (type == "canview") {
                                                        if (!$("#" + type + id).is(":checked")) {
                                                            $("#canadd" + id).prop("checked", false);
                                                            $("#canedit" + id).prop("checked", false);
                                                            $("#candelete" + id).prop("checked", false);
                                                            $("#canprint" + id).prop("checked", false);
                                                        }
                                                    }
                                                    if (type == "canadd") {
                                                        if ($("#" + type + id).is(":checked")) {
                                                            $("#canview" + id).prop("checked", true);
                                                        }
                                                    }
                                                    if (type == "canedit") {
                                                        if ($("#" + type + id).is(":checked")) {
//                                                           $("#canadd"+id).prop("checked", true);
                                                            $("#canview" + id).prop("checked", true);
                                                        }
                                                    }
                                                    if (type == "candelete") {
                                                        if ($("#" + type + id).is(":checked")) {
                                                            $("#canview" + id).prop("checked", true);
                                                        }
                                                    }
                                                    if (type == "canprint") {
                                                        if ($("#" + type + id).is(":checked")) {
                                                            $("#canview" + id).prop("checked", true);
                                                        }
                                                    }
                                                }

                                                if ("<%=request.getSession().getAttribute("welcome")%>" != "null") {
                                                    toastr.info("<%=request.getSession().getAttribute("welcome")%>", "${company.getCOMPANYNAME().toUpperCase()} - TABLEAU DE BORD");
                                                    removeSession("welcome");
                                                }

</script>