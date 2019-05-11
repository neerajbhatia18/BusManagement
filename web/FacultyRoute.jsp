<%-- 
    Document   : FacultyRoute
    Created on : Mar 25, 2019, 12:17:26 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Modal.Faculty"%>
<%@page import="Modal.StoppageInfo" %>
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
  <title>My Route</title>
  <script src="all.js"></script>
  <link rel="stylesheet" type="text/css" href="css/student.css">
  <link rel="stylesheet" type="text/css" href="css/table.css">
  <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <style>
table {
  border-collapse: collapse;
}

table, td, th {
  border: 1px solid black;
}
      </style>

</head>

<body>

  <%
    ArrayList<Faculty> s = (ArrayList<Faculty>)session.getAttribute("factInfo");
    int r = (s.get(0)).getRoll();
%>
  <nav>
    <span id="Logo"><a href="##" style="margin-top: -0.5%;">BUS MANAGEMENT SYSTEM</a></span>
    <ul style="width: 1550;min-height: 0;">

      <li><a href="FacultyDashboard.jsp">HOME</a></li>

      <li><a href="FactProfile?rno=<%= r %>">PROFILE</a></li>
      <span id="selected_nav">
        <li><a href="vwFactRoute?rno=<%= r%>">VIEW YOUR ROUTE</a></li>
      </span>
      <li><a href="Logout.jsp">LOG OUT </a></li>
    </ul>
  </nav>
  <div class="test">
      <table style="margin-top:5%">
    <%
      if(!((s.get(0)).getRoute()==null && (s.get(0)).getPermission()==null)){
       System.out.println("jsp");
       int i=0;
       ArrayList<StoppageInfo> ri = (ArrayList<StoppageInfo>)session.getAttribute("stopInfo");
       if(ri!=null && ri.size()!=0){
           System.out.println(ri.size());
  %>
    <caption><%= (ri.get(0)).getRname() %></caption>
    <thead>
      <tr>
        <th scope="col">S. No</th>
        <th scope="col">Stops</th>
        <th scope="col">Time</th>
      </tr>
    </thead>
    <%
     for(i=0;i<ri.size();i++){
  %>
    <tbody>
      <tr>
        <td data-label="S.No"><%= i+1 %></td>
        <td data-label="Pick-up Point"><%= (ri.get(i)).getStoppage() %></td>
        <td data-label="Time"><%= (ri.get(i)).getTime() %></td>
      </tr>
      <%
        }
    %>
    </tbody>
    <%
    
    }
    else{
        %>
    <tr>
      <td>
        Nothing to display
      </td>
    </tr>
    <%
        }
     }
     else{
   %>
    <tr>
      <td>
        Nothing to display
      </td>
    </tr>
    <%
      } 
   %>
  </table>
</body>
</div>

</html>

<%
    }
%>