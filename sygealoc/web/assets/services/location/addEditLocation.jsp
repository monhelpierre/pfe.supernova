<%-- 
    Document   : addLocation
    Created on : Aug 16, 2020, 3:54:05 AM
    Author     : GIRLS
--%>
<%@page import="supernova.pfe.tool.DateDifference"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="supernova.pfe.model.Reservation"%>
<%@page import="supernova.pfe.dao.D_Reservation"%>
<%@page import="java.util.Date"%>
<%@page import="supernova.pfe.dao.D_Vehicule"%>
<%@page import="supernova.pfe.model.Vehicule"%>
<%@page import="supernova.pfe.tool.MyID"%>
<%@page import="supernova.pfe.dao.D_Location"%>
<%@page import="supernova.pfe.model.Employe"%>
<%@page import="java.util.HashMap"%>
<%@page import="supernova.pfe.tool.Form_validation"%>
<%@page import="atg.taglib.json.util.JSONArray"%>
<%@page import="atg.taglib.json.util.JSONObject"%>
<%@page import="supernova.pfe.model.Location"%>
<%@page import="supernova.pfe.dao.D_Auth"%>
<%
    JSONObject json = new JSONObject();

    if (request.getSession() == null || request.getSession().getAttribute("member_info") == null) {
        json.put("link", "connexion");
    } else {
        json.put("link", "null");
        String ID = request.getParameter("ID");
        String CLIENT = request.getParameter("CLIENT");
        String VEHICULE = request.getParameter("VEHICULE");
        String DATEDEBUT = request.getParameter("DATEDEBUT");
        String HEUREDEBUT = request.getParameter("HEUREDEBUT");
        String DETTE = request.getParameter("DETTE");
        String NBJOUR = request.getParameter("NBJOUR");
        String VEHICULERETOURNE = request.getParameter("VEHICULERETOURNE");
        String ETAT = request.getParameter("ETAT");
        String COMMENTAIRE = request.getSession().getAttribute("COMMENTAIRE")==null?"":request.getSession().getAttribute("COMMENTAIRE").toString();

        HashMap<String, String> rules = new HashMap<>();
        rules.put("CLIENT", "required");
        rules.put("DATEDEBUT", "required");
        rules.put("HEUREDEBUT", "required");
        rules.put("VEHICULE", "required");
        rules.put("NBJOUR", "required");
        rules.put("VEHICULERETOURNE", "required");
        Form_validation.setRules(rules, request);
        String message = null, newid = null;

        if (Form_validation.run()) {
            String seconds = (((new Date().getSeconds()) < 9) ? "0" + new Date().getSeconds() : "" + new Date().getSeconds());
            if (HEUREDEBUT.contains("pm") || HEUREDEBUT.contains("am")) {
                if (HEUREDEBUT.contains("pm")) {
                    String[] d = (HEUREDEBUT.replace("pm", "").trim()).split(":");
                    HEUREDEBUT = ((Integer.parseInt(d[0]) + 12) + ":" + d[1] + ":" + seconds).trim();
                } else {
                    HEUREDEBUT = (HEUREDEBUT.replace("am", "").trim() + ":" + seconds).trim();
                }
            }

            String[] completedatef = request.getParameter("DATEDEBUT").split(" - ");
            DETTE = DETTE.replace("$ ", "");
            if (DETTE.trim().isEmpty()) {
                DETTE = "0";
            }

            Location m = new Location(ID, CLIENT, VEHICULE, completedatef[0], HEUREDEBUT, NBJOUR, VEHICULERETOURNE, DETTE, ETAT);
            m.COMMENTAIRE(COMMENTAIRE);
            
            if (ID != null && !ID.isEmpty()) {
                Location oldloc = new D_Location().get(Integer.parseInt(ID));
                if (oldloc.VEHICULE() != null && !oldloc.VEHICULE().equals(VEHICULE)) {
                    Vehicule oldv = new D_Vehicule().get(Integer.parseInt(oldloc.VEHICULE().trim()));
                    oldv.ETAT("Libre");
                    new D_Vehicule().update(oldv);
                }
            }

            Vehicule v = new D_Vehicule().get(Integer.parseInt(VEHICULE.trim()));
            if (m.VEHICULERETOURNE().equals("Non")) {
                if (m.ETAT().equals("Terminé")) {
                    v.ETAT("En retard");
                } else {
                    v.ETAT("Loué");
                }
            } else {
                v.ETAT("Libre");
            }

            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            Date datefin = sdf.parse(m.DATEDEBUT());
            datefin.setDate(datefin.getDate() + Integer.parseInt(m.NBJOUR()));

            double dette = 0;
            if (datefin.getTime() < new Date().getTime()) {
                if (m.VEHICULERETOURNE().equals("Non")) {
                    v.ETAT("En retard");                    
                    int nbhourslate = new DateDifference(datefin, new Date()).get() * 24;
                    dette = ((Double.parseDouble(v.PRIXPARJOUR()) /24) * nbhourslate);
                } else {
                    v.ETAT("Libre");
                }
                m.ETAT("Terminé");
                new D_Vehicule().update(v);
            } else {
                if (m.VEHICULERETOURNE().equals("Non")) {
                    v.ETAT("Loué");
                    m.ETAT("Actif");
                }
            }
            m.DETTE(dette + "");            

            if (ID != null && !ID.trim().isEmpty()) {
                m.USERUPDATED(((Employe) request.getSession().getAttribute("member_info")).ID() + "");
                request.getSession().setAttribute("COMMENTAIRE", null);
                if (new D_Location().update(m) > 0) {
                    if (new D_Vehicule().update(v) > 0) {
                        Reservation reser = new D_Reservation().get(Integer.parseInt(m.ID()));
                        if (reser != null) {
                            reser.DATEDEBUT(m.DATEDEBUT());
                            reser.NBJOUR(m.NBJOUR());
                            reser.VERSEMENT(Double.parseDouble(v.PRIXPARJOUR()) * Integer.parseInt(m.NBJOUR()) + "");
                            new D_Reservation().update(reser);
                        }
                        message = "Modification avec succes!";
                    }
                } else {
                    message = "Erreur de modification !";
                }
            } else {
                m.ID(MyID.createFromTwo("reservation", "location"));
                m.USERCREATED(((Employe) request.getSession().getAttribute("member_info")).ID() + "");
                if (new D_Location().insert(m) > 0) {
                    if (new D_Vehicule().update(v) > 0) {
                        message = "Enregistrement avec succes!";
                    }
                } else {
                    message = "Erreur d'enregistrement !";
                }
            }
            newid = m.ID();
        } else {
            message = Form_validation.error();
        }

        json.put("newid", newid);
        json.put("message", message);
    }
    out.print(json);
%>