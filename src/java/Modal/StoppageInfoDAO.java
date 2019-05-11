/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modal;

import java.util.ArrayList;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author user
 */
public class StoppageInfoDAO {
    
    public boolean saveStoppage(StoppageInfo original){
        boolean flag= false;
        Configuration cf = null;
        SessionFactory sf = null;
        Session session = null;
        
        try{
        cf = new Configuration();
        
        cf.configure("cfgpackage/hibernate.cfg.xml");
        
        sf = cf.buildSessionFactory();
        
        session =sf.openSession();
        
        Transaction tx = session.beginTransaction();
        
        session.save(original);
            
        flag=true;
        
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
    
    public ArrayList<StoppageInfo> getStoppage(String rname){
        ArrayList<StoppageInfo> results = null;
        Configuration cf = null;
        
        SessionFactory sf = null;
        
        Session session = null;
        
        try{
            cf = new Configuration();

            cf.configure("cfgpackage/hibernate.cfg.xml");

            sf = cf.buildSessionFactory();

            session =sf.openSession();

            Transaction tx = session.beginTransaction();

            String hql = "FROM StoppageInfo where rname = :r_name";

            Query query = session.createQuery(hql);
            
            query.setParameter("r_name",rname);

            results = (ArrayList<StoppageInfo>) query.list();
            
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
    
    public ArrayList<StoppageInfo> getRouteFromStoppage(String stoppage){
        ArrayList<StoppageInfo> results = null;
        Configuration cf = null;
        
        SessionFactory sf = null;
        
        Session session = null;
        
        try{
            cf = new Configuration();

            cf.configure("cfgpackage/hibernate.cfg.xml");

            sf = cf.buildSessionFactory();

            session =sf.openSession();

            Transaction tx = session.beginTransaction();

            String hql = "FROM StoppageInfo s where s.rname = :stoppage_name";

            Query query = session.createQuery(hql);
            
            query.setParameter("stoppage_name",stoppage);

            results = (ArrayList<StoppageInfo>) query.list();
            
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


public ArrayList<StoppageInfo> getRouteFromStoppage1(String stoppage){
        ArrayList<StoppageInfo> results = null;
        Configuration cf = null;
        
        SessionFactory sf = null;
        
        Session session = null;
        
        try{
            cf = new Configuration();

            cf.configure("cfgpackage/hibernate.cfg.xml");

            sf = cf.buildSessionFactory();

            session =sf.openSession();

            Transaction tx = session.beginTransaction();

            String hql = "FROM StoppageInfo s where s.stoppage = :stoppage_name";

            Query query = session.createQuery(hql);
            
            query.setParameter("stoppage_name",stoppage);

            results = (ArrayList<StoppageInfo>) query.list();
            
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
    
    public ArrayList<StoppageInfo> getAllStoppage(){
        ArrayList<StoppageInfo> results = null;
        Configuration cf = null;
        
        SessionFactory sf = null;
        
        Session session = null;
        
        try{
            cf = new Configuration();

            cf.configure("cfgpackage/hibernate.cfg.xml");

            sf = cf.buildSessionFactory();

            session =sf.openSession();

            Transaction tx = session.beginTransaction();

            String hql = "FROM StoppageInfo";

            Query query = session.createQuery(hql);
            
            results = (ArrayList<StoppageInfo>) query.list();
            
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
