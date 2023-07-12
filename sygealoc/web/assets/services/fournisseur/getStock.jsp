<%-- 
    Document   : getMember
    Created on : Aug 15, 2020, 10:42:18 AM
    Author     : GIRLS
--%>
<%@page import="supernova.pfe.dao.D_Auth"%>
<%@page import="supernova.pfe.dao.D_Fournisseur"%>
<%@page import="supernova.pfe.model.Fournisseur"%>
<%@page import="atg.taglib.json.util.JSONObject"%>

<%
    JSONObject json = new JSONObject();

    if (request.getSession() == null || request.getSession().getAttribute("member_info") == null) {
        json.put("link", "connexion");
    } else {
        json.put("link", "null");
        String ID = request.getParameter("ID");
        Fournisseur m = new D_Fournisseur().get(Integer.parseInt(ID));
        String data = "";
        if (new D_Auth().isProviderInStock(ID)) {
            data = "Erreur";
        } else {
            data = "Success";
        }
        json.put("msg", data);
    }
    out.print(json);
%>