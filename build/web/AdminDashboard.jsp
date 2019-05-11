<%-- 
    Document   : AdminDashboard
    Created on : Mar 21, 2019, 6:03:42 PM
    Author     : user
--%>

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
  <title>Home</title>
  <link rel="stylesheet" type="text/css" href="css/dashboard.css">
  <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
</head>

<body>
    <div id="container" style="position:relative;">
    <nav>
        <span id="Logo"><a href="##">BUS MANAGEMENT SYSTEM</a></span>
        <ul>
            <span id="selected_nav">
                <li><a href="AdminDashboard.jsp">HOME</a></li>
            </span>
            <li><a href="CreateRoutes.jsp">CREATE ROUTE</a></li>
            <li><a href="DeleteRoute.jsp">DELETE ROUTE</a></li>
            <li><a href="UpdateRoute.jsp">UPDATE ROUTE</a></li>
            <li><a href="vwRoute">VIEW ROUTES</a></li>
            <li><a href="getAllPermission">NEW REGISTRATION </a></li>
            <li><a href="Logout.jsp">LOG OUT </a></li>
        </ul>
    </nav>
        <div class="test"></div>
    </span>
    </div>
  <!-- <nav>
    <a class="active" href="AdminDashboard.jsp">Home</a>
    <a href="CreateRoutes.jsp">Create Route</a>
    <a href="DeleteRoute.jsp">Delete Route</a>
    <a href="UpdateRoute.jsp">Update Route</a>
    <a href="vwRoute">View Routes</a>
    <a href="getAllPermission">New Registration</a>
    <a href="Logout.jsp">Logout</a>
  </nav> -->
</body>
</html>

<%
    }
%>