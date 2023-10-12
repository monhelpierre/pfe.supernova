<%-- 
    Document   : deleteMember
    Created on : Aug 16, 2020, 3:47:17 AM
    Author     : GIRLS
--%>

<%@page import="java.io.File"%>
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
        Vehicule vh = new D_Vehicule().get(Integer.parseInt(ID));
        String message = "";

        if (new D_Auth().deleteFrom(request.getParameter("table"), Integer.parseInt(ID)) > 0) {
            String root = (request.getServletContext().getRealPath("/").replace("/" + "build", "").replace("\\", "/")).replace("/build", "") + vh.IMAGE();
            if (new File(root).isFile() && new File(root).exists()) {
                new File(root).delete();
                message = "Suppression avec succes!";
            }
        } else {
            message = "Echec de la suppression!";
        }
        json.put("message", message);
    }
    out.print(json);
%>