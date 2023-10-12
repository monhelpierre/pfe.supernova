<%-- 
    Document   : addClient
    Created on : Aug 16, 2020, 3:54:05 AM
    Author     : GIRLS
--%>
<%@page import="supernova.pfe.model.Employe"%>
<%@page import="supernova.pfe.tool.MyID"%>
<%@page import="supernova.pfe.dao.D_Client"%>
<%@page import="java.util.HashMap"%>
<%@page import="supernova.pfe.tool.Form_validation"%>
<%@page import="atg.taglib.json.util.JSONArray"%>
<%@page import="atg.taglib.json.util.JSONObject"%>
<%@page import="supernova.pfe.model.Client"%>
<%@page import="supernova.pfe.dao.D_Auth"%>

<%
    JSONObject json = new JSONObject();

    if (request.getSession() == null || request.getSession().getAttribute("member_info") == null) {
        json.put("link", "connexion");
    } else {
        json.put("link", "null");
        String ID = request.getParameter("ID");
        String TYPE = request.getParameter("TYPE");
        String NOMCOMPLET = request.getParameter("NOMCOMPLET");
        String SEXE = request.getParameter("SEXE");
        String ADRESSE = request.getParameter("ADRESSE");
        String NATIONALITE = request.getParameter("NATIONALITE");
        String CIN = request.getParameter("CIN");
        String PASSEPORT = request.getParameter("PASSEPORT");
        String TELEPHONE = request.getParameter("TELEPHONE");
        String EMAIL = request.getParameter("EMAIL");
        String PERMIS = request.getParameter("PERMIS");
        String DATEDEXPIRATION = request.getParameter("DATEDEXPIRATION");
        String PATENTE = request.getParameter("PATENTE");

        if (TELEPHONE != null) {
            TELEPHONE = TELEPHONE.trim().replace("-", "");
        }

        HashMap<String, String> rules = new HashMap<>();
        rules.put("TYPE", "required");

        if (TYPE != null) {
            if (TYPE.equals("Personne physique")) {
                rules.put("NOMCOMPLET", "required, no-symbol");
                rules.put("SEXE", "required");
                rules.put("NATIONALITE", "required");
                rules.put("PERMIS", "required, between-and-nb-letter=12&13#1&2, unique[client.PERMIS]");
                rules.put("DATEDEXPIRATION", (ID==null||ID.isEmpty()?"required, min-date-from-now=0&1&0" : "required"));
                PATENTE = "N/A";
                
                if (NATIONALITE != null) {
                    if (NATIONALITE.equals("Haitïenne")) {
                        PASSEPORT = "N/A";
                        rules.put("CIN", "required, unique[client.CIN]");
                    } else {                                              
                        if(PASSEPORT!=null && !(PASSEPORT.trim()).isEmpty()){
                            rules.put("PASSEPORT", "required, unique[client.PASSEPORT]");
                        }else{
                            rules.put("PASSEPORT", "required");  
                        }
                    }
                }
            } else {
                rules.put("NOMCOMPLET", "required");
                rules.put("PATENTE", "required");
                SEXE = "N/A";
                NATIONALITE = "N/A";
                CIN = "N/A";
                DATEDEXPIRATION = "N/A";
                PASSEPORT = "N/A";
                PERMIS = "N/A";
            }
        }

        rules.put("ADRESSE", "required");
        rules.put("TELEPHONE", "required, only-digit, len=8, unique[client.TELEPHONE]");
        rules.put("EMAIL", "required, is-email, unique[client.EMAIL");

        Form_validation.setRules(rules, request);
        String message = null;

        if (Form_validation.run()) {
            Client m = new Client(ID, TYPE, NOMCOMPLET, SEXE, ADRESSE, NATIONALITE, CIN, PASSEPORT, TELEPHONE, EMAIL, PERMIS, DATEDEXPIRATION, PATENTE);
            if (ID != null && !ID.isEmpty()) {
                m.USERUPDATED(((Employe) request.getSession().getAttribute("member_info")).ID() + "");
                if (new D_Client().update(m) > 0) {
                    message = "Modification avec succes!";
                } else {
                    message = "Erreur de modification !";
                }
            } else {
                m.ID(MyID.create("client"));
                m.USERCREATED(((Employe) request.getSession().getAttribute("member_info")).ID() + "");
                if (new D_Client().insert(m) > 0) {
                    message = "Enregistrement avec succes!";
                } else {
                    message = "Erreur d'enregistrement !";
                }
            }
        } else {
            message = Form_validation.error();
        }
        json.put("message", message);
    }
    out.print(json);
%>