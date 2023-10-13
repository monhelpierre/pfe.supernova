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
import supernova.pfe.dao.D_Location;
import supernova.pfe.dao.D_Vehicule;
import supernova.pfe.model.Location;
import supernova.pfe.model.Vehicule;
import supernova.pfe.tool.DateDifference;
import supernova.pfe.tool.Lang;

/**
 *
 * @author GIRLS
 */
public class LocationController extends AbstractController {

    @Override
    protected ModelAndView handleRequestInternal(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addObject("active_menu", this.getClass().getName().substring(25).toLowerCase().replace("controller", ""));

        ArrayList<Location> loc = new D_Location().get();
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        for (Location l : loc) {
            Date datefin = sdf.parse(l.DATEDEBUT());
            datefin.setDate(datefin.getDate() + Integer.parseInt(l.NBJOUR()));
            Vehicule vh = new D_Vehicule().get(Integer.parseInt(l.VEHICULE()));
            double dette = 0;
            if (datefin.getTime() < new Date().getTime()) {
                if (l.VEHICULERETOURNE().equals("NON")) {
                    vh.ETAT("EN RETARD");
                    int nbhourslate = new DateDifference(datefin, new Date()).get() * 24;
                    dette = ((Double.parseDouble(vh.PRIXPARJOUR()) /24) * nbhourslate);
                } else {
                    vh.ETAT("LIBRE");
                }
                l.ETAT("TERMINÉ");
                new D_Vehicule().update(vh);
            } else {
                if (l.VEHICULERETOURNE().equals("NON")) {
                    vh.ETAT("LOUÉ");
                    l.ETAT("ACTIF");
                }
            }
            l.DETTE(dette + "");
            new D_Location().update(l);
        }

        request.setAttribute("location", loc);
        Lang.removeVehicleSession(request);
        request.setAttribute("position", this.getClass().getName().substring(25).toLowerCase().replace("controller", ""));
        return mv;
    }

}
