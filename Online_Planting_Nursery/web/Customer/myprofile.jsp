<%-- 
    Document   : myprofile
    Created on : Jan 28, 2019, 3:01:15 PM
    Author     : VINOTI
--%>

<%@page import="java.sql.*"%>
<jsp:include page="header.jsp" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Account</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script>

            $(document).ready(function () {

                $("form input[type=text]").prop("disabled", true);
                $("input[name=edit]").on("click", function () {
                    $("input[type=text],input[type=checkbox],select").removeAttr("disabled");
                })
                $("input[name=save]").on("click", function () {
                    $("input[type=text],input[type=checkbox],select").prop("disabled", true);
                })
            })
        </script>
        <style>
            td{
                font-family: Arial, Helvetica, sans-serif, fantasy; 
                font-style: inherit; 
                font-size: xx-large;
                width: 60%;
                padding: 5px;
            }
            input[type=submit],[type=reset], [type=button] {
                width: 3cm;
                height: 1.5cm;
                font-size : 20px;
                font-weight: bold;
                font-family: Arial,Helvetica,sans-serif;
                border-radius: 10%;
                align-items: center;
            }
        </style>
    </head>
    <body bgcolor="white">
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Welcome");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plant_nursery", "root", "root");
                System.out.println("Connection created");
                Statement st = con.createStatement();
                String pid = request.getParameter("pid");
                PreparedStatement ps = con.prepareStatement("select custid, name, address, mobile, email from customer "
                        + "where email=email");
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
        %>
        <h1>Personal Details</h1>
        <form method="post">
<!--<input type="text" name="custid" value="<%=rs.getString("custid")%>">-->
<!--<input type="text" name="custid" value="<%=rs.getString("custid")%>">--><br>
            <table frame="box" align="center" bordercolor="black" border="0" cellspacing="10" 
                   style="width: 80%; height: 100%; font-size: 20px; text-align: center; background-color: white;
                   color: orange; margin-left: 1.5cm">
                <tr>
                    <td width="10%">
                        Name:
                    </td>
                    <td width="60%">
                        <input type="text" name="name" value="<%=rs.getString("name")%>" disabled></td>
                    <td rowspan="3"><input type="button" name='edit' value='EDIT' style="margin-top: 2cm"></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><input type="text" name="address" value="<%=rs.getString("address")%>" disabled></td>
                </tr>
                <tr>
                    <td>Mobile Number:</td>
                    <td><input type="text" name="mobile" value="<%=rs.getString("mobile")%>" disabled></td>
                </tr>
                <tr>
                    <td>Email Address:</td>
                    <td><input type="text" name="email" value="<%=rs.getString("email")%>" disabled></td>
                </tr>
                <tr>
                    <td colspan="3"><input type="submit" value="SUBMIT" name="submit"></td>
                </tr>
            </table>
        </form>
        <%}
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        <%
            String custid = request.getParameter("custid");
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String mobile = request.getParameter("mobile");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            if (custid != null) {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    System.out.println("Welcome");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plant_nursery", "root", "root");
                    System.out.println("Connection created");
                    Statement st = con.createStatement();
                    PreparedStatement ps = con.prepareStatement("update customer set name=?,address=?,mobile=?"
                            + "email=?,password=md5(?) where custid=custid");
                    ps.setString(1, name);
                    ps.setString(2, address);
                    ps.setString(3, mobile);
                    ps.setString(4, email);
                    ps.setString(5, password);
                    int i = ps.executeUpdate();
                    System.out.println("update");
                    if (i > 0) {
        %>
        <script type="text/javascript">
            alert("Personal details successfully updated !");
            window.location = "home.jsp";
        </script>
        <%} else {
        %>
        <script type="text/javascript">
            alert("There is a problem in updating details.");
            window.location = "myprofile.jsp";
        </script>
        <%}
                } catch (SQLException sql) {
                    request.setAttribute("error", sql);
                }
            }
        %>
    </body>
</html>