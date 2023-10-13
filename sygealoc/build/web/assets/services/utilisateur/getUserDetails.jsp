<%-- 
    Document   : getMember
    Created on : Aug 15, 2020, 10:42:18 AM
    Author     : GIRLS
--%>
<%@page import="atg.taglib.json.util.JSONObject"%>
<%@page import="supernova.pfe.dao.D_Auth"%>
<%@page import="supernova.pfe.model.Employe"%>

<%
    JSONObject json = new JSONObject();
    if (request.getSession() == null || request.getSession().getAttribute("member_info") == null) {
        json.put("link", "connexion");
    } else {
        json.put("link", "null");
        String ID = request.getParameter("ID");
        Employe m = new D_Auth().get(Integer.parseInt(ID));
        String data
                = m.ID() + "\t"
                + m.PSEUDO() + "\t"
                + m.MOTDEPASSE() + "\t"
                + m.ETAT();
        json.put("data", data);
    }
    out.print(json);
%>