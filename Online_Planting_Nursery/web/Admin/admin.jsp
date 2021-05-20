<%-- 
    Document   : admin
    Created on : Feb 15, 2019, 8:30:31 AM
    Author     : VINOTI
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%!
        String email1;
        String email, password;
    %>
    <%
        email = (String) session.getAttribute("email");
        password = (String) session.getAttribute("password");
        if (email == null && password == null) {
            response.sendRedirect("admin_login.jsp");
        } else {
    %>
    <frameset cols="20%,80%">
        <frame src="left.jsp" name="left"></frame>
        <frame src="right.jsp" name="right"></frame>
    </frameset>
    <%}
    %>
</html>