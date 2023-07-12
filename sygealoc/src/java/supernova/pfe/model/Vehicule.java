/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package supernova.pfe.model;

/**
 *
 * @author GIRLS
 */
public class Vehicule {

    private String ID;    
    private String FOURNISSEUR;
    private String TYPE;
    private String COULEUR;
    private String MARQUE;
    private String MODEL;
    private String ANNEE;    
    private String TRANSMISSION;
    private String NUMMOTEUR;
    private String NUMPLAQUE;
    private String TYPEMOTEUR;
    private String PRIXPARJOUR;
    private String ETAT;
    private String IMAGE;    
    private String USERCREATED;
    private String DATECREATED;
    private String USERUPDATED;
    private String DATEUPDATED;

    public Vehicule() {
    }    
    
    public Vehicule(String ID, String FOURNISSEUR, String TYPE, String COULEUR, String MARQUE, String MODEL, String ANNEE, String TRANSMISSION, String NUMMOTEUR, String NUMPLAQUE, String TYPEMOTEUR, String PRIXPARJOUR, String ETAT, String IMAGE) {
        this.ID = ID;
        this.FOURNISSEUR = FOURNISSEUR;
        this.TYPE = TYPE;
        this.COULEUR = COULEUR;
        this.MARQUE = MARQUE;
        this.MODEL = MODEL;
        this.ANNEE = ANNEE;
        this.TRANSMISSION = TRANSMISSION;
        this.NUMMOTEUR = NUMMOTEUR;
        this.NUMPLAQUE = NUMPLAQUE;
        this.TYPEMOTEUR = TYPEMOTEUR;
        this.PRIXPARJOUR = PRIXPARJOUR;
        this.ETAT = ETAT;
        this.IMAGE = IMAGE;
    }

    public String ID() {
        return ID;
    }

    public void ID(String ID) {
        this.ID = ID;
    }

    public String FOURNISSEUR() {
        return FOURNISSEUR;
    }

    public void FOURNISSEUR(String FOURNISSEUR) {
        this.FOURNISSEUR = FOURNISSEUR;
    }

    public String TYPE() {
        return TYPE;
    }

    public void TYPE(String TYPE) {
        this.TYPE = TYPE;
    }

    public String COULEUR() {
        return COULEUR;
    }

    public void COULEUR(String COULEUR) {
        this.COULEUR = COULEUR;
    }

    public String MARQUE() {
        return MARQUE;
    }

    public void MARQUE(String MARQUE) {
        this.MARQUE = MARQUE;
    }

    public String MODEL() {
        return MODEL;
    }

    public void MODEL(String MODEL) {
        this.MODEL = MODEL;
    }

    public String ANNEE() {
        return ANNEE;
    }

    public void ANNEE(String ANNEE) {
        this.ANNEE = ANNEE;
    }

    public String TRANSMISSION() {
        return TRANSMISSION;
    }

    public void TRANSMISSION(String TRANSMISSION) {
        this.TRANSMISSION = TRANSMISSION;
    }

    public String NUMMOTEUR() {
        return NUMMOTEUR;
    }

    public void NUMMOTEUR(String NUMMOTEUR) {
        this.NUMMOTEUR = NUMMOTEUR;
    }

    public String NUMPLAQUE() {
        return NUMPLAQUE;
    }

    public void NUMPLAQUE(String NUMPLAQUE) {
        this.NUMPLAQUE = NUMPLAQUE;
    }

    public String TYPEMOTEUR() {
        return TYPEMOTEUR;
    }

    public void TYPEMOTEUR(String TYPEMOTEUR) {
        this.TYPEMOTEUR = TYPEMOTEUR;
    }

    public String PRIXPARJOUR() {
        return PRIXPARJOUR;
    }

    public void PRIXPARJOUR(String PRIXPARJOUR) {
        this.PRIXPARJOUR = PRIXPARJOUR;
    }

    public String ETAT() {
        return ETAT;
    }

    public void ETAT(String ETAT) {
        this.ETAT = ETAT;
    }

    public String IMAGE() {
        return IMAGE;
    }

    public void IMAGE(String IMAGE) {
        this.IMAGE = IMAGE;
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
}
