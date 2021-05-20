<%-- 
    Document   : update_save
    Created on : Feb 14, 2019, 1:54:35 PM
    Author     : VINOTI
--%>

<%@page import="java.net.URLDecoder"%>
<%@page import="java.sql.*"%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String productid = request.getParameter("pid");
            String productname = request.getParameter("productname");
            String quantity = request.getParameter("quantity");
            String price = request.getParameter("price");
            if (productname != null) {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    System.out.println("Welcome");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plant_nursery", "root", "root");
                    System.out.println("Connection created");
                    Statement st = con.createStatement();
                    PreparedStatement ps = con.prepareStatement("update product set quantity=?,price=? where "
                            + "productname='" + productname + "'");
                    ps.setString(1, quantity);
                    ps.setString(2, price);
                    int i = ps.executeUpdate();
                    System.out.println("update");
                    if (i > 0) {
        %>
        <script type="text/javascript">
            alert("Product successfully updated !");
            window.location = "right.jsp";
        </script>
        <%} else {
        %>
        <script type="text/javascript">
            alert("There is a problem in updating Record.");
            window.location = "admin.jsp";
        </script>
        <%}
                } catch (SQLException sql) {
                    request.setAttribute("error", sql);
                }
            }
        %>
    </body>
</html>
