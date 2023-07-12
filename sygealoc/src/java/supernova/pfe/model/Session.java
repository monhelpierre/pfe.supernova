/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package supernova.pfe.model;

/**
 *
 * @author monhel.pierre
 */
public class Session {

    private String MAC;
    private String USER;
    private String LASTLOCATION;
    private String IP;
    private String HOST;
    private String DATE;

    public Session(String MAC, String USER, String LASTLOCATION, String IP, String HOST, String DATE) {
        this.MAC = MAC;
        this.USER = USER;
        this.LASTLOCATION = LASTLOCATION;
        this.IP = IP;
        this.HOST = HOST;
        this.DATE = DATE;
    }

    public String getMAC() {
        return MAC;
    }

    public void setMAC(String MAC) {
        this.MAC = MAC;
    }

    public String getUSER() {
        return USER;
    }

    public void setUSER(String USER) {
        this.USER = USER;
    }

    public String getLASTLOCATION() {
        return LASTLOCATION;
    }

    public void setLASTLOCATION(String LASTLOCATION) {
        this.LASTLOCATION = LASTLOCATION;
    }

    public String getIP() {
        return IP;
    }

    public void setIP(String IP) {
        this.IP = IP;
    }

    public String getHOST() {
        return HOST;
    }

    public void setHOST(String HOST) {
        this.HOST = HOST;
    }

    public String getDATE() {
        return DATE;
    }

    public void setDATE(String DATE) {
        this.DATE = DATE;
    }
    
    
}
