<%-- 
    Document   : addMember
    Created on : Aug 16, 2020, 3:54:05 AM
    Author     : GIRLS
--%>
<%@page import="supernova.pfe.tool.MyID"%>
<%@page import="java.util.HashMap"%>
<%@page import="supernova.pfe.tool.Form_validation"%>
<%@page import="atg.taglib.json.util.JSONArray"%>
<%@page import="atg.taglib.json.util.JSONObject"%>
<%@page import="supernova.pfe.model.Employe"%>
<%@page import="supernova.pfe.dao.D_Auth"%>
<%
    JSONObject json = new JSONObject();
    if (request.getSession() == null || request.getSession().getAttribute("member_info") == null) {
        json.put("link", "connexion");
    } else {
        json.put("link", "null");
        String ID = request.getParameter("ID");
        String NOMCOMPLET = request.getParameter("NOMCOMPLET");
        String SEXE = request.getParameter("SEXE");
        String DATENAISSANCE = request.getParameter("DATENAISSANCE");
        String ADRESSE = request.getParameter("ADRESSE");
        String NIF = request.getParameter("NIF");
        String POSTE = request.getParameter("POSTE");
        String TELEPHONE = request.getParameter("TELEPHONE");
        String EMAIL = request.getParameter("EMAIL");

        HashMap<String, String> rules = new HashMap<>();
        rules.put("ADRESSE", "required");
        rules.put("NOMCOMPLET", "required, no-symbol");
        rules.put("SEXE", "required, no-symbol");
        rules.put("POSTE", "required, no-symbol");
        rules.put("DATENAISSANCE", "required, max-year=18");
        rules.put("EMAIL", "required, is-email, unique[employe.EMAIL]");
        rules.put("NIF", "required, only-digit, len=13, unique[employe.NIF]");
        rules.put("TELEPHONE", "required, only-digit, len=8, unique[employe.TELEPHONE]");
        Form_validation.setRules(rules, request);
        String message = null;

        if (Form_validation.run()) {
            if (TELEPHONE != null) {
                TELEPHONE = TELEPHONE.replace("-", "");
            }

            Employe m = new Employe(ID == null || ID.isEmpty() ? 0 : Integer.parseInt(ID), NOMCOMPLET, SEXE, DATENAISSANCE, ADRESSE, NIF, POSTE, TELEPHONE, EMAIL);
            m.PSEUDO("");
            m.MOTDEPASSE("");

            if (ID != null && !ID.isEmpty()) {
                m.USERUPDATED(((Employe) request.getSession().getAttribute("member_info")).ID() + "");
                Employe userForEmp = new D_Auth().get(Integer.parseInt(ID));
                m.PSEUDO(userForEmp.PSEUDO());
                m.MOTDEPASSE(userForEmp.MOTDEPASSE());
                m.ETAT(userForEmp.ETAT());
                m.USERCREATED(userForEmp.USERCREATED());
                m.DATECREATED(userForEmp.DATECREATED());
                
                if (new D_Auth().update(m) > 0) {
                    message = "Modification avec succes!";
                } else {
                    message = "Erreur de modification !";
                }
            } else {
                m.ID(Integer.parseInt(MyID.create("employe")));
                m.USERCREATED(((Employe) request.getSession().getAttribute("member_info")).ID() + "");
                if (new D_Auth().insert(m) > 0) {
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