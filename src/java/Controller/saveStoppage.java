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
public class saveStoppage extends HttpServlet {

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
        boolean f = false;
           StoppageInfoDAO sd = new StoppageInfoDAO();
           StoppageInfo si = new StoppageInfo();
            String rname = request.getParameter("rName");
            String s = "sPoint0";
            String s1 = "Tim0";
            String sPoint = request.getParameter(s);
            String tim = request.getParameter(s1);
            
            si.setRname(rname);
            si.setStoppage(sPoint);
            si.setTime(tim);
            if(sd.saveStoppage(si))
            {
                f=true;
            }
            else{
                f=false;
            }
        
        
        if(f==true)
        {
              response.sendRedirect("AddStoppages.jsp");
//            out.println("<script type=\"text/javascript\">");
//            out.println("location='vwRoute';");
//            out.println("</script>");
        }
        else{
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Not able to save !!');");
            out.println("location='CreateRoutes.jsp';");
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
