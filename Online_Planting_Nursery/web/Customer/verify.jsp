<%-- 
    Document   : online
    Created on : Feb 13, 2019, 2:03:27 AM
    Author     : VINOTI
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, Helvetica, sans-serif;
                font-size: 25px;
            }

            .d{
                background-color: #669900;
            }

            /* Full-width input fields */
            input[type=text], input[type=password], input[type=email] {
                width: 80%;
                padding: 15px;
                margin: 5px 0 22px 0;
                display: inline-block;
                border: none;
                background: #f1f1f1;
            }

            input[type=text]:focus, input[type=password],input[type=email]:focus {
                background-color: #ddd;
                outline: none;
            }

            input[type=submit] {
                width: 5cm;
                height: 1.5cm;
                font-size : 20px;
                font-weight: bold;
                font-family: Arial,Helvetica,sans-serif;
                border-radius: 10%;
            }
        </style>
    </head>
    <body>
        <div align="center" class="d">
            <h1><b>VERIFICATION</b></h1>
        </div>
        <br>
    <center>
        <form method="post">
            <table border="0">
                <tr>
                    <td>Enter the OTP: </td>
                    <td><input type="text" name="otp" title="Enter otp send to your email address" required></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="submit" value="SUBMIT">
                    </td>
                </tr>
            </table>
        </form>
    </center>

    <%
        if (request.getParameter("submit") != null) {
            try {
                Connection con;
                PreparedStatement ps = null;
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plant_nursery", "root", "root");
                Statement st = con.createStatement();
                System.out.println("Connection created");
                String otp = request.getParameter("otp");
                String PIN = (String) session.getAttribute("pin");
                System.out.println(PIN);
                if (otp.equals(PIN)) {
    %>
    <script type="text/javascript">
        alert("The email address is verified.");
        alert("You have successfully registered.");
        window.location = "login.jsp";
    </script>
    <%
    } else {
        System.out.println("Incorrect OTP");
    %>
    <script type="text/javascript">
        alert("Incorrect OTP.");
        window.location = "signup.jsp";
    </script>
    <%
                }
            } catch (Exception se) {
                se.printStackTrace();
            }
        }
    %>
</body>
</html>
