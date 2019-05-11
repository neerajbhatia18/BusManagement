<%-- 
    Document   : ViewStoppageFaculty
    Created on : Mar 25, 2019, 9:25:39 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Modal.*"%>
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
  <title>View Routes</title>

  
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

<div id="container" style="position:relative;">
    <div class ="test" >
<%
   ArrayList<Faculty> s = (ArrayList<Faculty>)session.getAttribute("factInfo");
   int r = (s.get(0)).getRoll();
   System.out.println("oo");
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

<table style="margin-top: 5%;position: absolute;">
   
    <%
       int i=0;
       ArrayList<StoppageInfo> ri = (ArrayList<StoppageInfo>)session.getAttribute("stoppages");
       if(ri.size()!=0){
    %>
  <caption><%= (ri.get(0)).getRname() %></caption>
  <thead>
    <tr>
      <th scope="col">S.No</th>
      <th scope="col">Pick-up Point</th>
      <th scope="col">Time</th>
    </tr>
  </thead>
  <tbody>
      <%
          for(i=0;i<ri.size();i++){
      %>
        <tr>
          <td data-label="S.No"><%= i+1 %></td>
          <td data-label="Pick-up Point"><%= (ri.get(i)).getStoppage()  %></td>
          <td data-label="Time"><%= ri.get(i).getTime() %></td>
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
</body>
</html>

<%
    }
%>
