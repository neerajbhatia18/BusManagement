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
public class StudentDAO {
    
    public boolean saveStudent(Student s)
    {
        boolean flag=true;
        Configuration cf = null;
        SessionFactory sf = null;
        Session session = null;
        
        try{
        cf = new Configuration();
        
        cf.configure("cfgpackage/hibernate2.cfg.xml");
        
        sf = cf.buildSessionFactory();
        
        session =sf.openSession();
        
        Transaction tx = session.beginTransaction();
        
        if(checkStudent(s)){
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
    public boolean checkStudent(Student s)
    {
        boolean flag=true;
        
        Configuration cf = null;
        SessionFactory sf = null;
        Session session = null;
        
        try{
            cf = new Configuration();

            cf.configure("cfgpackage/hibernate2.cfg.xml");

            sf = cf.buildSessionFactory();

            session =sf.openSession();

            Transaction tx = session.beginTransaction();
            
            String hql = "SELECT E.fname FROM Student E where E.roll = :r_name";

            Query query = session.createQuery(hql);
            
            query.setParameter("r_name",s.getRoll());

            ArrayList<Student> results = (ArrayList<Student>) query.list();
            
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
    
    public boolean check(Student original)
    {
        boolean flag=false;
        Student db=null;
        
        Configuration cf = null;
        SessionFactory sf = null;
        Session session = null;
        Transaction tx = null;
        
        try{
            cf = new Configuration();

            cf.configure("cfgpackage/hibernate2.cfg.xml");

            sf = cf.buildSessionFactory();
            session =sf.openSession();
            tx = session.beginTransaction();
            String hql = "FROM Student E where E.roll= :r_name";

            Query query = session.createQuery(hql);
            
            query.setParameter("r_name",original.getRoll());
            
            tx.commit();
            ArrayList<Student> results = (ArrayList<Student>) query.list();
            
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
    
    public ArrayList<Student> studentProfile(int roll)
    {
        ArrayList<Student> results = null;

        Configuration cf = null;
        
        SessionFactory sf = null;
        
        Session session = null;
        
        try{
            cf = new Configuration();

            cf.configure("cfgpackage/hibernate2.cfg.xml");

            sf = cf.buildSessionFactory();

            session =sf.openSession();

            Transaction tx = session.beginTransaction();

            String hql = "FROM Student s where s.roll=:r_no";
            
            Query query = session.createQuery(hql);
            
            query.setParameter("r_no",roll);

            results = (ArrayList<Student>) query.list();
            
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
    
    public ArrayList<Student> getAllStudents(){
        
        ArrayList<Student> results = null;
        
        Configuration cf = null;
        
        SessionFactory sf = null;
        
        Session session = null;
        
        try{
            cf = new Configuration();

            cf.configure("cfgpackage/hibernate2.cfg.xml");

            sf = cf.buildSessionFactory();

            session =sf.openSession();

            Transaction tx = session.beginTransaction();

            String hql = "FROM Student s where s.permission=:permit";
            
            Query query = session.createQuery(hql);
            
            String s1 = "NULL";
            
            query.setParameter("permit",s1);

            results = (ArrayList<Student>) query.list();
            
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
