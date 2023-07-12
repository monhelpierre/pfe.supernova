/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package supernova.pfe.tool;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Beaute
 */
public class Db_access {
    private static String hostname;
    private static int port = 3306;
    private static String db;
    private static String username;
    private static String password;
    public static Connection con = null;
    public static String error_message = null;
    
    public static Connection connect(){
        System.setProperty("file.encoding","UTF-8");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Db_access.con = DriverManager.getConnection("jdbc:mysql://"+hostname+":"+port+"/"+db, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            Db_access.error_message = ex.getMessage();
            Logger.getLogger(Db_access.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Db_access.con;
    }
    
    public static void setCredentials(String hostname, int port, String db, String username, String password){
        Db_access.hostname = hostname;
        Db_access.port = port;
        Db_access.db = db;
        Db_access.username = username;
        Db_access.password = password;
    }
    
    public static boolean isNotYetConfigured(){
        boolean status = true;
        if(Db_access.hostname != null && Db_access.username != null && Db_access.password != null){
            status = false;
        }
        return status;
    }
}
