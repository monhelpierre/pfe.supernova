<%-- 
    Document   : nextPage
    Created on : Sep 26, 2020, 10:43:16 AM
    Author     : monhel.pierre
--%>

<%@page import="atg.taglib.json.util.JSONObject"%>
<%
    String active_page = request.getParameter("page");
    JSONObject json = new JSONObject();
    request.getSession().setAttribute("active_page", active_page);
    json.put("message", "Success");
    out.print(json);
%>