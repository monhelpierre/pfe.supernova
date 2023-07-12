/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package supernova.pfe.tool;

import supernova.pfe.dao.D_Auth;

/**
 *
 * @author GIRLS
 */
public class MyID {
    public static int len = 6;
    public static int min = 0;
    public static int max = 9;

    public static String generate() {
        String tmp = "";
        for (int i = 0; i < MyID.len; i++) {
            tmp += "" + ((int) (Math.random() * ((MyID.max - MyID.min) + 1)) + MyID.min);
        }
        return tmp;
    }

    public static String create(String table) {
        String val = null;
        do {
            val = MyID.generate();
        } while (new D_Auth().isNotUniqueCode(table, val));
        return val;
    }
    
    public static String createFromTwo(String table1, String table2) {
        String val = null;
        do {
            val = MyID.generate();
        } while (new D_Auth().isNotUniqueCode(table1, val) || new D_Auth().isNotUniqueCode(table2, val));
        return val;
    }
}
