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
import supernova.pfe.model.UserPermission;
import supernova.pfe.tool.Db_access;

/**
 *
 * @author GIRLS
 */
public class D_UserPermission {

    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public int insert(UserPermission v) {
        int i = 0;
        try {
            ps = Db_access.con.prepareStatement("INSERT INTO `userpermission`(`ID`, `USER`,`MODULE`, "
                    + "`CAN_VIEW`, `CAN_ADD`, `CAN_EDIT`, `CAN_DELETE`, `CAN_PRINT`) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setInt(1, v.getID());
            ps.setInt(2, v.getUSER());
            ps.setInt(3, v.getMODULE());
            ps.setInt(4, v.getCAN_VIEW());
            ps.setInt(5, v.getCAN_ADD());
            ps.setInt(6, v.getCAN_EDIT());
            ps.setInt(7, v.getCAN_DELETE());
            ps.setInt(8, v.getCAN_PRINT());
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public int update(UserPermission v) throws NoSuchAlgorithmException {
        int i = 0;
        try {
            ps = Db_access.con.prepareStatement("UPDATE  `userpermission` SET CAN_VIEW = ?, CAN_ADD = ?, "
                    + "CAN_EDIT = ?, CAN_DELETE = ?, CAN_PRINT = ?, USER = ?, MODULE = ? WHERE ID = ?");
            ps.setInt(1, v.getCAN_VIEW());
            ps.setInt(2, v.getCAN_ADD());
            ps.setInt(3, v.getCAN_EDIT());
            ps.setInt(4, v.getCAN_DELETE());
            ps.setInt(5, v.getCAN_PRINT());
            ps.setInt(6, v.getUSER());
            ps.setInt(7, v.getMODULE());

            ps.setInt(8, v.getID());
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public int delete(int id) {
        int i = 0;
        try {
            ps = Db_access.con.prepareStatement("DELETE FROM  `userpermission` WHERE ID = ?");
            ps.setInt(1, id);
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public UserPermission get(int id) {
        UserPermission data = null;

        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM `userpermission` WHERE ID = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                data = new UserPermission(
                        rs.getInt("ID"), rs.getInt("USER"), rs.getInt("MODULE"),
                        rs.getInt("CAN_VIEW"), rs.getInt("CAN_ADD"), rs.getInt("CAN_EDIT"),
                        rs.getInt("CAN_DELETE"), rs.getInt("CAN_PRINT")
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }
    
    public int has(int user, int module) {
        int data = -1;

        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM `userpermission` WHERE USER = ? AND MODULE = ?");
            ps.setInt(1, user);
            ps.setInt(2, module);
            rs = ps.executeQuery();
            while (rs.next()) {
                data = rs.getInt("ID");
            }
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }
    
    public ArrayList<UserPermission> getPerm(int user) {
        UserPermission tmp = null;
        ArrayList<UserPermission> data= new ArrayList<UserPermission>();

        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM `userpermission` WHERE USER = ?");
            ps.setInt(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                tmp = new UserPermission(
                        rs.getInt("ID"), rs.getInt("USER"), rs.getInt("MODULE"),
                        rs.getInt("CAN_VIEW"), rs.getInt("CAN_ADD"), rs.getInt("CAN_EDIT"),
                        rs.getInt("CAN_DELETE"), rs.getInt("CAN_PRINT")
                );
                data.add(tmp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }
    
    public int get(int user, int module, String perm) {
        int data = 0;

        try {
            ps = Db_access.con.prepareStatement("SELECT "+perm+" FROM `userpermission` WHERE USER = ? AND MODULE = ?");
            ps.setInt(1, user);
            ps.setInt(2, module);
            rs = ps.executeQuery();
            while (rs.next()) {
                data = rs.getInt(""+perm+"");
            }
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }
    

    public ArrayList<UserPermission> get() {
        ArrayList<UserPermission> data = new ArrayList<>();
        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM `userpermission`");
            rs = ps.executeQuery();
            while (rs.next()) {
                UserPermission tmp = new UserPermission(
                        rs.getInt("ID"), rs.getInt("USER"), rs.getInt("MODULE"),
                        rs.getInt("CAN_VIEW"), rs.getInt("CAN_ADD"), rs.getInt("CAN_EDIT"),
                        rs.getInt("CAN_DELETE"), rs.getInt("CAN_PRINT")
                );
                data.add(tmp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }
}
