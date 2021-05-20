<%-- 
    Document   : remove
    Created on : Dec 20, 2018, 6:41:33 PM
    Author     : VINOTI
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remove Product</title>
        <style>
            body{
                background-image: url("chestnut-leaf.jpg");
            }
        </style>
    </head>
    <body>
        <h3 style=" font-family: fantasy; font-size: 30px; color: cyan;">
            <center>DELETE PRODUCT</center></h3>
        <hr><br>
        <br>
        <form method="post" action="delete_process.jsp">
            <table frame="box" align="center" bordercolor="black" border="0" cellspacing="10" 
                   style="width: 90%; height: 100%; font-size: 30px; text-align: center; background-color:white">

                <%
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        System.out.println("Welcome");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plant_nursery", "root", "root");
                        System.out.println("Connection created");
                        Statement st = con.createStatement();
                        PreparedStatement ps = con.prepareStatement("select pid,category,productname,image,description,quantity,price"
                                + " from product");
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                            String productname=rs.getString("productname");
                %>
                <tr>
                    <td rowspan="3" width="20%">
                        <a href="update_process.jsp">
                            <img src="${pageContext.request.contextPath}/Images/<%=rs.getString("image")%>" 
                                 height="150" width="150">
                        </a>
                    </td>
                    <td><%=rs.getString("productname")%>
                    <%session.setAttribute("productname",productname);%></td>
                    <td><a href="delete_process.jsp?productname=<%=rs.getString("productname")%>">DELETE</a></td>
                </tr>
                <tr>
                    <td>In Stock: <%=rs.getString("quantity")%></td>
                </tr>
                <tr>
                    <td>Price: <%=rs.getString("price")%></td>
                </tr>
                <%}
                %></table>
                <%
                    } catch (Exception e) {
                        System.out.println("Error: " + e.getMessage());
                    }
                %>
        </form>
    </body>
</html>