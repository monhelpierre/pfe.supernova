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
import supernova.pfe.model.Vehicule;
import supernova.pfe.tool.Db_access;
import supernova.pfe.tool.MyDate;

/**
 *
 * @author GIRLS
 */
public class D_Vehicule {
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    public int insert(Vehicule v) {
        int i = 0;
        try {
            ps = Db_access.con.prepareStatement("INSERT INTO `vehicule`(`ID`, `FOURNISSEUR`, `TYPE`, `COULEUR`, `MARQUE`, "
                    + "`MODEL`, `ANNEE`, `TRANSMISSION`, `NUMMOTEUR`, "
                    + "`NUMPLAQUE`, `TYPEMOTEUR`, `PRIXPARJOUR`, `ETAT`, `IMAGE`, `USERCREATED`, `DATECREATED`) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            
            ps.setInt(1, Integer.parseInt(v.ID()));
            ps.setString(2, v.FOURNISSEUR());
            ps.setString(3, v.TYPE());
            ps.setString(4, v.COULEUR());
            ps.setString(5, v.MARQUE());
            ps.setString(6, v.MODEL());
            ps.setString(7, v.ANNEE());
            ps.setString(8, v.TRANSMISSION());
            ps.setString(9, v.NUMMOTEUR());
            ps.setString(10, v.NUMPLAQUE());
            ps.setString(11, v.TYPEMOTEUR());
            ps.setString(12, v.PRIXPARJOUR());
            ps.setString(13, v.ETAT());
            ps.setString(14, v.IMAGE());
            ps.setString(15, v.USERCREATED());
            ps.setString(16, MyDate.current_fr());
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public int update(Vehicule v) throws NoSuchAlgorithmException {
        int i = 0;
        try {
            ps = Db_access.con.prepareStatement("UPDATE vehicule SET FOURNISSEUR=?, TYPE=?, COULEUR=?, "
                    + "MARQUE=?, MODEL=?, ANNEE=?, TRANSMISSION=?, NUMMOTEUR=?, NUMPLAQUE=?, TYPEMOTEUR=?, "
                    + "PRIXPARJOUR=?, ETAT=?, IMAGE=?, USERUPDATED=?, DATEUPDATED=? WHERE ID=?");
            ps.setString(1, v.FOURNISSEUR());
            ps.setString(2, v.TYPE());
            ps.setString(3, v.COULEUR());
            ps.setString(4, v.MARQUE());
            ps.setString(5, v.MODEL());
            ps.setString(6, v.ANNEE());
            ps.setString(7, v.TRANSMISSION());
            ps.setString(8, v.NUMMOTEUR());
            ps.setString(9, v.NUMPLAQUE());
            ps.setString(10, v.TYPEMOTEUR());
            ps.setString(11, v.PRIXPARJOUR());
            ps.setString(12, v.ETAT());
            ps.setString(13, v.IMAGE());
            ps.setString(14, v.USERUPDATED());
            ps.setString(15, MyDate.current_fr());
            ps.setInt(16, Integer.parseInt(v.ID()));
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public int delete(int id) {
        int i = 0;
        try {
            ps = Db_access.con.prepareStatement("DELETE FROM `vehicule` WHERE ID = ?");
            ps.setInt(1, id);
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public Vehicule get(int id){
        Vehicule data = null;
        
        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM `vehicule` WHERE ID = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                data = new Vehicule(
                        rs.getString("ID"), rs.getString("FOURNISSEUR"),
                        rs.getString("TYPE"),rs.getString("COULEUR"),rs.getString("MARQUE"),
                        rs.getString("MODEL"),rs.getString("ANNEE"),
                        rs.getString("TRANSMISSION"),rs.getString("NUMMOTEUR"),
                        rs.getString("NUMPLAQUE"),rs.getString("TYPEMOTEUR"),
                        rs.getString("PRIXPARJOUR"),rs.getString("ETAT"),
                        rs.getString("IMAGE")
                );
                data.DATEUPDATED(rs.getString("DATEUPDATED"));
                data.DATECREATED(rs.getString("DATECREATED"));
                data.USERCREATED(rs.getString("USERCREATED"));
                data.USERUPDATED(rs.getString("USERUPDATED"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }
    
    public int getWhereState(String etat){
        int count = 0;
        
        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM `vehicule` WHERE ETAT = ?");
            ps.setString(1, etat);
            rs = ps.executeQuery();
            while (rs.next()) {
                count++;
            }
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
    
    public ArrayList<Vehicule> get(){
        ArrayList<Vehicule> data = new ArrayList<>();
        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM `vehicule` ORDER BY DATECREATED DESC");
            rs = ps.executeQuery();
            while (rs.next()) {
                Vehicule tmp = new Vehicule(
                         rs.getString("ID"), rs.getString("FOURNISSEUR"),
                        rs.getString("TYPE"),rs.getString("COULEUR"),rs.getString("MARQUE"),
                        rs.getString("MODEL"),rs.getString("ANNEE"),
                        rs.getString("TRANSMISSION"),rs.getString("NUMMOTEUR"),
                        rs.getString("NUMPLAQUE"),rs.getString("TYPEMOTEUR"),
                        rs.getString("PRIXPARJOUR"),rs.getString("ETAT"),
                        rs.getString("IMAGE")
                );
                tmp.DATEUPDATED(rs.getString("DATEUPDATED"));
                tmp.DATECREATED(rs.getString("DATECREATED"));
                tmp.USERCREATED(rs.getString("USERCREATED"));
                tmp.USERUPDATED(rs.getString("USERUPDATED"));
                data.add(tmp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }
    
    public ArrayList<Vehicule> get(String limit, int nbbypage, int active_page, int total_pages){
        ArrayList<Vehicule> data = new ArrayList<>();
        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM `vehicule` ORDER BY DATECREATED DESC");
            if(limit != null){
                ps = Db_access.con.prepareStatement("SELECT * FROM `vehicule` ORDER BY DATECREATED DESC LIMIT ?, ?");
                ps.setInt(1, (active_page-1)*nbbypage);
                ps.setInt(2, nbbypage);
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                Vehicule tmp = new Vehicule(
                         rs.getString("ID"), rs.getString("FOURNISSEUR"),
                        rs.getString("TYPE"),rs.getString("COULEUR"),rs.getString("MARQUE"),
                        rs.getString("MODEL"),rs.getString("ANNEE"),
                        rs.getString("TRANSMISSION"),rs.getString("NUMMOTEUR"),
                        rs.getString("NUMPLAQUE"),rs.getString("TYPEMOTEUR"),
                        rs.getString("PRIXPARJOUR"),rs.getString("ETAT"),
                        rs.getString("IMAGE")
                );
                tmp.DATEUPDATED(rs.getString("DATEUPDATED"));
                tmp.DATECREATED(rs.getString("DATECREATED"));
                tmp.USERCREATED(rs.getString("USERCREATED"));
                tmp.USERUPDATED(rs.getString("USERUPDATED"));
                data.add(tmp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }
}
