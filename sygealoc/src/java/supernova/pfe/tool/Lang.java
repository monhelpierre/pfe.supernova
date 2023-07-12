/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package supernova.pfe.tool;

import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author GIRLS
 */
public class Lang {

    private static final HashMap<String, String> field = new HashMap<>();

    public static String get(String key) {
        String traduction = key;
        field.put("FOURNISSEUR", "fournisseur");
        field.put("TYPE", "type");
        field.put("COULEUR", "couleur");
        field.put("MARQUE", "marque");
        field.put("MODEL", "model");
        field.put("ANNEE", "annee");
        field.put("TRANSMISSION", "transmission");
        field.put("NUMMOTEUR", "numero de moteur");
        field.put("NUMPLAQUE", "numero de plaque");
        field.put("TYPEMOTEUR", "type de moteur");
        field.put("PRIXPARJOUR", "prix par jour");
        field.put("ETAT", "etat");
        field.put("IMAGE", "image");
        field.put("CLIENT", "client");
        field.put("VEHICULE", "vehicule");
        field.put("DATEDEBUT", "date de debut");
        field.put("NBJOUR", "nombre de jours");
        field.put("VERSEMENT", "versement");
        field.put("BALANCE", "balance");
        field.put("NOMENTREPRISE", "nom de l'entreprise");
        field.put("SIEGESOCIAL", "siege social");
        field.put("TELEPHONE", "telephone");
        field.put("EMAIL", "email");
        field.put("ADRESSE", "adresse");
        field.put("REPRESENTANT", "representant");
        field.put("NUMEROPASSPORT", "numero de passeport");
        field.put("CIN", "cin");
        field.put("PATENTE", "patente");
        field.put("SITEWEB", "site web");
        field.put("NOMCOMPLET", "nom complet");
        field.put("SEXE", "sexe");
        field.put("DATENAISSANCE", "date de naissance");
        field.put("NIF", "nif");
        field.put("POSTE", "poste");
        field.put("PSEUDO", "pseudo");
        field.put("MOTDEPASSE", "mot de passe");
        field.put("NATIONALITE", "nationalite");
        field.put("PASSEPORT", "passeport");
        field.put("PERMIS", "permis");
        field.put("password", "mot de passe");
        field.put("DATEDEXPIRATION", "date d'expiration");

        if (field.containsKey(key)) {
            traduction = field.get(key);
        }
        field.clear();
        return traduction;
    }

    public static void removeVehicleSession(HttpServletRequest request) {
        request.getSession().removeAttribute("ID");
        request.getSession().removeAttribute("ANNEE");
        request.getSession().removeAttribute("COULEUR");
        request.getSession().removeAttribute("MARQUE");
        request.getSession().removeAttribute("NUMMOTEUR");
        request.getSession().removeAttribute("NUMPLAQUE");
        request.getSession().removeAttribute("PRIXPARJOUR");
        request.getSession().removeAttribute("MODEL");
        request.getSession().removeAttribute("TYPE");
        request.getSession().removeAttribute("FOURNISSEUR");
        request.getSession().removeAttribute("ETAT");
        request.getSession().removeAttribute("TYPEMOTEUR");
        request.getSession().removeAttribute("TRANSMISSION");
    }
}
