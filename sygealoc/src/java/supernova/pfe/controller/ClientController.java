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
import supernova.pfe.dao.D_Client;
import supernova.pfe.tool.Lang;

/**
 *
 * @author Michel
 */
public class ClientController extends AbstractController {

    @Override
    protected ModelAndView handleRequestInternal(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addObject("active_menu", this.getClass().getName().substring(25).toLowerCase().replace("controller", ""));
        mv.addObject("client", new D_Client().get());
        Lang.removeVehicleSession(request);
        request.setAttribute("position", this.getClass().getName().substring(25).toLowerCase().replace("controller", ""));
        return mv;
    }

}
