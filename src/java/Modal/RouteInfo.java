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
public class RouteInfo {
    
    @Id
    @GeneratedValue
    int id;
    
    String routename;
    
    String vrnumber;
    
    String busno;
    
    String dname;
    
    String dcontact;
    
    int capacity;
    
    String spoint;
    
    String tcost;
    
    public RouteInfo(){}

    public String getRoutename() {
        return routename;
    }

    public void setRoutename(String routename) {
        this.routename = routename;
    }

    public String getVrnumber() {
        return vrnumber;
    }

    public void setVrnumber(String vrnumber) {
        this.vrnumber = vrnumber;
    }

    public String getBusno() {
        return busno;
    }

    public void setBusno(String busno) {
        this.busno = busno;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public String getDcontact() {
        return dcontact;
    }

    public void setDcontact(String dcontact) {
        this.dcontact = dcontact;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public String getSpoint() {
        return spoint;
    }

    public void setSpoint(String spoint) {
        this.spoint = spoint;
    }

    public String getTcost() {
        return tcost;
    }

    public void setTcost(String tcost) {
        this.tcost = tcost;
    }
    
    @Override
    public boolean equals(Object original)
    {
        boolean flag = false;
        RouteInfo ob = (RouteInfo) original;
        
        if(this.routename == ob.getRoutename())
        {
            return true;
        }
        
        return flag;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 97 * hash + Objects.hashCode(this.routename);
        hash = 97 * hash + Objects.hashCode(this.vrnumber);
        hash = 97 * hash + Objects.hashCode(this.busno);
        hash = 97 * hash + Objects.hashCode(this.dname);
        hash = 97 * hash + Objects.hashCode(this.dcontact);
        hash = 97 * hash + this.capacity;
        hash = 97 * hash + Objects.hashCode(this.spoint);
        hash = 97 * hash + Objects.hashCode(this.tcost);
        return hash;
    }
    
    
}
