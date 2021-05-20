<%-- 
    Document   : left
    Created on : Feb 15, 2019, 8:18:17 AM
    Author     : VINOTI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body bgcolor="#33ff77" style="align-content: center; font-size: 25px;">
        <br>
        <a href="right.jsp" target="right" shape="rect" style="color: white">HOME</a>
        <br><br><br>
        <a href="product.html" target="right" shape="rect" style="color: white">PRODUCT</a>
        <br><br><br>
        <a href="customerlist.jsp" target="right" shape="rect" style="color: white">CUSTOMER LIST</a>
        <br><br><br>
        <a href="orderlist.jsp" target="right" shape="rect" style="color: white">ORDER LIST</a>
        <br><br><br>
        <%
            String email = (String) session.getAttribute("email");
            if (email.equals("admin@gmail.com")) {
        %>
        <a href="employee.html" target="right" shape="rect" style="color: white">EMPLOYEE</a>
        <br><br><br>
        <%
            }
        %>
        <a href="feedback.jsp" target="right" shape="rect" style="color: white">FEEDBACK</a>
        <br><br><br>
        <a href="admin_logout.jsp" target="admin_logout.jsp" style="color: white">LOGOUT</a>

    </body>
</html>