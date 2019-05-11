<%-- 
    Document   : ViewStoppages
    Created on : Mar 21, 2019, 6:09:13 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Modal.RouteInfo"%>
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
  <style>
    /*----table----*/

    table {
      border: 1px solid #ccc;
      border-collapse: collapse;
      margin: 0;
      padding: 0;
      width: 100%;
      table-layout: fixed;
    }

    table tr {
      background-color: #f8f8f880;
      border: 1px solid #ddd;
      padding: .35em;
    }

    table th,
    table td {
      padding: .625em;
      text-align: center;
    }

    table td {
      font-weight: bold;
    }

    table td a {
      display: block;
      color: #f1f1f1;
      text-align: center;
      text-decoration: none;
      font-size: 12px;
      background-color: dodgerblue;
      border-radius: 3px;
    }

    table th {
      font-size: 1em;
      letter-spacing: .1em;
      text-transform: uppercase;
      background-color: #000000b3;
      color: #f1f1f1;
    }

    @media screen and (max-width: 600px) {
      table {
        border: 0;
      }

      table caption {
        font-size: 1.3em;
      }

      table thead {
        border: none;
        clip: rect(0 0 0 0);
        height: 1px;
        margin: -1px;
        overflow: hidden;
        padding: 0;
        position: absolute;
        width: 1px;
      }

      table tr {
        border-bottom: 3px solid #ddd;
        display: block;
        margin-bottom: .625em;
      }

      table td {
        border-bottom: 1px solid #141111cc;
        display: block;
        font-size: .8em;
        text-align: right;
      }

      table td a {
        border-bottom: 1px solid #ddd;
        display: block;
        font-size: .8em;
        text-align: center;
      }

      table td::before {
        /*
            * aria-label has no advantage, it won't be read inside a table
            content: attr(aria-label);
            */
        content: attr(data-label);
        float: left;
        font-weight: bold;
        text-transform: uppercase;
      }

      table td:last-child {
        border-bottom: 0;
      }
    }
  </style>
  <link rel="stylesheet" type="text/css" href="css/dashboard.css">
  <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
</head>

<body>
  <div id="container" style="position:relative;">

    <nav>
      <span id="Logo"><a href="##">BUS MANAGEMENT SYSTEM</a></span>
      <ul>
        <li><a href="AdminDashboard.jsp">HOME</a></li>
        <li><a href="CreateRoutes.jsp">CREATE ROUTE</a></li>
        <li><a href="DeleteRoute.jsp">DELETE ROUTE</a></li>
        <li><a href="UpdateRoute.jsp">UPDATE ROUTE</a></li>
        <span id="selected_nav">
          <li><a href="vwRoute">VIEW ROUTES</a></li>
        </span>
        <li><a href="getAllPermission">NEW REGISTRATION </a></li>
        <li><a href="Logout.jsp">LOG OUT </a></li>
      </ul>
    </nav>
      <div class="test">
    <table style="margin-top: 5%;position: absolute;">
      <%
       int i=0;
       ArrayList<RouteInfo> ri = (ArrayList<RouteInfo>)session.getAttribute("routes");
       if(ri.size()!=0){
    %>
      <thead>
        <tr>
          <th scope="col">S.No</th>
          <th scope="col">Route Id</th>
          <th scope="col">Vehicle Reg No.</th>
          <th scope="col">Starting Point</th>
          <th scope="col">Capacity</th>
          <th scope="col">Driver Name</th>
          <th scope="col">Driver Contact No.</th>
        </tr>
      </thead>
      <tbody>
        <%
          for(i=0;i<ri.size();i++){
      %>
        <tr>
          <td data-label="S.No"><%= i+1 %></td>
          <td data-label="Route Id"><%= (ri.get(i)).getRoutename()%></td>
          <td data-label="Vehicle Reg No."><%= (ri.get(i)).getVrnumber() %></td>
          <td data-label="Starting Point"><%= (ri.get(i)).getSpoint() %> <a
              href="vwStoppage?rtName=<%=(ri.get(i)).getRoutename()%>">( List More )</a></td>
          <td data-label="Capacity"><%= (ri.get(i)).getCapacity() %></td>
          <td data-label="Driver Name"><%= (ri.get(i)).getDname() %></td>
          <td data-label="Driver Contact No."><%= (ri.get(i)).getDcontact() %></td>
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
   %>
    </table>
    <div id="container" style="position:relative;"></div>
      </div>
</body>

</html>

<%
    }
%>