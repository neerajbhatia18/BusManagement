<%-- 
    Document   : NewRegistration
    Created on : Mar 21, 2019, 6:09:48 PM
    Author     : user
--%>

<%@page import="Modal.Faculty"%>
<%@page import="Modal.StoppageInfo"%>
<%@page import="Modal.Student"%>
<%@page import="Modal.StoppageInfoDAO" %>
<%@page import="Modal.RouteInfo"%>
<%@page import="java.util.ArrayList"%>
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
  <title>New Registration</title>
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

    table caption {
      border: 0.5px solid rgb(255, 255, 255);
      background: #2E0854;
      box-sizing: content-box;
      font-size: 2.0em;
      margin: .5em 0 .85em;
      padding-top: 1%;
      padding-bottom: 1%;
      color: white;
      font-weight: bold;
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
      padding-top: 10px;
      padding-bottom: 10px;
      display: block;
      color: #f1f1f1;
      text-align: center;
      /* width: 30px; */
      text-decoration: none;
      font-size: 20px;
      background-color: lightseagreen;
      border-radius: 10px;
    }

    #rem {
      padding-top: 10px;
      padding-bottom: 10px;
      display: block;
      color: #f1f1f1;
      text-align: center;
      /* width: 30px; */
      text-decoration: none;
      font-size: 20px;
      margin-top: 5px;
      border-radius: 10px;
      background-color: red;
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
        /*    float: left;
*/
        margin-left: 300px;
        display: block;
        font-size: 2em;
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

    /*-----*/

    @media (max-width: 768px) {
      nav .search-container {
        float: none;
      }

      nav a,
      nav input[type=text],
      nav .search-container button {
        float: none;
        display: block;
        text-align: left;
        width: 100%;
        margin: 0;
        padding: 14px;
      }

      nav input[type=text] {
        border: 1px solid #ccc;
      }
    }

    /*--------------------------------*/

    .wrapper {
      margin: 0 auto;
      padding-top: 1%;
      position: relative;
    }

    .wrapper-2 {
      width: 14%;
      margin: 0 auto;
      text-align: right;
    }

    .bus {
      width: 120px;
      z-index: 10;
      animation: bounce 100ms infinite alternate;
    }

    .road {
      position: absolute;
      bottom: 2px;
      right: inherit;
      animation: road 1s ease-out infinite;
    }

    @keyframes road {
      0% {
        transform: translateX(0);
      }

      75% {
        opacity: 1;
      }

      100% {
        transform: translateX(-250%);
        opacity: 0;
      }

    }

    @keyframes size {
      from {
        transform: scale3d(0.75, 0.75, 0.75);
        transform: translateX(-350%);

      }

      20% {
        transform: scale3d(1, 1, 1);
      }

      to {
        transform: scale3d(0.75, 0.75, 0.75);
        transform: translateX(-350%);
      }
    }

    @keyframes bounce {
      0% {
        transform: translateY(0)
      }

      100% {
        transform: translateY(-1%)
      }
    }
  </style>
  <link rel="stylesheet" type="text/css" href="css/dashboard.css">
</head>

<body>
  <div class="container" style="position:relative;">
    <nav>
      <span id="Logo"><a href="##">BUS MANAGEMENT SYSTEM</a></span>
      <ul>
        <li><a href="AdminDashboard.jsp">HOME</a></li>
        <li><a href="CreateRoutes.jsp">CREATE ROUTE</a></li>
        <li><a href="DeleteRoute.jsp">DELETE ROUTE</a></li>
        <li><a href="UpdateRoute.jsp">UPDATE ROUTE</a></li>
        <li><a href="vwRoute">VIEW ROUTES</a></li>
        <span id="selected_nav">
          <li><a href="getAllPermission">NEW REGISTRATION </a></li>
        </span>
        <li><a href="Logout.jsp">LOG OUT </a></li>
      </ul>
    </nav>
    <div class="test">
    <div class="table_wrapper" style="  margin-top: 5%;position: absolute;">
      <table>
        <caption>Newly Registered Students</caption>
        <%
       int i=0;
       ArrayList<Student> ri = (ArrayList<Student>)session.getAttribute("allstu");
       if(ri!=null && ri.size()!=0){
           System.out.println("out");
   %>
        <thead>
          <tr>
            <th scope="col">S.No</th>
            <th scope="col">Pick-Up Point</th>
            <th scope="col">Student ID</th>
            <th scope="col">Student Name</th>
            <th scope="col">Route Name</th>
            <th scope="col">Status</th>
          </tr>
        </thead>
        <tbody>
          <%
          for(i=0;i<ri.size();i++){
      %>
          <tr>
            <td data-label="S.No"><%= i+1%></td>
            <td data-label="Pick-Up Point"><%=(ri.get(i)).getPickup() %></td>
            <td data-label="Student ID"><%= (ri.get(i)).getRoll() %></td>
            <td data-label="Student Name"><%= (ri.get(i)).getFname()+" "+(ri.get(i)).getLname() %></td>
            <%
          if((ri.get(i)).getPermission().equals("NULL")){
              System.out.println("inn");
              StoppageInfoDAO sd = new StoppageInfoDAO();
              ArrayList<StoppageInfo> si = sd.getRouteFromStoppage1((String)(ri.get(i)).getPickup());
              String str = (String)si.get(0).getRname();
              System.out.println("route : "+str);
      %>
            <td data-label="Route Name"><%= str %></td>
            <td data-label="Status"><a
                href="grantPermission?roll=<%= (ri.get(i)).getRoll() %>&sto=<%= (ri.get(i)).getPickup() %>">Accept</a>
              <a href="revokePermission?roll=<%= (ri.get(i)).getRoll() %>" id="rem">Remove</a>
            </td>
            <%
          }
          else{
      %>
            <td data-label="Route Name"><%= (ri.get(i)).getRoute() %></td>
            <td data-label="Status"></td>
            <%
        }
    %>
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
      <table>
        <caption>Newly Registered Faculty Members</caption>
        <%
       int j=0;
       ArrayList<Faculty> r = (ArrayList<Faculty>)session.getAttribute("allfact");
       if(r!=null && r.size()!=0){
           System.out.println("out");
   %>
        <thead>
          <tr>
            <th scope="col">S.No</th>
            <th scope="col">Pick-Up Point</th>
            <th scope="col">Student ID</th>
            <th scope="col">Student Name</th>
            <th scope="col">Route Name</th>
            <th scope="col">Status</th>
          </tr>
        </thead>
        <tbody>
          <%
          for(j=0;j<r.size();j++){
      %>
          <tr>
            <td data-label="S.No"><%= j+1%></td>
            <td data-label="Pick-Up Point"><%=(r.get(j)).getPickup() %></td>
            <td data-label="Student ID"><%= (r.get(j)).getRoll() %></td>
            <td data-label="Student Name"><%= (r.get(j)).getFname()+" "+(r.get(j)).getLname() %></td>
            <%
          if((r.get(j)).getPermission().equals("NULL")){
              System.out.println("inn");
              StoppageInfoDAO sd = new StoppageInfoDAO();
              ArrayList<StoppageInfo> si1 = sd.getRouteFromStoppage1((String)(r.get(j)).getPickup());
              String str1=" ";
              if(si1!=null){
                str1 = str1+(String)si1.get(0).getRname();
              }else{
                   str1=str1 + "null";
              }
      %>
            <td data-label="Route Name"><%= str1 %></td>
            <td data-label="Status"><a
                href="grantPermissionF?ro=<%= (r.get(j)).getRoll() %>&st=<%= (r.get(j)).getPickup() %>">Accept</a>
              <<a href="revokePermissionF?roll=<%= (r.get(j)).getRoll() %>" id="rem">Remove</a>
            </td>
            <%
          }
          else{
      %>
            <td data-label="Route Name"><%= (r.get(i)).getRoute() %></td>
            <td data-label="Status"></td>
            <%
        }
    %>
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
    </div>
  </div>
  </div>
</body>

</html>

<%
    }
%>