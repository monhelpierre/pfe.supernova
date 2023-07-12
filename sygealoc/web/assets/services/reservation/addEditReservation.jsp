<%-- 
    Document   : addReservation
    Created on : Aug 16, 2020, 3:54:05 AM
    Author     : GIRLS
--%>
<%@page import="supernova.pfe.dao.D_Location"%>
<%@page import="supernova.pfe.model.Location"%>
<%@page import="supernova.pfe.tool.MyDate"%>
<%@page import="supernova.pfe.dao.D_Vehicule"%>
<%@page import="supernova.pfe.model.Vehicule"%>
<%@page import="supernova.pfe.tool.MyID"%>
<%@page import="supernova.pfe.dao.D_Reservation"%>
<%@page import="supernova.pfe.model.Employe"%>
<%@page import="java.util.HashMap"%>
<%@page import="supernova.pfe.tool.Form_validation"%>
<%@page import="atg.taglib.json.util.JSONArray"%>
<%@page import="atg.taglib.json.util.JSONObject"%>
<%@page import="supernova.pfe.model.Reservation"%>
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
        String NBJOUR = request.getParameter("NBJOUR");
        String VERSEMENT = request.getParameter("VERSEMENT");
        String ETAT = request.getParameter("ETAT");
        String LIVRE = request.getParameter("LIVRE");
        String newid = null;

        HashMap<String, String> rules = new HashMap<>();
        rules.put("CLIENT", "required");
        rules.put("DATEDEBUT", "required");
        rules.put("VEHICULE", "required");
        rules.put("LIVRE", "required");
        rules.put("NBJOUR", "required");
        rules.put("VERSEMENT", "required");
        Form_validation.setRules(rules, request);
        String message = null;

        if (Form_validation.run()) {
            Vehicule vh = new D_Vehicule().get(Integer.parseInt(VEHICULE));
            VERSEMENT = VERSEMENT.replace("$ ", "").replace(" ", "");
            if ((Float.parseFloat(vh.PRIXPARJOUR()) * Float.parseFloat(NBJOUR)) >= Float.parseFloat(VERSEMENT)) {
                String[] completedatef = request.getParameter("DATEDEBUT").split(" - ");
                double balance = (Double.parseDouble(vh.PRIXPARJOUR()) * Double.parseDouble(NBJOUR)) - Double.parseDouble(VERSEMENT);
                Reservation m = new Reservation(ID, CLIENT, VEHICULE, completedatef[0], NBJOUR, VERSEMENT, balance + "", ETAT);
                m.LIVRE(LIVRE);
                if (ID != null && !ID.isEmpty()) {
                    Reservation oldloc = new D_Reservation().get(Integer.parseInt(ID));
                    if (oldloc.VEHICULE() != null && !oldloc.VEHICULE().equals(VEHICULE)) {
                        Vehicule oldv = new D_Vehicule().get(Integer.parseInt(oldloc.VEHICULE().trim()));
                        oldv.ETAT("Libre");
                        new D_Vehicule().update(oldv);
                    }
                }

                Vehicule v = new D_Vehicule().get(Integer.parseInt(VEHICULE.trim()));
                if (!m.ETAT().equals("Actif")) {
                    v.ETAT("Libre");
                } else {
                    v.ETAT("Reservé");
                }

                if (ID != null && !ID.trim().isEmpty()) {
                    m.USERUPDATED(((Employe) request.getSession().getAttribute("member_info")).ID() + "");
                    if (m.ETAT().equals("Annulé")) {
                        m.LIVRE("Non");
                    }

                    if (new D_Reservation().update(m) > 0) {
                        if (m.ETAT().equals("Actif") || m.ETAT().equals("Terminé")) {
                            if (m.LIVRE().equals("Oui")) {
                                Location loc = new Location(m.ID(),
                                        m.CLIENT(),
                                        m.VEHICULE(),
                                        m.DATEDEBUT(),
                                        MyDate.now().split(" ")[1],
                                        m.NBJOUR(),
                                        "Non",
                                        "0",
                                        m.ETAT());
                                new D_Location().insert(loc);
                                new D_Location().update(loc);
                                v.ETAT("Loué");
                            } else {
                                new D_Location().delete(Integer.parseInt(m.ID()));
                            }
                        } else {
                            new D_Location().delete(Integer.parseInt(m.ID()));
                        }
                        
                        if (new D_Vehicule().update(v) > 0) {
                            message = "Modification avec succes! ";
                        }
                        
                    } else {
                        message = "Erreur de modification !";
                    }
                } else {
                    m.ID(MyID.createFromTwo("location", "reservation"));
                    m.USERCREATED(((Employe) request.getSession().getAttribute("member_info")).ID() + "");
                    if (new D_Reservation().insert(m) > 0) {
                        if (new D_Vehicule().update(v) > 0) {
                            message = "Enregistrement avec succes!";
                        }
                    } else {
                        message = "Erreur d'enregistrement !";
                    }
                }
                newid = m.ID();
            } else {
                message = "Versement superieur au montant !";
            }
        } else {
            message = Form_validation.error();
        }

        json.put("newid", newid);
        json.put("message", message);
    }
    out.print(json);
%>