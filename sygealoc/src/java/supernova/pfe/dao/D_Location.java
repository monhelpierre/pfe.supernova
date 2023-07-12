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
import supernova.pfe.model.Location;
import supernova.pfe.tool.Db_access;
import supernova.pfe.tool.MyDate;

/**
 *
 * @author GIRLS
 */
public class D_Location {
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    public int insert(Location v) {
        int i = 0;
        try {            
            ps = Db_access.con.prepareStatement("INSERT INTO `location`(`ID`, `CLIENT`, `VEHICULE`, `DATEDEBUT`, `HEUREDEBUT`, "
                    + "`NBJOUR`, `VEHICULERETOURNE`, `DETTE`, `ETAT`, `USERCREATED`, "
                    + "`DATECREATED`, `COMMENTAIRE`) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setInt(1, v.ID()==null||v.ID().isEmpty()?0:Integer.parseInt(v.ID()));
            ps.setString(2, v.CLIENT());
            ps.setString(3, v.VEHICULE());
            ps.setString(4, v.DATEDEBUT());
            ps.setString(5, v.HEUREDEBUT());
            ps.setString(6, v.NBJOUR());
            ps.setString(7, v.VEHICULERETOURNE());
            ps.setString(8, v.DETTE());
            ps.setString(9, v.ETAT());
            ps.setString(10, v.USERCREATED());
            ps.setString(11, MyDate.current_fr());
            ps.setString(12, v.COMMENTAIRE());
            
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public int update(Location v) throws NoSuchAlgorithmException {
        int i = 0;
        try {
            ps = Db_access.con.prepareStatement("UPDATE  `location` SET "
                    + "`CLIENT`=?, `VEHICULE`=?, "
                    + "`NBJOUR`=?, `VEHICULERETOURNE`=?, "
                    + "`DETTE`=?, `ETAT`=?, "
                    + "`USERUPDATED` = ?, `DATEUPDATED` = ?, `DATEDEBUT`=?, "
                    + "`HEUREDEBUT`=?, `COMMENTAIRE`=? WHERE ID = ?");                  
            ps.setString(1, v.CLIENT());
            ps.setString(2, v.VEHICULE());
            ps.setString(3, v.NBJOUR());
            ps.setString(4, v.VEHICULERETOURNE());
            ps.setString(5, v.DETTE());
            ps.setString(6, v.ETAT());
            ps.setString(7, v.USERUPDATED());
            ps.setString(8, MyDate.current_fr());
            ps.setString(9, v.DATEDEBUT());
            ps.setString(10, v.HEUREDEBUT());
            ps.setString(11, v.COMMENTAIRE());            
            ps.setInt(12, v.ID()==null||v.ID().isEmpty()?0:Integer.parseInt(v.ID()));
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public int delete(int id) {
        int i = 0;
        try {
            ps = Db_access.con.prepareStatement("DELETE FROM  `location` WHERE ID = ?");
            ps.setInt(1, id);
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public Location get(int id){
        Location data = null;
        
        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM `location` WHERE ID = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                data = new Location(
                        rs.getString("ID"), rs.getString("CLIENT"),
                        rs.getString("VEHICULE"),rs.getString("DATEDEBUT"),rs.getString("HEUREDEBUT"),rs.getString("NBJOUR"),
                        rs.getString("VEHICULERETOURNE"),rs.getString("DETTE"),rs.getString("ETAT")
                );
                data.DATEUPDATED(rs.getString("DATEUPDATED"));
                data.DATECREATED(rs.getString("DATECREATED"));
                data.USERCREATED(rs.getString("USERCREATED"));
                data.USERUPDATED(rs.getString("USERUPDATED"));
                data.COMMENTAIRE(rs.getString("COMMENTAIRE"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }
    
    public Location getForClient(int id){
        Location data = null;
        
        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM `location` WHERE CLIENT = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                data = new Location(
                        rs.getString("ID"), rs.getString("CLIENT"),
                        rs.getString("VEHICULE"),rs.getString("DATEDEBUT"),rs.getString("HEUREDEBUT"),rs.getString("NBJOUR"),
                        rs.getString("VEHICULERETOURNE"),rs.getString("DETTE"),rs.getString("ETAT")
                );
                data.DATEUPDATED(rs.getString("DATEUPDATED"));
                data.DATECREATED(rs.getString("DATECREATED"));
                data.USERCREATED(rs.getString("USERCREATED"));
                data.USERUPDATED(rs.getString("USERUPDATED"));
                data.COMMENTAIRE(rs.getString("COMMENTAIRE"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }
    
    public Location getForVehicle(int id){
        Location data = null;
        
        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM `location` WHERE VEHICULE = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                data = new Location(
                       rs.getString("ID"), rs.getString("CLIENT"),
                        rs.getString("VEHICULE"),rs.getString("DATEDEBUT"),rs.getString("HEUREDEBUT"),rs.getString("NBJOUR"),
                        rs.getString("VEHICULERETOURNE"),rs.getString("DETTE"),rs.getString("ETAT")
                );
                data.DATEUPDATED(rs.getString("DATEUPDATED"));
                data.DATECREATED(rs.getString("DATECREATED"));
                data.USERCREATED(rs.getString("USERCREATED"));
                data.USERUPDATED(rs.getString("USERUPDATED"));
                data.COMMENTAIRE(rs.getString("COMMENTAIRE"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }
    
    public ArrayList<Location> get(){
        ArrayList<Location> data = new ArrayList<>();
        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM `location`");
            rs = ps.executeQuery();
            while (rs.next()) {
                Location tmp = new Location(
                        rs.getString("ID"), rs.getString("CLIENT"),
                        rs.getString("VEHICULE"),rs.getString("DATEDEBUT"),rs.getString("HEUREDEBUT"),rs.getString("NBJOUR"),
                        rs.getString("VEHICULERETOURNE"),rs.getString("DETTE"),rs.getString("ETAT")
                );
                tmp.DATEUPDATED(rs.getString("DATEUPDATED"));
                tmp.DATECREATED(rs.getString("DATECREATED"));
                tmp.USERCREATED(rs.getString("USERCREATED"));
                tmp.USERUPDATED(rs.getString("USERUPDATED"));    
                tmp.COMMENTAIRE(rs.getString("COMMENTAIRE"));
                data.add(tmp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }
}
