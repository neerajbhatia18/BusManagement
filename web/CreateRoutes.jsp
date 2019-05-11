<%-- 
    Document   : CreateRoute
    Created on : Mar 21, 2019, 6:05:52 PM
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
  <title>Create Route</title>

      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.4/css/bulma.min.css">
    
  <link rel="stylesheet" type="text/css" href="css/dashboard.css">
  <style>
      .white_round_back_t 
      {
          background: rgba(0, 0, 0,0.5);
      }
      .white_round_back_t
      {
          left: 20%;
          top: 60%;
      }
  </style>
  <script type="text/javascript">
    function myValidation() {
      var dname = document.forms["myForm"]["dName"];
      var rname = document.forms["myForm"]["rName"];
      var vReg = document.forms["myForm"]["vReg"];
      var caps = document.forms["myForm"]["caps"];
      var sPoint = document.forms["myForm"]["sPoint"];
      var busno = document.forms["myForm"]["Bno"];
      var tcost = document.forms["myForm"]["tCost"];
      var c = document.forms["myForm"]["contact"];
      var flag = true;

      if (rname.value == "") {
        alert("Route Name cannot be empty");
        rname.style.border = 2 + "px" + " solid red";
        flag = false;
      }

      if (busno.value == "" || isNaN(busno.value)) {
        alert("Bus Number cannot be empty");
        busno.style.border = 2 + "px" + " solid red";
        flag = false;
      }

      if (dname.value == "") {
        alert("Driver Name cannot be empty");
        dname.style.border = 2 + "px" + " solid red";
        flag = false;
      }

      if (vReg.value == "") {
        alert("Vehicle Registration Number cannot be empty");
        flag = false;
        vReg.style.border = 2 + "px" + " solid red";
      }

      if (caps.value == "" || (caps.value >= 30 && caps <= 35)) {
        alert("Capacity cannot be Empty Or Invalid");
        caps.style.border = 2 + "px" + " solid red";
        flag = false;
      }

      if (sPoint.value == "") {
        alert("Starting cannot be empty");
        flag = false;
        sPoint.style.border = 2 + "px" + " solid red";
      }

      if (tcost.value == "") {
        alert("Travelling Cost cannot be empty");
        flag = false;
        tcost.style.border = 2 + "px" + " solid red";
      }

      if (c.value == "" || isNaN(c.value) || c.value.length != 10) {
        alert("Contact cannot be empty or invalid");
        flag = false;
        c.style.border = 2 + "px" + " solid red";
      }

      if (flag == true) {
        myFunction();
      }

      return flag;
    }
    function myFunction() {
      location.replace("AddStoppages.html")
    }

  </script>
</head>

<body>
  <div id="container" style="position:relative;">

    <nav>
      <span id="Logo"><a href="##">BUS MANAGEMENT SYSTEM</a></span>
      <ul>
        <li><a href="AdminDashboard.jsp">HOME</a></li>
        <span id="selected_nav">
          <li><a href="CreateRoutes.jsp">CREATE ROUTE</a></li>
        </span>
        <li><a href="DeleteRoute.jsp">DELETE ROUTE</a></li>
        <li><a href="UpdateRoute.jsp">UPDATE ROUTE</a></li>
        <li><a href="vwRoute">VIEW ROUTES</a></li>
        <li><a href="getAllPermission">NEW REGISTRATION </a></li>
        <li><a href="Logout.jsp">LOG OUT </a></li>
      </ul>
    </nav>

    <div class="test">
      <div class="black_overlay">
        <div class="white_round_back_t">
          <form action="saveRoute" method="post" name="myForm" onsubmit="return myValidation()">
              <div class = "inputclass"><div class="control has-icons-left has-icons-right"><input class="input" type="text" name="rName" placeholder="Route Name"></div></div>
            <div class = "inputclass"><div class="control has-icons-left has-icons-right"><input class="input" name="vReg" placeholder="Vehicle Registration No." type="text" width="100px;"></div></div>
            <div class = "inputclass"><div class="control has-icons-left has-icons-right"><input class="input" name="Bno" placeholder="Bus Number" type="text" width="100px;"></div></div>
            <div class = "inputclass"><div class="control has-icons-left has-icons-right"><input class="input" name="dName" placeholder="Driver Name" type="text"></div></div>
            <div class = "inputclass"><div class="control has-icons-left has-icons-right"><input class="input" name="contact" placeholder="Contact No." type="text"></div></div>
            <div class = "inputclass"><div class="control has-icons-left has-icons-right"><input class="input" name="caps" placeholder="Capacity" type="text"></div></div>
            <div class = "inputclass"><div class="control has-icons-left has-icons-right"><input class="input" type="text" name="sPoint" placeholder="Starting Point"></div></div>
                <div class = "inputclass"><div class="control has-icons-left has-icons-right"><input class="input" type="text" name="tCost" placeholder="Travelling Cost"></div></div>
                <center> <div class = "inputclass"><input class="button is-link" id="submit" type="submit" value="Next"></div></center>
<!--             <a class="button is-success">Submit</a>-->
          </form>
        </div>
      </div>
    </div>


  </div>
</body>

</html>
<%
    }
%>