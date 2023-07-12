/*
 * To change this license header; choose License Headers in Project Properties.
 * To change this template file; choose Tools | Templates
 * and open the template in the editor.
 */
package supernova.pfe.model;

/**
 *
 * @author GIRLS
 */
public class Localization {

    private String ID;
    private String DEFAULTCOUNTRY;
    private String DATEFORMAT;
    private String TIMEZONE;
    private String DEFAULTLANGUAGE;
    private String CURRENCYCODE;
    private String CURRENCYSYMBOL;
    private String USERCREATED;
    private String DATECREATED;
    private String USERUPDATED;
    private String DATEUPDATED;

    public Localization(String ID, String DEFAULTCOUNTRY, String DATEFORMAT, String TIMEZONE, String DEFAULTLANGUAGE, String CURRENCYCODE, String CURRENCYSYMBOL, String USERUPDATED, String DATEUPDATED) {
        this.ID = ID;
        this.DEFAULTCOUNTRY = DEFAULTCOUNTRY;
        this.DATEFORMAT = DATEFORMAT;
        this.TIMEZONE = TIMEZONE;
        this.DEFAULTLANGUAGE = DEFAULTLANGUAGE;
        this.CURRENCYCODE = CURRENCYCODE;
        this.CURRENCYSYMBOL = CURRENCYSYMBOL;
        this.USERUPDATED = USERUPDATED;
        this.DATEUPDATED = DATEUPDATED;
    }
    
    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getDEFAULTCOUNTRY() {
        return DEFAULTCOUNTRY;
    }

    public void setDEFAULTCOUNTRY(String DEFAULTCOUNTRY) {
        this.DEFAULTCOUNTRY = DEFAULTCOUNTRY;
    }

    public String getDATEFORMAT() {
        return DATEFORMAT;
    }

    public void setDATEFORMAT(String DATEFORMAT) {
        this.DATEFORMAT = DATEFORMAT;
    }

    public String getTIMEZONE() {
        return TIMEZONE;
    }

    public void setTIMEZONE(String TIMEZONE) {
        this.TIMEZONE = TIMEZONE;
    }

    public String getDEFAULTLANGUAGE() {
        return DEFAULTLANGUAGE;
    }

    public void setDEFAULTLANGUAGE(String DEFAULTLANGUAGE) {
        this.DEFAULTLANGUAGE = DEFAULTLANGUAGE;
    }

    public String getCURRENCYCODE() {
        return CURRENCYCODE;
    }

    public void setCURRENCYCODE(String CURRENCYCODE) {
        this.CURRENCYCODE = CURRENCYCODE;
    }

    public String getCURRENCYSYMBOL() {
        return CURRENCYSYMBOL;
    }

    public void setCURRENCYSYMBOL(String CURRENCYSYMBOL) {
        this.CURRENCYSYMBOL = CURRENCYSYMBOL;
    }

    public String getUSERCREATED() {
        return USERCREATED;
    }

    public void setUSERCREATED(String USERCREATED) {
        this.USERCREATED = USERCREATED;
    }

    public String getDATECREATED() {
        return DATECREATED;
    }

    public void setDATECREATED(String DATECREATED) {
        this.DATECREATED = DATECREATED;
    }

    public String getUSERUPDATED() {
        return USERUPDATED;
    }

    public void setUSERUPDATED(String USERUPDATED) {
        this.USERUPDATED = USERUPDATED;
    }

    public String getDATEUPDATED() {
        return DATEUPDATED;
    }

    public void setDATEUPDATED(String DATEUPDATED) {
        this.DATEUPDATED = DATEUPDATED;
    }
    
    
}
