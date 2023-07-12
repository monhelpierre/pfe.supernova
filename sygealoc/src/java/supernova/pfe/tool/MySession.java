/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package supernova.pfe.tool;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import supernova.pfe.model.Session;

/**
 *
 * @author monhel.pierre
 */
public class MySession {

    public static ArrayList<Session> session = new ArrayList<Session>();
    public static String filename = "/uploads/session.txt";
    public static String mac;
    public static String pos;
    public static String path;
    public static String ip;
    public static String host;

    public MySession(HttpServletRequest request) {
        try {
            InetAddress adress = InetAddress.getLocalHost();
            MySession.ip = request.getHeader("x-forwarded-for");            
            if (MySession.ip == null || MySession.ip.length() == 0 || "unknown".equalsIgnoreCase(MySession.ip)) {
                MySession.ip = request.getHeader("Proxy-Client-IP");
            }
            if (MySession.ip == null || MySession.ip.length() == 0 || "unknown".equalsIgnoreCase(MySession.ip)) {
                MySession.ip = request.getHeader("WL-Proxy-Client-IP");
            }
            if (MySession.ip == null || MySession.ip.length() == 0 || "unknown".equalsIgnoreCase(MySession.ip)) {
                MySession.ip = request.getHeader("HTTP_CLIENT_IP");
            }
            if (MySession.ip == null || MySession.ip.length() == 0 || "unknown".equalsIgnoreCase(MySession.ip)) {
                MySession.ip = request.getHeader("HTTP_X_FORWARDED_FOR");
            }
            if (MySession.ip == null || MySession.ip.length() == 0 || "unknown".equalsIgnoreCase(MySession.ip)) {
                MySession.ip = request.getRemoteAddr();
            }
            MySession.mac = request.getHeader("User-Agent").replace(" ", "_");
            if (MySession.mac.contains("Mobi")) {
                MySession.host = "mobile";
            } else {
                MySession.host = "desktop";
            }
            MySession.getPosition();
            
        } catch (UnknownHostException ex) {
            Logger.getLogger(MySession.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private static void getPosition() {
        MySession.session.clear();
        try {
            BufferedReader fluxEntree = new BufferedReader(new FileReader(MySession.path + MySession.filename));
            String ligneLue = fluxEntree.readLine();
            while (ligneLue != null) {
                String[] data = ligneLue.split("\t");
                MySession.session.add(new Session(data[0], data[1], data[2], data[3], data[4], data[5]));
                ligneLue = fluxEntree.readLine();
            }
        } catch (IOException ex) {
        }
    }

    public static void setPosition(String username, String lastlocation) {
        MySession.getPosition();
        try {
            boolean newdata = true;
            for (int i = 0; i < session.size(); i++) {
                if (session.get(i).getUSER().equals(username) && session.get(i).getMAC().equals(MySession.mac)) {
                    session.get(i).setLASTLOCATION(lastlocation);
                    session.get(i).setIP(MySession.ip);
                    session.get(i).setHOST(MySession.host);
                    session.get(i).setDATE(MyDate.current_fr().replace(" ", "_"));
                    newdata = false;
                    break;
                }
            }

            if (!new File(MySession.path + MySession.filename).exists()) {
                new File(MySession.path + MySession.filename).createNewFile();
            }

            if (newdata) {
                session.add(new Session(mac, username, lastlocation, MySession.ip, MySession.host, MyDate.current_fr().replace(" ", "_")));
            }
            writeData();
        } catch (IOException ex) {
            Logger.getLogger(MySession.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void delete(String mac, String username) {
        try {
            int POS = -1;
            for (int i = 0; i < session.size(); i++) {
                if (mac != null) {
                    if (session.get(i).getMAC().equals(mac)) {
                        POS = i;
                        break;
                    }
                }
                if (username != null) {
                    if (session.get(i).getUSER().equals(username)) {
                        POS = i;
                        break;
                    }
                }
            }

            if (POS != -1) {
                session.remove(POS);
                writeData();
            }
        } catch (FileNotFoundException | UnsupportedEncodingException ex) {
            Logger.getLogger(MySession.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private static void writeData() throws FileNotFoundException, UnsupportedEncodingException {
        PrintWriter writer;
        writer = new PrintWriter(MySession.path + MySession.filename, "UTF-8");
        session.forEach((s) -> {
            writer.println(s.getMAC() + "\t" + s.getUSER() + "\t" + s.getLASTLOCATION() + "\t" + s.getIP() + "\t" + s.getHOST() + "\t" + s.getDATE());
        });
        writer.close();
    }

    public static String getLastModuleFor(String f_user, String f_mac, String f_host) {
        MySession.getPosition();
        String module = null;
        for (Session s : MySession.session) {
            if (s.getUSER().equals(f_user) && s.getMAC().equals(f_mac) && s.getHOST().equals(f_host)) {
                module = s.getLASTLOCATION();
                break;
            }
        }
        return module;
    }

    public static String getMacFor(String host) {
        MySession.getPosition();
        String h_mac = null;
        for (Session s : MySession.session) {
            if (s.getHOST().equals(host)) {
                h_mac = s.getMAC();
                break;
            }

        }
        return h_mac;
    }

    public static String getModuleFor(String mac) {
        MySession.getPosition();
        String module = null;
        for (Session s : MySession.session) {
            if (s.getMAC().equals(mac)) {
                module = s.getLASTLOCATION();
                break;
            }
        }
        return module;
    }

    public static String getUserFor(String mac) {
        MySession.getPosition();
        String user = null;
        for (Session s : MySession.session) {
            if (s.getMAC().equals(mac)) {
                user = s.getUSER();
                break;
            }
        }
        return user;
    }
}
