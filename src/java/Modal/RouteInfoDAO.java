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
public class RouteInfoDAO {
    
    public boolean saveRoute(RouteInfo original)
    {
        boolean flag = false;
        Configuration cf = null;
        SessionFactory sf = null;
        Session session = null;
        
        try{
        cf = new Configuration();
        
        cf.configure("cfgpackage/hibernate.cfg.xml");
        
        sf = cf.buildSessionFactory();
        
        session =sf.openSession();
        
        Transaction tx = session.beginTransaction();
        
        if(checkRouteByName(original.getRoutename())){
            session.save(original);
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
    
    public boolean checkRouteByName(String rname){
        
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

            String hql = "SELECT E.routename FROM RouteInfo E where E.routename = :r_name";

            Query query = session.createQuery(hql);
            
            query.setParameter("r_name",rname);

            ArrayList<RouteInfo> results = (ArrayList<RouteInfo>) query.list();
            
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
            
            e1.printStackTrace();
            
            flag=false;
        }
        finally{
            
            session.close();

            sf.close();
        }
        
        return flag;
    }
    
//    ************************************* View Routes ****************************88
    
    public ArrayList<RouteInfo> getAllRoute(){
        
        ArrayList<RouteInfo> results = null;

        Configuration cf = null;
        
        SessionFactory sf = null;
        
        Session session = null;
        
        try{
            cf = new Configuration();

            cf.configure("cfgpackage/hibernate.cfg.xml");

            sf = cf.buildSessionFactory();

            session =sf.openSession();

            Transaction tx = session.beginTransaction();

            String hql = "FROM RouteInfo";

            Query query = session.createQuery(hql);

            results = (ArrayList<RouteInfo>) query.list();
            
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
    
//    ******************************* All search *****************************************************
    
    public ArrayList<RouteInfo> getRouteByName(String rname){
        ArrayList<RouteInfo> results = null;
        
        Configuration cf = null;
        SessionFactory sf = null;
        Session session = null;
        
        try{
            cf = new Configuration();

            cf.configure("cfgpackage/hibernate.cfg.xml");

            sf = cf.buildSessionFactory();

            session =sf.openSession();

            Transaction tx = session.beginTransaction();

            String hql = "FROM RouteInfo E where E.routename= :r_name";

            Query query = session.createQuery(hql);
            
            query.setParameter("r_name",rname);

            results = (ArrayList<RouteInfo>) query.list();
       
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
    
    public ArrayList<RouteInfo> getRouteByBus(String bno){
                
        ArrayList<RouteInfo> results = null;
        
        Configuration cf = null;
        SessionFactory sf = null;
        Session session = null;
        
        try{
            cf = new Configuration();

            cf.configure("cfgpackage/hibernate.cfg.xml");

            sf = cf.buildSessionFactory();

            session =sf.openSession();

            Transaction tx = session.beginTransaction();

            String hql = "FROM RouteInfo E where E.busno= :b_no";

            Query query = session.createQuery(hql);
            
            query.setParameter("b_no",bno);

            results = (ArrayList<RouteInfo>) query.list();
       
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
    
//    ******************************  All Update  ********************************************8
    
    public boolean updateRouteName(String original,String latest)
    {
        boolean flag = false;
        ArrayList<RouteInfo> results =null;
        Configuration cf = null;
        SessionFactory sf = null;
        Session session = null;
        
        try{
            cf = new Configuration();

            cf.configure("cfgpackage/hibernate.cfg.xml");

            sf = cf.buildSessionFactory();

            session =sf.openSession();

            Transaction tx = session.beginTransaction();

            String hql = "update RouteInfo r set r.routename=:lr_name where r.routename=:r_name";

            Query query = session.createQuery(hql);
            query.setParameter("lr_name",latest);
            query.setParameter("r_name",original);
            query.executeUpdate();
            
            String hql1 = "FROM RouteInfo";

            Query query1 = session.createQuery(hql1);
            
            results = (ArrayList<RouteInfo>) query1.list();
            
            if(results!=null || results.size()!=0)
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
            
            e1.printStackTrace();
            
            flag=false;
        }
        finally{
            
            session.close();

            sf.close();
        }

        
        return flag;
    }
    
    public boolean updateBusNumber(String original,String latest,String ov,String lv)
    {
        boolean flag = false;
        Configuration cf = null;
        SessionFactory sf = null;
        Session session = null;
        ArrayList<RouteInfo> results=null;
        try{
            cf = new Configuration();

            cf.configure("cfgpackage/hibernate.cfg.xml");

            sf = cf.buildSessionFactory();

            session =sf.openSession();

            Transaction tx = session.beginTransaction();

            String hql = "update RouteInfo set busno= :lr_name where busno= :r_name";

            Query query = session.createQuery(hql);
            query.setParameter("lr_name",latest);
            query.setParameter("r_name",original);
            
            query.executeUpdate();
            
            String hql2 = "update RouteInfo set vrnumber= :l_v where vrnumber= :o_v";

            Query query2 = session.createQuery(hql2);
            
            query2.setParameter("l_v",lv);
            
            query2.setParameter("o_v",ov);
            
            query2.executeUpdate();
            
            String hql1 = "FROM RouteInfo";

            Query query1 = session.createQuery(hql1);
            
            results = (ArrayList<RouteInfo>) query1.list();
            
            
            if(results!=null || results.size()!=0)
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
            
            e1.printStackTrace();
            
            flag=false;
        }
        finally{
            
            session.close();

            sf.close();
        }
        return flag;
    }
    
    public boolean updateDriverName(String original,String latest,String oldcontact,String newcontact,String rname)
    {
     
        boolean flag = false;
        Configuration cf = null;
        SessionFactory sf = null;
        Session session = null;
        ArrayList<RouteInfo> results = null;
        try{
            cf = new Configuration();

            cf.configure("cfgpackage/hibernate.cfg.xml");

            sf = cf.buildSessionFactory();

            session =sf.openSession();

            Transaction tx = session.beginTransaction();
            
            String hql = "update RouteInfo set dname= :lr_name, dcontact= :rt where routename= :r_name";

            Query query = session.createQuery(hql);
            
            query.setParameter("rt",newcontact);
            
            query.setParameter("lr_name",latest);
            
            query.setParameter("r_name",rname);
            
            query.executeUpdate();
            
            String hql1 = "FROM RouteInfo";

            Query query1 = session.createQuery(hql1);
            
            results = (ArrayList<RouteInfo>) query1.list();
            
            if(results!=null || results.size()!=0)
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
            
            e1.printStackTrace();
            
            flag=false;
        }
        finally{
            
            session.close();

            sf.close();
        }
        return flag;
    }
    
    public boolean updateDriverContact(String original,String latest,String rname)
    {
        boolean flag = false;
        Configuration cf = null;
        SessionFactory sf = null;
        Session session = null;
        ArrayList<RouteInfo> results = null;
        try{
            cf = new Configuration();

            cf.configure("cfgpackage/hibernate.cfg.xml");

            sf = cf.buildSessionFactory();

            session =sf.openSession();

            Transaction tx = session.beginTransaction();

            String hql = "update RouteInfo set dcontact= :lr_name where dcontact= :r_nae and routename= :r_name";

            Query query = session.createQuery(hql);
            
            query.setParameter("r_nae",original);
            
            query.setParameter("lr_name",latest);
            
            query.setParameter("r_name",rname);
            
            query.executeUpdate();
            
            String hql1 = "FROM RouteInfo";

            Query query1 = session.createQuery(hql1);
            
            results = (ArrayList<RouteInfo>) query1.list();
            
            if(results!=null || results.size()!=0)
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
            
            e1.printStackTrace();
            
            flag=false;
        }
        finally{
            
            session.close();

            sf.close();
        }

        return flag;
    }
    
//  ******************************** All Delete ************************************************8  
    
    public boolean deleteRoute(String rname)
    {
        boolean flag=false;        
        Configuration cf = null;
        SessionFactory sf = null;
        Session session = null;
        ArrayList<RouteInfo> results = null;
        try{
            cf = new Configuration();

            cf.configure("cfgpackage/hibernate.cfg.xml");

            sf = cf.buildSessionFactory();

            session =sf.openSession();

            Transaction tx = session.beginTransaction();

            Query qry = session.createQuery("delete from RouteInfo p where p.routename=:r_name");
	    qry.setParameter("r_name",rname);
            int res = qry.executeUpdate();
            
            String hql1 = "FROM RouteInfo";

            Query query1 = session.createQuery(hql1);
            
            results = (ArrayList<RouteInfo>) query1.list();
            
            if(results!=null || results.size()!=0)
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
            
            e1.printStackTrace();
            
            flag=false;
        }
        finally{
            
            session.close();

            sf.close();
        }

        return flag;
    }
    
    public ArrayList<RouteInfo> getRoute(String route){
        ArrayList<RouteInfo> results = null;
        
        Configuration cf = null;
        
        SessionFactory sf = null;
        
        Session session = null;
        
        try{
            cf = new Configuration();

            cf.configure("cfgpackage/hibernate.cfg.xml");

            sf = cf.buildSessionFactory();

            session =sf.openSession();

            Transaction tx = session.beginTransaction();

            String hql = "FROM RouteInfo r where r.routename=:r_name";

            Query query = session.createQuery(hql);
            
            query.setParameter("r_name",route);

            results = (ArrayList<RouteInfo>) query.list();
            
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
