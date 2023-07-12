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
public class Theme {
    private String ID;
    private String LOGO;
    private String USERCREATED;
    private String DATECREATED;
    private String USERUPDATE;
    private String DATEUPDATE;

    public Theme(String ID, String LOGO, String USERUPDATE, String DATEUPDATE) {
        this.ID = ID;
        this.LOGO = LOGO;
        this.USERUPDATE = USERUPDATE;
        this.DATEUPDATE = DATEUPDATE;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getLOGO() {
        return LOGO;
    }

    public void setLOGO(String LOGO) {
        this.LOGO = LOGO;
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

    public String getUSERUPDATE() {
        return USERUPDATE;
    }

    public void setUSERUPDATE(String USERUPDATE) {
        this.USERUPDATE = USERUPDATE;
    }

    public String getDATEUPDATE() {
        return DATEUPDATE;
    }

    public void setDATEUPDATE(String DATEUPDATE) {
        this.DATEUPDATE = DATEUPDATE;
    }
}


