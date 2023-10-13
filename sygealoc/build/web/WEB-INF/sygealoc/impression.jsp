<%-- 
    Document   : detailslocation
    Created on : Sep 12, 2020, 6:54:52 PM
    Author     : GIRLS
--%>

<%@page import="supernova.pfe.dao.D_Reservation"%>
<%@page import="supernova.pfe.dao.D_Location"%>
<%@page import="supernova.pfe.model.Reservation"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="supernova.pfe.tool.MyDate"%>
<%@page import="supernova.pfe.model.Vehicule"%>
<%@page import="supernova.pfe.dao.D_Vehicule"%>
<%@page import="supernova.pfe.dao.D_Client"%>
<%@page import="supernova.pfe.model.Client"%>
<%@page import="supernova.pfe.model.Location"%>
<%@include file="part/firstpart.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/pages/invoice.min.css">

<%    
    if (request.getSession() == null || request.getSession().getAttribute("member_info") == null) {
        out.print("<script>history.back();</script>");
    }else{
    
    String NOMCOMPLET = null, MARQUE = null, MODEL = null, TYPEMOTEUR = null, TRANSMISSION = null,
            BALANCE = null, ADRESSE = null, NUMPLAQUE = null, PRIXPARJOUR = null, DATEDEBUT = null, DATEFIN = null, ID = null;
    Vehicule ve = null;
    Client cl = null;
    Double MONTANT = null;
    String VERSEMENT = null, locationID = (String) request.getParameter("locationid"), type = "reservation";
    String reservationID = (String) request.getParameter("reservationid");
    String dateCreation = null, dateModification = null;

    Location loc = null;
    Reservation res = null;
    if (locationID != null) {loc = new D_Location().get(Integer.parseInt(locationID)); type="location";}
    if (reservationID != null) {res = new D_Reservation().get(Integer.parseInt(reservationID));}

    if (loc == null && res == null) {
        out.print("<script>history.back();</script>");
    } else {
        if (loc != null) {
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
            ve = new D_Vehicule().get(Integer.parseInt(loc.VEHICULE()));
            cl = new D_Client().get(Integer.parseInt(loc.CLIENT()));
            MONTANT = Double.parseDouble(loc.NBJOUR()) * Double.parseDouble(ve.PRIXPARJOUR());
            String df = loc.DATEDEBUT() + " " + loc.HEUREDEBUT();
            Date datefin = sdf.parse(df);
            datefin.setDate(datefin.getDate() + Integer.parseInt(loc.NBJOUR()));
            DATEFIN = datefin.getDate() + "-" + (datefin.getMonth() + 1) + "-" + (datefin.getYear() + 1900) + " &agrave; " + datefin.getHours() + ":" + datefin.getMinutes();
            BALANCE = loc.DETTE();
            DATEDEBUT = loc.DATEDEBUT();
            ID = loc.ID() + "";
            dateCreation = loc.DATECREATED();
            dateModification = loc.DATEUPDATED();
        }

        if (res != null) {
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            ve = new D_Vehicule().get(Integer.parseInt(res.VEHICULE()));
            cl = new D_Client().get(Integer.parseInt(res.CLIENT()));
            MONTANT = Double.parseDouble(res.NBJOUR()) * Double.parseDouble(ve.PRIXPARJOUR());
            String df = res.DATEDEBUT();
            Date datefin = sdf.parse(df);
            datefin.setDate(datefin.getDate() + Integer.parseInt(res.NBJOUR()));
            DATEFIN = datefin.getDate() + "-" + (datefin.getMonth() + 1) + "-" + (datefin.getYear() + 1900);
            BALANCE = res.BALANCE();
            DATEDEBUT = res.DATEDEBUT();
            ID = res.ID() + "";
            dateCreation = res.DATECREATED();
            dateModification = res.DATEUPDATED();
        }

        NOMCOMPLET = cl.NOMCOMPLET();
        ADRESSE = cl.ADRESSE();
        TYPEMOTEUR = ve.TYPEMOTEUR();
        TRANSMISSION = ve.TRANSMISSION();
        NUMPLAQUE = ve.NUMPLAQUE();
        PRIXPARJOUR = ve.PRIXPARJOUR() + "";
        MARQUE = ve.MARQUE();
        MODEL = ve.MODEL();
        VERSEMENT = (MONTANT - Double.parseDouble(BALANCE)) + "";
    }
%>

<div class="content-body">
    <section class="card">
        <div id="invoice-template" class="card-body p-4">
            <div id="invoice-company-details" class="row">
                <div class="col-sm-6 col-12 text-center text-sm-left">
                    <div class="media row">
                        <div class="col-12 col-sm-3 col-xl-2">
                            <img width="100%" height="100%" src="${pageContext.request.contextPath}/${theme.getLOGO()}" alt="sygealoc" class="mb-1 mb-sm-0" />
                        </div>
                        <div class="col-12 col-sm-9 col-xl-10">
                            <div class="media-body">
                                <ul class="ml-2 px-0 list-unstyled">
                                    <li class="text-bold-800">${company.getCOMPANYNAME()}</li>
                                    <li>${company.getADDRESS()}, <br/> ${company.getCITY()}, ${company.getSTATE()}, ${company.getCOUNTRY()}</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-12 text-center text-sm-right">
                    <h2>FACTURE</h2>
                    <p class="pb-sm-3"># <%=ID%>                         
                        <br/>Enregistr&eacute; le <%=dateCreation.replace(" ", " à ")%> 
                        <%if(dateModification != null){%><br/>Modifi&eacute; le <%=dateModification.replace(" ", " à ")%><%}%>
                        <br/>Imprim&eacute; le <%=MyDate.current_fr().replace(" ", " à ")%>
                        <br/>Remis &agrave; <%=NOMCOMPLET%> habitant à <%=ADRESSE%>                        
                    </p>
                </div>
            </div>

            <div id="invoice-items-details" class="pt-2">
                <div class="row">
                    <div class="table-responsive col-12">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Description du véhicule</th>
                                    <th class="text-right">Plaque</th>
                                    <th class="text-right">Nb. jour</th>
                                    <th class="text-right">Prix par jour</th>                                    
                                    <%if(loc==null){%>
                                        <th class="text-right">Versement</th>                                    
                                        <th class="text-right">Balance</th>
                                    <%}else{%>
                                        <th class="text-right">V&eacute;hicule retourn&eacute;</th>
                                        <th class="text-right">Dette</th>
                                    <%}%>                                    
                                    <th class="text-right">Date de d&eacute;but/fin</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <p>Marque: <%=MARQUE%>, Modele: <%=MODEL%>, Moteur: <%=TYPEMOTEUR%>,  Transmission: <%=TRANSMISSION%>
                                        </p>
                                    </td>
                                    <td class="text-right"><%=NUMPLAQUE%></td>
                                    <td class="text-right"><%=loc==null?res.NBJOUR():loc.NBJOUR()%></td>
                                    <td class="text-right">$ <%=PRIXPARJOUR%></td>                                    
                                    <%if(loc==null){%>
                                        <td class="text-right">$ <%=VERSEMENT%></td>
                                        <td class="text-right">$ <%=BALANCE%></td>
                                    <%}else{%> 
                                        <td class="text-right"><%=loc.VEHICULERETOURNE()%></td>
                                        <td class="text-right">$ 
                                            <%
                                                String[] det = loc.DETTE().replace(".",  "-").split("-");                                            
                                                out.print(loc.DETTE().contains(".")?(det[0]+"."+det[1].substring(0, 1)) :loc.DETTE());                                            
                                            %>
                                        </td>
                                    <%}%>     
                                    <td class="text-right">De <%=DATEDEBUT%> au <%=DATEFIN%></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row"> 
                    <div class="col-sm-8 col-12">
                        <div class="col-sm-4 col-12 text-center">
                        <button type="button" class="btn btn-info btn-print btn-lg my-1"><i class="la la-print mr-50"></i>
                            Imprimer
                        </button>
                    </div>
                    </div>
                    <div class="col-sm-4 col-12">
                        <div class="text-center">
                            <img src="${pageContext.request.contextPath}/assets/images/pages/signature-scan.png" alt="signature" class="height-100" />
                            <p class="text-muted">Responsable</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<%@include file="part/lastpart.jsp" %>
<script src="${pageContext.request.contextPath}/assets/js/scripts/pages/invoice-template.min.js"></script>

<script>
    $("#footerview").attr("style", "display:none");
    $("#currentpage").html("<a href='#' onclick='history.back()'>RETOUR</a>");
    $("#<%=type%>").attr("class", "active");
</script>

<%}%>