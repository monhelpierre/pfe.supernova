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
import supernova.pfe.model.Fournisseur;
import supernova.pfe.tool.Db_access;
import supernova.pfe.tool.MyDate;

/**
 *
 * @author GIRLS
 */
public class D_Fournisseur {
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    public int insert(Fournisseur v) {
        int i = 0;
        try {            
            ps = Db_access.con.prepareStatement("INSERT INTO `fournisseur`(`ID`, `NOMENTREPRISE`, "
                    + "`SIEGESOCIAL`, `TELEPHONE`, `EMAIL`, `ADRESSE`, `REPRESENTANT`, "
                    + "`NUMEROPASSPORT`, `CIN`, `PATENTE`, `SITEWEB`, `USERCREATED`, `DATECREATED`) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            
            ps.setInt(1, v.ID()==null||v.ID().isEmpty()?0:Integer.parseInt(v.ID()));
            ps.setString(2, v.NOMENTREPRISE());
            ps.setString(3, v.SIEGESOCIAL());
            ps.setString(4, v.TELEPHONE());
            ps.setString(5, v.EMAIL());
            ps.setString(6, v.ADRESSE());
            ps.setString(7, v.REPRESENTANT());
            ps.setString(8, v.NUMEROPASSPORT());
            ps.setString(9, v.CIN());
            ps.setString(10, v.PATENTE());
            ps.setString(11, v.SITEWEB());
            ps.setString(12, v.USERCREATED());
            ps.setString(13, MyDate.current_fr());
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public int update(Fournisseur v) throws NoSuchAlgorithmException {
        int i = 0;
        try {
            ps = Db_access.con.prepareStatement("UPDATE  `fournisseur` SET `NOMENTREPRISE`=?, "
                    + "`SIEGESOCIAL`=?, `TELEPHONE`=?, `EMAIL`=?, `ADRESSE`=?, `REPRESENTANT`=?, "
                    + "`NUMEROPASSPORT`=?, `CIN`=?, `PATENTE`=?, `SITEWEB`=?, USERUPDATED=?, DATEUPDATED = ? WHERE ID = ?");              
            ps.setString(1, v.NOMENTREPRISE());
            ps.setString(2, v.SIEGESOCIAL());
            ps.setString(3, v.TELEPHONE());
            ps.setString(4, v.EMAIL());
            ps.setString(5, v.ADRESSE());
            ps.setString(6, v.REPRESENTANT());
            ps.setString(7, v.NUMEROPASSPORT());
            ps.setString(8, v.CIN());
            ps.setString(9, v.PATENTE());
            ps.setString(10, v.SITEWEB());
            ps.setString(11, v.USERUPDATED());
            ps.setString(12, MyDate.current_fr());
            ps.setInt(13, Integer.parseInt(v.ID()));
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public int delete(int id) {
        int i = 0;
        try {
            ps = Db_access.con.prepareStatement("DELETE FROM  `fournisseur` WHERE ID = ?");
            ps.setInt(1, id);
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public Fournisseur get(int id){
        Fournisseur data = null;
        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM `fournisseur` WHERE ID = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                data = new Fournisseur(
                        rs.getString("ID"), rs.getString("NOMENTREPRISE"),
                        rs.getString("SIEGESOCIAL"),rs.getString("TELEPHONE"),rs.getString("EMAIL"),
                        rs.getString("ADRESSE"),rs.getString("REPRESENTANT"),
                        rs.getString("NUMEROPASSPORT"),rs.getString("CIN"),
                         rs.getString("PATENTE"),rs.getString("SITEWEB")
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
    
    public ArrayList<Fournisseur> get(){
        ArrayList<Fournisseur> data = new ArrayList<>();
        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM fournisseur");
            rs = ps.executeQuery();
            while (rs.next()) {
                
                Fournisseur tmp  = new Fournisseur(
                        rs.getString("ID"), rs.getString("NOMENTREPRISE"),
                        rs.getString("SIEGESOCIAL"),rs.getString("TELEPHONE"),rs.getString("EMAIL"),
                        rs.getString("ADRESSE"),rs.getString("REPRESENTANT"),
                        rs.getString("NUMEROPASSPORT"),rs.getString("CIN"),
                         rs.getString("PATENTE"),rs.getString("SITEWEB")
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
