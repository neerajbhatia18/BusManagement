<%-- 
    Document   : StudentDashboard
    Created on : Mar 22, 2019, 8:22:23 PM
    Author     : user
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modal.Student"%>
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
  <title>Student HomePage</title>
  <script src="all.js"></script>
  <script type="text/javascript">
    function myValidation() {
      var search = document.forms["myForm"]["search"];
      var stat = document.forms["myForm"]["choices"];
      var flag = true;

      if (search.value == "") {
        alert("Search box cannot be empty");

        flag = false;
      }

      if (stat.value == "" || !(stat.value == "BusNumber" || stat.value == "RouteName")) {
        alert("Choice is Invalid");

        flag = false;
      }

      else if (stat.value == "Category") {
        alert("Please select category");
      }

      return flag;
    }
  </script>

  <link rel="stylesheet" type="text/css" href="css/student.css">
<!--  <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.4/css/bulma.min.css">
    
</head>

<body>
  <%
   ArrayList<Student> s = (ArrayList<Student>)session.getAttribute("stuInfo");
   int r = (s.get(0)).getRoll();
   System.out.println(r);
%>
  <div id="container" style="position:relative;">
    <nav>
      <span id="Logo"><a href="##" style="margin-top: -0.5%;">BUS MANAGEMENT SYSTEM</a></span>
      <ul style="width: 1550;min-height: 0;">
        <span id="selected_nav">
          <li><a href="StudentDashboard.jsp">HOME</a></li>
        </span>
        <li><a href="StuProfile?rno=<%= r %>">PROFILE</a></li>
        <li><a href="vwStuRoute?rno=<%= r%>">VIEW YOUR ROUTE</a></li>
        <li><a href="Logout.jsp">LOG OUT </a></li>
      </ul>
    </nav>

    <div class="test">
      <div class="s131">
        <form action="searchRoute" name="myForm" onsubmit="return myValidation()">
          <div class="inner-form">
            <div class="input-field first-wrap">
              <input id="search" type="text" placeholder="Search your route" name="search" />
            </div>
            <div class="input-field second-wrap">
              <div class="input-select" style="height:68px;">
                <select select name="choice" data-trigger="" >
                  <option placeholder="">Category</option>
                  <option value="RouteName">By Route name </option>
                </select>
              </div>
            </div>
            <div class="input-field third-wrap">
              <button class="btn-search" type="submit">SEARCH</button>
            </div>
          </div>
        </form>
      </div>
    </div>
    <script src="js/extention/choices.js"></script>
    <script>
      const choices = new Choices('[data-trigger]',
        {
          searchEnabled: false,
          itemSelectText: '',
        });

    </script>
    <%
   if((s.get(0)).getRoute().equals("null") && (s.get(0)).getPermission().equals("null") ){   
%>
    <h1>You are not a verified user</h1>
    <%
    }
%>
</body>

</html>
<%
    }
%>