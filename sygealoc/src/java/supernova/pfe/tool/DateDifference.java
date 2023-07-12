/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package supernova.pfe.tool;

import java.util.Date;

/**
 *
 * @author monhel.pierre
 */
public class DateDifference {
    private final Date d1;
    private final Date d2;
    
    public DateDifference(Date d1, Date d2) {
        this.d1 = d1;
        this.d2 = d2;
    }
    
    public int get(){
        return (int)( (this.d2.getTime() - this.d1.getTime()) / (1000 * 60 * 60 * 24));
    }
}