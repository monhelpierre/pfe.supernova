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
public class CompanySetting {
    
    private String ID;
    private String COMPANYNAME;
    private String CONTACTPERSON;
    private String ADDRESS;
    private String COUNTRY;
    private String CITY;
    private String STATE;
    private String POSTALCODE;
    private String EMAIL;
    private String PHONENUMBER;
    private String MOBILENUMBER;
    private String FAX;
    private String WEBSITEURL;
    private String USERCREATED;
    private String DATECREATED;
    private String USERUPDATED;
    private String DATEUPDATED;

    public CompanySetting(String ID, String COMPANYNAME, 
            String CONTACTPERSON, String ADDRESS, String COUNTRY, 
            String CITY, String STATE, String POSTALCODE, String EMAIL, 
            String PHONENUMBER, String MOBILENUMBER, String FAX, String WEBSITEURL, 
            String USERUPDATED, String DATEUPDATED) {
        this.ID = ID;
        this.COMPANYNAME = COMPANYNAME;
        this.CONTACTPERSON = CONTACTPERSON;
        this.ADDRESS = ADDRESS;
        this.COUNTRY = COUNTRY;
        this.CITY = CITY;
        this.STATE = STATE;
        this.POSTALCODE = POSTALCODE;
        this.EMAIL = EMAIL;
        this.PHONENUMBER = PHONENUMBER;
        this.MOBILENUMBER = MOBILENUMBER;
        this.FAX = FAX;
        this.WEBSITEURL = WEBSITEURL;
        this.USERUPDATED = USERUPDATED;
        this.DATEUPDATED = DATEUPDATED;
    }  

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getCOMPANYNAME() {
        return COMPANYNAME;
    }

    public void setCOMPANYNAME(String COMPANYNAME) {
        this.COMPANYNAME = COMPANYNAME;
    }

    public String getCONTACTPERSON() {
        return CONTACTPERSON;
    }

    public void setCONTACTPERSON(String CONTACTPERSON) {
        this.CONTACTPERSON = CONTACTPERSON;
    }

    public String getADDRESS() {
        return ADDRESS;
    }

    public void setADDRESS(String ADDRESS) {
        this.ADDRESS = ADDRESS;
    }

    public String getCOUNTRY() {
        return COUNTRY;
    }

    public void setCOUNTRY(String COUNTRY) {
        this.COUNTRY = COUNTRY;
    }

    public String getCITY() {
        return CITY;
    }

    public void setCITY(String CITY) {
        this.CITY = CITY;
    }

    public String getSTATE() {
        return STATE;
    }

    public void setSTATE(String STATE) {
        this.STATE = STATE;
    }

    public String getPOSTALCODE() {
        return POSTALCODE;
    }

    public void setPOSTALCODE(String POSTALCODE) {
        this.POSTALCODE = POSTALCODE;
    }

    public String getEMAIL() {
        return EMAIL;
    }

    public void setEMAIL(String EMAIL) {
        this.EMAIL = EMAIL;
    }

    public String getPHONENUMBER() {
        return PHONENUMBER;
    }

    public void setPHONENUMBER(String PHONENUMBER) {
        this.PHONENUMBER = PHONENUMBER;
    }

    public String getMOBILENUMBER() {
        return MOBILENUMBER;
    }

    public void setMOBILENUMBER(String MOBILENUMBER) {
        this.MOBILENUMBER = MOBILENUMBER;
    }

    public String getFAX() {
        return FAX;
    }

    public void setFAX(String FAX) {
        this.FAX = FAX;
    }

    public String getWEBSITEURL() {
        return WEBSITEURL;
    }

    public void setWEBSITEURL(String WEBSITEURL) {
        this.WEBSITEURL = WEBSITEURL;
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
