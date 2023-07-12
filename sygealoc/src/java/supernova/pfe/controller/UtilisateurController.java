/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package supernova.pfe.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;
import supernova.pfe.dao.D_Auth;
import supernova.pfe.tool.Lang;

/**
 *
 * @author GIRLS
 */
public class UtilisateurController extends AbstractController {
    
    public UtilisateurController() {
    }
    
    @Override
    protected ModelAndView handleRequestInternal(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addObject("active_menu", this.getClass().getName().substring(25).toLowerCase().replace("controller", ""));
        request.setAttribute("member", new D_Auth().getUsers());
        Lang.removeVehicleSession(request);
        request.setAttribute("position", this.getClass().getName().substring(25).toLowerCase().replace("controller", ""));
        return mv;
    }
    
}
