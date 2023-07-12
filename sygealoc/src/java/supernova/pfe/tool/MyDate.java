/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package supernova.pfe.tool;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author GIRLS
 */
public class MyDate {
    private static LocalDateTime ldt;
    private static DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    
    public static String now(){
        ldt = LocalDateTime.now();
        return ldt.format(dtf);
    }
    
    public static String current_spec(String format){
        ldt = LocalDateTime.now();
        DateTimeFormatter edtf = DateTimeFormatter.ofPattern(format);
        return ldt.format(edtf);
    }
    
    public static String current_fr(){
        ldt = LocalDateTime.now();
        DateTimeFormatter edtf = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        return ldt.format(edtf);
    }
}
