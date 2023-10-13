<%-- 
    Document   : getMember
    Created on : Aug 15, 2020, 10:42:18 AM
    Author     : GIRLS
--%>
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

        String data
                = m.ID() + "\t"
                + m.NOMENTREPRISE() + "\t"
                + m.SIEGESOCIAL() + "\t"
                + m.TELEPHONE() + "\t"
                + m.EMAIL() + "\t"
                + m.ADRESSE() + "\t"
                + m.REPRESENTANT() + "\t"
                + m.NUMEROPASSPORT() + "\t"
                + m.CIN() + "\t"
                + m.PATENTE() + "\t"
                + m.SITEWEB() + "\t"
                + m.USERCREATED() + "\t"
                + m.DATECREATED() + "\t"
                + m.USERUPDATED() + "\t"
                + m.DATEUPDATED();

        json.put("data", data);
    }
    out.print(json);
%>