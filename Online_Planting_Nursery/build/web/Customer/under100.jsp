<%-- 
    Document   : under100
    Created on : Feb 4, 2019, 7:26:24 PM
    Author     : VINOTI
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <br><br>
        <table align="center" frame="box" cellspacing="10" 
               style="width: 90%; height: 100%; font-size: 30px; text-align: center;">

            <%
                try {
                    String category, productname, image;
                    int quantity, price;
                    Class.forName("com.mysql.jdbc.Driver");
                    System.out.println("Welcome");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plant_nursery", "root", "root");
                    System.out.println("Connection created");
                    Statement st = con.createStatement();
                    PreparedStatement ps = con.prepareStatement("select * from product where price<=100");
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
                        category = rs.getString("category");
                        productname = rs.getString("productname");
                        image = rs.getString("image");
                        quantity = rs.getInt("quantity");
                        price = rs.getInt("price");
            %>
            <tr>
                <td rowspan="3">
                    <a href="productdetails.jsp">
                        <img src="${pageContext.request.contextPath}/Images/<%=image%>" height="150" width="150">
                        <%session.setAttribute("image", image);%>
                    </a>
                </td>
                <td style="width: 65%;">
                    <a href="productdetails.jsp"><%=productname%>
                        <%session.setAttribute("productname", productname);%>
                    </a>
                </td>
            </tr>
            <tr>
                <td>In Stock: <%=quantity%></td>
            </tr>
            <tr>
                <td>₹ <%=price%></td>
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
    </body>
</html>
