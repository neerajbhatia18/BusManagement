<%-- 
    Document   : StudentProfile
    Created on : Mar 22, 2019, 8:25:55 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Modal.Student"%>
<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
    
    if(request.getSession().getAttribute("uname")==null)
    {
%>
    <script>
            location = "Login.jsp";
    </script>
<%
    }
    else
    {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <link rel="stylesheet" type="text/css" href="css/student.css">
  <link rel="stylesheet" type="text/css" href="css/table.css">
  <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
  <script src="all.js"></script>
  <title>Student Profile</title>
</head>

<body>
  <div id="container" style="position:relative;">

      <%
      ArrayList<Student> s = (ArrayList<Student>)session.getAttribute("stuInfo");
      int r = (s.get(0)).getRoll();
      System.out.println("oo");
      %>

    <nav>
      <span id="Logo"><a href="##" style="margin-top: -0.5%;">BUS MANAGEMENT SYSTEM</a></span>
      <ul style="width: 1550;min-height: 0;">
        <li><a href="StudentDashboard.jsp">HOME</a></li>
        <span id="selected_nav">
          <li><a href="StuProfile?rno=<%= r %>">PROFILE</a></li>
        </span>
        <li><a href="vwStuRoute?rno=<%= r%>">VIEW YOUR ROUTE</a></li>
        <li><a href="Logout.jsp">LOG OUT </a></li>
      </ul>
    </nav>

    <%
    int i=0;
    ArrayList<Student> ri = (ArrayList<Student>)session.getAttribute("sprof");
    if(ri!=null && ri.size()!=0){
        System.out.println("n");
   %>
    <div class="test">
      <div class="black_overlay">
        <div class="white_round_back">
          <div class="student_info">STUDENT INFORMATION</div>
          
          <div class="empname"><%=(ri.get(0)).getFname()+" "+(ri.get(0)).getLname() %></div>
          <div class="student_section">
            <div class="branch" style="margin-top:50px;"><%=("BRANCH : " + (ri.get(0)).getBranch()) %></div>
            <div class="branch"><%=("PHONE NO. : "+(ri.get(0)).getMobno()) %></div>
            <div class="branch"><%=("ADDRESS : "+(ri.get(0)).getAddress()) %></div>
            <div class="branch"><%=("PICKUP POINT : "+(ri.get(i)).getPickup()) %></div>

            <% 
          }
          %>

          <%
          if(!((ri.get(i)).getRoute().equals("NULL") && (ri.get(i)).getPermission().equals("NULL"))){
          %>

            <div class="branch"><%=("ROUTE NAME : " + (ri.get(i)).getRoute()) %></div>
            <div class="branch"><%=("VERIFICATION STATUS : " + (ri.get(i)).getPermission()) %></div>

            <% 
          }
          else 
          {
          %>
            <div class="branch"><%=("ROUTE NOT ASSIGNED") %></div>
            <div class="branch"><%=("UNVERIFIED ACCOUNT : "   + (ri.get(i)).getPermission()) %></div>
          
            <% 
          }
          %>
      
          </div>
        </div>
      </div>
</body>
</html>
<% 
}
%>