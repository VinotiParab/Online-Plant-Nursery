<%-- 
    Document   : feedback
    Created on : Feb 17, 2019, 12:52:01 AM
    Author     : VINOTI
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <title>Product list</title>
        <style>
            body{
                background-image: url("chestnut-leaf.jpg");
            }
        </style>
    </head>
    <body>
        <h3 style=" font-family: fantasy; font-size: 30px; color: cyan;">
            <center>FEEDBACKS</center></h3>
        <form method="post">
            <table frame="box" rules="all" align="center" bordercolor="black" border="4" cellspacing="2px" 
                   style="width: 90%; height: 100%; font-size: 20px; background-color: white;
                   font-family: fantasy; font-style: inherit; text-align: center; color: darkorchid;">
                <tr>
                    <td>Sr no.</td>
                    <td>Name</td>
                    <td>Subject</td>
                </tr>
                <%
                    try {
                        String fname, lname, subject;
                        Class.forName("com.mysql.jdbc.Driver");
                        System.out.println("Welcome");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plant_nursery", "root", "root");
                        System.out.println("Connection created");
                        Statement st = con.createStatement();
                        PreparedStatement ps = con.prepareStatement("select * from feedback");
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                            fname = rs.getString("fname");
                            lname = rs.getString("lname");
                            subject = rs.getString("subject");
                %>
                <tr>
                    <td><%=rs%></td>
                    <td><%=fname%> <%=lname%>
                    <td><%=subject%></td>
                </tr>
                <%
                    }
                %>
            </table>
            <%
                } catch (Exception e) {
                    System.out.println("Error: " + e.getMessage());
                }
            %>
        </form>
    </body>
</html>