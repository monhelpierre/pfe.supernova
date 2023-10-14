<%-- 
    Document   : personnel
    Created on : Aug 29, 2020, 10:03:53 PM
    Author     : GIRLS
--%>

<%@page import="supernova.pfe.dao.D_Auth"%>
<%@page import="supernova.pfe.model.Location"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="supernova.pfe.dao.D_Vehicule"%>
<%@page import="supernova.pfe.model.Vehicule"%>
<%@page import="supernova.pfe.model.Vehicule"%>
<%@page import="supernova.pfe.dao.D_Client"%>
<%@page import="supernova.pfe.model.Client"%>
<%@page import="supernova.pfe.model.Client"%>
<%@include file="part/firstpart.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/vendors.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/tables/datatable/datatables.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/extensions/toastr.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/plugins/forms/selectivity/selectivity.min.css">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/extensions/datedropper.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/extensions/timedropper.min.css">


<div class="content-body">
    <div class="content-overlay"></div>
    <section class="row all-contacts" id="pick-a-date">
        <input id="picker_from" class="form-control datepicker hidden" type="date">
        <input id="picker_to" class="form-control datepicker hidden" type="date">

        <div class="col-12">
            <div class="card">
                <div class="card-head">
                    <div class="card-header">
                        <div class="heading-elements mt-0">
                            <%if (r != null && r.get(5).getCAN_ADD().equals("1") || r != null && r.get(5).getCAN_EDIT().equals("1")) {%>
                            <button class="btn btn-primary btn-sm " onclick="holdModal('AddLocationModal')"><i class="d-md-none d-block ft-plus white"></i>
                                <span class="d-md-block d-none">Nouvelle ${active_menu}</span></button>
                                <%}%>

                            <div class="modal fade" id="AddLocationModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1"
                                 aria-hidden="true">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <section class="contact-form">
                                            <form id="add_form" class="contact-input" method="post">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel1"><span id="modaltitle">NOUVELLE</span> ${active_menu.toUpperCase()}</h5>
                                                    <button onclick="resetData()" type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="resetData()">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="col-xl-6 col-lg-12">
                                                            <input name="id" id="EDITID" type="hidden" />
                                                            <fieldset class="form-group col-12">
                                                                <h5>Client</h5>
                                                                <select name="client" class="form-control" id="CLIENT" placeholder="Client">
                                                                    <option value="" disabled selected>Client</option>
                                                                    <%for (Client mb : new D_Client().get()) {%>
                                                                    <option value="<%=mb.ID()%>"><%=mb.NOMCOMPLET()%></option>
                                                                    <%} %>
                                                                </select>
                                                            </fieldset>                       
                                                        </div>

                                                        <div class="col-xl-6 col-lg-12">
                                                            <fieldset class="form-group col-12">
                                                                <h5>V&eacute;hicule</h5>
                                                                <span id="VEHICLEINFO">
                                                                    <select disabled name="VEHICULE" class="form-control" id="VEHICULE" placeholder="V&eacute;hicule">
                                                                        <option value="" disabled selected>V&eacute;hicule</option>
                                                                        <%for (Vehicule mb : new D_Vehicule().get()) {
                                                                                if (mb.ETAT().equals("LIBRE")) {%>
                                                                        <option value="<%=mb.ID()%>"><%="(" + mb.COULEUR() + ") " + mb.MARQUE() + " - " + mb.MODEL() + " (" + mb.NUMPLAQUE() + ")"%></option>
                                                                        <%}
                                                                            }%>
                                                                    </select>
                                                                </span>
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-xl-6 col-lg-12">
                                                            <fieldset class="form-group col-12">
                                                                <h5>Prix par jour</h5>
                                                                <input readonly="" type="text" name="PRIXPARJOUR" id="PRIXPARJOUR" class="contact-name form-control" placeholder="Prix par jour">
                                                            </fieldset>

                                                            <fieldset class="form-group col-12">
                                                                <h5>Heure de d&eacute;but</h5>
                                                                <input name="HEUREDEBUT" type='text' class="contact-name form-control" id="HEUREDEBUT"/>
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-xl-6 col-lg-12">                                                            
                                                            <fieldset class="form-group col-12">
                                                                <h5>Date de d&eacute;but</h5>
                                                                <input name="DATEDEBUT" type='text' class="contact-name form-control" id="DATEDEBUT"/>
                                                            </fieldset>

                                                            <fieldset class="form-group col-12">
                                                                <h5>Nombre de jour</h5>
                                                                <input type="number" min="1" name="NBJOUR" id="NBJOUR" class="contact-name form-control" placeholder="Nombre de jour">
                                                            </fieldset>                                                             
                                                        </div>

                                                        <div class="col-xl-6 col-lg-12">
                                                            <fieldset class="form-group col-12">
                                                                <h5>V&eacute;hicule retourn&eacute;</h5>
                                                                <select name="VEHICULERETOURNE" class="form-control" id="VEHICULERETOURNE" placeholder="V&eacute;hicule retourn&eacute;">
                                                                    <option disabled="" value="">V&eacute;hicule retourn&eacute;</option>
                                                                    <option id="Non" selected>NON</option>
                                                                    <option id="Oui">OUI</option>
                                                                </select>
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-xl-6 col-lg-12">
                                                            <fieldset class="form-group col-12">
                                                                <h5>Dette</h5>
                                                                <input name="DETTE" type='text' class="contact-name form-control" id="DETTE"/>
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-xl-12 col-lg-12">
                                                            <fieldset class="form-group col-12">
                                                                <h5>&Eacute;tat</h5>
                                                                <select name="ETAT" class="form-control" id="ETAT" placeholder="Statut">
                                                                    <option disabled="" value="">&Eacute;tat</option>
                                                                    <option id="Actif" selected>ACTIF</option>
                                                                    <option id="Terminé" class="hidden">TERMINÉ</option>
                                                                </select>
                                                            </fieldset>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <span class="text-info" style="float: left; text-transform: uppercase; size: 40px"><i class="fa fa-info-circle"></i> Prix total: <span style="border-bottom-style: double; font-weight: bold; color: red">$ <span id="MONTANT">--</span></span></span>
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

                            <div class="modal fade" id="DelLocationModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1"
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
                                                <p>&Ecirc;tes vous s&uuml;r de vouloir supprimer les informations de la location de '<b id="fullname"></b>' ?</p>
                                            </div>
                                            <div class="modal-footer">
                                                <fieldset class="form-group position-relative has-icon-left mb-0">
                                                    <button onclick="deleteLocation()" type="button" class="btn btn-info add-contact-item"><i
                                                            class="la la-paper-plane-o d-block d-lg-none"></i> <span class="d-none d-lg-block">Valider</span></button>
                                                </fieldset>
                                            </div>
                                        </section>
                                    </div>
                                </div>
                            </div>

                            <div class="modal fade" id="ReturnCarConfirmation" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1"
                                 aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <section class="contact-form">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel1">CONFIRMER RETOUR VEHICULE</h5>
                                                <button onclick="cancelVehicle()" type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <span id="del_id" style="display: none"></span>
                                                <p>&Ecirc;tes vous s&uuml;r de vouloir retourner ce v&e&eacute;hicule bien que la location n'est pas encore  arriv&eacute;e &agrave; terme ?<p/>
                                            </div>
                                            <div class="modal-footer">
                                                <fieldset class="form-group position-relative has-icon-left mb-0">
                                                    <button onclick="setComment()" type="button" class="btn btn-info add-contact-item"><i
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
                                        <th>CLIENT</th>
                                        <th>VEHICULE</th>
                                        <th>DATE DE DEBUT</th>
                                        <th>HEURE DE DEBUT</th>
                                        <th>NOMBRE DE JOUR</th>
                                        <th>VEHICULERETOURNE</th>
                                        <th>DETTE</th>
                                        <th>STATUT</th>
                                        <th>RETOUR AVANT</th>                                        
                                            <%if (r != null && (r.get(5).getCAN_EDIT().equals("1") || r.get(5).getCAN_DELETE().equals("1")
                                                        || r.get(5).getCAN_PRINT().equals("1"))) {%>
                                        <th>ACTIONS</th>
                                            <%}%>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for (Location l : (ArrayList<Location>) request.getAttribute("location")) {%>
                                    <tr>
                                        <td><%=l.ID()%></td>
                                        <td><%=new D_Auth().nameOf("client", "nomcomplet", l.CLIENT())%></td>
                                        <td><%=new D_Auth().nameOf("vehicule", "numplaque", l.VEHICULE())%></td>
                                        <td><%=l.DATEDEBUT()%></td>
                                        <td><%=l.HEUREDEBUT()%></td>
                                        <td><%=l.NBJOUR()%></td>
                                        <td><%=l.VEHICULERETOURNE()%></td>
                                        <td>$ 
                                            <%
                                                String[] det = l.DETTE().replace(".", "-").split("-");
                                                out.print(l.DETTE().contains(".") ? (det[0] + "." + det[1].substring(0, 1)) : l.DETTE());
                                            %>
                                        </td>
                                        <td><%=l.ETAT()%></td>
                                        <td><%=l.COMMENTAIRE()%></td>
                                        <%if (r != null && (r.get(5).getCAN_EDIT().equals("1") || r.get(5).getCAN_DELETE().equals("1") || r.get(5).getCAN_PRINT().equals("1"))) {%>
                                        <td>
                                            <%if (r != null && r.get(5).getCAN_PRINT().equals("1")) {%>
                                            <a title="Imprimer" href="#" onclick="prepareDetails('<%=l.ID()%>')" class="primary info mr-1"><i class="las la-print"></i></a>
                                                <%}%>

                                            <%if (r != null && r.get(5).getCAN_EDIT().equals("1")) {%>
                                            <a title="Modifier" href="#" onclick="showEditModal('<%=l.ID()%>')" class="primary edit mr-1"><i class="la la-pencil"></i></a>
                                                <%}%>

                                            <%if (r != null && r.get(5).getCAN_DELETE().equals("1")) {%>
                                            <a title="Supprimer" href="#" onclick="validateDeletion('<%=l.ID()%>')" class="danger delete mr-1"><i class="la la-trash-o"></i></a>
                                                <%}%>
                                        </td>
                                        <%}%>                                        
                                    </tr>
                                    <% }%>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>ID</th>
                                        <th>CLIENT</th>
                                        <th>VEHICULE</th>
                                        <th>DATE DE DEBUT</th>
                                        <th>HEURE DE DEBUT</th>
                                        <th>NOMBRE DE JOUR</th>
                                        <th>VEHICULERETOURNE</th>
                                        <th>DETTE</th>
                                        <th>STATUT</th>
                                        <th>RETOUR AVANT</th>  
                                            <%if (r != null && (r.get(5).getCAN_EDIT().equals("1") || r.get(5).getCAN_DELETE().equals("1")
                                                        || r.get(5).getCAN_PRINT().equals("1"))) {%>
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

<form action="impression" method="post" id="detailslocationform" class="hidden">
    <input name="locationid" id="locationid" type="hidden"/>
</form>

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
                                                function prepareDetails(id) {
                                                    $("#locationid").val(id);
                                                    $("#detailslocationform").submit();
                                                }

                                                function cancelVehicle() {
                                                    $("#VEHICULERETOURNE").val("Non");
                                                    s
                                                }

                                                function resetData() {
                                                    $('#add_form')[0].reset();
                                                    $("#modaltitle").html("NOUVELLE");
                                                    $("#modalbtn").html("Ajouter");
                                                    $("#REALMONTANT").html("");
                                                    $("#CLIENT").attr("disabled", false);
                                                    $("#completedate").attr("disabled", true);
                                                    $("#MONTANT").html("0");
                                                }

                                                function showEditModal(id) {
                                                    $.ajax({
                                                        url: '${pageContext.request.contextPath}/assets/services/location/getLocationDetails.jsp',
                                                        type: "POST",
                                                        data: {ID: id},
                                                        dataType: 'json',
                                                        success: function (res) {
                                                            if (res.link != 'null') {
                                                                window.location.href = res.link;
                                                            }
                                                            var member = res.data.split("\t");
                                                            $.ajax({
                                                                url: '${pageContext.request.contextPath}/assets/services/location/calculatePrix.jsp',
                                                                type: "POST",
                                                                data: {VEHICULE: member[2]},
                                                                dataType: 'json',
                                                                success: function (data) {
                                                                    $("#PRIXPARJOUR").val("$ " + data.PRIXPARJOUR);
                                                                    $("#MONTANT").html((new Number(data.PRIXPARJOUR) * new Number(member[5])));
                                                                },
                                                                error: function (data) {
                                                                    toastr.error("Erreur", "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} ");
                                                                }
                                                            });
                                                            $("#EDITID").val(member[0]);
                                                            $("#CLIENT").val(member[1]);
                                                            $("#VEHICULE").val(member[2]);
                                                            $("#DATEDEBUT").val(member[3]);

                                                            var hr = member[4].split(":");
                                                            var cphr = "";
                                                            if (new Number(hr[0]) > 12) {
                                                                $("#HEUREDEBUT").val((new Number(hr[0]) - 12) + ":" + hr[1] + " pm");
                                                            } else {
                                                                $("#HEUREDEBUT").val(hr[0] + ":" + hr[1] + " am");
                                                            }

                                                            $("#NBJOUR").val(member[5]);
                                                            $("#VEHICULERETOURNE").val(member[6]);
                                                            $("#DETTE").val(member[7]);
                                                            $("#" + member[8]).attr("selected", true);
                                                            $("#MONTANT").val(new Number(member[6]) + new Number(member[7]));
                                                            $("#CLIENT").attr("disabled", true);
                                                            $.ajax({
                                                                url: '${pageContext.request.contextPath}/assets/services/vehicule/getVehicleDetails.jsp',
                                                                type: "POST",
                                                                data: {ID: member[2]},
                                                                dataType: 'json',
                                                                success: function (res) {
                                                                    var data = res.data.split("\t");
                                                                    $("#VEHICLEINFO").html("<select disabled name='VEHICULE' class='form-control' id='VEHICULE'><option value='" + member[2] + "' selected>" + data[5].toUpperCase() + " " + data[6].toUpperCase() + " DE " + data[7] + "</option></select>");
                                                                },
                                                                error: function (res) {
                                                                }
                                                            });
                                                            $("#Terminé").attr("class", "");
                                                            $("#modaltitle").html("MODIFIER");
                                                            $("#modalbtn").html("Modifier");
                                                            holdModal("AddLocationModal");
                                                        },
                                                        error: function (res) {
                                                        }
                                                    });
                                                }

                                                function validateDeletion(id) {
                                                    $("#del_id").html(id);
                                                    $.ajax({
                                                        url: '${pageContext.request.contextPath}/assets/services/location/getLocationDetails.jsp',
                                                        type: "POST",
                                                        data: {ID: id},
                                                        dataType: 'json',
                                                        success: function (res) {
                                                            if (res.link != 'null') {
                                                                window.location.href = res.link;
                                                            }
                                                            var member = res.data.split("\t");
                                                            $("#fullname").html(member[1]);
                                                            if (member[8] == "Terminé") {
                                                                holdModal("DelLocationModal");
                                                            } else {
                                                                toastr.error("Impossible de supprimer une location en cours", "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} ");
                                                            }
                                                        },
                                                        error: function (res) {
                                                        }
                                                    });
                                                }

                                                function saveData() {
                                                    var ID = $("#EDITID").val();
                                                    var CLIENT = $("#CLIENT").val();
                                                    var VEHICULE = $("#VEHICULE").val();
                                                    var DATEDEBUT = $("#DATEDEBUT").val();
                                                    var HEUREDEBUT = $("#HEUREDEBUT").val();
                                                    var NBJOUR = $("#NBJOUR").val();
                                                    var VEHICULERETOURNE = $("#VEHICULERETOURNE").val();
                                                    var DETTE = $("#DETTE").val();
                                                    var ETAT = $("#ETAT").val();
                                                    setComment();
                                                    
                                                    $.ajax({
                                                        url: '${pageContext.request.contextPath}/assets/services/location/addEditLocation.jsp',
                                                        type: "POST",
                                                        data: {
                                                            ID: ID,
                                                            CLIENT: CLIENT,
                                                            VEHICULE: VEHICULE,
                                                            DATEDEBUT: DATEDEBUT,
                                                            HEUREDEBUT: HEUREDEBUT,
                                                            NBJOUR: NBJOUR,
                                                            VEHICULERETOURNE: VEHICULERETOURNE,
                                                            DETTE: DETTE,
                                                            ETAT: ETAT
                                                        },
                                                        dataType: 'json',
                                                        success: function (res) {
                                                            if (res.link != 'null') {
                                                                window.location.href = res.link;
                                                            }
                                                            if (!res.message.includes("succes")) {
                                                                toastr.error(res.message, "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} ");
                                                            } else {
                                                                setTimeout(toastr.success(res.message, "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} "), 5000);
                                                                prepareDetails(res.newid);
                                                            }
                                                        },
                                                        error: function (data) {
                                                            toastr.error("Erreur", "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} ");
                                                        }
                                                    });
                                                }

                                                function deleteLocation() {
                                                    var id = $("#del_id").html();
                                                    $.ajax({
                                                        url: '${pageContext.request.contextPath}/assets/services/delete.jsp',
                                                        type: "POST",
                                                        data: {ID: id, table: "location"},
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

                                                function calculate() {
                                                    var NBJOUR = $("#NBJOUR").val();
                                                    if (new Number(NBJOUR) > 0) {
                                                        var PRIXPARJOUR = $("#PRIXPARJOUR").val();
                                                        var TOTAL = (new Number(NBJOUR) * new Number(PRIXPARJOUR.replace("$ ", "").replace(" ", "")));
                                                        $("#MONTANT").html(readable(TOTAL));
                                                        versementmask.destroy();
                                                        versementmask = numberMask('VEHICULERETOURNE', TOTAL);
                                                    }
                                                }

                                                function calculatePrix() {
                                                    var VEHICULE = $("#VEHICULE").val();
                                                    $.ajax({
                                                        url: '${pageContext.request.contextPath}/assets/services/location/calculatePrix.jsp',
                                                        type: "POST",
                                                        data: {VEHICULE: VEHICULE},
                                                        dataType: 'json',
                                                        success: function (data) {
                                                            $("#PRIXPARJOUR").val("$ " + data.PRIXPARJOUR);
                                                            calculate();
                                                        },
                                                        error: function (data) {
                                                            toastr.error("Erreur", "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} ");
                                                        }
                                                    });
                                                }

                                                $("#CLIENT").on("change", function () {
                                                    $("#VEHICULE").val("");
                                                    $("#VEHICULE").attr("disabled", false);
                                                });

                                                $("#VEHICULE").on("change", function () {
                                                    $("#DATEDBUT").val("");
                                                    $("#DATEDBUT").attr("disabled", false);
                                                    calculatePrix();
                                                });

                                                $("#DATEDBUT").val("");
                                                $("#DATEDBUT").on("change", function () {
                                                    $("#NBJOUR").attr("disabled", false);
                                                });

                                                $("#VEHICULERETOURNE").on("change", function () {
                                                    if ($(this).val() == "Oui" && $("#ETAT").val() == "Actif") {
                                                        holdModal("ReturnCarConfirmation");
                                                    }else{
                                                        $("#ETAT").val("Actif");
                                                    }
                                                });

                                                function setComment() {
                                                    $.ajax({
                                                        url: '${pageContext.request.contextPath}/assets/services/location/getNbDaysFromDates.jsp',
                                                        type: "POST",
                                                        data: {EDITID: $("#EDITID").val()},
                                                        dataType: 'json',
                                                        success: function (data) {
                                                            if (data.comment) {
                                                                $("#ReturnCarConfirmation").modal("hide");
                                                                $("#ETAT").val("Terminé")
                                                                toastr.info(data.comment, "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} ");
                                                            }
                                                        }
                                                    });
                                                }

                                                $("#ETAT").on("change", function () {
                                                    if ($(this).val() == "Actif") {
                                                        $("#VEHICULERETOURNE").val("Non");
                                                    } else {
                                                        $("#Oui").attr("class", "");
                                                        $("#Non").attr("class", "hidden");
                                                    }
                                                });

                                                $("#NBJOUR").on("keyup", function () {
                                                    calculate();
                                                });

                                                var NBJOUR = IMask(
                                                        document.getElementById('NBJOUR'),
                                                        {
                                                            mask: [
                                                                {
                                                                    mask: Number,
                                                                    min: 1,
                                                                    max: 1000
                                                                }
                                                            ]
                                                        });

                                                $("#DATEDEBUT").dateDropper({
                                                    dropWidth: 200,
                                                    init_animation: "bounce",
                                                    minYear: ((new Date().getYear() + 1900) - 18),
                                                    lang: "en",
                                                    format: "j-m-Y",
                                                    dropPrimaryColor: "#d4002a",
                                                    dropBorder: "1px solid #d4002a"
                                                });

                                                $("#HEUREDEBUT").timeDropper({
                                                    primaryColor: "#2fb594",
                                                    textColor: "#e8273a",
                                                    borderColor: "#2fb594"
                                                });

                                                if ("<%=request.getSession().getAttribute("welcome")%>" != "null") {
                                                    toastr.info("<%=request.getSession().getAttribute("welcome")%>", "${company.getCOMPANYNAME().toUpperCase()} - TABLEAU DE BORD");
                                                    removeSession("welcome");
                                                }

                                                IMask(
                                                        document.getElementById("DETTE"),
                                                        {
                                                            mask: '$ num',
                                                            blocks: {
                                                                num: {
                                                                    mask: Number,
                                                                    thousandsSeparator: ' ',
                                                                    min: 1
                                                                }
                                                            }
                                                        }
                                                );
</script>