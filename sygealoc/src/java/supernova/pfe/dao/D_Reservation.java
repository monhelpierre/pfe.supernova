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
import supernova.pfe.model.Reservation;
import supernova.pfe.tool.Db_access;
import supernova.pfe.tool.MyDate;

/**
 *
 * @author GIRLS
 */
public class D_Reservation {

    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public int insert(Reservation v) {
        int i = 0;
        try {
            ps = Db_access.con.prepareStatement("INSERT INTO `reservation`(`ID`, `CLIENT`, `VEHICULE`, `DATEDEBUT`, "
                    + "`NBJOUR`, `VERSEMENT`, `BALANCE`, `LIVRE`, `ETAT`, `USERCREATED`, "
                    + "`DATECREATED`) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setInt(1, v.ID() == null || v.ID().isEmpty() ? 0 : Integer.parseInt(v.ID()));
            ps.setString(2, v.CLIENT());
            ps.setString(3, v.VEHICULE());
            ps.setString(4, v.DATEDEBUT());
            ps.setString(5, v.NBJOUR());
            ps.setString(6, v.VERSEMENT());
            ps.setString(7, v.BALANCE());
            ps.setString(8, v.LIVRE());
            ps.setString(9, v.ETAT());
            ps.setString(10, v.USERCREATED());
            ps.setString(11, MyDate.current_fr());
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public int update(Reservation v) throws NoSuchAlgorithmException {
        int i = 0;
        try {
            ps = Db_access.con.prepareStatement("UPDATE  `reservation` SET "
                    + "`CLIENT`=?, "
                    + "`VEHICULE`=?, "
                    + "`NBJOUR`=?, "
                    + "`DATEDEBUT`=?, "
                    + "`VERSEMENT`=?, "
                    + "`BALANCE`=?, "
                    + "`ETAT`=?, "
                    + "`USERUPDATED` = ?, "
                    + "`DATEUPDATED` = ?, "
                    + "`LIVRE`=? "
                    + "WHERE `ID` = ?");
            
            ps.setString(1, v.CLIENT());
            ps.setString(2, v.VEHICULE());
            ps.setString(3, v.NBJOUR());
            ps.setString(4, v.DATEDEBUT());
            ps.setString(5, v.VERSEMENT());
            ps.setString(6, v.BALANCE());
            ps.setString(7, v.ETAT());
            ps.setString(8, v.USERUPDATED());
            ps.setString(9, MyDate.current_fr());
            ps.setString(10, v.LIVRE());
            ps.setInt(11, v.ID() == null || v.ID().isEmpty() ? 0 : Integer.parseInt(v.ID()));
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public int delete(int id) {
        int i = 0;
        try {
            ps = Db_access.con.prepareStatement("DELETE FROM  `reservation` WHERE ID = ?");
            ps.setInt(1, id);
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public Reservation get(int id) {
        Reservation data = null;

        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM `reservation` WHERE ID = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                data = new Reservation(
                        rs.getString("ID"), rs.getString("CLIENT"),
                        rs.getString("VEHICULE"), rs.getString("DATEDEBUT"), rs.getString("NBJOUR"),
                        rs.getString("VERSEMENT"), rs.getString("BALANCE"), rs.getString("ETAT")
                );
                data.LIVRE(rs.getString("LIVRE"));
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

    public Reservation getForClient(int id) {
        Reservation data = null;

        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM `reservation` WHERE CLIENT = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                data = new Reservation(
                        rs.getString("ID"), rs.getString("CLIENT"),
                        rs.getString("VEHICULE"), rs.getString("DATEDEBUT"), rs.getString("NBJOUR"),
                        rs.getString("VERSEMENT"), rs.getString("BALANCE"), rs.getString("ETAT")
                );
                data.LIVRE(rs.getString("LIVRE"));
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

    public Reservation getForVehicle(int id) {
        Reservation data = null;

        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM `reservation` WHERE VEHICULE = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                data = new Reservation(
                        rs.getString("ID"), rs.getString("CLIENT"),
                        rs.getString("VEHICULE"), rs.getString("DATEDEBUT"), rs.getString("NBJOUR"),
                        rs.getString("VERSEMENT"), rs.getString("BALANCE"), rs.getString("ETAT")
                );
                data.LIVRE(rs.getString("LIVRE"));
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

    public ArrayList<Reservation> get() {
        ArrayList<Reservation> data = new ArrayList<>();
        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM `reservation`");
            rs = ps.executeQuery();
            while (rs.next()) {
                Reservation tmp = new Reservation(
                        rs.getString("ID"), rs.getString("CLIENT"),
                        rs.getString("VEHICULE"), rs.getString("DATEDEBUT"), rs.getString("NBJOUR"),
                        rs.getString("VERSEMENT"), rs.getString("BALANCE"), rs.getString("ETAT")
                );
                tmp.LIVRE(rs.getString("LIVRE"));
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
