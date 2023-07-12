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
import supernova.pfe.tool.MySession;

/**
 *
 * @author monhel.pierre
 */
public class VerouillerController extends AbstractController {

    @Override
    protected ModelAndView handleRequestInternal(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addObject("active_menu", this.getClass().getName().substring(25).toLowerCase().replace("controller", ""));
        request.getSession().setAttribute("theme", new D_Auth().getTheme());
        request.getSession().setAttribute("company", new D_Auth().getCompanySetting());
        String message = "";
        String username = MySession.getUserFor(MySession.mac);
        
        if (request.getParameter("action") != null) {
            HashMap<String, String> rules = new HashMap<>();
            rules.put("password", "required");
            Form_validation.setRules(rules, request);
            if (Form_validation.run()) {
                Employe mb = new D_Auth().get(username, request.getParameter("password"));
                if (mb != null) {
                    request.getSession().setAttribute("member_info", mb);
                    request.getSession().setAttribute("rights", new D_UserPermission().getPerm(mb.ID()));
                    request.getSession().setAttribute("welcome", "Bon retour, " + mb.PSEUDO() + " !");
                    mv.addObject("member_info", ((Employe) request.getSession().getAttribute("member_info")));
                    mv.addObject("rights", ((ArrayList<UserPermission>) request.getSession().getAttribute("rights")));
                    mv.addObject("company", ((CompanySetting) request.getSession().getAttribute("company")));
                    mv.addObject("theme", ((Theme) request.getSession().getAttribute("theme")));
                    String module = MySession.getLastModuleFor(username, MySession.mac, MySession.host);
                    response.sendRedirect(module==null?"tableaudebord":module);
                } else {
                    message = "Mot de passe incorrect";
                }
            } else {
                message = Form_validation.error();
            }
        }

        mv.addObject("username", username);
        mv.addObject("msg", message);
        return mv;
    }
}
