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
import supernova.pfe.model.Client;
import supernova.pfe.tool.Db_access;
import supernova.pfe.tool.MyDate;

/**
 *
 * @author GIRLS
 */
public class D_Client {
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public int insert(Client v) {
        int i = 0;
        try {
            ps = Db_access.con.prepareStatement("INSERT INTO `client`(`ID`, `TYPE`, "
                    + "`NOMCOMPLET`, `SEXE`, `ADRESSE`, `NATIONALITE`, `CIN`, `PASSEPORT`, `TELEPHONE`, "
                    + "`EMAIL`, `PERMIS`, `DATEDEXPIRATION`, `PATENTE`, `USERCREATED`, `DATECREATED`) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setInt(1, v.ID() == null || v.ID().isEmpty() ? 0 : Integer.parseInt(v.ID()));
            ps.setString(2, v.TYPE());
            ps.setString(3, v.NOMCOMPLET());
            ps.setString(4, v.SEXE());
            ps.setString(5, v.ADRESSE());
            ps.setString(6, v.NATIONALITE());
            ps.setString(7, v.CIN());
            ps.setString(8, v.PASSEPORT());
            ps.setString(9, v.TELEPHONE());
            ps.setString(10, v.EMAIL());
            ps.setString(11, v.PERMIS());
            ps.setString(12, v.DATEDEXPIRATION());
            ps.setString(13, v.PATENTE());
            ps.setString(14, v.USERCREATED());
            ps.setString(15, MyDate.current_fr());
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public int update(Client v) throws NoSuchAlgorithmException {
        int i = 0;
        try {
            ps = Db_access.con.prepareStatement("UPDATE  `client` SET `TYPE`=?, "
                    + "`NOMCOMPLET`=?, `SEXE`=?, `ADRESSE`=?, `NATIONALITE`=?, `CIN`=?, "
                    + "`EMAIL`=?, `PERMIS`=?, `DATEDEXPIRATION`=?, `PATENTE`=?, `USERUPDATED` = ?, `DATEUPDATED` = ?, `PASSEPORT`=?, `TELEPHONE`=? WHERE `ID` = ?");
            ps.setString(1, v.TYPE());
            ps.setString(2, v.NOMCOMPLET());
            ps.setString(3, v.SEXE());
            ps.setString(4, v.ADRESSE());
            ps.setString(5, v.NATIONALITE());
            ps.setString(6, v.CIN());
            ps.setString(7, v.EMAIL());
            ps.setString(8, v.PERMIS());
            ps.setString(9, v.DATEDEXPIRATION());
            ps.setString(10, v.PATENTE());
            ps.setString(11, v.USERUPDATED());
            ps.setString(12, MyDate.current_fr());
            ps.setString(13, v.PASSEPORT());
            ps.setString(14, v.TELEPHONE());
            ps.setInt(15, Integer.parseInt(v.ID()));
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public int delete(int id) {
        int i = 0;
        try {
            ps = Db_access.con.prepareStatement("DELETE FROM  `client` WHERE ID = ?");
            ps.setInt(1, id);
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public Client get(int id) {
        Client data = null;

        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM `client` WHERE ID = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                data = new Client(
                        rs.getString("ID"), rs.getString("TYPE"),
                        rs.getString("NOMCOMPLET"), rs.getString("SEXE"), rs.getString("ADRESSE"),
                        rs.getString("NATIONALITE"), rs.getString("CIN"), rs.getString("PASSEPORT"), rs.getString("TELEPHONE"),
                        rs.getString("EMAIL"), rs.getString("PERMIS"), rs.getString("DATEDEXPIRATION"), rs.getString("PATENTE")
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

    public ArrayList<Client> get() {
        ArrayList<Client> data = new ArrayList<>();
        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM `client`");
            rs = ps.executeQuery();
            while (rs.next()) {
                Client tmp = new Client(
                        rs.getString("ID"), rs.getString("TYPE"),
                        rs.getString("NOMCOMPLET"), rs.getString("SEXE"), rs.getString("ADRESSE"),
                        rs.getString("NATIONALITE"), rs.getString("CIN"), rs.getString("PASSEPORT"), rs.getString("TELEPHONE"),
                        rs.getString("EMAIL"), rs.getString("PERMIS"), rs.getString("DATEDEXPIRATION"), rs.getString("PATENTE")
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
