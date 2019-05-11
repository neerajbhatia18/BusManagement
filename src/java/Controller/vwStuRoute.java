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
public class vwStuRoute extends HttpServlet {

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
        
        int r = Integer.parseInt((String)request.getParameter("rno"));
        
        StudentDAO sd = new StudentDAO();
        
        StoppageInfoDAO sid = new StoppageInfoDAO();
        
        ArrayList<Student> sl = sd.studentProfile(r);
        
        String stoppage = sl.get(0).getRoute();
        
        ArrayList<StoppageInfo> results = sid.getRouteFromStoppage(stoppage);
        
        RouteInfoDAO rd = new RouteInfoDAO();
        
        ArrayList<RouteInfo> res = rd.getRoute(sl.get(0).getRoute());
        
        if(results!=null && results.size()!=0){
            System.out.println("in vw route");
            HttpSession session = request.getSession();
            session.setAttribute("rest", res);
            session.setAttribute("stopInfo",results);
            response.sendRedirect("StudentRoute.jsp");
        }
        else{
            out.println("<script type=\"text/javascript\">");
            
            out.println("alert('Invalid Information!');");
            out.println("location='StudentDashboard.jsp';");
            
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
