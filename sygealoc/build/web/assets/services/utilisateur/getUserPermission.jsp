<%-- 
    Document   : getMember
    Created on : Aug 15, 2020, 10:42:18 AM
    Author     : GIRLS
--%>
<%@page import="supernova.pfe.dao.D_UserPermission"%>
<%@page import="supernova.pfe.model.UserPermission"%>
<%@page import="java.util.ArrayList"%>
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
        ArrayList<UserPermission> perm = new D_UserPermission().getPerm(Integer.parseInt(ID));
        String result = "";
        for (UserPermission u : perm) {
            result += u.getMODULE() + "-" + u.getCAN_VIEW() + "-" + u.getCAN_ADD() + "-" + u.getCAN_EDIT() + "-" + u.getCAN_DELETE() + "-" + u.getCAN_PRINT() + "\t";
        }
        json.put("perm", result);
    }
    out.print(json);
%>