<%-- 
    Document   : productlist
    Created on : Dec 26, 2018, 11:52:06 AM
    Author     : VINOTI
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product list</title>
        <style>
            body{
                background-image: url("chestnut-leaf.jpg");
            }
        </style>
    </head>
    <body>
        <h3 style=" font-family: fantasy; font-size: 30px; color: cyan;">
            <center>PRODUCT LIST</center></h3>
        <hr>
        <br><br>
        <form method="post">
            <table frame="box" rules="all" align="center" bordercolor="black" border="4" cellspacing="2px" 
               style="width: 90%; height: 100%; font-size: 20px; background-color: white;
               font-family: fantasy; font-style: inherit; text-align: center; color: darkorchid;">
                <tr>
                    <th>Category</th>
                    <th>Product Name</th>
                    <th>Image</th>
                    <th>Stock</th>
                    <th>Price</th>
                </tr>
                <%
                    try {
                        String category,subcategory,productname,image,quantity,price;
                        Class.forName("com.mysql.jdbc.Driver");
                        System.out.println("Welcome");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plant_nursery", "root", "root");
                        System.out.println("Connection created");
                        Statement st = con.createStatement();
                        PreparedStatement ps = con.prepareStatement("select * from product");
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                            category = rs.getString("category");
                            productname = rs.getString("productname");
                            image = rs.getString("image");
                            quantity = rs.getString("quantity");
                            price = rs.getString("price");
                %>
                <tr>
                    <td><%=category%></td>
                    <td><%=productname%></td>
                    <td><img src="${pageContext.request.contextPath}/Images/<%=image%>" height="100" width="100"></td>
                    <td><%=quantity%></td>
                    <td><%=price%></td>
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