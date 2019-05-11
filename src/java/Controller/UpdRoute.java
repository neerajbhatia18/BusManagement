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
public class UpdRoute extends HttpServlet {

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
        
        RouteInfoDAO rd = new RouteInfoDAO();
        ArrayList<RouteInfo> rl1 = rd.getAllRoute();
        if(rl1!=null)
        {
            System.out.println("inner");
        }
        HttpSession session = request.getSession();
        session.setAttribute("URoute",rl1);
        String choice = request.getParameter("choice");
        if(choice.equals("rno")){
            String v1 = request.getParameter("v1");
            String v2 = request.getParameter("v2");
            if(rd.updateRouteName(v1, v2)){
                
                ArrayList<RouteInfo> rl = rd.getAllRoute();
                session = request.getSession();
                session.setAttribute("URoute",rl);
                response.sendRedirect("UpdateRoute.jsp");
            }
            else{
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Nothing to display !!');");
                out.println("location='AdminDashboard.jsp';");
                out.println("</script>");
            }  
        }
        else if(choice.equals("bno")){
            String v3 = request.getParameter("v3");
            String v4 = request.getParameter("v4");
            String v5 = request.getParameter("v5");
            String v6 = request.getParameter("v6");
            if(rd.updateBusNumber(v3, v4, v5, v6)){
                
                ArrayList<RouteInfo> rl = rd.getAllRoute();
                session = request.getSession();
                session.setAttribute("URoute",rl);
                response.sendRedirect("UpdateRoute.jsp");
            }
            else{
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Nothing to display !!');");
                out.println("location='AdminDashboard.jsp';");
                out.println("</script>");
            }  
        }
        else if(choice.equals("drname")){
            String v7 = request.getParameter("v7");
            String v8 = request.getParameter("v8");
            String v9 = request.getParameter("v9");
            String v10 = request.getParameter("v10");
            String v = request.getParameter("v111");
            if(rd.updateDriverName(v7, v8, v9,v10,v)){
                
                ArrayList<RouteInfo> rl = rd.getAllRoute();
                session = request.getSession();
                session.setAttribute("URoute",rl);
                response.sendRedirect("UpdateRoute.jsp");
            }
            else{
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Nothing to display !!');");
                out.println("location='AdminDashboard.jsp';");
                out.println("</script>");
            }  
        }
        else if(choice.equals("drcontact")){
            String v9 = request.getParameter("v9");
            String v10 = request.getParameter("v10");
            String v = request.getParameter("v111");
            if(rd.updateDriverContact(v9,v10,v)){
                ArrayList<RouteInfo> rl = rd.getAllRoute();
                session = request.getSession();
                session.setAttribute("URoute",rl);
                response.sendRedirect("UpdateRoute.jsp");
            }
            else{
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Nothing to display !!');");
                out.println("location='AdminDashboard.jsp';");
                out.println("</script>");
            }  
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
