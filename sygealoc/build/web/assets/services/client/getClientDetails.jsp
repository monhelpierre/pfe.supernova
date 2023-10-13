<%-- 
    Document   : getMember
    Created on : Aug 15, 2020, 10:42:18 AM
    Author     : GIRLS
--%>
<%@page import="supernova.pfe.model.Client"%>
<%@page import="supernova.pfe.dao.D_Client"%>
<%@page import="atg.taglib.json.util.JSONObject"%>

<%
    JSONObject json = new JSONObject();
    if (request.getSession() == null || request.getSession().getAttribute("member_info") == null) {
        json.put("link", "connexion");
    } else {
        json.put("link", "null");
        String ID = request.getParameter("ID");
        Client m = new D_Client().get(Integer.parseInt(ID));
        String data
                = m.ID() + "\t"
                + m.TYPE() + "\t"
                + m.NOMCOMPLET() + "\t"
                + m.SEXE() + "\t"
                + m.ADRESSE() + "\t"
                + m.NATIONALITE() + "\t"
                + m.CIN() + "\t"
                + m.PASSEPORT() + "\t"
                + m.TELEPHONE() + "\t"
                + m.EMAIL() + "\t"
                + m.PERMIS() + "\t"
                + m.DATEDEXPIRATION() + "\t"
                + m.PATENTE() + "\t"
                + m.USERCREATED() + "\t"
                + m.DATECREATED() + "\t"
                + m.USERUPDATED() + "\t"
                + m.DATEUPDATED();
        json.put("data", data);
    }
    out.print(json);
%>