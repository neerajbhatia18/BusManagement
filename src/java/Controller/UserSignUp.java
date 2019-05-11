/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Modal.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
public class UserSignUp extends HttpServlet {

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
            
            String status = request.getParameter("status");
            if(status.equals("student")){
                Student s = new Student();
                StudentDAO sd = new StudentDAO();
                String fname = request.getParameter("fname");
                String lname = request.getParameter("lname");
                int rno = Integer.parseInt(request.getParameter("rno"));
                String branch = request.getParameter("branch");
                String email = request.getParameter("email");
                String address = request.getParameter("address");
                String pickupPoint = request.getParameter("PickUppoint");
                String mobile = request.getParameter("mobile");
                String pwd = request.getParameter("pwd");
                System.out.println(pwd);
                s.setFname(fname);
                s.setLname(lname);
                s.setRoll(rno);
                s.setBranch(branch);
                s.setEmail(email);
                s.setPickup(pickupPoint);
                s.setMobno(mobile);
                s.setPwd(pwd);
                s.setAddress(address);
                s.setRoute("NULL");
                s.setPermission("NULL");
                if(sd.saveStudent(s)){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('User Added Successfully!!');");
                    out.println("location='Login.jsp';");
                    out.println("</script>");
                }
                else{
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Username Exists!');");
                    out.println("location='Login.jsp';");
                    out.println("</script>");
                }
            }
            if(status.equals("faculty")){
                Faculty s = new Faculty();
                FacultyDAO sd = new FacultyDAO();
                String fname = request.getParameter("fname");
                String lname = request.getParameter("lname");
                int rno = Integer.parseInt(request.getParameter("rno"));
                String branch = request.getParameter("branch");
                String email = request.getParameter("email");
                String address = request.getParameter("address");
                String pickupPoint = request.getParameter("PickUppoint");
                String mobile = request.getParameter("mobile");
                String pwd = request.getParameter("pwd");
                System.out.println(pwd);
                s.setFname(fname);
                s.setLname(lname);
                s.setRoll(rno);
                s.setBranch(branch);
                s.setEmail(email);
                s.setPickup(pickupPoint);
                s.setMobno(mobile);
                s.setPwd(pwd);
                s.setAddress(address);
                s.setRoute("NULL");
                s.setPermission("NULL");
                if(sd.saveFaculty(s)){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('User Added Successfully!!');");
                    out.println("location='Login.jsp';");
                    out.println("</script>");
                }
                else{
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Username Exists!');");
                    out.println("location='Login.jsp';");
                    out.println("</script>");
                }
            }
            else{
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Invalid Data Entered!');");
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
