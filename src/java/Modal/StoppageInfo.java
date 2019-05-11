/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modal;

import java.util.Objects;
import javax.persistence.*;

/**
 *
 * @author user
 */
@Entity
public class StoppageInfo {
    
    @Id
    @GeneratedValue
    int id;
    
    String rname;
    
    String stoppage;
    
    String time;
    
    public StoppageInfo(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public String getStoppage() {
        return stoppage;
    }

    public void setStoppage(String stoppage) {
        this.stoppage = stoppage;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
    
    @Override
    public boolean equals(Object original)
    {
        StoppageInfo sp = (StoppageInfo)original;
        
        if(this.rname.equals(sp.getRname()) && this.stoppage.equals(sp.getStoppage()) && this.time.equals(sp.getTime()))
        {
            return true;
        }
        else{
            return false;
        }
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 29 * hash + Objects.hashCode(this.rname);
        hash = 29 * hash + Objects.hashCode(this.stoppage);
        hash = 29 * hash + Objects.hashCode(this.time);
        return hash;
    }
    
}
