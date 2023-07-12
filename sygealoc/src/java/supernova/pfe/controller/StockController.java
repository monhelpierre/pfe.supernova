/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package supernova.pfe.controller;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;
import supernova.pfe.dao.D_Vehicule;
import supernova.pfe.tool.Lang;

/**
 *
 * @author GIRLS
 */
public class StockController extends AbstractController {

    public void setPages(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) throws UnsupportedEncodingException {

        if (request.getSession().getAttribute("nbbypage") == null || request.getSession().getAttribute("nbbypage").toString().isEmpty()) {
            request.getSession().setAttribute("nbbypage", 4);
        }

        int nbbypage = Integer.parseInt(request.getSession().getAttribute("nbbypage").toString());

        int total_pages = (int) (Math.ceil((double) (new D_Vehicule().get().size()) / nbbypage));
        if (total_pages < 0) {
            total_pages = 1;
        }

        if (request.getSession().getAttribute("active_page") == null || request.getSession().getAttribute("active_page").toString().isEmpty()) {
            request.getSession().setAttribute("active_page", 1);
        }

        int limit = Integer.parseInt(request.getSession().getAttribute("active_page").toString()) * nbbypage;
        int active_page = Integer.parseInt(request.getSession().getAttribute("active_page").toString());

        if (active_page > total_pages) {
            active_page = total_pages;
            request.getSession().setAttribute("active_page", active_page);
        }

        if (active_page < 1) {
            active_page = 1;
            request.getSession().setAttribute("active_page", active_page);
        }

        mv.addObject("vehicule", new D_Vehicule().get(limit + "", nbbypage, active_page, total_pages));
        request.setAttribute("active_page", request.getSession().getAttribute("active_page"));
        request.setAttribute("total_pages", total_pages);
        request.setAttribute("nbbypage", nbbypage);
    }

    @Override
    protected ModelAndView handleRequestInternal(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addObject("active_menu", this.getClass().getName().substring(25).toLowerCase().replace("controller", ""));
        this.setPages(request, response, mv);
        Lang.removeVehicleSession(request);
        request.setAttribute("position", this.getClass().getName().substring(25).toLowerCase().replace("controller", ""));
        return mv;
    }

}
