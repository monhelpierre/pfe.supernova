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
public class Reservation {
    private String ID;
    private String CLIENT;
    private String VEHICULE;
    private String DATEDEBUT;
    private String NBJOUR;
    private String VERSEMENT;
    private String BALANCE;
    private String LIVRE;
    private String ETAT;
    private String USERCREATED;
    private String DATECREATED;
    private String USERUPDATED;
    private String DATEUPDATED;

    public Reservation(String ID, String CLIENT, String VEHICULE, String DATEDEBUT, String NBJOUR, String VERSEMENT, String BALANCE, String ETAT) {
        this.ID = ID;
        this.CLIENT = CLIENT;
        this.VEHICULE = VEHICULE;
        this.DATEDEBUT = DATEDEBUT;
        this.NBJOUR = NBJOUR;
        this.VERSEMENT = VERSEMENT;
        this.BALANCE = BALANCE;
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

    public String NBJOUR() {
        return NBJOUR;
    }

    public void NBJOUR(String NBJOUR) {
        this.NBJOUR = NBJOUR;
    }

    public String VERSEMENT() {
        return VERSEMENT;
    }

    public void VERSEMENT(String VERSEMENT) {
        this.VERSEMENT = VERSEMENT;
    }

    public String BALANCE() {
        return BALANCE;
    }

    public void BALANCE(String BALANCE) {
        this.BALANCE = BALANCE;
    }
    
    public String LIVRE() {
        return LIVRE;
    }

    public void LIVRE(String LIVRE) {
        this.LIVRE = LIVRE;
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
}
