/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Modal.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class UserLog extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String uname = request.getParameter("uname");
        String pass = request.getParameter("pass");
        String status = request.getParameter("status");
        ArrayList<RouteInfo> rl = null;
        RouteInfoDAO rd = new RouteInfoDAO();
        if(status.equals("admin")){
            Admin ad = new Admin();
            AdminDAO ado = new AdminDAO();
            ad.setName(uname);
            ad.setPwd(pass);
            if(ado.check(ad))
            {
                    rl = rd.getAllRoute();
                    HttpSession session = request.getSession();
                    session.setAttribute("admin",ad);
                    session.setAttribute("uname",ad.getName());
                    //session.setAttribute("routess",rl);
                    out.println("<script type=\"text/javascript\">");
                    out.println("location='AdminDashboard.jsp';");
                    out.println("</script>");
            }
            else
            {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Wrong Username & password!');");
                    out.println("location='Login.jsp';");
                    out.println("</script>");
            }
        }
        else if(status.equals("student")){
            Student s = new Student();
            StudentDAO sd = new StudentDAO();
            int r = Integer.parseInt(uname);
            s.setRoll(r);
            s.setPwd(pass);
            if(sd.check(s)){
               
               ArrayList<Student> sl = sd.studentProfile(r);
               if(!(sl.get(0).getPermission().equals("NULL"))){
                    HttpSession session =request.getSession();
                    session.setAttribute("uname",uname);
                    session.setAttribute("stuInfo",sl);
                    response.sendRedirect("StudentDashboard.jsp");
               }
               else{
                   out.println("<script type=\"text/javascript\">");
                   out.println("alert('You Are Not A Verified User, Wait for Verification !');");
                   out.println("location='Login.jsp';");
                   out.println("</script>");
               }
            }
            else{
               out.println("<script type=\"text/javascript\">");
               out.println("alert('Wrong Username & password!');");
               out.println("location='Login.jsp';");
               out.println("</script>"); 
            }
            
        }
        else if(status.equals("faculty")){
            Faculty s = new Faculty();
            FacultyDAO sd = new FacultyDAO();
            int r = Integer.parseInt(uname);
            s.setRoll(r);
            s.setPwd(pass);
            if(sd.check(s)){
               
               ArrayList<Faculty> sl = sd.facultyProfile(r);
               if(!(sl.get(0).getPermission().equals("NULL"))){
                    HttpSession session =request.getSession();
                    session.setAttribute("uname",uname);
                    session.setAttribute("factInfo",sl);
                    response.sendRedirect("FacultyDashboard.jsp");
               }
               else{
                   out.println("<script type=\"text/javascript\">");
                   out.println("alert('You Are Not A Verified User, Wait for Verification !');");
                   out.println("location='Login.jsp';");
                   out.println("</script>");
               }
            }
            else{
               out.println("<script type=\"text/javascript\">");
               out.println("alert('Wrong Username & password!');");
               out.println("location='Login.jsp';");
               out.println("</script>"); 
            }
            
        }
        else
        {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Wrong Username & password!');");
            out.println("location='Login.jsp';");
            out.println("</script>");
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
