<%-- 
    Document   : addMember
    Created on : Aug 16, 2020, 3:54:05 AM
    Author     : GIRLS
--%>
<%@page import="supernova.pfe.tool.FormvalidationWithImage"%>
<%@page import="org.springframework.http.HttpRequest"%>
<%@page import="supernova.pfe.tool.Form_validation"%>
<%@page import="supernova.pfe.dao.D_Vehicule"%>
<%@page import="supernova.pfe.tool.MyID"%>
<%@page import="supernova.pfe.tool.ImageResizer"%>
<%@page import="supernova.pfe.model.Vehicule"%>
<%@page import="java.util.HashMap"%>
<%@page import="supernova.pfe.dao.D_Auth"%>
<%@page import="supernova.pfe.model.Employe"%>
<%@page import="java.util.Map"%>
<%@page import="atg.taglib.json.util.JSONObject"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.List"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>

<%
    JSONObject json = new JSONObject();
    if (request.getSession() == null || request.getSession().getAttribute("member_info") == null) {
        json.put("link", "connexion");
    } else {
        json.put("link", "null");
        String message = "";
        HashMap<String, String> data = new HashMap<>();
        HashMap<String, String> rules = new HashMap<>();
        String path = "assets/uploads/vehicule";
        String ID = request.getParameter("ID");
        Vehicule v = new Vehicule();
        FileItem file = null;
        String absolutepath = null, extention = null;

        boolean keep = false;

        rules.put("ANNEE", "required, len=4");
        rules.put("COULEUR", "required");
        rules.put("MARQUE", "required");
        rules.put("NUMMOTEUR", "required, unique[vehicule.NUMMOTEUR]");
        rules.put("MODEL", "required");
        rules.put("PRIXPARJOUR", "required");
        rules.put("NUMPLAQUE", "required, is-imma, unique[vehicule.NUMPLAQUE]");
        rules.put("TYPE", "required");
        rules.put("FOURNISSEUR", "required");
        rules.put("TYPEMOTEUR", "required");
        rules.put("TRANSMISSION", "required");

        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {
                        String name = new File(item.getName()).getName();
                        double fileSize = (double) item.getSize() / 1024;

                        if (name.toLowerCase().contains("jpg")
                                || name.toLowerCase().contains("png")
                                || name.toLowerCase().contains("jpeg")) {
                            if (name.toLowerCase().contains("jpg")) {
                                extention = "jpg";
                            } else {
                                if (name.toLowerCase().contains("png")) {
                                    extention = "png";
                                } else {
                                    if (name.toLowerCase().contains("jpeg")) {
                                        extention = "jpeg";
                                    }
                                }
                            }

                            String filename = "image" + v.ID() + "vehicule." + extention;
                            String root = request.getServletContext().getRealPath("/").replace("/" + "build", "").replace("\\", "/");
                            String relative_path = path + "/" + filename;
                            absolutepath = root.replace("/build", "") + relative_path.replace("\\", "/");
                            v.IMAGE(relative_path);
                            file = item;
                            message = absolutepath;
                        } else {
                            if (!message.contains(item.getFieldName())) {
                                message = "Type de fichier non permis pour le champ '" + item.getFieldName() + "' (jpg, png, jpeg)<br/>";
                            }
                        }
                    } else {
                        data.put(item.getFieldName(), item.getString());
                        if (item.getFieldName().equals("ID")) {
                            if (item.getString() != null && !item.getString().isEmpty()) {
                                ID = item.getString();
                            } else {
                                ID = MyID.create("vehicule");
                            }
                            v.ID(ID);
                        }
                        if (item.getString() != null && !item.getString().isEmpty()) {
                            request.getSession().setAttribute(item.getFieldName(), item.getString());
                        }
                        if (item.getFieldName().equals("ID") && !item.getString().isEmpty()) {
                            request.setAttribute("option", "Modifier");
                        } else {
                            request.setAttribute("option", "Enregistrer");
                        }
                    }
                }
            } catch (Exception ex) {
                message = ex.getMessage();
            }

            FormvalidationWithImage.setRules(rules, data);
            keep = FormvalidationWithImage.run();
            if (!keep) {
                message = FormvalidationWithImage.error();
            }
        } else {
            data.put("ID", request.getParameter("ID"));
            data.put("ANNEE", request.getParameter("ANNEE"));
            data.put("COULEUR", request.getParameter("COULEUR"));
            data.put("MARQUE", request.getParameter("MARQUE"));
            data.put("NUMMOTEUR", request.getParameter("NUMMOTEUR"));
            data.put("NUMPLAQUE", request.getParameter("NUMPLAQUE"));
            data.put("PRIXPARJOUR", request.getParameter("PRIXPARJOUR"));
            data.put("MODEL", request.getParameter("MODEL"));
            data.put("TYPE", request.getParameter("TYPE"));
            data.put("FOURNISSEUR", request.getParameter("FOURNISSEUR"));
            data.put("ETAT", request.getParameter("ETAT"));
            data.put("TYPEMOTEUR", request.getParameter("TYPEMOTEUR"));
            data.put("TRANSMISSION", request.getParameter("TRANSMISSION"));

            Form_validation.setRules(rules, request);
            keep = Form_validation.run();
            if (!keep) {
                message = Form_validation.error();
            }
        }

        if (keep) {
            v.ANNEE(data.get("ANNEE"));
            v.COULEUR(data.get("COULEUR"));
            v.MARQUE(data.get("MARQUE"));
            v.NUMMOTEUR(data.get("NUMMOTEUR"));
            v.NUMPLAQUE(data.get("NUMPLAQUE").toUpperCase());
            v.PRIXPARJOUR(data.get("PRIXPARJOUR").replace("$ ", "").replace(" ", ""));
            v.MODEL(data.get("MODEL"));
            v.TYPE(data.get("TYPE"));
            v.FOURNISSEUR(data.get("FOURNISSEUR"));
            v.ETAT(data.get("ETAT"));
            v.TYPEMOTEUR(data.get("TYPEMOTEUR"));
            v.TRANSMISSION(data.get("TRANSMISSION"));
            v.ID(data.get("ID"));

            if (data.get("ID") != null && !data.get("ID").isEmpty()) {
                if (v.IMAGE() == null) {
                    Vehicule vhc = new D_Vehicule().get(Integer.parseInt(data.get("ID")));
                    if (vhc.IMAGE() != null) {
                        v.IMAGE(vhc.IMAGE());
                    } else {
                        v.IMAGE("");
                    }
                }
                v.USERUPDATED(((Employe) request.getSession().getAttribute("member_info")).ID() + "");
                message = v.ID();
                if (new D_Vehicule().update(v) > 0) {
                    message = "Vehicule mise a jour avec succes.";
                    request.getSession().removeAttribute("vehiculeimage");
                    if (file != null) {
                        file.write(new File(absolutepath));
                        ImageResizer.init(new File(absolutepath), 200, 200, extention);
                    }
                } else {
                    message = "Erreur de mise a jour du vehicule " + v.ID();
                    if (request.getSession().getAttribute("vehiculeimage") != null) {
                        String oldprofile = request.getSession().getAttribute("vehiculeimage").toString();
                        if (new File(oldprofile).isFile() && new File(oldprofile).exists()) {
                            new File(oldprofile).delete();
                            request.getSession().removeAttribute("vehiculeimage");
                        }
                    }
                }
            } else {
                v.USERCREATED(((Employe) request.getSession().getAttribute("member_info")).ID() + "");
                v.ID(MyID.create("vehicule"));
                if (new D_Vehicule().insert(v) > 0) {
                    message = "Vehicule ajoute avec succes";
                    if (file != null) {
                        file.write(new File(absolutepath));
                        ImageResizer.init(new File(absolutepath), 200, 200, extention);
                    }
                } else {
                    message = "Erreur d'enregistrement du vehicule ";
                    String oldprofile = request.getSession().getAttribute("vehiculeimage").toString();
                    if (new File(oldprofile).isFile() && new File(oldprofile).exists()) {
                        new File(oldprofile).delete();
                        request.getSession().removeAttribute("vehiculeimage");
                    }
                }
            }
        }
        json.put("message", message);
        request.getSession().setAttribute("msgi", message);
    }
    out.print(json);
%>