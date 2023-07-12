<%-- 
    Document   : getMember
    Created on : Aug 15, 2020, 10:42:18 AM
    Author     : GIRLS
--%>
<%@page import="supernova.pfe.dao.D_Location"%>
<%@page import="supernova.pfe.model.Location"%>
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
        Location loc = new D_Location().getForClient(Integer.parseInt(ID));
        String msg = "";
        if (loc != null && loc.ETAT().equals("Actif")) {
            msg = "Impossible de supprimer un client ayant une reservation en cours";
        } else {
            msg = "succes";
        }
        json.put("msg", msg);
    }
    out.print(json);
%>