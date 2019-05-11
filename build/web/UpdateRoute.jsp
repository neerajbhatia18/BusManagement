<%-- 
    Document   : UpdateRoute
    Created on : Mar 21, 2019, 6:07:45 PM
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
  <title>Update Routes</title>
  <script src="all.js"></script>
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
      border: 5px solid rgba(0, 0, 0, .5);
      background: rgba(0, 0, 0, .5);
      box-sizing: content-box;
      font-size: 2.5em;
      margin: .5em 0 .85em;
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
      display: none;
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
        display: none;
        margin-bottom: .625em;
      }

      table td {
        border-bottom: 1px solid #141111cc;
        display: none;
        font-size: .8em;
        text-align: right;
      }

      table td button {
        border-bottom: 1px solid #ddd;
        display: none;
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



    /*...................*/
    table {
      border: 1px solid #ccc;
      border-collapse: collapse;
      margin: 0;
      padding: 0;
      width: 100%;
      table-layout: fixed;
    }

    table caption {
      border: 5px solid rgba(0, 0, 0, .5);
      background: rgba(0, 0, 0, .5);
      box-sizing: content-box;
      font-size: 2.5em;
      margin: .5em 0 .85em;
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

    @media screen and (max-width: 1000px) {

      .demoBox {
        flex-direction: column;
      }

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
        display: none;
        margin-bottom: .625em;
      }

      table td {
        border-bottom: 1px solid #141111cc;
        display: none;
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
  <script type="text/javascript">
    function myfunction() {
      var myWindow = window.open("ad1.html", "MsgWindow", "width=600,height=600");
    }
    function mychoice() {
      var stat = document.forms["myForm"]["choice"];
      var v1 = document.forms["myForm"]["v1"];
      var v2 = document.forms["myForm"]["v2"];
      var v3 = document.forms["myForm"]["v3"];
      var v4 = document.forms["myForm"]["v4"];
      var v5 = document.forms["myForm"]["v5"];
      var v6 = document.forms["myForm"]["v6"];
      var v7 = document.forms["myForm"]["v7"];
      var v8 = document.forms["myForm"]["v8"];
      var v9 = document.forms["myForm"]["v9"];
      var v10 = document.forms["myForm"]["v10"];
      var v11 = document.forms["myForm"]["v11"];
      var v111 = document.forms["myForm"]["v111"];
      if (stat.value == "rno") {
        v1.style.display = "block";
        v2.style.display = "block";
        v3.style.display = "none";
        v4.style.display = "none";
        v5.style.display = "none";
        v6.style.display = "none";
        v7.style.display = "none";
        v8.style.display = "none";
        v9.style.display = "none";
        v10.style.display = "none";
        v111.style.display = "none";
      }
      if (stat.value == "bno") {
        v1.style.display = "none";
        v2.style.display = "none";
        v3.style.display = "block";
        v4.style.display = "block";
        v5.style.display = "block";
        v6.style.display = "block";
        v7.style.display = "none";
        v8.style.display = "none";
        v9.style.display = "none";
        v10.style.display = "none";
        v111.style.display = "none";
      }
      if (stat.value == "drname") {
        v1.style.display = "none";
        v2.style.display = "none";
        v3.style.display = "none";
        v4.style.display = "none";
        v5.style.display = "none";
        v6.style.display = "none";
        v7.style.display = "block";
        v8.style.display = "block";
        v9.style.display = "block";
        v10.style.display = "block";
        v111.style.display = "block";
      }
      if (stat.value == "drcontact") {
        v1.style.display = "none";
        v2.style.display = "none";
        v3.style.display = "none";
        v4.style.display = "none";
        v5.style.display = "none";
        v6.style.display = "none";
        v7.style.display = "none";
        v8.style.display = "none";
        v9.style.display = "block";
        v10.style.display = "block";
        v111.style.display = "block";
      }
      if (stat.value == "rno" || stat.value == "bno" || stat.value == "drcontact" || stat.value == "drname") {
        v11.style.display = "block";
      }
    }

    function myValidation() {
//      var stat = document.forms["myForm"]["choice"];
//      var v1 = document.forms["myForm"]["v1"];
//      var v2 = document.forms["myForm"]["v2"];
//      if (stat.value == "" || !(stat.value == "rno" || stat.value == "bno")) {
//        alert("Category is empty or invalid");
//        stat.style.border = 2 + "px" + " solid red";
//        flag = false;
//      }
//      if (v1.value == "") {
//        alert("Value to be updated cannot be empty");
//        v1.style.border = 2 + "px" + " solid red";
//        flag = false;
//      }
//      if (v2.value == "") {
//        alert("Updated Value cannot be empty");
//        v2.style.border = 2 + "px" + " solid red";
//        flag = false;
//      }
//
//      return flag
    }
  </script>
  <link rel="stylesheet" type="text/css" href="css/updateroute.css">
  <link rel="stylesheet" type="text/css" href="css/dashboard.css">
  <link rel="stylesheet" type="text/css" href="css/animate.css">
  <link rel="stylesheet" media="screen and (max-width: 1000px) and (min-width: 450px)" href="responsiveformss1.css" />
  <link rel="stylesheet" media="screen and (max-width: 500px) and (min-width: 110px)" href="responsiveformss2.css" />
  <link rel="stylesheet" media="screen and (max-width: 100px) and (min-width: 50px)" href="responsiveformss3.css" />

</head>


<body>

  <div class="container" style="position:relative;">
    <nav>
      <span id="Logo"><a href="##">BUS MANAGEMENT SYSTEM</a></span>
      <ul>
        <li><a href="AdminDashboard.jsp">HOME</a></li>
        <li><a href="CreateRoutes.jsp">CREATE ROUTE</a></li>

        <li><a href="DeleteRoute.jsp">DELETE ROUTE</a></li>

        <span id="selected_nav">
          <li><a href="UpdateRoute.jsp">UPDATE ROUTE</a></li>
        </span>
        <li><a href="vwRoute">VIEW ROUTES</a></li>
        <li><a href="getAllPermission">NEW REGISTRATION </a></li>
        <li><a href="Logout.jsp">LOG OUT </a></li>
      </ul>
    </nav>

    <div class="test">
    <div class="demoBox" style="position: absolute;margin-top: 10%;">

      <div class="item1" style="
      margin-top: 10;
      float: left;
  ">
        <div class="envelope">
          <form action="UpdRoute" name="myForm" method="post">
            <input type="text" name="rName" placeholder="Update Route" readonly="readonly" id="nroute">
            <select id="ch" name="choice" onchange="mychoice()">
              <option disabled selected>Category</option>
              <option value="rno">Route Name</option>
              <option value="drname">Driver Name</option>
              <option value="drcontact">Driver Contact</option>
            </select>
            <input type="text" name="v1" placeholder="Enter Old Route Name">
            <input type="text" name="v2" placeholder="Enter New Route Name">

            <input type="text" name="v3" placeholder="Enter Old Bus Number">
            <input type="text" name="v4" placeholder="Enter New Bus Number">
            <input type="text" name="v5" placeholder="Enter Old Vehicle Reg. No.">
            <input type="text" name="v6" placeholder="Enter New Vehicle Reg. No.">

            <input type="text" name="v111" placeholder="Enter Route Name">
            <input type="text" name="v7" placeholder="Enter Old Driver Name">
            <input type="text" name="v8" placeholder="Enter New Driver Name">
            <input type="text" name="v9" placeholder="Enter Old Driver Contact Number">
            <input type="text" name="v10" placeholder="Enter New Driver Contact Number">
            <input type="submit" name="v11" value="Update" style="width:50%;">
          </form>
        </div>

      </div>
      <div class="item2" style="overflow: hidden;margin-left: 30%;">
        <table>
          <%
       int i=0;
       ArrayList<RouteInfo> ri = (ArrayList<RouteInfo>)session.getAttribute("URoute");
       if(ri==null){
           ri = (ArrayList<RouteInfo>)session.getAttribute("routess");
       }
       if(ri!=null && ri.size()!=0){
      %>
          <caption>View Routes</caption>
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


      </div>
    </div>
  </div>
  </div>
</body>

</html>
<%
    }
%>