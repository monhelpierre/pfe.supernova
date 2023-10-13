<%-- 
    Document   : getMember
    Created on : Aug 15, 2020, 10:42:18 AM
    Author     : GIRLS
--%>
<%@page import="supernova.pfe.model.Reservation"%>
<%@page import="supernova.pfe.dao.D_Reservation"%>
<%@page import="atg.taglib.json.util.JSONObject"%>

<%
    JSONObject json = new JSONObject();

    if (request.getSession() == null || request.getSession().getAttribute("member_info") == null) {
        json.put("link", "connexion");
    } else {
        json.put("link", "null");
        String ID = request.getParameter("ID");
        Reservation m = new D_Reservation().get(Integer.parseInt(ID));
        String data
                = m.ID() + "\t"
                + m.CLIENT() + "\t"
                + m.VEHICULE() + "\t"
                + m.DATEDEBUT() + "\t"
                + m.NBJOUR() + "\t"
                + m.VERSEMENT() + "\t"
                + m.BALANCE() + "\t"
                + m.LIVRE() + "\t"
                + m.ETAT() + "\t"
                + m.USERCREATED() + "\t"
                + m.DATECREATED() + "\t"
                + m.USERUPDATED() + "\t"
                + m.DATEUPDATED();

        json.put("data", data);
    }
    out.print(json);
%>