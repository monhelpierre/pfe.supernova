<%-- 
    Document   : getMember
    Created on : Aug 15, 2020, 10:42:18 AM
    Author     : GIRLS
--%>
<%@page import="supernova.pfe.dao.D_Vehicule"%>
<%@page import="supernova.pfe.model.Vehicule"%>
<%@page import="atg.taglib.json.util.JSONObject"%>
<%@page import="supernova.pfe.dao.D_Auth"%>

<%
    JSONObject json = new JSONObject();
    if (request.getSession() == null || request.getSession().getAttribute("member_info") == null) {
        json.put("link", "connexion");
    } else {
        json.put("link", "null");
        String ID = request.getParameter("ID");
        Vehicule m = new D_Vehicule().get(Integer.parseInt(ID));
        String data
                = m.ID() + "\t"
                + m.COULEUR() + "\t"
                + m.FOURNISSEUR() + "\t"
                + m.TYPE() + "\t"
                + m.COULEUR() + "\t"
                + m.MARQUE() + "\t"
                + m.MODEL() + "\t"
                + m.ANNEE() + "\t"
                + m.TRANSMISSION() + "\t"
                + m.NUMMOTEUR() + "\t"
                + m.NUMPLAQUE() + "\t"
                + m.TYPEMOTEUR() + "\t"
                + m.PRIXPARJOUR() + "\t"
                + m.ETAT() + "\t"
                + m.IMAGE() + "\t"
                + m.USERCREATED() + "\t"
                + m.DATECREATED() + "\t"
                + m.USERUPDATED() + "\t"
                + m.DATEUPDATED();
        json.put("data", data);
    }
    out.print(json);
%>