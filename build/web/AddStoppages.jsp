<%-- 
    Document   : AddStoppages
    Created on : Mar 21, 2019, 6:06:40 PM
    Author     : user
--%>

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
  <title>Add Stoppages</title>
</head>

<!-----Including CSS for different screen sizes----->
<link rel="stylesheet" type="text/css" href="responsiveform.css">
<link rel="stylesheet" type="text/css" href="css/dashboard.css">
<link rel="stylesheet" media="screen and (max-width: 1200px) and (min-width: 601px)" href="responsiveform1.css" />
<link rel="stylesheet" media="screen and (max-width: 600px) and (min-width: 351px)" href="responsiveform2.css" />
<link rel="stylesheet" media="screen and (max-width: 350px)" href="responsiveform3.css" />

<!-- JavaScript Code for create new input boxes -->
<script>
  var flag = true;
  var c = 0;
  function addTextBox(btn) {
    c++;

    var element1 = document.createElement("input");
    var element2 = document.createElement("input");

    element1.setAttribute("type", "text");
    element1.setAttribute("value", "");
    element1.setAttribute("name", "sPoint" + c);
    element1.setAttribute("placeholder", "Stoppage");
    element2.setAttribute("type", "text");
    element2.setAttribute("value", "");
    element2.setAttribute("name", "Tim" + c);
    element2.setAttribute("placeholder", "hh:mm");

    btn.parentNode.insertBefore(element1, btn);

    btn.parentNode.insertBefore(element2, btn);


  }

  function getCount() {
    return c;
  }

  function Multiple(btn) {
    // var f = return myValidation();
    if (myValidation()) {
      addTextBox(btn);
    }
  }

  function myValidation() {
    var sPoint = document.forms["myForm"]["sPoint" + c];
    var obj = document.forms["myForm"]["Tim" + c];

    var flag = true;

    if (sPoint.value == "") {
      alert("Starting Point cannot be empty");
      sPoint.style.border = 2 + "px" + " solid red";
      flag = false;
    }

    var timeValue = obj.value;
    if (timeValue == "" || timeValue.indexOf(":") < 0) {
      alert("Invalid Time format");
      obj.style.border = 2 + "px" + " solid red";
    }
    else {
      var sHours = timeValue.split(':')[0];
      var sMinutes = timeValue.split(':')[1];

      if (sHours == "" || isNaN(sHours) || parseInt(sHours) > 23) {
        alert("Invalid Time format");
        obj.style.border = 2 + "px" + " solid red";
      }
      else if (parseInt(sHours) == 0)
        sHours = "00";
      else if (sHours < 10)
        sHours = "0" + sHours;

      if (sMinutes == "" || isNaN(sMinutes) || parseInt(sMinutes) > 59) {
        alert("Invalid Time format");
        return false;
      }
      else if (parseInt(sMinutes) == 0)
        sMinutes = "00";
      else if (sMinutes < 10)
        sMinutes = "0" + sMinutes;

      //obj.value = sHours + ":" + sMinutes;        
    }


    return flag;

  }

  function validateTime(obj) {
    var timeValue = obj.value;
    if (timeValue == "" || timeValue.indexOf(":") < 0) {
      alert("Invalid Time format");
      return false;
    }
    else {
      var sHours = timeValue.split(':')[0];
      var sMinutes = timeValue.split(':')[1];

      if (sHours == "" || isNaN(sHours) || parseInt(sHours) > 23) {
        alert("Invalid Time format");
        return false;
      }
      else if (parseInt(sHours) == 0)
        sHours = "00";
      else if (sHours < 10)
        sHours = "0" + sHours;

      if (sMinutes == "" || isNaN(sMinutes) || parseInt(sMinutes) > 59) {
        alert("Invalid Time format");
        return false;
      }
      else if (parseInt(sMinutes) == 0)
        sMinutes = "00";
      else if (sMinutes < 10)
        sMinutes = "0" + sMinutes;

      obj.value = sHours + ":" + sMinutes;
    }

    return true;
  }

</script>

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
      <%
        RouteInfo ri = (RouteInfo)session.getAttribute("route");
        String st = (String)session.getAttribute("rname");  
        //System.out.println("String : "+st+" "+session.getId());
    %>
      <%
       int c;
    %>
      <div class="envelope" style="margin-top: 10%;">
        <form action="saveStoppage?id=" name="myForm" method="post" onsubmit="return myValidation()">
          <input type="text" name="rName" placeholder="<%=st%>" value="<%=st%>" readonly="readonly" id="nroute">
          <input type="text" name="sPoint0" placeholder="Enter Stop Name">
          <input type="text" name="Tim0" placeholder="Enter Time (hh:mm)">
          <input type="submit" value="Next" style="width:50%;">
        </form>
        <form action="vwRoute" name="myForm" method="post">
          <input type="submit" value="Finish" style="width:50%;">
        </form>


      </div>
    </div>

  </div>
</body>

</html>
<%
    }
%>