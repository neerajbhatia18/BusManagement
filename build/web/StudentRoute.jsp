<%-- 
    Document   : StudentRoute
    Created on : Mar 22, 2019, 8:26:17 PM
    Author     : user
--%>

<%@page import="Modal.RouteInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modal.Student"%>
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
  
  <style>
table {
  border-collapse: collapse;
}

table, td, th {
  border: 1px solid black;
}
      </style>

  <script src="all.js"></script>


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
  <link rel="stylesheet" type="text/css" href="css/student.css">
  <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">

</head>

<body>
  <div id="container" style="position:relative;">

    <%
    ArrayList<Student> s = (ArrayList<Student>)session.getAttribute("stuInfo");
    int r = (s.get(0)).getRoll();
%>
    <nav>
      <span id="Logo"><a href="##" style="margin-top: -0.5%;">BUS MANAGEMENT SYSTEM</a></span>
      <ul style="width: 1550;min-height: 0;">
        <li><a href="StudentDashboard.jsp">HOME</a></li>
        <li><a href="StuProfile?rno=<%= r %>">PROFILE</a></li>
        <span id="selected_nav">
          <li><a href="vwStuRoute?rno=<%= r%>">VIEW YOUR ROUTE</a></li>
        </span>
        <li><a href="Logout.jsp">LOG OUT </a></li>
      </ul>
    </nav>

    <div class="test">
      <div class="black_overlay">
        <div class="white_round_back">
          <%
      if(!((s.get(0)).getRoute()==null && (s.get(0)).getPermission()==null)){
       System.out.println("jsp");
       int i=0;
       ArrayList<StoppageInfo> ri = (ArrayList<StoppageInfo>)session.getAttribute("stopInfo");
       
       ArrayList<RouteInfo> rt = (ArrayList<RouteInfo>)session.getAttribute("rest");
       
       if(ri!=null && ri.size()!=0 && rt!=null){
           System.out.println(ri.size());
  %>
          <div class="student_info" style="text-align:center;">MY ROUTE</div>
          <div class="empname"><%=(ri.get(0)).getRname() %></div>
          <div class="branch" style="margin-top:50px;"><%=("BUS NO : " + (rt.get(0)).getBusno()) %></div>
          <div class="branch"><%=("DRIVER NAME : "+(rt.get(0)).getDname()) %></div>
          <div class="branch"><%=("DRIVER CONTACT : "+(rt.get(0)).getDcontact()) %></div>

          <!-- <caption><%= (ri.get(0)).getRname() %><br>
        Driver Bus Number : <%= (rt.get(0)).getBusno() %><br>

        Driver Name : <%= (rt.get(0)).getDname() %><br>

        Driver Contact: <%= (rt.get(0)).getDcontact()%><br>
      </caption> -->



          <!--  <tr>
      <td>
        <h1>Driver Bus Number : <%= (rt.get(0)).getBusno() %></h1>

        <h1>Driver Name : <%= (rt.get(0)).getDname() %></h1>

        <h1>Driver Contact: <%= (rt.get(0)).getDcontact()%></h1>
      </td>
  </tr>-->
        <table style="width:100%">
          <thead>
            <tr>
              <th scope="col">S.No  </th>
              <th scope="col">Stop   </th>
              <th scope="col">Time    </th>
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
            </tr><br>
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
        </div>
      </div>
    </div>
  </div>
</body>

</html>

<%
    }
%>