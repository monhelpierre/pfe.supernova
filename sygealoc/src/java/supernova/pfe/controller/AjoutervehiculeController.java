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
import supernova.pfe.dao.D_Vehicule;
import supernova.pfe.model.Vehicule;

/**
 *
 * @author GIRLS
 */
public class AjoutervehiculeController extends AbstractController {

    @Override
    protected ModelAndView handleRequestInternal(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addObject("active_menu", "stock");
        if (request.getParameter("editid") != null) {
            request.setAttribute("option", "Modifier");
            Vehicule v = new D_Vehicule().get(Integer.parseInt(request.getParameter("editid")));
            request.setAttribute("v", v);
        } else {
            request.setAttribute("option", "Enregistrer");
        }
        request.setAttribute("position", this.getClass().getName().substring(25).toLowerCase().replace("controller", "")); 
        return mv;
    }
}
