<%-- 
    Document   : deleteMember
    Created on : Aug 16, 2020, 3:47:17 AM
    Author     : GIRLS
--%>

<%@page import="atg.taglib.json.util.JSONObject"%>
<%@page import="supernova.pfe.dao.D_Auth"%>
<%
    JSONObject json = new JSONObject();
    if (request.getSession() == null || request.getSession().getAttribute("member_info") == null) {
        json.put("link", "connexion");
    } else {
        json.put("link", "null");
        String ID = request.getParameter("ID");
        String message;
        if (new D_Auth().deleteFrom(request.getParameter("table"), Integer.parseInt(ID)) > 0) {
            message = "Suppression avec succes!";
        } else {
            message = "Echec de la suppression!";
        }
        json.put("message", message);
    }
    out.print(json);
%>