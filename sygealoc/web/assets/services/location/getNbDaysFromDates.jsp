<%-- 
    Document   : deleteMember
    Created on : Aug 16, 2020, 3:47:17 AM
    Author     : GIRLS
--%>

<%@page import="supernova.pfe.tool.DateDifference"%>
<%@page import="supernova.pfe.dao.D_Vehicule"%>
<%@page import="supernova.pfe.model.Vehicule"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="supernova.pfe.dao.D_Location"%>
<%@page import="supernova.pfe.model.Location"%>
<%@page import="atg.taglib.json.util.JSONObject"%>
<%@page import="supernova.pfe.dao.D_Auth"%>
<%
    JSONObject json = new JSONObject();
    String comment = "";
    if (request.getParameter("EDITID") == null) {
        json.put("comment", "");
    } else {
        Location l = new D_Location().get(Integer.parseInt(request.getParameter("EDITID")));        
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");        
        Date datefin = sdf.parse(l.DATEDEBUT());        
        datefin.setDate(datefin.getDate() + Integer.parseInt(l.NBJOUR()));
        
        long difference_In_Time = datefin.getTime() - new Date().getTime();
        long difference_In_Seconds = (difference_In_Time  / 1000) % 60; 
        long difference_In_Minutes = (difference_In_Time/ (1000 * 60)) % 60; 
        long difference_In_Hours  = (difference_In_Time / (1000 * 60 * 60)) % 24; 
        long difference_In_Years = (difference_In_Time / (1000l * 60 * 60 * 24 * 365)); 
        long difference_In_Days = (difference_In_Time / (1000 * 60 * 60 * 24))% 365;        
        comment =difference_In_Days+ "j"+ difference_In_Hours+ " h"+ difference_In_Minutes+ "m";  
        request.getSession().setAttribute("COMMENTAIRE", comment);
        json.put("comment", comment);
    }
    
    out.print(json);
%>