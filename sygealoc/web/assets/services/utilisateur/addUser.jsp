<%-- 
    Document   : addMember
    Created on : Aug 16, 2020, 3:54:05 AM
    Author     : GIRLS
--%>
<%@page import="supernova.pfe.tool.MD5"%>
<%@page import="supernova.pfe.dao.D_UserPermission"%>
<%@page import="supernova.pfe.model.UserPermission"%>
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
        String personnel = request.getParameter("personnel");
        String pseudo = request.getParameter("pseudo");
        String motdepasse = request.getParameter("motdepasse");
        String confirmer = request.getParameter("confirmer");
        String etat = request.getParameter("etat");

        HashMap<String, String> rules = new HashMap<>();
        rules.put("personnel", "required");
        rules.put("pseudo", "required, unique[employe.PSEUDO]");
        rules.put("motdepasse", "required");
        rules.put("confirmer", "required");
        rules.put("RIGHTS", "at-least-one-right");

        Form_validation.setRules(rules, request);
        HashMap<String, Integer> rightsdata = new HashMap<>();
        String message = null;
        String canview = "0";
        String canadd = "0";
        String canedit = "0";
        String candelete = "0";
        String canprint = "0";

        if (Form_validation.run()) {
            if (ID != null && !ID.isEmpty()) {
                motdepasse = new D_Auth().get(Integer.parseInt(ID)).MOTDEPASSE();
                confirmer = motdepasse;
            } else {
                motdepasse = MD5.generate(motdepasse);
                confirmer = MD5.generate(confirmer);
            }

            if (motdepasse.equals(confirmer)) {
                Employe m = new Employe(((personnel == null || personnel.isEmpty()) ? 0 : Integer.parseInt(personnel)), pseudo, motdepasse, etat);

                if (new D_Auth().updateEmployeForUser(m) > 0) {
                    for (String s : request.getParameter("RIGHTS").split(",")) {
                        String[] right = s.split("=");
                        rightsdata.put(right[0], Integer.parseInt(right[1]));
                    }
                    for (int i = 0; i < 7; i++) {
                        canview = rightsdata.get("canview" + i) == null ? "0" : rightsdata.get("canview" + i) +"";
                        canadd = rightsdata.get("canadd" + i) == null ? "0" : rightsdata.get("canadd" + i) +"";
                        canedit = rightsdata.get("canedit" + i) == null ? "0" : rightsdata.get("canedit" + i) +"";
                        candelete = rightsdata.get("candelete" + i) == null ? "0" : rightsdata.get("candelete" + i) +"";
                        canprint = rightsdata.get("canprint" + i) == null ? "0" : rightsdata.get("canprint" + i) +"";

                        UserPermission up = new UserPermission(0, Integer.parseInt(personnel), i, canview, canadd, canedit, candelete, canprint);
                        int oldid = new D_UserPermission().has(Integer.parseInt(personnel), i);

                        if (oldid != -1) {
                            up.setID(oldid);
                            new D_UserPermission().update(up);
                        } else {
                            new D_UserPermission().insert(up);
                        }
                    }
                    message = (ID == null || ID.isEmpty()) ? "Utilisateur ajoute avec succes!" : "Utilisateur modifie avec succes ";
                } else {
                    message = (ID == null || ID.isEmpty()) ? "Erreur d'enregistrement !" : "Erreur de modification";
                }
            } else {
                message = "Les deux mots de passe ne correspondent pas !";
            }
        } else {
            message = Form_validation.error();
        }

        json.put("message", message);
    }
    out.print(json);
%>