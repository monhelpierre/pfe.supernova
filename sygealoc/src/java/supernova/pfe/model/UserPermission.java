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
public class UserPermission {
  private int ID;
  private int USER;
  private int MODULE;
  private String CAN_VIEW;
  private String CAN_ADD;
  private String CAN_EDIT;
  private String CAN_DELETE;
  private String CAN_PRINT;

    public UserPermission(int ID, int USER, int MODULE, String CAN_VIEW, String CAN_ADD, String CAN_EDIT, String CAN_DELETE, String CAN_PRINT) {
        this.ID = ID;
        this.USER = USER;
        this.MODULE = MODULE;
        this.CAN_VIEW = CAN_VIEW;
        this.CAN_ADD = CAN_ADD;
        this.CAN_EDIT = CAN_EDIT;
        this.CAN_DELETE = CAN_DELETE;
        this.CAN_PRINT = CAN_PRINT;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getUSER() {
        return USER;
    }

    public void setUSER(int USER) {
        this.USER = USER;
    }

    public int getMODULE() {
        return MODULE;
    }

    public void setMODULE(int MODULE) {
        this.MODULE = MODULE;
    }

    public String getCAN_VIEW() {
        return CAN_VIEW;
    }

    public void setCAN_VIEW(String CAN_VIEW) {
        this.CAN_VIEW = CAN_VIEW;
    }

    public String getCAN_ADD() {
        return CAN_ADD;
    }

    public void setCAN_ADD(String CAN_ADD) {
        this.CAN_ADD = CAN_ADD;
    }

    public String getCAN_EDIT() {
        return CAN_EDIT;
    }

    public void setCAN_EDIT(String CAN_EDIT) {
        this.CAN_EDIT = CAN_EDIT;
    }

    public String getCAN_DELETE() {
        return CAN_DELETE;
    }

    public void setCAN_DELETE(String CAN_DELETE) {
        this.CAN_DELETE = CAN_DELETE;
    }

    public String getCAN_PRINT() {
        return CAN_PRINT;
    }

    public void setCAN_PRINT(String CAN_PRINT) {
        this.CAN_PRINT = CAN_PRINT;
    }
}
