<%-- 
    Document   : ResultSearch
    Created on : Mar 23, 2019, 8:30:38 PM
    Author     : user
--%>

<%@page import="Modal.Student"%>
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
      padding-top: 5px;
      padding-bottom: 5px;
      display: block;
      color: #f1f1f1;
      text-align: center;
      /* width: 30px; */
      text-decoration: none;
      font-size: 15px;
      background-color: lightseagreen;
      border-radius: 5px;
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

  <script type="text/javascript">
    function myValidation() {
      var search = document.forms["myForm"]["search"];
      var stat = document.forms["myForm"]["choice"];
      var flag = true;

      if (search.value == "") {
        alert("Search Box cannot be empty");
        flag = false;
      }

      if (stat.value == "" || !(stat.value == "BusNumber" || stat.value == "RouteName")) {
        alert("Choice is Invalid");
        flag = false;
      }

      return flag;
    }
  </script>
  <script src="all.js"></script>

  <link rel="stylesheet" type="text/css" href="css/dashboard.css">

</head>

<body>

  <%
   ArrayList<Student> s = (ArrayList<Student>)session.getAttribute("stuInfo");
   int r = (s.get(0)).getRoll();
  //System.out.println(r);
%>

    <div id="container" style="position:relative;">
      <nav>
        <span id="Logo"><a href="##" style="margin-top: -0.5%;margin-left: 0px;">BUSMANAGEMENT SYSTEM</a></span>
        <ul>
          <span id="selected_nav">
            <li><a href="StudentDashboard.jsp">HOME</a></li>
          </span>
          <li><a href="StuProfile?rno=<%= r %>">PROFILE</a></li>
          <li><a href="vwStuRoute?rno=<%= r%>">VIEW YOUR ROUTE</a></li>
          <li><a href="Logout.jsp">LOG OUT </a></li>
        </ul>
      </nav>
      <div class="test">
      <%
    String ch = (String)session.getAttribute("ch");
    if(ch.equals("RouteName")){
%>
      <table  style="margin-top: 10%;position: absolute;">
        <%
       int i=0;
       String st = (String)session.getAttribute("rt");
       ArrayList<RouteInfo> ri = (ArrayList<RouteInfo>)session.getAttribute("searchResults");
       if(ri!=null && ri.size()!=0){
    %>
    
        
        <caption>Search Results for <%=  st%></caption>
        <thead>
          <tr>
            <th scope="col">S.No</th>
            <th scope="col">Route Id</th>
            <th scope="col">Starting Point</th>
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
            <td data-label="Starting Point"><%= (ri.get(i)).getSpoint() %> <a
                href="vwStoppageStudent?rtName=<%=(ri.get(i)).getRoutename()%>">( List More )</a></td>
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
      <%
    }
    if(ch.equals("BusNumber")){
%>
      <table  style="margin-top: 10%;position: absolute;">
        <%
       int i=0;
       String st = (String)session.getAttribute("rt1");
       ArrayList<RouteInfo> ri = (ArrayList<RouteInfo>)session.getAttribute("res");
       if(ri!=null && ri.size()!=0){
    %>
        <caption>Search Results for Bus Number <%=  st%></caption>
        <thead>
          <tr>
            <th scope="col">S.No</th>
            <th scope="col">Route Id</th>
            <th scope="col">Starting Point</th>
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
            <td data-label="Starting Point"><%= (ri.get(i)).getSpoint() %> <a
                href="vwStoppageStudent?rtName=<%=(ri.get(i)).getRoutename()%>">( List More )</a></td>
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

      <%
   }        
%>
    </div>
    </div>
  </body>

</html>

<%
    }
%>