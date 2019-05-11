<%-- 
    Document   : Login
    Created on : Mar 21, 2019, 5:30:20 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>SIGN IN</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="images/icons/favicon.ico" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <!--===============================================================================================-->

    <script type="text/javascript">
        function myValidation() {
            var uname = document.forms["myForm"]["uname"];
            var pwd = document.forms["myForm"]["pass"];
            var stat = document.forms["myForm"]["status"];
            var flag = true;

            if (uname.value == "") {
                alert("UserName cannot be empty");
                uname.style.border = 2 + "px" + " solid red";
                flag = false;
            }

            if (pwd.value == "") {
                alert("Password cannot be empty");
                pwd.style.border = 2 + "px" + " solid red";
                flag = false;
            }

            if (stat.value === "" || !(stat.value === "student" || stat.value === "faculty" || stat.value === "admin")) {
                alert("Status is Invalid");
                stat.style.border = 2 + "px" + " solid red";
                flag = false;
            }

            return flag;
        }
    </script>
</head>

<!-- <body>
		<header>
                    <h1>Bus Management System</h1>
                </header>
		<div class="loginBox">
			    <img src="user.png" class="user">
			    <h2>Log In Here</h2>
                            <form name="myForm" method="post" action="UserLog" onsubmit="return myValidation()">
				<p>User Name</p>
				<input type="text" name="uname" placeholder="User Name">
				<p>Password</p>
                                <input type="password" name="pass" placeholder="••••••">
                                <p>Select Status</p><p>  </p>
                                <select name="status">
                                <option value="default" disabled selected>Status</option>
                                <option value="student">Student</option>
                                <option value="faculty">Faculty</option>
                                <option value="admin">Admin</option>
                                </select><br><br>							
                                <input type="submit" name="submit" value="Sign In">
                                <a href="SignUp.jsp">Not a Member ? SignUp Here</a>
				
			</form>
		</div>
	</body> -->

<body>
    <div class="limiter">
        <div class="container-login100">

            <div class="wrap-login100">
                <div class="login100-pic js-tilt" data-tilt>
                    <img src="images/img-01.png" alt="IMG">
                </div>
                <form class="login100-form validate-form" name="myForm" method="post" action="UserLog"
                    onsubmit="return myValidation()">
                    <span class="login100-form-title">
                        SIGN IN
                    </span>

                    <div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
                        <input class="input100" type="text" name="uname" placeholder="User Name" style="padding:0 30px 0 68px;">
                        <span class="focus-input100"></span>
                        <span class="symbol-input100">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                        </span>
                    </div>

                    
                    <div class="wrap-input100 validate-input" data-validate="Password is required" >
                            <input class="input100" type="password" name="pass" placeholder="••••••"  style="padding:0 30px 0 68px;">
                        <span class="focus-input100"></span>
                        <span class="symbol-input100">
                            <i class="fa fa-lock" aria-hidden="true"></i>
                        </span>
                    </div>

                    <div class="search_categories">

                        <div class="select" >
                            <select required name="status" id="search_categories"  style="padding:0 30px 0 68px;">
                                    <option value="default" disabled selected>Status</option>
                                    <option value="student">Student</option>
                                    <option value="faculty">Faculty</option>
                                    <option value="admin">Admin</option>
                                <!-- <option value="" style="color:gray" selected="selected" disabled hidden>SIGN IN AS
                                </option>
                                <option value="1">student</option>
                                <option value="2">faculty</option>
                                <option value="3">admin</option> -->
                            </select>
                        </div>
                    </div>

                    <div class="container-login100-form-btn">
                        <button class="login100-form-btn" type="submit" name="submit" value="Sign In">
                            SIGN IN
                        </button>
                    </div>

                    <div class="text-center p-t-136">
                        <a class="txt2" href="SignUp.jsp">
                            Create your Account
                            <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    
    <!--===============================================================================================-->
    <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/bootstrap/js/popper.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/select2/select2.min.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/tilt/tilt.jquery.min.js"></script>
    <script>
        $('.js-tilt').tilt({
            scale: 1.1
        })
    </script>
    <!--===============================================================================================-->
    <script src="js/main.js"></script>

</body>
</html>