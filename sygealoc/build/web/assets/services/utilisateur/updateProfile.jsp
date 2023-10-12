<%-- 
    Document   : addMember
    Created on : Aug 16, 2020, 3:54:05 AM
    Author     : GIRLS
--%>
<%@page import="supernova.pfe.tool.MD5"%>
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
        String pseudo = request.getParameter("pseudo");
        String motdepasse = request.getParameter("motdepasse");
        String newmotdepasse = request.getParameter("newmotdepasse");
        String confirmer = request.getParameter("confirmermotdepasse");

        HashMap<String, String> rules = new HashMap<>();
        rules.put("personnel", "required");
        rules.put("pseudo", "required, unique[employe.PSEUDO]");
        rules.put("motdepasse", "required");
        Form_validation.setRules(rules, request);
        String message = null;
        boolean go = true;
        Employe currentuser = ((Employe) request.getSession().getAttribute("member_info"));

        if (Form_validation.run()) {
            if (newmotdepasse != null && !newmotdepasse.isEmpty()) {
                if (!newmotdepasse.equals(confirmer)) {
                    go = false;
                    message = "La confirmation du nouveau mot de passe ne correspond pas!";
                } else {
                    if (!MD5.generate(motdepasse).equals(currentuser.MOTDEPASSE())) {
                        go = false;
                        message = "Le mot de passe actuel saisi est incorrect!";
                    } else {
                        currentuser.MOTDEPASSE(MD5.generate(newmotdepasse));
                    }
                }
            } else {
                if (!MD5.generate(motdepasse).equals(currentuser.MOTDEPASSE())) {
                    go = false;
                    message = "Le mot de passe actuel saisi est incorrect!";
                }
            }

            if (go) {
                currentuser.PSEUDO(pseudo);
                if (new D_Auth().updateEmployeForUser(currentuser) > 0) {
                    message = "Profile modifie avec succes! " + newmotdepasse;
                } else {
                    message = "Erreur de modiffication !";
                }
            }
        } else {
            message = Form_validation.error();
        }

        json.put("message", message);
    }
    out.print(json);
%>