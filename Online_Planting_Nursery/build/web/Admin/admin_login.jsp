<%-- 
    Document   : admin_login
    Created on : Dec 26, 2018, 11:53:37 AM
    Author     : VINOTI
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
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
    <body style="font-size:25px; align-content: center; background-color: thistle">
        <h1  align="center" style=" align-self: center; color: aquamarine;"><b>
                PLANT NURSERY MANAGEMENT STORE
            </b></h1><br><br>
        <h1  align="center" style=" align-self: center; color: crimson;"><b>LOGIN</b></h1>
        <br>
        <form method="post">
            <div align="center">
                <table align="center" cellpadding="5" style="text-align: center; vertical-align: middle;size:25px;">
                    <tr>
                        <td>EMAIL :</td>
                        <td><input type="email" placeholder="Enter Username" name="email" required
                                   style="size: 30px; height: 30px; width: 8cm"></td>
                    </tr>
                    <tr>
                        <td>PASSWORD :</td>
                        <td><input type="password" placeholder="Enter Password" name="password" required
                                   style="size: 30px; height: 30px; width: 8cm"></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" value="SIGN IN" name="submit"
                                                              width="48px" height="48px"></td>
                    </tr>
                </table>
                <br><br>
            </div>
        </form>
    </body>
</html>

<%
    if (request.getParameter("submit") != null) {
        String email = request.getParameter("email");
        
        String password = request.getParameter("password");
        System.out.println(password);
        if (email.equals("admin@gmail.com") && password.equals("Admin@123")) {
            session.setAttribute("email","admin@gmail.com");
%>
<script>
    alert("You have successfully login!");
    window.location = "admin.jsp";
</script>
<%} else {
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plant_nursery", "root", "root");
        System.out.println("Connection created");
        Statement st = con.createStatement();
        PreparedStatement ps = con.prepareStatement("select fname,email,password from employee where "
                + "email=? and password=md5(?)");
        ps.setString(1, email);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            session.setAttribute("email", email);
            String name = rs.getString("fname");
            session.setAttribute("name", name);
%>
<script>
    alert("You have successfully login!");
    window.location = "admin.jsp";
</script>
<%} 
            } catch (Exception se) {
                se.printStackTrace();
            }
        }
    }
%>