<%-- 
    Document   : personnel
    Created on : Aug 29, 2020, 10:03:53 PM
    Author     : GIRLS
--%>

<%@include file="part/firstpart.jsp" %>

<!-- BEGIN: Vendor CSS-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/vendors.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/tables/datatable/datatables.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/extensions/toastr.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/plugins/forms/selectivity/selectivity.min.css">

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
                        <!--<h4 class="card-title">LISTE</h4>-->
                        <div class="heading-elements mt-0">
                            <%if (r != null && r.get(1).getCAN_ADD().equals("1") || r != null && r.get(1).getCAN_EDIT().equals("1")) {%>
                            <button class="btn btn-primary btn-sm " onclick="holdModal('AddClientModal')"><i class="d-md-none d-block ft-plus white"></i>
                                <span class="d-md-block d-none">Nouveau ${active_menu}</span></button>
                                <%}%>

                            <div class="modal fade" id="AddClientModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1"
                                 aria-hidden="true">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <section class="contact-form">
                                            <form id="add_form" class="contact-input" method="post">
                                                <input name="id" id="EDITID" type="hidden" />
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
                                                                <h5>Type</h5>
                                                                <select name="TYPE" class="contact-email form-control" id="TYPE" placeholder="Sexe">
                                                                    <option disabled value="" selected="">Type</option>
                                                                    <option id="pp">Personne physique</option>
                                                                    <option id="pm">Personne morale</option>
                                                                </select>
                                                            </fieldset>
                                                            <fieldset class="form-group col-12">
                                                                <h5>Sexe</h5>
                                                                <select name="SEXE" class="contact-email form-control" id="SEXE" placeholder="Sexe">
                                                                    <option disabled value="">Sexe</option>
                                                                    <option>MASCULIN</option>
                                                                    <option>FEMININ</option>
                                                                    <option>INDETERMINÉ</option>
                                                                </select>
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-xl-6 col-lg-12">
                                                            <fieldset class="form-group col-12">
                                                                <h5>Nom complet</h5>
                                                                <input type="text" name="NOMCOMPLET" id="NOMCOMPLET" class="contact-email form-control" placeholder="Nom complet">
                                                            </fieldset>
                                                            <fieldset class="form-group col-12">
                                                                <h5>Adresse compl&egrave;te</h5>
                                                                <input type="text" name="ADRESSE" id="ADRESSE" class="contact-email form-control" placeholder="Adresse compl&egrave;te">
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-xl-6 col-lg-12">
                                                            <fieldset class="form-group col-12">
                                                                <h5>Nationalit&eacute;</h5>
                                                                <select name="NATIONALITE" class="contact-email form-control" id="NATIONALITE">
                                                                    <option disabled value="" selected>Nationalit&eacute;</option>
                                                                    <option id="ht">Hait&iuml;enne</option>
                                                                    <option id="etr">Etrang&egrave;re</option>
                                                                </select>
                                                            </fieldset>

                                                            <fieldset class="form-group col-12">
                                                                <h5>CIN</h5>
                                                                <input type="text" name="CIN" class="contact-email form-control input-lg" id="CIN" placeholder="CIN">
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-xl-6 col-lg-12">
                                                            <fieldset class="form-group col-12">
                                                                <h5>Num&eacute;ro de passeport</h5>
                                                                <input type="text" name="PASSEPORT" id="PASSEPORT" class="contact-email form-control" placeholder="Num&eacute;ro de passeport">
                                                            </fieldset>

                                                            <fieldset class="form-group col-12">
                                                                <h5>T&eacute;l&eacute;phone</h5>
                                                                <input type="text" name="TELEPHONE" class="contact-email form-control input-lg" id="TELEPHONE" placeholder="T&eacute;l&eacute;phone">
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-xl-6 col-lg-12"> 
                                                            <fieldset class="form-group col-12">
                                                                <h5>Num&eacute;ro de permis</h5>
                                                                <input type="text" name="PERMIS" class="contact-email form-control input-lg" id="PERMIS" placeholder="Numero de permis">
                                                            </fieldset>                                                            

                                                            <fieldset class="form-group col-12">
                                                                <h5>Adresse m&eacute;l</h5>
                                                                <input type="email" name="EMAIL" class="contact-email form-control input-lg" id="EMAIL" placeholder="Adresse m&eacute;l">
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-xl-6 col-lg-12">
                                                            <fieldset class="form-group col-12">
                                                                <h5>Date d'expiration du permis</h5>
                                                                <input type="text" disabled name="DATEDEXPIRATION" class="contact-email form-control input-lg" id="DATEDEXPIRATION" placeholder="Date d'expiration du permis">
                                                            </fieldset>

                                                            <fieldset class="form-group col-12">
                                                                <h5>Num&eacute;ro de patente</h5>
                                                                <input type="text" name="PATENTE" class="contact-email form-control input-lg" id="PATENTE" placeholder="Num&eacute;ro de patente">
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

                            <div class="modal fade" id="DelClientModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1"
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
                                                <p>&Ecirc;tes vous s&ucirc;r de vouloir supprimer le client '<b id="fullname"></b>' ?</p>
                                            </div>
                                            <div class="modal-footer">
                                                <fieldset class="form-group position-relative has-icon-left mb-0">
                                                    <button onclick="deleteClient()" type="button" class="btn btn-info addadd-contact-item"><i
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
                                        <th>TYPE</th>
                                        <th>NOMCOMPLET</th>
                                        <th>SEXE</th>
                                        <th>ADRESSE</th>
                                        <th>NATIONALITE</th>
                                        <th>CIN</th>
                                        <th>PASSEPORT</th>
                                        <th>TELEPHONE</th>
                                        <th>EMAIL</th>
                                        <th>PERMIS</th>
                                        <th>DATEDEXPIRATION</th>
                                        <th>PATENTE</th>
                                            <%if (r != null && (r.get(1).getCAN_EDIT().equals("1") || r.get(1).getCAN_DELETE().equals("1"))) {%>
                                        <th>ACTIONS</th>
                                            <%}%>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="m" items="${client}" >
                                        <tr>
                                            <td>${m.ID()}</td>
                                            <td>${m.TYPE()}</td>
                                            <td>${m.NOMCOMPLET()}</td>
                                            <td>${m.SEXE()}</td>
                                            <td>${m.ADRESSE()}</td>
                                            <td>${m.NATIONALITE()}</td>
                                            <td>${m.CIN()}</td>
                                            <td>${m.PASSEPORT()}</td>
                                            <td>${m.TELEPHONE()}</td>

                                            <td class="text-center">
                                                <a class="email" href="mailto:${m.EMAIL()}">${m.EMAIL()}</a>
                                            </td>
                                            <td>${m.PERMIS()}</td>
                                            <td>${m.DATEDEXPIRATION()}</td>
                                            <td>${m.PATENTE()}</td>
                                            <%if (r != null && (r.get(1).getCAN_EDIT().equals("1") || r.get(1).getCAN_DELETE().equals("1"))) {%>
                                            <td>
                                                <%if (r != null && r.get(1).getCAN_EDIT().equals("1")) {%>
                                                <a href="#" onclick="showEditModal('${m.ID()}')" class="primary edit mr-1" title="Modifier"><i class="la la-pencil"></i></a>
                                                    <%}%>

                                                <%if (r != null && r.get(1).getCAN_DELETE().equals("1")) {%>
                                                <a href="#" onclick="validateDeletion('${m.ID()}')" class="danger delete mr-1" title="Supprimer"><i class="la la-trash-o"></i></a>
                                                    <%}%>
                                            </td>
                                            <%}%>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>ID</th>
                                        <th>TYPE</th>
                                        <th>NOMCOMPLET</th>
                                        <th>SEXE</th>
                                        <th>ADRESSE</th>
                                        <th>NATIONALITE</th>
                                        <th>CIN</th>
                                        <th>PASSEPORT</th>
                                        <th>TELEPHONE</th>
                                        <th>EMAIL</th>
                                        <th>PERMIS</th>
                                        <th>DATEDEXPIRATION</th>
                                        <th>PATENTE</th>
                                            <%if (r != null && (r.get(1).getCAN_EDIT().equals("1") || r.get(1).getCAN_DELETE().equals("1"))) {%>
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
<!-- END: Content-->

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

                                                    function setFieldForType(type) {
                                                        if (type == "Personne physique") {
                                                            $("#PATENTE").attr("disabled", true);
                                                            $("#PATENTE").val("");
                                                            $("#SEXE").attr("disabled", false);
                                                            $("#NATIONALITE").attr("disabled", false);
                                                            $("#CIN").attr("disabled", false);
                                                            $("#PERMIS").attr("disabled", false);
                                                            $("#DATEDEXPIRATION").attr("disabled", false);
                                                            $("#DATEDEXPIRATION").val("");
                                                            $("#DATEDEXPIRATION").dateDropper({
                                                                dropWidth: 200,
                                                                init_animation: "bounce",
                                                                minYear: ((new Date().getYear() + 1900) - 18),
                                                                lang: "fr",
                                                                format: "j/m/Y",
                                                                dropPrimaryColor: "#d4002a",
                                                                dropBorder: "1px solid #d4002a"
                                                            });
                                                            $("#PASSEPORT").attr("disabled", false);
                                                            $("#DATEDEXPIRATION").attr("disabled", false);
                                                        } else {
                                                            $("#DATEDEXPIRATION").val("");
                                                            $("#SEXE").attr("disabled", true);
                                                            $("#SEXE").val("");
                                                            $("#PATENTE").attr("disabled", false);
                                                            $("#NATIONALITE").attr("disabled", true);
                                                            $("#NATIONALITE").val("");
                                                            $("#CIN").attr("disabled", true);
                                                            $("#CIN").val("");
                                                            $("#PERMIS").attr("disabled", true);
                                                            $("#PERMIS").val("");
                                                            $("#PASSEPORT").attr("disabled", true);
                                                            $("#PASSEPORT").val("");
                                                            $("#DATEDEXPIRATION").attr("disabled", true);
                                                            $("#DATEDEXPIRATION").val("");
                                                        }
                                                    }

                                                    function setFieldForNation(nation) {
                                                        if (nation == "Haitïenne") {
                                                            $("#CIN").attr("disabled", false);
                                                            $("#PASSEPORT").attr("disabled", true);
                                                            $("#PASSEPORT").val("");
                                                        }
                                                        if (nation.includes("Etrang")) {
                                                            $("#CIN").attr("disabled", true);
                                                            $("#CIN").val("");
                                                            $("#PASSEPORT").val("");
                                                            $("#PASSEPORT").attr("disabled", false);
                                                        }
                                                    }

                                                    $("#TYPE").on("change", function () {
                                                        setFieldForType($(this).val());
                                                    });

                                                    $("#NATIONALITE").on("change", function () {
                                                        setFieldForNation($(this).val());
                                                    });

                                                    function validateDeletion(id) {
                                                        $("#del_id").html(id);
                                                        $.ajax({
                                                            url: '${pageContext.request.contextPath}/assets/services/client/getClientDetails.jsp',
                                                            type: "POST",
                                                            data: {ID: id},
                                                            dataType: 'json',
                                                            success: function (res) {
                                                                if(res.link != 'null'){window.location.href = res.link;} 
                                                                var member = res.data.split("\t");
                                                                $("#fullname").html(member[2]);
                                                                $.ajax({
                                                                    url: '${pageContext.request.contextPath}/assets/services/client/getDetailsFromLocation.jsp',
                                                                    type: "POST",
                                                                    data: {ID: member[0]},
                                                                    dataType: 'json',
                                                                    success: function (res) {
                                                                        if (res.msg == "succes") {
                                                                            holdModal("DelClientModal");
                                                                        } else {
                                                                            toastr.error(res.msg, "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} ");
                                                                        }
                                                                    },
                                                                    error: function (res) {
                                                                    }
                                                                });

                                                            },
                                                            error: function (res) {
                                                            }
                                                        });
                                                    }

                                                    function saveData(type) {
                                                        var ID = $("#EDITID").val();
                                                        var TYPE = $("#TYPE").val();
                                                        var NOMCOMPLET = $("#NOMCOMPLET").val();
                                                        var SEXE = $("#SEXE").val();
                                                        var ADRESSE = $("#ADRESSE").val();
                                                        var NATIONALITE = $("#NATIONALITE").val();
                                                        var CIN = $("#CIN").val();
                                                        var PASSEPORT = $("#PASSEPORT").val();
                                                        var TELEPHONE = $("#TELEPHONE").val();
                                                        var EMAIL = $("#EMAIL").val();
                                                        var PERMIS = $("#PERMIS").val();
                                                        var DATEDEXPIRATION = $("#DATEDEXPIRATION").val();
                                                        var PATENTE = $("#PATENTE").val();

                                                        $.ajax({
                                                            url: '${pageContext.request.contextPath}/assets/services/client/addEditClient.jsp',
                                                            type: "POST",
                                                            data: {ID: ID, TYPE: TYPE, NOMCOMPLET: NOMCOMPLET, SEXE: SEXE, ADRESSE: ADRESSE, NATIONALITE: NATIONALITE,
                                                                CIN: CIN, PASSEPORT: PASSEPORT, TELEPHONE: TELEPHONE, EMAIL: EMAIL, PERMIS: PERMIS, DATEDEXPIRATION: DATEDEXPIRATION,
                                                                PATENTE: PATENTE},
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

                                                    function deleteClient() {
                                                        var id = $("#del_id").html();
                                                        $.ajax({
                                                            url: '${pageContext.request.contextPath}/assets/services/delete.jsp',
                                                            type: "POST",
                                                            data: {ID: id, table: "client"},
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
                                                            url: '${pageContext.request.contextPath}/assets/services/client/getClientDetails.jsp',
                                                            type: "POST",
                                                            data: {ID: id},
                                                            dataType: 'json',
                                                            success: function (res) {
                                                                if(res.link != 'null'){window.location.href = res.link;} 
                                                                var member = res.data.replace("N/A", "NA").split("\t");
                                                                $("#EDITID").val(member[0]);
                                                                $("#" + member[1]).attr("selected", true);

                                                                setFieldForType(member[1]);
                                                                if (member[1].includes("physique")) {
                                                                    $("#pp").attr("style", "");
                                                                    $("#pp").attr("selected", true);
                                                                    $("#pm").attr("style", "display:none");
                                                                } else {
                                                                    $("#pm").attr("style", "");
                                                                    $("#pm").attr("selected", true);
                                                                    $("#pp").attr("style", "display:none");

                                                                }
                                                                $("#NOMCOMPLET").val(member[2]);
                                                                $("#" + member[3]).attr("selected", true);
                                                                $("#ADRESSE").val(member[4]);

                                                                if (member[5].includes("Ha")) {
                                                                    $("#ht").attr("selected", true);
                                                                }
                                                                if (member[5].includes("Etrang")) {
                                                                    $("#etr").attr("selected", true);
                                                                }
                                                                setFieldForNation(member[5]);

                                                                $("#CIN").val(member[6]);
                                                                $("#PASSEPORT").val(member[7]);
                                                                $("#TELEPHONE").val(member[8]);
                                                                $("#EMAIL").val(member[9]);
                                                                $("#PERMIS").val(member[10]);
                                                                $("#DATEDEXPIRATION").val(member[11]);
                                                                $("#PATENTE").val(member[12]);
                                                                $("#modaltitle").html("MODIFIER");
                                                                $("#modalbtn").html("Modifier");
                                                                holdModal("AddClientModal");
                                                            },
                                                            error: function (res) {
                                                            }
                                                        });
                                                    }

                                                    var PATENTE = IMask(
                                                            document.getElementById('PATENTE'),
                                                            {
                                                                mask: [
                                                                    {
                                                                        mask: '00 00000000'
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