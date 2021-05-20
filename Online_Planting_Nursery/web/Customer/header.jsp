<%-- 
    Document   : header
    Created on : Feb 3, 2019, 4:44:27 PM
    Author     : VINOTI
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js">
        <script>
      function disableClick(){
        document.onclick=function(event){
          if (event.button===2) {
            alert('Right Click Message');
            return false;
          }
        };
      }
      history.pushState(null, null, document.title);
      window.addEventListener('popstate', function () {
          history.pushState(null, null, document.title);
      });
    </script>
        <style>

            .dropbtn {
                background-color: yellowgreen;
                color: white;
                padding: 16px;
                font-size: 20px;
                border: none;
            }
            .dropdown {
                position: relative;
                display: inline-block;
            }
            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f1f1f1;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
            }
            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }
            .dropdown-content a:hover {background-color: yellowgreen;}
            .dropdown:hover .dropdown-content {display: block;}
            .dropdown:hover .dropbtn {background-color: yellowgreen;}

            * {box-sizing: border-box;}
            body {font-family: Verdana, sans-serif;}
            .mySlides {display: none;}
            img {vertical-align: middle;}

            /* Slideshow container */
            .slideshow-container {
                max-width: 2000px;
                height: 400px;
                position: relative;
                margin: auto;}

            /* Caption text */
            .text {
                color: #f2f2f2;
                font-size: 15px;
                padding: 8px 12px;
                position: absolute;
                bottom: 8px;
                width: 100%;
                text-align: center;}

            /* Number text (1/3 etc) */
            .numbertext {
                color: #f2f2f2;
                font-size: 12px;
                padding: 8px 12px;
                position: absolute;
                top: 0;}

            /* The dots/bullets/indicators */
            .dot {
                height: 15px;
                width: 15px;
                margin: 0 2px;
                background-color: #bbb;
                border-radius: 50%;
                display: inline-block;
                transition: background-color 0.6s ease;}

            .active {
                background-color: #717171;}

            /* Fading animation */
            .fade {
                -webkit-animation-name: fade;
                -webkit-animation-duration: 1.5s;
                animation-name: fade;
                animation-duration: 1.5s;}

            @-webkit-keyframes fade {
                from {opacity: .4} 
                to {opacity: 1}
            }

            @keyframes fade {
                from {opacity: .4} 
                to {opacity: 1}
            }

            /* On smaller screens, decrease text size */
            @media only screen and (max-width: 300px) {
                .text {font-size: 11px}
            }
        </style>
        <style>
            .btn {
                font-size: 25px;
                background-color: Transparent;
                color: white;
                border: none;
                cursor: pointer;
                opacity: 0.9;
                font-weight: bold;
                font-family: Arial,Helvetica,sans-serif;
                border-radius: 10%;
            }
        </style>
        <!--styled the drop-down button with a background-color, padding, etc. The .dropdown class uses position:relative, 
        which is needed when we want the drop-down content to be placed right below the drop-down button (using position:absolute).
        The .dropdown-content class holds the actual drop-down menu. It is hidden by default, and will be displayed on hover(see below).
        Note the min-width is set to 160px. Feel free to change this. Tip: If you want the width of the drop-down content to be 
        as wide as the drop-down button, set the width to 100% (and overflow:auto to enable scroll on small screens). 
        Instead of using a border, we have used the box-shadow property to make the drop-down menu look like a "card". 
        We also use z-index to place the drop-down in front of other elements. The :hover selector is used to show the 
        drop-down menu when the user moves the mouse over the drop-down button. -->
    </head>
    <body style=" background-color: white;" onLoad="disableClick()">
        <div style="background-color: whitesmoke; color: #3e8e41; font-family: Georgia">
            <font size="5" color="#3e8e41" style="font-family: Georgia;">
            <img src="transparent_logo.png" height="100" width="100" title="Plant Nursery">
            &nbsp;
            <b>PLANT NURSERY</b>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <%
                response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                String name = (String) session.getAttribute("name");
                String email = (String) session.getAttribute("email");
                if (name == null && email == null) {
            %>
            <a href="signup.jsp" style=" margin-left: 15cm;">
                <button style="font-size: 25px;
                        font-family: Georgia;
                        background-color: Transparent;
                        color: #3e8e41;
                        border: none;
                        cursor: pointer;
                        opacity: 0.9;
                        font-weight: bold;
                        border-radius: 10%;">SIGN UP</button></a>&nbsp;
            <a href="login.jsp"><button style="font-size: 25px;
                                        font-family: Georgia;
                                        background-color: Transparent;
                                        color: #3e8e41;
                                        border: none;
                                        cursor: pointer;
                                        opacity: 0.9;
                                        font-weight: bold;
                                        border-radius: 10%;">LOGIN</button></a>

            <% } else {
            %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Logged in<div class="dropdown">
                <button id="myaccount" class="dropbtn" style="background-color: Transparent;
                        background-repeat:no-repeat;border: none;cursor:pointer;overflow: hidden;
                        outline:none; font-family: Georgia; color: #3e8e41;">
                    <%=session.getAttribute("name")%>
                </button>
                <div class="dropdown-content">
                    <a href="myprofile.jsp">My Profile</a>
                    <a href="orders.jsp">Orders</a>
                    <a href="changepassword.jsp">Change Password</a>
                    <a href="logout.jsp">Logout</a>
                </div>
            </div>
            <% }%>

            </font>

            &nbsp;&nbsp;
        </div>
        <div style="background-color: yellowgreen; color: white; ">
            <div class="dropdown">
                <a href="home.jsp" style="color: white;"><button class="dropbtn">HOME</button></a>
            </div>
            <div class="dropdown">
                <a href="Seeds.jsp" style="color: white;"><button class="dropbtn">SEEDS</button></a>
            </div>

            <div class="dropdown">
                <a href="Plants.jsp" style="color: white;"><button class="dropbtn">PLANTS</button></a>
            </div>
            
            <div class="dropdown">
                <a href="PotsAndPlanters.jsp" style="color: white;"><button class="dropbtn">POTS & PLANTERS</button></a>
            </div>
            
            <div class="dropdown">
                <a href="GardenAndAccessories.jsp" style="color: white;"><button class="dropbtn">GARDEN & ACCESSORIES</button></a>
            </div>
            
            <div class="dropdown">
                <a href="PlantsCare.jsp" style="color: white;"><button class="dropbtn">PLANTS CARE</button></a>
            </div>
            
            <div class="dropdown">
                <a href="Books.jsp" style="color: white;"><button class="dropbtn">BOOKS</button></a>
            </div>
            &nbsp;&nbsp;
            <a href="contactus.jsp"><button style="margin-left: 100px; font-size: 25px;
                                            background-color: Transparent;
                                            color: white;
                                            border: none;
                                            cursor: pointer;
                                            opacity: 0.9;
                                            font-weight: bold;
                                            font-family: Arial,Helvetica,sans-serif;
                                            border-radius: 10%;">CONTACT US</button></a>
        </div>
    </body>
</html>
