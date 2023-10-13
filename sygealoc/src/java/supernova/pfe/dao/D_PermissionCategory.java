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
import supernova.pfe.model.PermissionCategory;
import supernova.pfe.tool.Db_access;

/**
 *
 * @author GIRLS
 */
public class D_PermissionCategory {

    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public int insert(PermissionCategory v) {
        int i = 0;
        try {
            ps = Db_access.con.prepareStatement("INSERT INTO `permissioncategory`(`ID`, `MODULE`, "
                    + "`CAN_VIEW`, `CAN_ADD`, `CAN_EDIT`, `CAN_DELETE`, `CAN_PRINT`) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?)");
            ps.setInt(1, v.getID());
            ps.setInt(2, v.getMODULE());
            ps.setString(3, v.getCAN_VIEW());
            ps.setString(4, v.getCAN_ADD());
            ps.setString(5, v.getCAN_EDIT());
            ps.setString(6, v.getCAN_DELETE());
            ps.setString(7, v.getCAN_PRINT());
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public int update(PermissionCategory v) throws NoSuchAlgorithmException {
        int i = 0;
        try {
            ps = Db_access.con.prepareStatement("UPDATE  `permissioncategory` SET MODULE = ?, CAN_VIEW = ?, CAN_ADD = ?, "
                    + "CAN_EDIT = ?, CAN_DELETE = ?, CAN_PRINT = ? WHERE ID = ?");
            ps.setInt(1, v.getMODULE());
            ps.setString(2, v.getCAN_VIEW());
            ps.setString(3, v.getCAN_ADD());
            ps.setString(4, v.getCAN_EDIT());
            ps.setString(5, v.getCAN_DELETE());
            ps.setString(6, v.getCAN_PRINT());
            ps.setInt(7, v.getID());
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public int delete(int id) {
        int i = 0;
        try {
            ps = Db_access.con.prepareStatement("DELETE FROM  `permissioncategory` WHERE ID = ?");
            ps.setInt(1, id);
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public PermissionCategory get(int id) {
        PermissionCategory data = null;

        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM `permissioncategory` WHERE ID = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                data = new PermissionCategory(
                        rs.getInt("ID"), rs.getInt("MODULE"),
                        rs.getString("CAN_VIEW"), rs.getString("CAN_ADD"), rs.getString("CAN_EDIT"),
                        rs.getString("CAN_DELETE"), rs.getString("CAN_PRINT")
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }
    
    public ArrayList<PermissionCategory> getForModule(int id) {
        PermissionCategory tmp = null;
        ArrayList<PermissionCategory> data = new ArrayList<>();

        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM `permissioncategory` WHERE MODULE = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                tmp = new PermissionCategory(
                        rs.getInt("ID"), rs.getInt("MODULE"),
                        rs.getString("CAN_VIEW"), rs.getString("CAN_ADD"), rs.getString("CAN_EDIT"),
                        rs.getString("CAN_DELETE"), rs.getString("CAN_PRINT")
                );
                data.add(tmp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    public ArrayList<PermissionCategory> get() {
        ArrayList<PermissionCategory> data = new ArrayList<>();
        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM `permissioncategory`");
            rs = ps.executeQuery();
            while (rs.next()) {
                PermissionCategory tmp = new PermissionCategory(
                        rs.getInt("ID"), rs.getInt("MODULE"),
                        rs.getString("CAN_VIEW"), rs.getString("CAN_ADD"), rs.getString("CAN_EDIT"),
                        rs.getString("CAN_DELETE"), rs.getString("CAN_PRINT")
                );
                data.add(tmp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }
}
