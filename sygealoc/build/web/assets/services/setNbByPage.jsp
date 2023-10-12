<%-- 
    Document   : nextPage
    Created on : Sep 26, 2020, 10:43:16 AM
    Author     : monhel.pierre
--%>

<%@page import="atg.taglib.json.util.JSONObject"%>
<%
    String nbbypage = request.getParameter("nb");
    JSONObject json = new JSONObject();
    request.getSession().setAttribute("nbbypage", nbbypage);
    json.put("message", "Success");
    out.print(json);
%>