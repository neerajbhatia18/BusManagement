/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modal;

import java.util.Objects;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 *
 * @author user
 */
@Entity
public class Faculty {
    
    @Id
    @GeneratedValue
    private int id;
    
    private int roll;
    
    private String fname;
    
    private String lname;
    
    private String branch;
    
    private String email;
    
    private String pickup;
    
    private String mobno;
    
    private String address;
    
    private String pwd;
    
    private String route;
    
    private String permission;

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
    public String getRoute() {
        return route;
    }

    public void setRoute(String route) {
        this.route = route;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }
    
    public Faculty(){}
    
    public int getRoll() {
        return roll;
    }

    public void setRoll(int roll) {
        this.roll = roll;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPickup() {
        return pickup;
    }

    public void setPickup(String pickup) {
        this.pickup = pickup;
    }

    public String getMobno() {
        return mobno;
    }

    public void setMobno(String mobno) {
        this.mobno = mobno;
    }
    
    public String getPwd() {
        return pwd;
    }
    
    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
    
    @Override
    public boolean equals(Object o){
       Faculty s = (Faculty)o;
        if(this.roll == s.getRoll() && this.pwd.equals(s.getPwd())){
            return true;
        }
        else{
            return false;
        }
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 43 * hash + this.roll;
        hash = 43 * hash + Objects.hashCode(this.pwd);
        return hash;
    }
    
    
}

