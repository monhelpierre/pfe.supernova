<%-- 
    Document   : deleteMember
    Created on : Aug 16, 2020, 3:47:17 AM
    Author     : GIRLS
--%>

<%@page import="atg.taglib.json.util.JSONObject"%>
<%@page import="supernova.pfe.dao.D_Auth"%>
<%
    JSONObject json = new JSONObject();
    request.getSession().removeAttribute(request.getParameter("parameter"));
    json.put("message", "Success");
    out.print(json);
%>