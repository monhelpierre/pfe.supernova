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
public class PermissionCategory {
    private int ID;
    private int MODULE;
    private int CAN_VIEW;
    private int CAN_ADD;
    private int CAN_EDIT;
    private int CAN_DELETE;
    private int CAN_PRINT;

    public PermissionCategory(int ID, int MODULE, int CAN_VIEW, int CAN_ADD, int CAN_EDIT, int CAN_DELETE, int CAN_PRINT) {
        this.ID = ID;
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

    public int getMODULE() {
        return MODULE;
    }

    public void setMODULE(int MODULE) {
        this.MODULE = MODULE;
    }

    public int getCAN_VIEW() {
        return CAN_VIEW;
    }

    public void setCAN_VIEW(int CAN_VIEW) {
        this.CAN_VIEW = CAN_VIEW;
    }

    public int getCAN_ADD() {
        return CAN_ADD;
    }

    public void setCAN_ADD(int CAN_ADD) {
        this.CAN_ADD = CAN_ADD;
    }

    public int getCAN_EDIT() {
        return CAN_EDIT;
    }

    public void setCAN_EDIT(int CAN_EDIT) {
        this.CAN_EDIT = CAN_EDIT;
    }

    public int getCAN_DELETE() {
        return CAN_DELETE;
    }

    public void setCAN_DELETE(int CAN_DELETE) {
        this.CAN_DELETE = CAN_DELETE;
    }

    public int getCAN_PRINT() {
        return CAN_PRINT;
    }

    public void setCAN_PRINT(int CAN_PRINT) {
        this.CAN_PRINT = CAN_PRINT;
    }
    
    
}
