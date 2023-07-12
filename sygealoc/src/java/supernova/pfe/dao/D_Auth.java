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
import supernova.pfe.model.CompanySetting;
import supernova.pfe.model.Employe;
import supernova.pfe.model.Theme;
import supernova.pfe.tool.Db_access;
import supernova.pfe.tool.MD5;
import supernova.pfe.tool.MyDate;

/**
 *
 * @author Beaute
 */
public class D_Auth {

    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public int insert(Employe v) {
        int i = 0;
        try {

            ps = Db_access.con.prepareStatement("INSERT INTO `employe`(`ID`, `NOMCOMPLET`, "
                    + "`SEXE`, `DATENAISSANCE`, `ADRESSE`, `NIF`, `POSTE`, "
                    + "`TELEPHONE`, `EMAIL`, `PSEUDO`, `MOTDEPASSE`, `ETAT`, `USERCREATED`, `DATECREATED`) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setInt(1, v.ID());
            ps.setString(2, v.NOMCOMPLET());
            ps.setString(3, v.SEXE());
            ps.setString(4, v.DATENAISSANCE());
            ps.setString(5, v.ADRESSE());
            ps.setString(6, v.NIF());
            ps.setString(7, v.POSTE());
            ps.setString(8, v.TELEPHONE());
            ps.setString(9, v.EMAIL());
            ps.setString(10, v.PSEUDO());
            ps.setString(11, v.MOTDEPASSE());
            ps.setString(12, v.ETAT());
            ps.setString(13, v.USERCREATED());
            ps.setString(14, MyDate.current_fr());
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public int update(Employe v) throws NoSuchAlgorithmException {
        int i = 0;
        try {
            ps = Db_access.con.prepareStatement("UPDATE `employe` SET `NOMCOMPLET` = ? , `SEXE` = ?, `DATENAISSANCE` = ? , `ADRESSE` = ?, `NIF` = ?, `POSTE` = ?, `TELEPHONE` = ?, `EMAIL` = ?, `PSEUDO` = ?, `MOTDEPASSE` = ?, `ETAT` = ?, `USERUPDATED` = ?, `DATEUPDATED` = ? WHERE `ID` = ?");
            ps.setString(1, v.NOMCOMPLET());
            ps.setString(2, v.SEXE());
            ps.setString(3, v.DATENAISSANCE());
            ps.setString(4, v.ADRESSE());
            ps.setString(5, v.NIF());
            ps.setString(6, v.POSTE());
            ps.setString(7, v.TELEPHONE());
            ps.setString(8, v.EMAIL());
            ps.setString(9, v.PSEUDO());
            ps.setString(10, v.MOTDEPASSE());
            ps.setString(11, v.ETAT());
            ps.setString(12, v.USERUPDATED());
            ps.setString(13, MyDate.current_fr());
            ps.setInt(14, v.ID());
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public int updateEmployeForUser(Employe v) throws NoSuchAlgorithmException {
        int i = 0;
        try {
            ps = Db_access.con.prepareStatement("UPDATE  `employe` SET PSEUDO = ?, MOTDEPASSE = ?, ETAT =?, USERUPDATED=?, DATEUPDATED=? WHERE ID = ?");
            ps.setString(1, v.PSEUDO());
            ps.setString(2, v.MOTDEPASSE());
            ps.setString(3, v.ETAT());
            ps.setString(4, v.USERUPDATED());
            ps.setString(5, MyDate.current_fr());
            ps.setInt(6, v.ID());
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public int removeUser(String id) throws NoSuchAlgorithmException {
        int i = 0;
        try {
            ps = Db_access.con.prepareStatement("UPDATE  `employe` SET PSEUDO='', MOTDEPASSE='', ETAT ='' WHERE ID = ?");
            ps.setInt(1, Integer.parseInt(id));
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public int updatePassword(Employe v) throws NoSuchAlgorithmException {
        int i = 0;
        try {
            ps = Db_access.con.prepareStatement("UPDATE  `employe` SET MOTDEPASSE  = ? WHERE ID = ?");
            ps.setString(1, MD5.generate(v.MOTDEPASSE()));
            ps.setInt(2, v.ID());
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public int deleteFrom(String table, int id) {
        int i = 0;
        try {
            ps = Db_access.con.prepareStatement("DELETE FROM `" + table + "` WHERE ID=?");
            ps.setInt(1, id);
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public Employe get(int id) {
        Employe data = null;
        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM `employe` WHERE `ID` = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                data = new Employe(
                        rs.getInt("ID"), rs.getString("NOMCOMPLET"), rs.getString("SEXE"),
                        rs.getString("DATENAISSANCE"), rs.getString("ADRESSE"), rs.getString("NIF"),
                        rs.getString("POSTE"), rs.getString("TELEPHONE"), rs.getString("EMAIL")
                );
                data.PSEUDO(rs.getString("PSEUDO"));
                data.ETAT(rs.getString("ETAT"));
                data.MOTDEPASSE(rs.getString("MOTDEPASSE"));
                data.USERCREATED(rs.getString("USERCREATED"));
                data.USERUPDATED(rs.getString("USERUPDATED"));
                data.DATECREATED(rs.getString("DATECREATED"));
                data.DATEUPDATED(rs.getString("DATEUPDATED"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    public ArrayList<Employe> getUsers() {
        ArrayList<Employe> data = new ArrayList<Employe>();
        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM `employe` WHERE PSEUDO != ''");
            rs = ps.executeQuery();
            while (rs.next()) {
                Employe tmp = new Employe(
                        rs.getInt("ID"), rs.getString("NOMCOMPLET"), rs.getString("SEXE"),
                        rs.getString("DATENAISSANCE"), rs.getString("ADRESSE"), rs.getString("NIF"),
                        rs.getString("POSTE"), rs.getString("TELEPHONE"), rs.getString("EMAIL")
                );
                tmp.PSEUDO(rs.getString("PSEUDO"));
                tmp.ETAT(rs.getString("ETAT"));
                tmp.MOTDEPASSE(rs.getString("MOTDEPASSE"));
                tmp.USERCREATED(rs.getString("USERCREATED"));
                tmp.USERUPDATED(rs.getString("USERUPDATED"));
                tmp.DATECREATED(rs.getString("DATECREATED"));
                tmp.DATEUPDATED(rs.getString("DATEUPDATED"));
                data.add(tmp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    public ArrayList<Employe> getOnlyEmployes() {
        ArrayList<Employe> data = new ArrayList<Employe>();
        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM `employe` WHERE PSEUDO = null OR PSEUDO = ''");
            rs = ps.executeQuery();
            while (rs.next()) {
                Employe tmp = new Employe(
                        rs.getInt("ID"), rs.getString("NOMCOMPLET"), rs.getString("SEXE"),
                        rs.getString("DATENAISSANCE"), rs.getString("ADRESSE"), rs.getString("NIF"),
                        rs.getString("POSTE"), rs.getString("TELEPHONE"), rs.getString("EMAIL")
                );
                tmp.PSEUDO(rs.getString("PSEUDO"));
                tmp.ETAT(rs.getString("ETAT"));
                tmp.USERCREATED(rs.getString("USERCREATED"));
                tmp.USERUPDATED(rs.getString("USERUPDATED"));
                tmp.DATECREATED(rs.getString("DATECREATED"));
                tmp.DATEUPDATED(rs.getString("DATEUPDATED"));
                data.add(tmp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    public Employe get(String username, String password) throws NoSuchAlgorithmException {
        Employe data = null;
        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM employe WHERE PSEUDO = ? AND MOTDEPASSE = ?");
            ps.setString(1, username);
            ps.setString(2, MD5.generate(password));
            rs = ps.executeQuery();
            while (rs.next()) {
                data = new Employe(
                        rs.getInt("ID"), rs.getString("NOMCOMPLET"), rs.getString("SEXE"),
                        rs.getString("DATENAISSANCE"), rs.getString("ADRESSE"), rs.getString("NIF"),
                        rs.getString("POSTE"), rs.getString("TELEPHONE"), rs.getString("EMAIL")
                );
                data.PSEUDO(rs.getString("PSEUDO"));
                data.ETAT(rs.getString("ETAT"));
                data.MOTDEPASSE(rs.getString("MOTDEPASSE"));
                data.USERCREATED(rs.getString("USERCREATED"));
                data.USERUPDATED(rs.getString("USERUPDATED"));
                data.DATECREATED(rs.getString("DATECREATED"));
                data.DATEUPDATED(rs.getString("DATEUPDATED"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    public Employe get(String username) throws NoSuchAlgorithmException {
        Employe data = null;
        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM employe WHERE PSEUDO = ?");
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                data = new Employe(
                        rs.getInt("ID"), rs.getString("NOMCOMPLET"), rs.getString("SEXE"),
                        rs.getString("DATENAISSANCE"), rs.getString("ADRESSE"), rs.getString("NIF"),
                        rs.getString("POSTE"), rs.getString("TELEPHONE"), rs.getString("EMAIL")
                );
                data.PSEUDO(rs.getString("PSEUDO"));
                data.ETAT(rs.getString("ETAT"));
                data.MOTDEPASSE(rs.getString("MOTDEPASSE"));
                data.USERCREATED(rs.getString("USERCREATED"));
                data.USERUPDATED(rs.getString("USERUPDATED"));
                data.DATECREATED(rs.getString("DATECREATED"));
                data.DATEUPDATED(rs.getString("DATEUPDATED"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    public int getTotalFrom(String table) {
        int total = 0;
        try {
            ps = Db_access.con.prepareStatement("SELECT COUNT(*) AS total FROM `" + table + "`");
            rs = ps.executeQuery();
            while (rs.next()) {
                total = rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

    public ArrayList<Employe> get() {
        ArrayList<Employe> data = new ArrayList<>();
        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM employe");
            rs = ps.executeQuery();
            while (rs.next()) {
                Employe dt = new Employe(
                        rs.getInt("ID"), rs.getString("NOMCOMPLET"), rs.getString("SEXE"),
                        rs.getString("DATENAISSANCE"), rs.getString("ADRESSE"), rs.getString("NIF"),
                        rs.getString("POSTE"), rs.getString("TELEPHONE"), rs.getString("EMAIL")
                );
                dt.PSEUDO(rs.getString("PSEUDO"));
                dt.ETAT(rs.getString("ETAT"));
                dt.MOTDEPASSE(rs.getString("MOTDEPASSE"));
                dt.USERCREATED(rs.getString("USERCREATED"));
                dt.USERUPDATED(rs.getString("USERUPDATED"));
                dt.DATECREATED(rs.getString("DATECREATED"));
                dt.DATEUPDATED(rs.getString("DATEUPDATED"));
                data.add(dt);
            }
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    public CompanySetting getCompanySetting() {
        CompanySetting data = null;
        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM company");
            rs = ps.executeQuery();
            while (rs.next()) {
                data = new CompanySetting(
                        rs.getInt("ID") + "", rs.getString("COMPANYNAME"), rs.getString("CONTACTPERSON"),
                        rs.getString("ADDRESS"), rs.getString("COUNTRY"), rs.getString("CITY"),
                        rs.getString("STATE"), rs.getString("POSTALCODE"), rs.getString("EMAIL"),
                        rs.getString("PHONENUMBER"), rs.getString("MOBILENUMBER"), rs.getString("FAX"),
                        rs.getString("WEBSITEURL"),
                        rs.getString("USERUPDATED"), rs.getDate("DATEUPDATED") + ""
                );
                data.setUSERCREATED(rs.getString("USERCREATED"));
                data.setDATECREATED(rs.getDate("DATECREATED") + "");
            }
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    public int updateCompanySetting(CompanySetting v) {
        int i = 0;
        try {
            ps = Db_access.con.prepareStatement("UPDATE  `company` SET COMPANYNAME  = ?, "
                    + "CONTACTPERSON = ?, ADDRESS = ?, COUNTRY = ? , CITY = ? "
                    + ", STATE = ?, POSTALCODE = ?, EMAIL = ?, PHONENUMBER = ?, MOBILENUMBER = ?, FAX = ?"
                    + ", WEBSITEURL = ?, USERUPDATED = ?, DATEUPDATED = ? WHERE 1");
            ps.setString(1, v.getCOMPANYNAME());
            ps.setString(2, v.getCONTACTPERSON());
            ps.setString(3, v.getADDRESS());
            ps.setString(4, v.getCOUNTRY());
            ps.setString(5, v.getCITY());
            ps.setString(6, v.getSTATE());
            ps.setString(7, v.getPOSTALCODE());
            ps.setString(8, v.getEMAIL());
            ps.setString(9, v.getPHONENUMBER());
            ps.setString(10, v.getMOBILENUMBER());
            ps.setString(11, v.getFAX());
            ps.setString(12, v.getWEBSITEURL());
            ps.setString(13, v.getUSERUPDATED());
            ps.setString(14, v.getDATEUPDATED());
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public Theme getTheme() {
        Theme data = null;
        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM theme");
            rs = ps.executeQuery();
            while (rs.next()) {
                data = new Theme(
                        rs.getInt("ID") + "",
                        rs.getString("LOGO"),
                        rs.getString("USERUPDATED"),
                        rs.getDate("DATEUPDATED") + ""
                );
                data.setUSERCREATED(rs.getString("USERCREATED"));
                data.setDATECREATED(rs.getDate("DATECREATED") + "");
            }
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    public int updateTheme(Theme v) {
        int i = 0;
        try {
            ps = Db_access.con.prepareStatement("UPDATE  `theme` SET LOGO = ?, USERUPDATED = ?, DATEUPDATED = ? WHERE 1");
            ps.setString(1, v.getLOGO());
            ps.setString(2, v.getUSERUPDATE());
            ps.setString(3, v.getDATEUPDATE());
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }

    public boolean isNotUnique(String table, String column, String value, String id) {
        boolean data = false;
        try {
            if (id == null || id.isEmpty()) {
                ps = Db_access.con.prepareStatement("SELECT * FROM `" + table + "` WHERE `" + column + "` = ?");
                ps.setString(1, value);
            } else {
                ps = Db_access.con.prepareStatement("SELECT * FROM `" + table + "` WHERE `" + column + "` = ? AND `ID` != ?");
                ps.setString(1, value);
                ps.setInt(2, Integer.parseInt(id));
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                data = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    public boolean isNotUniqueCode(String table, String value) {
        boolean state = false;
        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM `" + table + "` WHERE `ID` = ?");
            ps.setString(1, value);
            rs = ps.executeQuery();
            while (rs.next()) {
                state = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return state;
    }
    
    public boolean isProviderInStock(String id) {
        boolean state = false;
        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM `vehicule` WHERE `FOURNISSEUR` = ?");
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                state = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return state;
    }

    public String nameOf(String table, String column, String id) {
        String name = "";
        try {
            ps = Db_access.con.prepareStatement("SELECT * FROM `" + table + "` WHERE `ID` = ?");
            ps.setInt(1, Integer.parseInt(id));
            rs = ps.executeQuery();
            while (rs.next()) {
                name = rs.getString(column.toUpperCase());
            }
        } catch (SQLException ex) {
            Logger.getLogger(D_Auth.class.getName()).log(Level.SEVERE, null, ex);
        }
        return name;
    }
}
