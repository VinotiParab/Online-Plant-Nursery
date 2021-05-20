<%-- 
    Document   : login
    Created on : Dec 26, 2018, 8:17:00 PM
    Author     : VINOTI
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <style>
            body {
                font-family: Arial, Helvetica, sans-serif;
            }

            /* Full-width input fields */
            input[type=text], input[type=password], input[type=email] {
                width: 60%;
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
                width: 3cm;
                height: 1.5cm;
                font-size : 20px;
                font-weight: bold;
                font-family: Arial,Helvetica,sans-serif;
                border-radius: 10%;
            }
        </style>
    </head>
    <body style="font-size:25px;">
        <div align="center" style="background-color: #669900;">
            <h1><b>LOGIN</b></h1>
        </div>
        <br>
        <form method="post">
            <div align="center">
                <table align="center" cellpadding="5" style="text-align: left; vertical-align: middle;">
                    <tr>
                        <td>EMAIL :</td>
                        <td><input type="email" placeholder="Enter Username" name="email" required></td>
                    </tr>
                    <tr>
                        <td>PASSWORD :</td>
                        <td><input type="password" placeholder="Enter Password" name="password" required></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" value="SIGN IN" name="submit"
                                                              width="48px" height="48px"></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><a href="forgotpassword.jsp">FORGOT PASSWORD</a></td>
                    </tr>
                </table>
                <br><br>
                NEW TO PLANT NURSERY? &nbsp;<a href="signup.jsp">SIGN UP.</a>
            </div>


            <%
                if (request.getParameter("submit") != null) {
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");
                    System.out.println(password);
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plant_nursery", "root", "root");
                        System.out.println("Connection created");
                        Statement st = con.createStatement();
                        PreparedStatement ps = con.prepareStatement("select * from customer where email=? "
                                + "and password=md5(?)");
                        ps.setString(1, email);
                        ps.setString(2, password);
                        ResultSet rs = ps.executeQuery();
                        if (rs.next()) {
                            session.setAttribute("email", email);
                            String name = rs.getString("name");
                            session.setAttribute("name", name);
                            //ResultSet rs1 = st.executeQuery("SELECT * FROM customer WHERE email=email");
                            //while(rs1.next()){
                            //rs.getString("name");
                            //}
            %>
            <script>
                alert("You have successfully login!");
                window.location = "home.jsp";
            </script>
            <%} else {
            %>
            <script>
                alert("Invalid email or password.");
                window.location = "login.jsp";
            </script>
            <%
                        }
                    } catch (Exception se) {
                        se.printStackTrace();
                    }
                }
            %>
        </form>
    </body>
</html>