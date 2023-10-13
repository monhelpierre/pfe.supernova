<%-- 
    Document   : getMember
    Created on : Aug 15, 2020, 10:42:18 AM
    Author     : GIRLS
--%>
<%@page import="supernova.pfe.model.Location"%>
<%@page import="supernova.pfe.dao.D_Location"%>
<%@page import="atg.taglib.json.util.JSONObject"%>

<%
    JSONObject json = new JSONObject();

    if (request.getSession() == null || request.getSession().getAttribute("member_info") == null) {
        json.put("link", "connexion");
    } else {
        json.put("link", "null");
        String ID = request.getParameter("ID");
        Location m = new D_Location().get(Integer.parseInt(ID));
        String data
                = m.ID() + "\t"
                + m.CLIENT() + "\t"
                + m.VEHICULE() + "\t"
                + m.DATEDEBUT() + "\t"
                + m.HEUREDEBUT() + "\t"
                + m.NBJOUR() + "\t"
                + m.VEHICULERETOURNE() + "\t"
                + m.DETTE() + "\t"
                + m.ETAT() + "\t"
                + m.USERCREATED() + "\t"
                + m.DATECREATED() + "\t"
                + m.USERUPDATED() + "\t"
                + m.DATEUPDATED() + "\t"
                + m.COMMENTAIRE();

        json.put("data", data);
    }
    out.print(json);
%>