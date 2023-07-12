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
public class Employe {
    private int ID;
    private String NOMCOMPLET;
    private String SEXE;
    private String DATENAISSANCE;
    private String ADRESSE;
    private String NIF;
    private String POSTE;
    private String TELEPHONE;
    private String EMAIL;
    private String PSEUDO;
    private String MOTDEPASSE;
    private String ETAT;
    private String USERCREATED;
    private String DATECREATED;
    private String USERUPDATED;
    private String DATEUPDATED;

    public Employe(int ID, String NOMCOMPLET, String SEXE, String DATENAISSANCE, String ADRESSE, String NIF, String POSTE, String TELEPHONE, String EMAIL) {
        this.ID = ID;
        this.NOMCOMPLET = NOMCOMPLET;
        this.SEXE = SEXE;
        this.DATENAISSANCE = DATENAISSANCE;
        this.ADRESSE = ADRESSE;
        this.NIF = NIF;
        this.POSTE = POSTE;
        this.TELEPHONE = TELEPHONE;
        this.EMAIL = EMAIL;
    }

    public Employe(int ID, String ETAT, String USERUPDATED) {
        this.ID = ID;
        this.ETAT = ETAT;
        this.USERUPDATED = USERUPDATED;
    }

    public Employe(int ID, String PSEUDO, String MOTDEPASSE, String ETAT) {
        this.ID = ID;
        this.PSEUDO = PSEUDO;
        this.MOTDEPASSE = MOTDEPASSE;
        this.ETAT = ETAT;
    }

    public Employe(String PSEUDO, String MOTDEPASSE) {
        this.PSEUDO = PSEUDO;
        this.MOTDEPASSE = MOTDEPASSE;
    }

    public int ID() {
        return ID;
    }

    public void ID(int ID) {
        this.ID = ID;
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

    public String DATENAISSANCE() {
        return DATENAISSANCE;
    }

    public void DATENAISSANCE(String DATENAISSANCE) {
        this.DATENAISSANCE = DATENAISSANCE;
    }

    public String ADRESSE() {
        return ADRESSE;
    }

    public void ADRESSE(String ADRESSE) {
        this.ADRESSE = ADRESSE;
    }

    public String NIF() {
        return NIF;
    }

    public void NIF(String NIF) {
        this.NIF = NIF;
    }

    public String POSTE() {
        return POSTE;
    }

    public void POSTE(String POSTE) {
        this.POSTE = POSTE;
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

    public String PSEUDO() {
        return PSEUDO;
    }

    public void PSEUDO(String PSEUDO) {
        this.PSEUDO = PSEUDO;
    }

    public String MOTDEPASSE() {
        return MOTDEPASSE;
    }

    public void MOTDEPASSE(String MOTDEPASSE) {
        this.MOTDEPASSE = MOTDEPASSE;
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
