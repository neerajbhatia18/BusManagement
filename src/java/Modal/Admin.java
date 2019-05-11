/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modal;

import java.util.Objects;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 *
 * @author Admin
 */
@Entity
public class Admin {
    
    @Id
    String name;
    
    String pwd;
    
    public Admin(){}

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 31 * hash + Objects.hashCode(this.name);
        hash = 31 * hash + Objects.hashCode(this.pwd);
        return hash;
    }

    @Override
    public boolean equals(Object ob)
    {
        Admin u = (Admin)ob;
        
        if(this.name.equals(u.getName()) && this.pwd.equals(u.getPwd()))
        {
            return true;
        }
        else
        {
          return false;
        }
    }
    
}
