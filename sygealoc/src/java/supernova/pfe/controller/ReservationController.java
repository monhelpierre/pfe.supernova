/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package supernova.pfe.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;
import supernova.pfe.dao.D_Reservation;
import supernova.pfe.model.Reservation;
import supernova.pfe.tool.Lang;

/**
 *
 * @author GIRLS
 */
public class ReservationController extends AbstractController {

    /**
     *
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @Override
    protected ModelAndView handleRequestInternal(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addObject("active_menu", this.getClass().getName().substring(25).toLowerCase().replace("controller", ""));
        ArrayList<Reservation> res = new D_Reservation().get();
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

        for (Reservation r : res) {
            if (!r.ETAT().equals("ANNULÉ")) {
                Date datefin = sdf.parse(r.DATEDEBUT());
                datefin.setDate(datefin.getDate() + Integer.parseInt(r.NBJOUR()));
                if (datefin.getTime() < new Date().getTime()) {
                    if (r.ETAT().equals("ACTIF")) {
                        r.ETAT("TERMINÉ");
                    }
                } else {
                    if (r.ETAT().equals("TERMINÉ")) {
                        r.ETAT("ACTIF");
                    }
                }
                if (r.LIVRE().equals("OUI")) {
                    r.ETAT("TERMINÉ");
                } else {
                    r.ETAT("ACTIF");
                }
                new D_Reservation().update(r);
            }
        }

        res = new D_Reservation().get();
        request.setAttribute("reservation", res);
        Lang.removeVehicleSession(request);
        request.setAttribute("position", this.getClass().getName().substring(25).toLowerCase().replace("controller", ""));
        return mv;
    }
}
