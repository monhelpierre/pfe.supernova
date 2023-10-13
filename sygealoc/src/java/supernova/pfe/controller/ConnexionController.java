/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package supernova.pfe.controller;

import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;
import supernova.pfe.dao.D_Auth;
import supernova.pfe.dao.D_UserPermission;
import supernova.pfe.model.CompanySetting;
import supernova.pfe.model.Employe;
import supernova.pfe.model.Theme;
import supernova.pfe.model.UserPermission;
import supernova.pfe.tool.Form_validation;
import supernova.pfe.tool.Lang;
import supernova.pfe.tool.MySession;

/**
 *
 * @author GIRLS
 */
public class ConnexionController extends AbstractController {

    @Override
    protected ModelAndView handleRequestInternal(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addObject("active_menu", this.getClass().getName().substring(25).toLowerCase().replace("controller", ""));
        request.getSession().setAttribute("theme", new D_Auth().getTheme());
        request.getSession().setAttribute("company", new D_Auth().getCompanySetting());
        String action = request.getParameter("action");

        if (action != null) {
            String username = request.getParameter("pseudo");
            String password = request.getParameter("password");
            HashMap<String, String> rules = new HashMap<>();
            rules.put("pseudo", "required");
            rules.put("password", "required");
            Form_validation.setRules(rules, request);
            String message = "";
            if (Form_validation.run()) {
                Employe mb = new D_Auth().get(username, password);
                if (mb != null) {
                    if (mb.ETAT().equals("ACTIF")) {
                        request.getSession().setAttribute("member_info", mb);
                        request.getSession().setAttribute("rights", new D_UserPermission().getPerm(mb.ID()));
                        request.getSession().setAttribute("welcome", "Bienvenue, " + mb.PSEUDO() + " !");
                        String module = MySession.getLastModuleFor(username, MySession.mac, MySession.host);
                        response.sendRedirect(module==null?"tableaudebord":module);
                    } else {
                        message = "Votre compte n'est plus actif, veuillez contacter l'administrateur pour plus d'information.";
                    }
                } else {
                    message = "Pseudo et/ou mot de passe incorrect";
                }
            } else {
                message = Form_validation.error();
            }
            mv.addObject("msg", message);
            mv.addObject("pseudo", username);
            mv.addObject("password", password);
        }
        mv.addObject("member_info", ((Employe) request.getSession().getAttribute("member_info")));
        mv.addObject("rights", ((ArrayList<UserPermission>) request.getSession().getAttribute("rights")));
        mv.addObject("company", ((CompanySetting) request.getSession().getAttribute("company")));
        mv.addObject("theme", ((Theme) request.getSession().getAttribute("theme")));
        Lang.removeVehicleSession(request);
        return mv;
    }
}
