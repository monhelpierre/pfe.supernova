<%@page import="java.io.File"%>
<%@page import="supernova.pfe.model.Client"%>
<%@page import="supernova.pfe.dao.D_Client"%>
<%@page import="supernova.pfe.dao.D_Vehicule"%>
<%@page import="supernova.pfe.dao.D_Auth"%>
<%@page import="java.util.ArrayList"%>
<%@page import="supernova.pfe.model.Vehicule"%>
<%@page import="supernova.pfe.model.Vehicule"%>
<%@page import="supernova.pfe.dao.D_Fournisseur"%>
<%@page import="supernova.pfe.model.Fournisseur"%>

<%@include file="part/firstpart.jsp"%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/vendors.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/tables/datatable/datatables.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/extensions/toastr.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/plugins/forms/selectivity/selectivity.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/site/css/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/extensions/datedropper.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendors/css/extensions/timedropper.min.css">

<div class="content-body">
    <div class="modal fade" id="AddReservationModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1"
         aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <section class="contact-form">
                    <form class="contact-input" method="post">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel1">NOUVELLE RESERVATION</h5>
                            <button onclick="resetData()" type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="resetData()">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-xl-6 col-lg-12">
                                    <fieldset class="form-group col-12">
                                        <h5>V&eacute;hicule</h5>
                                        <span id="VEHICLEINFO"></span>
                                    </fieldset>
                                </div>

                                <div class="col-xl-6 col-lg-12">
                                    <input name="id" id="EDITID" type="hidden" />                                    
                                    <fieldset class="form-group col-12">
                                        <h5>Prix par jour</h5>
                                        <input readonly="" type="text" name="PRIXPARJOUR" id="PRIXPARJOUR" class="contact-name form-control" placeholder="Prix par jour">
                                    </fieldset>                    
                                </div>       

                                <div class="col-xl-6 col-lg-12">                                    
                                    <fieldset class="form-group col-12">
                                        <h5>Client</h5>
                                        <select name="client" class="form-control" id="CLIENT" placeholder="Client">
                                            <option value="" disabled selected>Client</option>
                                            <%for (Client mb : new D_Client().get()) {%>
                                            <option value="<%=mb.ID()%>"><%=mb.NOMCOMPLET()%></option>
                                            <%} %>
                                        </select>
                                    </fieldset>

                                    <fieldset class="form-group col-12">
                                        <h5>Nombre de jour</h5>
                                        <input type="text" min="1" name="NBJOUR" id="NBJOUR" class="contact-name form-control" placeholder="Nombre de jour">
                                    </fieldset>    
                                </div>

                                <div class="col-xl-6 col-lg-12">
                                    <fieldset class="form-group col-12">
                                        <h5>Date de d&eacute;but</h5>
                                        <input name="DATEDEBUT" type='text' class="contact-name form-control" id="DATEDEBUT" placeholder="Date de d&eacute;but"/>
                                    </fieldset>                                                           

                                    <fieldset class="form-group col-12">
                                        <h5>Versement</h5>
                                        <input type="text" name="VERSEMENT" id="VERSEMENT" class="contact-name form-control" placeholder="Versement">
                                    </fieldset>                                                            
                                </div>

                                <div class="col-xl-6 col-lg-12">
                                    <fieldset class="form-group col-12">
                                        <h5>Livr&eacute;</h5>
                                        <select name="LIVRE" class="form-control" id="LIVRE" placeholder="Livre">
                                            <option disabled="" value="">Livr&eacute;</option>
                                            <option selected>Non</option>
                                        </select>
                                    </fieldset>
                                </div>

                                <div class="col-xl-6 col-lg-12">
                                    <fieldset class="form-group col-12">
                                        <h5>&Eacute;tat</h5>
                                        <select name="ETAT" class="form-control" id="ETAT" placeholder="Statut">
                                            <option disabled="" value="">&Eacute;tat</option>
                                            <option selected>ACTIF</option>
                                        </select>
                                    </fieldset>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <span class="text-info" style="float: left; text-transform: uppercase; size: 40px"><i class="fa fa-info-circle"></i> Prix total: <span style="border-bottom-style: double; font-weight: bold; color: red">$ <span id="MONTANT">--</span></span></span>                       
                            <fieldset class="form-group position-relative has-icon-left mb-0">
                                <button id="SAVEBTN" type="button" class="btn btn-info add-contact-item"><i
                                        class="la la-paper-plane-o d-block d-lg-none"></i> <span class="d-none d-lg-block" id="modalbtn">Ajouter</span></button>
                            </fieldset>
                        </div>
                    </form>
                </section>
            </div>
        </div>
    </div>

    <div class="modal fade" id="AddLocationModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1"
         aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <section class="contact-form">
                    <form class="contact-input" method="post">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel1">NOUVELLE LOCATION</h5>
                            <button onclick="resetData()" type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="resetData()">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-xl-6 col-lg-12">
                                    <fieldset class="form-group col-12">
                                        <h5>V&eacute;hicule</h5>
                                        <span id="VEHICLEINFO2"></span>
                                    </fieldset>
                                </div>

                                <div class="col-xl-6 col-lg-12">
                                    <input name="id" id="EDITID1" type="hidden" />
                                    <fieldset class="form-group col-12">
                                        <h5>Prix par jour</h5>
                                        <input readonly="" type="text" name="PRIXPARJOUR" id="PRIXPARJOUR1" class="contact-name form-control" placeholder="Prix par jour">
                                    </fieldset>                    
                                </div>

                                <div class="col-xl-6 col-lg-12">                                     
                                    <fieldset class="form-group col-12">
                                        <h5>Client</h5>
                                        <select name="client" class="form-control" id="CLIENT1" placeholder="Client">
                                            <option value="" disabled selected>Client</option>
                                            <%for (Client mb : new D_Client().get()) {%>
                                            <option value="<%=mb.ID()%>"><%=mb.NOMCOMPLET()%></option>
                                            <%}%>
                                        </select>
                                    </fieldset> 

                                    <fieldset class="form-group col-12">
                                        <h5>Heure de d&eacute;but</h5>
                                        <input name="HEUREDEBUT" type='text' class="contact-name form-control" id="HEUREDEBUT"/>
                                    </fieldset>
                                </div>

                                <div class="col-xl-6 col-lg-12">
                                    <fieldset class="form-group col-12">
                                        <h5>Date de d&eacute;but</h5>
                                        <input name="DATEDEBUT" type='text' class="contact-name form-control" id="DATEDEBUT1"/>
                                    </fieldset>                                    

                                    <fieldset class="form-group col-12">
                                        <h5>Nombre de jour</h5>
                                        <input type="number" min="1" name="NBJOUR" id="NBJOUR1" class="contact-name form-control" placeholder="Nombre de jour">
                                    </fieldset>                                                             
                                </div>

                                <div class="col-xl-6 col-lg-12">
                                    <fieldset class="form-group col-12">
                                        <h5>V&eacute;hicule retourn&eacute;</h5>
                                        <select name="VEHICULERETOURNE" class="form-control" id="VEHICULERETOURNE" placeholder="V&eacute;hicule retourn&eacute;">
                                            <option disabled="" value="">V&eacute;hicule retourn&eacute;</option>
                                            <option id="Non" selected>NON</option>
                                            <option id="Oui" class="hidden">OUI</option>
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
                                        <select name="ETAT" class="form-control" id="ETAT1" placeholder="Statut">
                                            <option disabled="" value="">&Eacute;tat</option>
                                            <option selected>ACTIF</option>
                                        </select>
                                    </fieldset>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <span class="text-info" style="float: left; text-transform: uppercase; size: 40px"><i class="fa fa-info-circle"></i> Prix total: <span style="border-bottom-style: double; font-weight: bold; color: red">$ <span id="MONTANT1">--</span></span></span>
                            <fieldset class="form-group position-relative has-icon-left mb-0">
                                <button id="SAVEBTN2" type="button" class="btn btn-info add-contact-item"><i
                                        class="la la-paper-plane-o d-block d-lg-none"></i> <span class="d-none d-lg-block" id="modalbtn">Ajouter</span></button>
                            </fieldset>
                        </div>
                    </form>
                </section>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12 col-md-8">
            <div class="sorting-options-main"> 
                <div class="row">
                </div>           


                <div class="row">
                    <div class="col-lg-12 table-responsive">
                        <table class="table table-white-space table-bordered row-grouping display no-wrap icheck table-middle text-center" width="100%">
                            <thead>
                            <th>V&Eacute;HICULE LIBRE</th>
                            <th>V&Eacute;HICULE RESERV&Eacute;</th>
                            <th>V&Eacute;HICULE LOU&Eacute;</th>
                            <th>V&Eacute;HICULE EN RETARD</th>
                            <th>V&Eacute;HICULE EN R&Eacute;PARATION</th>
                            <th style="text-decoration: underline; color: red">GRAND TOTAL</th>
                            </thead>

                            <tbody>
                            <td><%=new D_Vehicule().getWhereState("LIBRE")%></td>
                            <td><%=new D_Vehicule().getWhereState("RESERVÉ")%></td>
                            <td><%=new D_Vehicule().getWhereState("LOUÉ")%></td>
                            <td><%=new D_Vehicule().getWhereState("EN RETARD")%></td>
                            <td><%=new D_Vehicule().getWhereState("EN REPARATION")%></td>
                            <td style="color: red"><%=new D_Vehicule().get().size()%></td>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-lg-2">
                        <div>
                            <%if (r != null && r != null && r.get(3).getCAN_ADD().equals("1") || r != null && r != null && r.get(3).getCAN_EDIT().equals("1")) {%>
                            <a class="d-md-block d-none form-control" href="ajoutervehicule" style="color:blue" title="Nouveau vehicule"> <i class="fa fa-plus-circle"></i> Nouveau </a>
                            <%}%>
                        </div>
                    </div> 

                    <div class="col-lg-2">
                        <select class="d-md-block d-none form-control" id="SHOW">
                            <option value="4">Afficher</option>
                            <%for (int i = 4; i <= 100; i += 12) {%>
                            <option <%=(nbbypage == i) ? "selected" : ""%> value="<%=i%>"><%=i%></option>
                            <%}%>
                        </select>
                    </div>

                    <div class="col-lg-2">
                        <select class="d-md-block d-none form-control" id="STATE">
                            <option value="" class="default">Etat</option>
                            <option>LIBRE</option>
                            <option>RESERVÉ</option>
                            <option>LOUÉ</option>
                            <option>EN RETARD</option>
                            <option>EN REPARATION</option>
                        </select>
                    </div>

                    <div class="col-lg-2">
                        <select class="d-md-block d-none form-control" id="TRANSMISSION">
                            <option value="" class="default">Transmission</option>
                            <option>MANUEL</option>
                            <option>AUTOMATIQUE</option>
                        </select>
                    </div>

                    <div class="col-lg-2">
                        <select class="d-md-block d-none form-control" id="MOTEUR">
                            <option value="" class="default">Moteur</option>
                            <option>DIESEL</option>
                            <option>GASOLINE</option>
                        </select>
                    </div>

                    <div class="col-lg-2">
                        <input class="d-md-block d-none form-control" id="SEARCH" placeholder="Rechercher..."/>
                    </div>
                </div>
            </div>

            <style>
                .item {
                    position:relative;
                    padding-top:20px;
                    display:inline-block;
                }
                .notify-badge{
                    position: absolute;
                    right:-5px;
                    top:10px;
                    background:rgb(251,101,102);
                    text-align: center;
                    border-radius: 30px 30px 30px 30px;
                    color:white;
                    padding:5px 10px;
                    font-size:15px;
                }
            </style>

            <div class="row">
                <img class="img-fluid col-lg-3" id="nocarsavailaibe" style="display: none" src="${pageContext.request.contextPath}/assets/uploads/nodata.png" alt="">                
                <%
                    ArrayList<Vehicule> vehicule = (ArrayList<Vehicule>) request.getAttribute("vehicule");
                    if (vehicule.size() > 0) {
                        for (Vehicule v : vehicule) {%>
                <div class="mylist col-lg-3"
                     data-id="<%=v.ID()%>"
                     data-fournisseur="<%=v.FOURNISSEUR()%>"
                     data-typev="<%=v.TYPE()%>"
                     data-annee="<%=v.ANNEE()%>"
                     data-prixjour="<%=v.PRIXPARJOUR()%>" 
                     data-marque="<%=v.MARQUE().toLowerCase()%>"
                     data-model="<%=v.MODEL().toLowerCase()%>" 
                     data-couleur="<%=v.COULEUR().toLowerCase()%>" 
                     data-plaque="<%=v.NUMPLAQUE().toLowerCase()%>"
                     data-moteur="<%=v.TYPEMOTEUR().toLowerCase()%>" 
                     data-etat="<%=v.ETAT().toLowerCase()%>" 
                     data-transmission="<%=v.TRANSMISSION().toLowerCase()%>"
                     data-nummoteur="<%=v.NUMMOTEUR().toLowerCase()%>"
                     data-numplaque="<%=v.NUMPLAQUE().toLowerCase()%>">

                    <div class="car-item gray-bg text-center">
                        <div class="car-image item">
                            <span class="notify-badge"><%=v.ETAT()%></span>
                            <img class="img-fluid" src="${pageContext.request.contextPath}/<%=v.IMAGE().isEmpty() || !new File(MySession.path.replace("assets", "") + v.IMAGE()).exists() ? "assets/90x90.jpg" : v.IMAGE()%>" alt="">
                            <div class="car-overlay-banner">
                                <ul> 
                                    <%if (v.ETAT().equals("LIBRE") || v.ETAT().equals("EN REPARATION")) {%>
                                    <%if (r != null && r != null && r.get(3).getCAN_EDIT().equals("1")) {%>
                                    <li><a title="MODIFIER" href="#" onclick="prepareModification('<%=v.ID()%>')"><i class="fa fa-edit"></i></a></li>
                                            <%}%>
                                            <%if (r != null && r != null && r.get(4).getCAN_ADD().equals("1")) {
                                            if(!v.ETAT().equals("EN REPARATION")){%>
                                    <li><a title="RESERVER" href="#" onclick="addReservation('<%=v.ID()%>')"><i class="las la-money-bill-wave-alt"></i></a></li>
                                            <%}}%>

                                    <%if (r != null && r != null && r.get(5).getCAN_ADD().equals("1")) {
                                    if(!v.ETAT().equals("EN REPARATION")){%>
                                    <li><a title="LOUER" href="#" onclick="addLocation('<%=v.ID()%>')"><i class="las la-hand-holding-usd"></i></a></li>
                                            <%}}
                                            %>

                                    <%if (r != null && r != null && r.get(3).getCAN_DELETE().equals("1")) {%>
                                    <li><a title="SUPPRIMER" href="#" onclick="validateDeletion('<%=v.ID()%>')"><i class="fa fa-trash"></i></a></li>
                                            <%}
                                                }%>
                                </ul>
                            </div>
                        </div>

                        <div class="car-list">
                            <ul class="list-inline text-sm-center">
                                <li title="NUMERO DE PLAQUE" style="font-weight: bold; color: black"><%=v.NUMPLAQUE()%></li> |
                                <li title="MARQUE" style="font-weight: bold; color: black"> <%=v.MARQUE().toUpperCase()%></li> |
                                <li title="TYPE DE VEHICULE" style="font-weight: bold; color: black"> <%=v.TYPE().toUpperCase()%></li> |
                                <li title="ANNEE" style="font-weight: bold; color: black"> <%=v.ANNEE().toUpperCase()%></li> |
                                <li title="TYPE DE TRANSMISSION" style="font-weight: bold; color: black"> <%=v.TRANSMISSION().toUpperCase()%> </li>  |
                                <li title="TYPE DE MOTEUR" style="font-weight: bold; color: black"> <%=v.TYPEMOTEUR().toUpperCase()%></li>
                            </ul>
                        </div>

                        <div class="car-content">
                            <a href="#" title="MODEL DE VEHICULE"><%=v.MODEL().toUpperCase()%></a>
                            <div class="price">
                                <span class="new-price" title="PRIX PAR JOUR">PRIX :  $<%=v.PRIXPARJOUR()%></span>
                            </div>
                        </div>
                    </div>
                </div>
                <%}
                } else {%>
                <img class="img-fluid" style="display: block; margin-left: auto; margin-right: auto; width: 30%;" src="${pageContext.request.contextPath}/assets/uploads/nodata.png" alt="">

                <%}%> 
            </div>

            <br/>
            <div class="pagination-nav d-flex justify-content-center">
                <ul class="pagination">
                    <li class="btnPage" style="<%=vehicule.size() > 0 ? "" : "display:none"%>"><a href="#" <%=(active_page == 1) ? "onclick=''" : ""%> onclick="previousPage()">«Pr&eacute;cedent</a></li>
                        <%for (int i = 1; i <= total_pages; i++) {%>
                    <li onclick="getData('<%=i%>')" class="page-item <%=(i == active_page) ? "active" : ""%>"><a class="page-link" href="#"><%=i%></a></li>
                        <%}%>
                    <li class="btnPage" style="<%=vehicule.size() > 0 ? "" : "display:none"%>"><a href="#" <%=(active_page == total_pages) ? "onclick=''" : ""%> onclick="nextPage()" >Suivant»</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
</section>
</div>
<div class="modal fade" id="DelVehiculeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <section class="contact-form">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel1">Supprimer vehicule</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <span id="del_id" style="display: none"></span>
                    <p>Etes vous sur de vouloir supprimer ce vehicule ?</p>
                </div>
                <div class="modal-footer">
                    <fieldset class="form-group position-relative has-icon-left mb-0">
                        <button onclick="deleteVehicule()" type="button" class="btn btn-info add-contact-item"><i
                                class="la la-paper-plane-o d-block d-lg-none"></i> <span class="d-none d-lg-block">Valider</span></button>
                    </fieldset>
                </div>
            </section>
        </div>
    </div>
</div>

</div>
</div>
<!-- END: Content-->
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

<script src="${pageContext.request.contextPath}/assets/jquery.slim.js"></script>
<script src="${pageContext.request.contextPath}/assets/popper.mim.js"></script>
<script src="${pageContext.request.contextPath}/assets/popper2.min.js"></script>

<form id="editform" action="ajoutervehicule" method="post" class="hidden">
    <input name="editid" id="editid" type="text" value=""/>
</form>

<form action="impression" method="post" id="detailsreservationform" class="hidden">
    <input name="reservationid" id="reservationid" type="hidden"/>
</form>

<form action="impression" method="post" id="detailslocationform" class="hidden">
    <input name="locationid" id="locationid" type="hidden"/>
</form>
<script>
                            var tmpdata = 1;
                            var current_page = '<%=request.getSession().getAttribute("active_page")%>';
                            var total_pages = '<%=request.getAttribute("total_pages")%>';

                            $("#DATEDEBUT").dateDropper({
                                dropWidth: 200,
                                init_animation: "bounce",
                                lang: "en",
                                format: "j-m-Y",
                                dropPrimaryColor: "#d4002a",
                                dropBorder: "1px solid #d4002a"
                            });

                            $("#DATEDEBUT1").dateDropper({
                                dropWidth: 200,
                                init_animation: "bounce",
                                lang: "en",
                                format: "j-m-Y",
                                dropPrimaryColor: "#d4002a",
                                dropBorder: "1px solid #d4002a"
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

                            var NBJOUR1 = IMask(
                                    document.getElementById('NBJOUR1'),
                                    {
                                        mask: [
                                            {
                                                mask: Number,
                                                min: 1,
                                                max: 1000
                                            }
                                        ]
                                    });

                            $("#HEUREDEBUT").timeDropper({
                                primaryColor: "#2fb594",
                                textColor: "#e8273a",
                                borderColor: "#2fb594"
                            });

                            $("#SEARCH").on("keyup", function () {
                                var input = $(this).val().toLowerCase();
                                $(".default").each(function () {
                                    $(this).attr("selected", true);
                                });

                                $(".mylist").each(function () {
                                    if ($(this).data("etat").indexOf(input) >= 0 ||
                                            $(this).data("id").toString().indexOf(input) >= 0 ||
                                            $(this).data("fournisseur").toString().indexOf(input) >= 0 ||
                                            $(this).data("typev").toString().toLowerCase().indexOf(input) >= 0 ||
                                            $(this).data("marque").toString().toLowerCase().indexOf(input) >= 0 ||
                                            $(this).data("model").toString().toLowerCase().indexOf(input) >= 0 ||
                                            $(this).data("prixjour").toString().indexOf(input) >= 0 ||
                                            $(this).data("annee").toString().indexOf(input) >= 0 ||
                                            $(this).data("couleur").toString().toLowerCase().indexOf(input) >= 0 ||
                                            $(this).data("plaque").toString().toLowerCase().indexOf(input) >= 0 ||
                                            $(this).data("moteur").toString().toLowerCase().indexOf(input) >= 0 ||
                                            $(this).data("transmission").toString().toLowerCase().indexOf(input) >= 0) {
                                        $(this).attr("style", "");
                                    } else {
                                        $(this).attr("style", "display:none");
                                    }
                                })
                            });

                            $("#STATE").on("change", function () {
                                search();
                            });

                            $("#MOTEUR").on("change", function () {
                                search();
                            });

                            $("#TRANSMISSION").on("change", function () {
                                search();
                            });

                            $("#SHOW").on("change", function () {
                                var input = $(this).val();
                                setNbByPage(input);
                            });

                            function search() {
                                var len = 0;
                                var etat = $("#STATE").val().toLowerCase();
                                var moteur = $("#MOTEUR").val().toLowerCase();
                                var transmission = $("#TRANSMISSION").val().toLowerCase();
                                $(".mylist").each(function () {
                                    if ($(this).data("etat").indexOf(etat) >= 0 && $(this).data("moteur").indexOf(moteur) >= 0 && $(this).data("transmission").indexOf(transmission) >= 0) {
                                        $(this).attr("style", "");
                                        len++;
                                    } else {
                                        $(this).attr("style", "display:none");
                                    }
                                });

                                if (len == 0) {
                                    $("#nocarsavailaibe").attr('style', 'display: block; margin-left: auto; margin-right: auto; width: 30%;');
                                } else {
                                    $("#nocarsavailaibe").attr('style', 'display:none');
                                }
                            }

                            function getData(page) {
                                $.ajax({
                                    url: '${pageContext.request.contextPath}/assets/services/setActivePage.jsp',
                                    type: "POST",
                                    data: {page: page},
                                    dataType: 'json',
                                    success: function (data) {
                                        window.location.reload(true);
                                    },
                                    error: function (data) {
                                    }
                                });
                            }

                            function setNbByPage(nb) {
                                $.ajax({
                                    url: '${pageContext.request.contextPath}/assets/services/setNbByPage.jsp',
                                    type: "POST",
                                    data: {nb: nb},
                                    dataType: 'json',
                                    success: function (data) {
                                        window.location.reload(true);
                                    },
                                    error: function (data) {
                                    }
                                });
                            }

                            function nextPage() {
                                var next = new Number(current_page) + 1;
                                if (next > new Number(total_pages)) {
                                    next = total_pages;
                                }
                                getData(next);
                            }

                            function previousPage() {
                                var prev = new Number(current_page) - 1;
                                if (prev == 0) {
                                    prev = 1;
                                }
                                getData(prev);
                            }

                            var span = document.getElementsByClassName("close")[0];
                            span.onclick = function () {
                                modal.style.display = "none";
                            }

                            function validateDeletion(id) {
                                $("#del_id").html(id);
                                $.ajax({
                                    url: '${pageContext.request.contextPath}/assets/services/vehicule/getVehicleDetails.jsp',
                                    type: "POST",
                                    data: {ID: id},
                                    dataType: 'json',
                                    success: function (res) {
                                        if (res.link != 'null') {
                                            window.location.href = res.link;
                                        }
                                        var member = res.data.split("\t");
                                        $("#fullname").html(member[6]);
                                        $.ajax({
                                            url: '${pageContext.request.contextPath}/assets/services/vehicule/getDetailsFromLocation.jsp',
                                            type: "POST",
                                            data: {ID: member[0]},
                                            dataType: 'json',
                                            success: function (res) {
                                                if (res.msg == "succes") {
                                                    if (member[13] == "LIBRE") {
                                                        holdModal("DelVehiculeModal");
                                                    } else {
                                                        toastr.error("Impossible de supprimer un vehicule non libre", "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} ");
                                                    }
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

                            function deleteVehicule() {
                                var id = $("#del_id").html();
                                $.ajax({
                                    url: '${pageContext.request.contextPath}/assets/services/vehicule/delete.jsp',
                                    type: "POST",
                                    data: {ID: id, table: "vehicule"},
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

                            function addReservation(id) {
                                $.ajax({
                                    url: '${pageContext.request.contextPath}/assets/services/vehicule/getVehicleDetails.jsp',
                                    type: "POST",
                                    data: {ID: id},
                                    dataType: 'json',
                                    success: function (res) {
                                        if (res.link != 'null') {
                                            window.location.href = res.link;
                                        }
                                        var data = res.data.split("\t");
                                        var prix = data[12];
                                        $("#PRIXPARJOUR").val("$ " + prix);
                                        $("#NBJOUR").on("keyup", function () {
                                            var TOTAL = (new Number($(this).val()) * new Number(prix));
                                            versementmask.destroy();
                                            versementmask = numberMask('VERSEMENT', TOTAL);
                                            $("#MONTANT").html(readable(TOTAL));
                                        });

                                        $("#SAVEBTN").on("click", function () {
                                            saveData("Reservation");
                                        });
                                        $("#VEHICLEINFO").html("<select disabled name='VEHICULE' class='form-control' id='VEHICULE'><option value='" + id + "' selected>" + data[5].toUpperCase() + " " + data[6].toUpperCase() + " DE " + data[7] + "</option></select>");
                                        holdModal("AddReservationModal");
                                    },
                                    error: function (data) {
                                    }
                                });
                            }

                            function saveData(type) {
                                var ID = (type.includes("vation")) ? $("#EDITID").val() : $("#EDITID1").val();
                                var CLIENT = (type.includes("vation")) ? $("#CLIENT").val() : $("#CLIENT1").val();
                                var VEHICULE = (type.includes("vation")) ? $("#VEHICULE").val() : $("#VEHICULE1").val();
                                var HEUREDEBUT = $("#HEUREDEBUT").val();
                                var DATEDEBUT = (type.includes("vation")) ? $("#DATEDEBUT").val() : $("#DATEDEBUT1").val();
                                var NBJOUR = (type.includes("vation")) ? $("#NBJOUR").val() : $("#NBJOUR1").val();
                                var VEHICULERETOURNE = $("#VEHICULERETOURNE").val();
                                var VERSEMENT = $("#VERSEMENT").val();
                                var DETTE = $("#DETTE").val();
                                var ETAT = (type.includes("vation")) ? $("#ETAT").val() : $("#ETAT1").val();
                                var LIVRE = $("#LIVRE").val();
                                $.ajax({
                                    url: '${pageContext.request.contextPath}/assets/services/' + type.toLowerCase() + '/addEdit' + type + '.jsp',
                                    type: "POST",
                                    data: {
                                        ID: ID,
                                        CLIENT: CLIENT,
                                        VEHICULE: VEHICULE,
                                        DATEDEBUT: DATEDEBUT,
                                        NBJOUR: NBJOUR,
                                        HEUREDEBUT: HEUREDEBUT,
                                        VEHICULERETOURNE: VEHICULERETOURNE,
                                        VERSEMENT: VERSEMENT,
                                        DETTE: DETTE,
                                        ETAT: ETAT,
                                        LIVRE: LIVRE
                                    },
                                    dataType: 'json',
                                    success: function (res) {
                                        if (!res.message.includes("succes")) {
                                            toastr.error(res.message, "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} ");
                                        } else {
                                            setTimeout(toastr.success(res.message, "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} "), 5000);
                                            prepareDetails(res.newid, type);
                                        }
                                    },
                                    error: function (data) {
                                        toastr.error(data.responseText, "${company.getCOMPANYNAME().toUpperCase()} - ${active_menu.toUpperCase()} ");
                                    }
                                });
                            }

                            function prepareDetails(id, type) {
                                if (type.includes("vation")) {
                                    $("#reservationid").val(id);
                                    $("#detailsreservationform").submit();
                                } else {
                                    $("#locationid").val(id);
                                    $("#detailslocationform").submit();
                                }
                            }

                            function addLocation(id) {
                                $.ajax({
                                    url: '${pageContext.request.contextPath}/assets/services/vehicule/getVehicleDetails.jsp',
                                    type: "POST",
                                    data: {ID: id},
                                    dataType: 'json',
                                    success: function (res) {
                                        if (res.link != 'null') {
                                            window.location.href = res.link;
                                        }
                                        var data = res.data.split("\t");
                                        var prix = data[12];
                                        $("#PRIXPARJOUR1").val("$ " + prix);
                                        $("#NBJOUR1").on("keyup", function () {
                                            var TOTAL = (new Number($(this).val()) * new Number(prix));
                                            $("#MONTANT1").html(readable(TOTAL));
                                        });
                                        $("#SAVEBTN2").on("click", function () {
                                            saveData("Location");
                                        });
                                        $("#VEHICLEINFO2").html("<select disabled name='VEHICULE' class='form-control' id='VEHICULE1'><option value='" + id + "' selected>" + data[5].toUpperCase() + " " + data[6].toUpperCase() + " DE " + data[7] + "</option></select>");
                                        holdModal("AddLocationModal");
                                    },
                                    error: function (data) {
                                    }
                                });
                            }

                            function prepareModification(id) {
                                $.ajax({
                                    url: '${pageContext.request.contextPath}/assets/services/vehicule/getVehicleDetails.jsp',
                                    type: "POST",
                                    data: {ID: id},
                                    dataType: 'json',
                                    success: function (res) {
                                        if (res.link != 'null') {
                                            window.location.href = res.link;
                                        } else {
                                            $("#editid").val(id);
                                            $("#editform").submit();
                                        }
                                    },
                                    error: function (data) {
                                    }
                                });
                            }

                            if ("<%=request.getSession().getAttribute("welcome")%>" != "null") {
                                toastr.info("<%=request.getSession().getAttribute("welcome")%>", "${company.getCOMPANYNAME().toUpperCase()} - TABLEAU DE BORD");
                                removeSession("welcome");
                            }
                            var versementmask = numberMask('VERSEMENT', 1);
</script>