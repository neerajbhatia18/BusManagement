/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modal;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author user
 */
public class FacultyDAO {
    
    public boolean saveFaculty(Faculty s)
    {
        boolean flag=true;
        Configuration cf = null;
        SessionFactory sf = null;
        Session session = null;
        
        try{
        cf = new Configuration();
        
        cf.configure("cfgpackage/hibernate3.cfg.xml");
        
        sf = cf.buildSessionFactory();
        
        session =sf.openSession();
        
        Transaction tx = session.beginTransaction();
        
        if(checkFaculty(s)){
          session.save(s);
          flag=true;
        }
        else{
            flag=false;
        }
        
        tx.commit();
        }
        catch(Exception e1){
            flag=false;
            System.out.println("Error"+e1);
            e1.printStackTrace();
        }
        finally{
            
        session.close();
       
        sf.close();
        }
        
        return flag;
    }
    public boolean checkFaculty(Faculty s)
    {
        boolean flag=true;
        
        Configuration cf = null;
        SessionFactory sf = null;
        Session session = null;
        
        try{
            cf = new Configuration();

            cf.configure("cfgpackage/hibernate3.cfg.xml");

            sf = cf.buildSessionFactory();

            session =sf.openSession();

            Transaction tx = session.beginTransaction();
            
            String hql = "SELECT E.fname FROM Faculty E where E.roll = :r_name";

            Query query = session.createQuery(hql);
            
            query.setParameter("r_name",s.getRoll());

            ArrayList<Faculty> results = (ArrayList<Faculty>) query.list();
            
            if(results==null || results.size()==0)
            {
                flag=true;
            }
            else{
                flag=false;
            }
            
            tx.commit();
        }
        catch(Exception e1){
            
            System.out.println("Error"+e1);
            flag=false;
            e1.printStackTrace();
        }
        finally{
            
        session.close();
       
        sf.close();
        }
      
        return flag;
    }
    
    public boolean check(Faculty original)
    {
        boolean flag=false;
        Faculty db=null;
        
        Configuration cf = null;
        SessionFactory sf = null;
        Session session = null;
        Transaction tx = null;
        
        try{
            cf = new Configuration();

            cf.configure("cfgpackage/hibernate3.cfg.xml");

            sf = cf.buildSessionFactory();
            session =sf.openSession();
            tx = session.beginTransaction();
            String hql = "FROM Faculty E where E.roll= :r_name";

            Query query = session.createQuery(hql);
            
            query.setParameter("r_name",original.getRoll());
            
            tx.commit();
            ArrayList<Faculty> results = (ArrayList<Faculty>) query.list();
            
            if(results==null || results.size()==0)
            {
                flag=false;
            }
            else{
                flag=true;
            }            
        }
        catch(Exception e){
            System.out.println(e);
            flag=false;
            e.printStackTrace();
        }
        finally{
            session.close();
            sf.close();
        }
        
        return flag;
    }
    
    public ArrayList<Faculty> facultyProfile(int roll)
    {
        ArrayList<Faculty> results = null;

        Configuration cf = null;
        
        SessionFactory sf = null;
        
        Session session = null;
        
        try{
            cf = new Configuration();

            cf.configure("cfgpackage/hibernate3.cfg.xml");

            sf = cf.buildSessionFactory();

            session =sf.openSession();

            Transaction tx = session.beginTransaction();

            String hql = "FROM Faculty s where s.roll=:r_no";
            
            Query query = session.createQuery(hql);
            
            query.setParameter("r_no",roll);

            results = (ArrayList<Faculty>) query.list();
            
            tx.commit();
        }
        catch(Exception e1){
            
            System.out.println("Error"+e1);
            
            e1.printStackTrace();
        }
        finally{
            
            session.close();

            sf.close();
        }
        
        return results;
    }
    
    public ArrayList<Faculty> getAllFacultys(){
        
        ArrayList<Faculty> results = null;
        
        Configuration cf = null;
        
        SessionFactory sf = null;
        
        Session session = null;
        
        try{
            cf = new Configuration();

            cf.configure("cfgpackage/hibernate3.cfg.xml");

            sf = cf.buildSessionFactory();

            session =sf.openSession();

            Transaction tx = session.beginTransaction();

            String hql = "FROM Faculty s where s.permission=:permit";
            
            Query query = session.createQuery(hql);
            
            String s1 = "NULL";
            
            query.setParameter("permit",s1);

            results = (ArrayList<Faculty>) query.list();
            
            tx.commit();
        }
        catch(Exception e1){
            
            System.out.println("Error"+e1);
            
            e1.printStackTrace();
        }
        finally{
            
            session.close();

            sf.close();
        }
        
        return results;
        
    }
    
    
}