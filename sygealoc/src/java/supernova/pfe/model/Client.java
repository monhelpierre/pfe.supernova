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
public class Client {
    private String ID;
    private String TYPE;
    private String NOMCOMPLET;
    private String SEXE;
    private String ADRESSE;
    private String NATIONALITE;
    private String CIN;
    private String PASSEPORT;
    private String TELEPHONE;
    private String EMAIL;
    private String PERMIS;
    private String DATEDEXPIRATION;
    private String PATENTE;
    private String USERCREATED;
    private String DATECREATED;
    private String USERUPDATED;
    private String DATEUPDATED;

    public Client(String ID, String TYPE, String NOMCOMPLET, String SEXE, String ADRESSE, String NATIONALITE, String CIN, String PASSEPORT, String TELEPHONE, String EMAIL, String PERMIS, String DATEDEXPIRATION, String PATENTE) {
        this.ID = ID;
        this.TYPE = TYPE;
        this.NOMCOMPLET = NOMCOMPLET;
        this.SEXE = SEXE;
        this.ADRESSE = ADRESSE;
        this.NATIONALITE = NATIONALITE;
        this.CIN = CIN;
        this.PASSEPORT = PASSEPORT;
        this.TELEPHONE = TELEPHONE;
        this.EMAIL = EMAIL;
        this.PERMIS = PERMIS;
        this.DATEDEXPIRATION = DATEDEXPIRATION;
        this.PATENTE = PATENTE;
    }

    public String ID() {
        return ID;
    }

    public void ID(String ID) {
        this.ID = ID;
    }

    public String TYPE() {
        return TYPE;
    }

    public void TYPE(String TYPE) {
        this.TYPE = TYPE;
    }

    public String NOMCOMPLET() {
        return NOMCOMPLET;
    }

    public void NOMCOMPLET(String NOMCOMPLET) {
        this.NOMCOMPLET = NOMCOMPLET;
    }

    public String SEXE() {
        return SEXE;
    }

    public void SEXE(String SEXE) {
        this.SEXE = SEXE;
    }

    public String ADRESSE() {
        return ADRESSE;
    }

    public void ADRESSE(String ADRESSE) {
        this.ADRESSE = ADRESSE;
    }

    public String NATIONALITE() {
        return NATIONALITE;
    }

    public void NATIONALITE(String NATIONALITE) {
        this.NATIONALITE = NATIONALITE;
    }

    public String CIN() {
        return CIN;
    }

    public void CIN(String CIN) {
        this.CIN = CIN;
    }

    public String PASSEPORT() {
        return PASSEPORT;
    }

    public void PASSEPORT(String PASSEPORT) {
        this.PASSEPORT = PASSEPORT;
    }

    public String TELEPHONE() {
        return TELEPHONE;
    }

    public void TELEPHONE(String TELEPHONE) {
        this.TELEPHONE = TELEPHONE;
    }

    public String EMAIL() {
        return EMAIL;
    }

    public void EMAIL(String EMAIL) {
        this.EMAIL = EMAIL;
    }

    public String PERMIS() {
        return PERMIS;
    }

    public void PERMIS(String PERMIS) {
        this.PERMIS = PERMIS;
    }

    public String DATEDEXPIRATION() {
        return DATEDEXPIRATION;
    }

    public void DATEDEXPIRATION(String DATEDEXPIRATION) {
        this.DATEDEXPIRATION = DATEDEXPIRATION;
    }

    public String PATENTE() {
        return PATENTE;
    }

    public void PATENTE(String PATENTE) {
        this.PATENTE = PATENTE;
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
