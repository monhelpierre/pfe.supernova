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
public class Fournisseur {
    private String ID;
    private String NOMENTREPRISE;
    private String SIEGESOCIAL;
    private String TELEPHONE;
    private String EMAIL;
    private String ADRESSE;    
    private String REPRESENTANT;    
    private String NUMEROPASSPORT;    
    private String CIN;    
    private String PATENTE;    
    private String SITEWEB;
    private String USERCREATED;
    private String DATECREATED;
    private String USERUPDATED;
    private String DATEUPDATED;

    public Fournisseur(String ID, String NOMENTREPRISE, String SIEGESOCIAL, String TELEPHONE, String EMAIL, String ADRESSE, String REPRESENTANT, String NUMEROPASSPORT, String CIN, String PATENTE, String SITEWEB) {
        this.ID = ID;
        this.NOMENTREPRISE = NOMENTREPRISE;
        this.SIEGESOCIAL = SIEGESOCIAL;
        this.TELEPHONE = TELEPHONE;
        this.EMAIL = EMAIL;
        this.ADRESSE = ADRESSE;
        this.REPRESENTANT = REPRESENTANT;
        this.NUMEROPASSPORT = NUMEROPASSPORT;
        this.CIN = CIN;
        this.PATENTE = PATENTE;
        this.SITEWEB = SITEWEB;
    }

    public String ID() {
        return ID;
    }

    public void ID(String ID) {
        this.ID = ID;
    }

    public String NOMENTREPRISE() {
        return NOMENTREPRISE;
    }

    public void NOMENTREPRISE(String NOMENTREPRISE) {
        this.NOMENTREPRISE = NOMENTREPRISE;
    }

    public String SIEGESOCIAL() {
        return SIEGESOCIAL;
    }

    public void SIEGESOCIAL(String SIEGESOCIAL) {
        this.SIEGESOCIAL = SIEGESOCIAL;
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

    public String ADRESSE() {
        return ADRESSE;
    }

    public void ADRESSE(String ADRESSE) {
        this.ADRESSE = ADRESSE;
    }

    public String REPRESENTANT() {
        return REPRESENTANT;
    }

    public void REPRESENTANT(String REPRESENTANT) {
        this.REPRESENTANT = REPRESENTANT;
    }

    public String NUMEROPASSPORT() {
        return NUMEROPASSPORT;
    }

    public void NUMEROPASSPORT(String NUMEROPASSPORT) {
        this.NUMEROPASSPORT = NUMEROPASSPORT;
    }

    public String CIN() {
        return CIN;
    }

    public void CIN(String CIN) {
        this.CIN = CIN;
    }

    public String PATENTE() {
        return PATENTE;
    }

    public void PATENTE(String PATENTE) {
        this.PATENTE = PATENTE;
    }

    public String SITEWEB() {
        return SITEWEB;
    }

    public void SITEWEB(String SITEWEB) {
        this.SITEWEB = SITEWEB;
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
