<%-- 
    Document   : Logout
    Created on : Nov 21, 2018, 2:17:30 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
   session.invalidate();
   response.sendRedirect("Login.jsp");
%>