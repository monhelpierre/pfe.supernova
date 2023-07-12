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
import supernova.pfe.tool.Lang;
import supernova.pfe.tool.MySession;

/**
 *
 * @author monhel.pierre
 */
public class DeconnexionController extends AbstractController {
    @Override
    protected ModelAndView handleRequestInternal(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView();
        MySession.delete(MySession.mac, null);
        request.getSession().removeAttribute("member_info");
        request.getSession().removeAttribute("company");
        request.getSession().removeAttribute("theme");
        request.getSession().removeAttribute("localization");
        response.sendRedirect("connexion");
        Lang.removeVehicleSession(request);
        return mv;
    }
}
