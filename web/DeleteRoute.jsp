<%-- 
    Document   : DeleteRoute
    Created on : Mar 21, 2019, 6:07:14 PM
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
  <title>Delete Routes</title>
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
  border: 5px solid rgba(0,0,0,.5); 
  background: rgba(0,0,0,.5);
  box-sizing: content-box;
  font-size: 2.5em;
  margin: .5em 0 .85em;
  color:white;
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

table td{
  font-weight: bold;
}

table td a{
  display: block;
  color: #f1f1f1;
  text-align: center;
  text-decoration: none;
  font-size: 12px;
  background-color:dodgerblue;
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
  
  table td{
    border-bottom: 1px solid #141111cc;
    display: block;
    font-size: .8em;
    text-align: right;
  }
  table td button{
    border-bottom: 1px solid #ddd;
    display: block;
    font-size: .8em;
    text-align: center;
  }
  
  table td::before {
  
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
      <script src="all.js"></script>
<script type="text/javascript">
  function myfunction(){
    var myWindow = window.open("ad1.html", "MsgWindow", "width=600,height=600");
  }
  function myValidation(){
    var stat = document.forms["myForm"]["choice"];
    var rno = document.forms["myForm"]["rno"];
    if(stat.value==""|| !(stat.value=="rname"))
    {
      alert("Category is empty or invalid");
      stat.style.border= 2+"px"+" solid red";
      flag=false;
    }
    if(rno.value=="")
    {
      alert("Route Name cannot be empty");
      rno.style.border= 2+"px"+" solid red";
      flag=false;
    }

    return flag
  }
</script>
    <link rel="stylesheet" type="text/css" href="css/dashboard.css">
    <link rel="stylesheet" type="text/css" href="responsiveforms.css">
    <link rel="stylesheet" media="screen and (max-width: 1200px) and (min-width: 450px)" href="responsiveforms1.css" />
    <link rel="stylesheet" media="screen and (max-width: 800px) and (min-width: 210px)" href="responsiveforms2.css" />
    <link rel="stylesheet" media="screen and (max-width: 300px)" href="responsiveforms3.css" />
</head>
 <div class="container" style="position:relative;">
    <nav>
      <span id="Logo"><a href="##">BUS MANAGEMENT SYSTEM</a></span>
      <ul>
        <li><a href="AdminDashboard.jsp">HOME</a></li>
        <li><a href="CreateRoutes.jsp">CREATE ROUTE</a></li>
        <span id="selected_nav">
        <li><a href="DeleteRoute.jsp">DELETE ROUTE</a></li>
        </span>
        <li><a href="UpdateRoute.jsp">UPDATE ROUTE</a></li>
        <li><a href="vwRoute">VIEW ROUTES</a></li>
        <li><a href="getAllPermission">NEW REGISTRATION </a></li>
        <li><a href="Logout.jsp">LOG OUT </a></li>
      </ul>
    </nav>

     <div class="test">
    <div class="demoBox" style="position: absolute;margin-top: 10%;">


    <div class="item1" style="float: left;">
     <div class="envelope">
            <form action="DelRoute" name="myForm" method="post" onsubmit="return myValidation()">
            <input type="text" name="rName" placeholder="Delete Route" readonly="readonly" id="nroute">
            <select name="choice">
                <option disabled selected>Category </option>
                <option value="rname">Route Name</option>
            </select>
            <input type="text" name="rno" placeholder="Enter Route Name">
            <input type="submit" value="Delete" style="width:50%;">
            </form>
        </div>  
    
    </div>
    <div class="item2" style="overflow: hidden;">
  <table>
      <%
       int i=0;
       ArrayList<RouteInfo> ri = (ArrayList<RouteInfo>)session.getAttribute("DRoute");
       if(ri==null){
           ri = (ArrayList<RouteInfo>)session.getAttribute("routess");
       }
       if(ri!=null && ri.size()!=0){
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
      <td data-label="Starting Point"><%= (ri.get(i)).getSpoint() %> <a href="vwStoppage?rtName=<%=(ri.get(i)).getRoutename()%>">( List More )</a></td>
      <td data-label="Capacity"><%= (ri.get(i)).getCapacity() %></td>
      <td data-label="Driver Name"><%= (ri.get(i)).getDname() %>></td>
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
