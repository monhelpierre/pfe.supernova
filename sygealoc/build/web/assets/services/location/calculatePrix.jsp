<%-- 
    Document   : calculateNbDay
    Created on : Sep 12, 2020, 10:02:59 PM
    Author     : GIRLS
--%>
<%@page import="supernova.pfe.dao.D_Vehicule"%>
<%@page import="supernova.pfe.model.Vehicule"%>
<%@page import="atg.taglib.json.util.JSONObject"%>

<%  
    JSONObject json = new JSONObject();
    Vehicule v = null;
    String VEHICULE = request.getParameter("VEHICULE");
    String PRIXPARJOUR = "0";
    if (VEHICULE != null && !VEHICULE.trim().isEmpty()) {
        v = new D_Vehicule().get(Integer.parseInt(VEHICULE));
        PRIXPARJOUR = v.PRIXPARJOUR();
    }
    json.put("PRIXPARJOUR", PRIXPARJOUR);
    out.print(json);
%>