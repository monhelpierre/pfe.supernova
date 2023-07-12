<%-- 
    Document   : addMember
    Created on : Aug 16, 2020, 3:54:05 AM
    Author     : GIRLS
--%>
<%@page import="java.util.HashMap"%>
<%@page import="supernova.pfe.tool.Form_validation"%>
<%@page import="atg.taglib.json.util.JSONArray"%>
<%@page import="atg.taglib.json.util.JSONObject"%>
<%@page import="supernova.pfe.model.Employe"%>
<%@page import="supernova.pfe.dao.D_Auth"%>
<%
    JSONObject json = new JSONObject();
    if (request.getSession() == null || request.getSession().getAttribute("member_info") == null) {
        json.put("link", "connexion");
    } else {
        json.put("link", "null");
        String ID = request.getParameter("PERSONNEL");
        String message = null;
        if (new D_Auth().removeUser(ID) > 0) {
            message = "Utilisateur supprime avec succes!";
        } else {
            message = "Erreur de suppression !";
        }
        json.put("message", message);
    }
    out.print(json);
%>