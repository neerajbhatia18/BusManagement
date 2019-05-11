<%-- 
    Document   : SignUp
    Created on : Mar 21, 2019, 5:31:34 PM
    Author     : user
--%>

<%@page import="Modal.StoppageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modal.StoppageInfoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <title>SIGN UP</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script type="text/javascript">
        function myValidation() {
            var fname = document.forms["myForm"]["fname"];
            var lname = document.forms["myForm"]["lname"];
            var branch = document.forms["myForm"]["branch"];
            var rno = document.forms["myForm"]["rno"];
            var email = document.forms["myForm"]["email"];
            var pwd = document.forms["myForm"]["pwd"];
            var cpwd = document.forms["myForm"]["cpwd"];
            var stat = document.forms["myForm"]["status"];
            var pick = document.forms["myForm"]["PickUppoint"];
            var mob = document.forms["myForm"]["mobile"];
            var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            var flag = true;

            if (fname.value == "") {
                alert("First Name cannot be empty");
                fname.style.border = 2 + "px" + " solid red";
                flag = false;
            }

            if (lname.value == "") {
                alert("Last Name cannot be empty");
                lname.style.border = 2 + "px" + " solid red";
                flag = false;
            }

            if (branch.value == "" || !(branch.value == "CSE" || branch.value == "ECE" || branch.value == "CE" || branch.value == "ME")) {
                alert("Branch is Invalid or Empty");
                branch.style.border = 2 + "px" + " solid red";
                flag = false;
            }

            if (rno.value == "") {
                alert("Roll No. cannot be empty");
                flag = false;
                rno.style.border = 2 + "px" + " solid red";
            }

            if (email.value == "" || !(email.value.match(mailformat))) {
                alert("Email cannot be Empty or Invalid");
                email.style.border = 2 + "px" + " solid red";
                flag = false;
            }

            //                               if(pick.value=="" || !(pick.value=="Panchkula" || pick.value=="Zirakpur" || pick.value=="Dhakoli" || pick.value=="Amravati" || pick.value=="Pinjore" || pick.value=="HMT")){
            //                                  alert("Pick-Up Point is Invalid");
            //                                  pick.style.border= 2+"px"+" solid red";
            //                                  flag=false;
            //                               }

            if (pwd.value == "") {
                alert("Password cannot be Empty");
                pwd.style.border = 2 + "px" + " solid red";
                flag = false;
            }

            if (cpwd.value == "") {
                alert("Conform Password cannot be Empty");
                cpwd.style.border = 2 + "px" + " solid red";
                flag = false;
            }

            if (pwd.value != cpwd.value) {
                alert("Password and Conform Password must be same");
                pwd.style.border = 2 + "px" + " solid red";
                cpwd.style.border = 2 + "px" + " solid red";
                flag = false;
            }

            if (mob.value == "" || isNaN(mob.value) || mob.value.length != 10) {
                alert("Mobile Number is Invalid");
                mob.style.border = 2 + "px" + " solid red";
                flag = false;
            }

            if (stat.value == "" || !(stat.value == "student" || stat.value == "faculty" || stat.value == "admin")) {
                alert("Status is Invalid");
                stat.style.border = 2 + "px" + " solid red";
                flag = false;
            }


            return flag;
        }
    </script>


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
</head>

<body>
    <div class="limiter">
        <div class="container-login100">

            <div class="wrap-register100">
                <div class="login100-pic js-tilt" data-tilt>
                    <img src="images/img-01.png" alt="IMG">
                </div>

                <form class="login100-form validate-form" action="UserSignUp" name="myForm" method="post"
                    onsubmit="return myValidation()">
                    <span class="login100-form-title">
                        SIGN UP
                    </span>

                    <div class="wrap-input100 validate-input">
                        <input class="input100" type="text" name="fname" placeholder="First name">
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100 validate-input">
                        <input class="input100" type="text" name="lname" placeholder="Last name">
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100 validate-input">
                        <input class="input100" type="text" name="rno" placeholder="Roll no or Emp ID">
                        <span class="focus-input100"></span>
                    </div>

                    <div class="search_categories">

                        <div class="select">
                            <select name="branch" id="search_categories">
                                <option value="" style="color:gray" selected="selected" disabled hidden>Branch
                                </option>
                                <option value="CSE">CSE</option>
                                <option value="ECE">ECE</option>
                                <option value="CE">CE</option>
                            </select>
                        </div>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
                        <input class="input100" type="text" name="email" placeholder="Email">
                        <span class="focus-input100"></span>
                    </div>

                    <div class="search_categories">

                        <div class="select">
                            <select required name="status" id="search_categories">
                                <option value="" style="color:gray" selected="selected" disabled hidden>ROLE
                                </option>
                                <option value="student">Student</option>
                                <option value="faculty">Faculty</option>
                            </select>
                        </div>
                    </div>

                    <div class="wrap-input100 validate-input">
                        <input class="input100" type="text" name="address" placeholder="Address">
                        <span class="focus-input100"></span>
                    </div>

                    <div class="search_categories">

                        <div class="select">
                            <select required name="PickUppoint" id="search_categories">
                                <option value="" style="color:gray" selected="selected" disabled hidden>PICKUP STOP
                                </option>
                                <%
                    StoppageInfoDAO std = new StoppageInfoDAO();
                    ArrayList<StoppageInfo> sl = std.getAllStoppage();
                    if(sl!=null){
                        for(int i=0;i<sl.size();i++){
                %>
                                <option value="<%= sl.get(i).getStoppage() %>"><%=  sl.get(i).getStoppage() %></option>
                                <%
                        }
                    }
                    else{
                %>
                                <option value="default" disabled selected>Nothing to be selected</option>
                                <%
                    }
                %>
                            </select>
                        </div>
                    </div>

                    <div class="wrap-input100 validate-input">
                        <input class="input100" type="text" name="mobile" placeholder="Mobile Number">
                        <span class="focus-input100"></span>
                    </div>


                    <div class="wrap-input100 validate-input" data-validate="Password is required">
                        <input class="input100" type="password" name="pwd" placeholder="Password">
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Password is required">
                        <input class="input100" type="password" name="cpwd" placeholder="Confirm Password">
                        <span class="focus-input100"></span>
                    </div>

                    <div class="container-login100-form-btn">
                        <button type="submit" value="Sign Up" class="login100-form-btn">
                            SIGN UP
                        </button>
                    </div>

                    <div class="text-center p-t-10">
                        <a class="txt2" href="Login.jsp">
                            Already have an account ?
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