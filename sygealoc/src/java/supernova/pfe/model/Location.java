/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package supernova.pfe.model;

/**
 *
 * @author Beaute
 */
public class Location {
    private String ID;
    private String CLIENT;
    private String VEHICULE;
    private String DATEDEBUT;
    private String HEUREDEBUT;
    private String NBJOUR;
    private String VEHICULERETOURNE;
    private String DETTE;
    private String ETAT;
    private String USERCREATED;
    private String DATECREATED;
    private String USERUPDATED;
    private String DATEUPDATED;
    private String COMMENTAIRE;

    public Location(String ID, String CLIENT, String VEHICULE, String DATEDEBUT, String HEUREDEBUT, String NBJOUR, String VEHICULERETOURNE, String DETTE, String ETAT) {
        this.ID = ID;
        this.CLIENT = CLIENT;
        this.VEHICULE = VEHICULE;
        this.DATEDEBUT = DATEDEBUT;
        this.HEUREDEBUT = HEUREDEBUT;
        this.NBJOUR = NBJOUR;
        this.VEHICULERETOURNE = VEHICULERETOURNE;
        this.DETTE = DETTE;
        this.ETAT = ETAT;
    }

    public String ID() {
        return ID;
    }

    public void ID(String ID) {
        this.ID = ID;
    }

    public String CLIENT() {
        return CLIENT;
    }

    public void CLIENT(String CLIENT) {
        this.CLIENT = CLIENT;
    }

    public String VEHICULE() {
        return VEHICULE;
    }

    public void VEHICULE(String VEHICULE) {
        this.VEHICULE = VEHICULE;
    }

    public String DATEDEBUT() {
        return DATEDEBUT;
    }

    public void DATEDEBUT(String DATEDEBUT) {
        this.DATEDEBUT = DATEDEBUT;
    }
    
    public String HEUREDEBUT() {
        return HEUREDEBUT;
    }

    public void HEUREDEBUT(String HEUREDEBUT) {
        this.DATEDEBUT = HEUREDEBUT;
    }

    public String NBJOUR() {
        return NBJOUR;
    }

    public void NBJOUR(String NBJOUR) {
        this.NBJOUR = NBJOUR;
    }

    public String VEHICULERETOURNE() {
        return VEHICULERETOURNE;
    }

    public void VEHICULERETOURNE(String VEHICULERETOURNE) {
        this.VEHICULERETOURNE = VEHICULERETOURNE;
    }

    public String DETTE() {
        return DETTE;
    }

    public void DETTE(String DETTE) {
        this.DETTE = DETTE;
    }

    public String ETAT() {
        return ETAT;
    }

    public void ETAT(String ETAT) {
        this.ETAT = ETAT;
    }

    public String USERCREATED() {
        return USERCREATED;
    }

    public void USERCREATED(String USERCREATED) {
        this.USERCREATED = USERCREATED;
    }

    public String DATECREATED() {
        return DATECREATED;
    }

    public void DATECREATED(String DATECREATED) {
        this.DATECREATED = DATECREATED;
    }

    public String USERUPDATED() {
        return USERUPDATED;
    }

    public void USERUPDATED(String USERUPDATED) {
        this.USERUPDATED = USERUPDATED;
    }

    public String DATEUPDATED() {
        return DATEUPDATED;
    }

    public void DATEUPDATED(String DATEUPDATED) {
        this.DATEUPDATED = DATEUPDATED;
    }
    
    public String COMMENTAIRE() {
        return COMMENTAIRE;
    }

    public void COMMENTAIRE(String COMMENTAIRE) {
        this.COMMENTAIRE = COMMENTAIRE;
    }
}
