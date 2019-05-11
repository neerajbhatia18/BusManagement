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
 * @author Admin
 */
public class AdminDAO {
    
    public boolean check(Admin original){
        boolean flag = false;
        Admin db=null;
        
        Configuration cf = null;
        SessionFactory sf = null;
        Session session = null;
        Transaction tx = null;
        
        try{
            cf = new Configuration();

            cf.configure("cfgpackage/hibernate1.cfg.xml");

            sf = cf.buildSessionFactory();
            session =sf.openSession();
            tx = session.beginTransaction();
            db = (Admin)session.get(Admin.class,original.getName());
            
            tx.commit();
            if(db!=null)
            {
                return original.equals(db);
            }
            else
            {
                return false;
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
    
//    ******************** Permission **************************8
    
    public ArrayList<Student> getAllP(){
        ArrayList<Student> results = null;
        StudentDAO sd= new StudentDAO();
        results = sd.getAllStudents();
        return results;
    }
    
    public String getRoute(String stops){
        ArrayList<StoppageInfo> results = null;
        StoppageInfoDAO sd = new StoppageInfoDAO();
        results = sd.getRouteFromStoppage(stops);
        return (String)(results.get(0)).getRname();
    }
    
    public boolean givePermission(int roll,String stops){
        boolean flag=false;
        ArrayList<Student> results =null;
        
        ArrayList<StoppageInfo> sd = null;
        
        StoppageInfoDAO so = new StoppageInfoDAO();
        
        Configuration cf = null;
        
        SessionFactory sf = null;
        
        Session session = null;
        
        try{
            cf = new Configuration();

            cf.configure("cfgpackage/hibernate.cfg.xml");

            sf = cf.buildSessionFactory();

            session =sf.openSession();

            Transaction tx = session.beginTransaction();
            
            sd = so.getRouteFromStoppage1(stops);
            
            String route = sd.get(0).getRname();
            
            String hql12 = "update Student r set r.route=:ro where r.roll=:r_no";

            Query query12 = session.createQuery(hql12);
            
            query12.setParameter("ro",route);
            
            query12.setParameter("r_no",roll);
            
            query12.executeUpdate();

            String hql = "update Student r set r.permission=:pr where r.roll=:r_no";

            Query query = session.createQuery(hql);
            
            query.setParameter("pr","granted");
            
            query.setParameter("r_no",roll);
            
            query.executeUpdate();
            
            String hql1 = "FROM Student";

            Query query1 = session.createQuery(hql1);
            
            results = (ArrayList<Student>) query1.list();
            
            if(results!=null && results.size()!=0 && results.get(0).getPermission()!=null)
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
    
    public boolean removePermission(int roll){

        boolean flag=false;
        
        Configuration cf = null;
        
        SessionFactory sf = null;
        
        Session session = null;
        
        ArrayList<Student> results = null;
        
        try{
            cf = new Configuration();

            cf.configure("cfgpackage/hibernate.cfg.xml");

            sf = cf.buildSessionFactory();

            session =sf.openSession();

            Transaction tx = session.beginTransaction();

            Query qry = session.createQuery("delete from Student p where p.roll=:r_name");
	    qry.setParameter("r_name",roll);
            int res = qry.executeUpdate();
            
            String hql1 = "FROM Student";

            Query query1 = session.createQuery(hql1);
            
            results = (ArrayList<Student>) query1.list();
            
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
    
    
    public boolean givePermissionFaculty(int roll,String stops){
        boolean flag=false;
        ArrayList<Faculty> results =null;
        
        ArrayList<StoppageInfo> sd = null;
        
        StoppageInfoDAO so = new StoppageInfoDAO();
        
        Configuration cf = null;
        
        SessionFactory sf = null;
        
        Session session = null;
        
        try{
            cf = new Configuration();

            cf.configure("cfgpackage/hibernate3.cfg.xml");

            sf = cf.buildSessionFactory();

            session =sf.openSession();

            Transaction tx = session.beginTransaction();
            
            sd = so.getRouteFromStoppage1(stops);
            
            String route = sd.get(0).getRname();
            System.out.println(route);
            String hql12 = "update Faculty r set r.route=:ro where r.roll=:r_no";

            Query query12 = session.createQuery(hql12);
            
            query12.setParameter("ro",route);
            
            query12.setParameter("r_no",roll);
            
            query12.executeUpdate();

            String hql = "update Faculty r set r.permission=:pr where r.roll=:r_no";

            Query query = session.createQuery(hql);
            
            query.setParameter("pr","granted");
            
            query.setParameter("r_no",roll);
            
            query.executeUpdate();
            
            String hql1 = "FROM Faculty";

            Query query1 = session.createQuery(hql1);
            
            results = (ArrayList<Faculty>) query1.list();
            
            if(results!=null && results.size()!=0 && results.get(0).getPermission()!=null)
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
    
    public boolean removePermissionFaculty(int roll){

        boolean flag=false;
        
        Configuration cf = null;
        
        SessionFactory sf = null;
        
        Session session = null;
        
        ArrayList<Faculty> results = null;
        
        try{
            cf = new Configuration();

            cf.configure("cfgpackage/hibernate3.cfg.xml");

            sf = cf.buildSessionFactory();

            session =sf.openSession();

            Transaction tx = session.beginTransaction();

            Query qry = session.createQuery("delete from Faculty p where p.roll=:r_name");
	    qry.setParameter("r_name",roll);
            int res = qry.executeUpdate();
            
            String hql1 = "FROM Faculty";

            Query query1 = session.createQuery(hql1);
            
            results = (ArrayList<Faculty>) query1.list();
            
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
}
