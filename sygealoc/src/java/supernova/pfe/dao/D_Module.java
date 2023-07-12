/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package supernova.pfe.dao;

import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import supernova.pfe.model.Module;
import supernova.pfe.tool.Db_access;

/**
 *
 * @author GIRLS
 */
public class D_Module {
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public int insert(Module v) {
        int i = 0;
        try {            
            ps = Db_access.con.prepareStatement("INSERT INTO `module`(`ID`, `NOM`) "
                    + "VALUES (?, ?)");
            ps.setInt(1, v.getID());
            ps.setString(2, v.getNOM());
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public int update(Module v) throws NoSuchAlgorithmException {
        int i = 0;
        try {
            ps = Db_access.con.prepareStatement("UPDATE  `module` SET NOM = ? WHERE ID = ?"); 
            ps.setString(1, v.getNOM());
            ps.setInt(2, v.getID());
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public int delete(int id) {
        int i = 0;
        try {
            ps = Db_access.con.prepareStatement("DELETE FROM  `module` WHERE ID = ?");
            ps.setInt(1, id);
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public Module get(int id){
        Module data = null;
        
        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM `module` WHERE ID = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                data = new Module(rs.getInt("ID"), rs.getString("NOM"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }
    
    public ArrayList<Module> get(){
        ArrayList<Module> data = new ArrayList<>();
        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM `module`");
            rs = ps.executeQuery();
            while (rs.next()) {
                Module tmp = new Module(rs.getInt("ID"), rs.getString("NOM"));
                data.add(tmp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }
}
