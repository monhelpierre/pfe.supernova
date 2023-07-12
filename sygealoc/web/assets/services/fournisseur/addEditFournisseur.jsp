<%-- 
    Document   : addFournisseur
    Created on : Aug 16, 2020, 3:54:05 AM
    Author     : GIRLS
--%>
<%@page import="supernova.pfe.tool.MyID"%>
<%@page import="supernova.pfe.dao.D_Fournisseur"%>
<%@page import="supernova.pfe.model.Employe"%>
<%@page import="java.util.HashMap"%>
<%@page import="supernova.pfe.tool.Form_validation"%>
<%@page import="atg.taglib.json.util.JSONArray"%>
<%@page import="atg.taglib.json.util.JSONObject"%>
<%@page import="supernova.pfe.model.Fournisseur"%>
<%@page import="supernova.pfe.dao.D_Auth"%>
<%
    JSONObject json = new JSONObject();

    if (request.getSession() == null || request.getSession().getAttribute("member_info") == null) {
        json.put("link", "connexion");
    } else {        
        json.put("link", "null");
        String ID = request.getParameter("ID");
        String NOMENTREPRISE = request.getParameter("NOMENTREPRISE");
        String SIEGESOCIAL = request.getParameter("SIEGESOCIAL");
        String TELEPHONE = request.getParameter("TELEPHONE");
        String EMAIL = request.getParameter("EMAIL");
        String ADRESSE = request.getParameter("ADRESSE");
        String REPRESENTANT = request.getParameter("REPRESENTANT");
        String NUMEROPASSPORT = request.getParameter("NUMEROPASSPORT");
        String CIN = request.getParameter("CIN");
        String PATENTE = request.getParameter("PATENTE");
        String SITEWEB = request.getParameter("SITEWEB");

        HashMap<String, String> rules = new HashMap<>();
        
        if(SITEWEB!=null && !(SITEWEB.trim()).isEmpty()){
            rules.put("SITEWEB", "is-url, unique[fournisseur.SITEWEB]");
        }
        
        rules.put("ADRESSE", "required");
        rules.put("REPRESENTANT", "required, no-symbol");
        rules.put("SIEGESOCIAL", "required");
        rules.put("NOMENTREPRISE", "required,  unique[fournisseur.NOMENTREPRISE]");
        rules.put("TELEPHONE", "required, only-digit, len=8, unique[fournisseur.TELEPHONE]");
        rules.put("PATENTE", "required, unique[fournisseur.PATENTE]");
        rules.put("EMAIL", "required, is-email, unique[fournisseur.EMAIL]");

        Form_validation.setRules(rules, request);
        String message = null;

        if (Form_validation.run()) {
            if ((CIN != null && !CIN.isEmpty()) || (NUMEROPASSPORT != null && !NUMEROPASSPORT.isEmpty())) {
                Fournisseur m = new Fournisseur(ID, NOMENTREPRISE, SIEGESOCIAL, TELEPHONE, EMAIL, ADRESSE, REPRESENTANT, NUMEROPASSPORT, CIN, PATENTE, SITEWEB);
                if (ID != null && !ID.isEmpty()) {
                    m.USERUPDATED(((Employe) request.getSession().getAttribute("member_info")).ID() + "");
                    if (new D_Fournisseur().update(m) > 0) {
                        message = "Modification avec succes!";
                    } else {
                        message = "Erreur de modification !";
                    }
                } else {
                    m.ID(MyID.create("fournisseur"));
                    m.USERCREATED(((Employe) request.getSession().getAttribute("member_info")).ID() + "");
                    if (new D_Fournisseur().insert(m) > 0) {
                        message = "Enregistrement avec succes!";
                    } else {
                        message = "Erreur d'enregistrement !";
                    }
                }
            } else {
                message = "Veuillez specifier un CIN ou un numero de passeport";
            }
        } else {
            message = Form_validation.error();
        }

        json.put("message", message);
    }
    out.print(json);
%>