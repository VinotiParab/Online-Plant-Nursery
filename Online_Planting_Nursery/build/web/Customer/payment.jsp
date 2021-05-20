<%-- 
    Document   : payment
    Created on : Feb 16, 2019, 12:34:04 AM
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
    <body>
    <center>
        <form method="post">
            <table border="0">
                <tr>
                    <td>Enter the OTP: </td>
                    <td><input type="text" name="otp" title="Enter otp send to your email address" required></td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" name="submit" value="CHANGE PASSWORD">
                    </td>
                </tr>
            </table>
    </form>
    </center>
</body>
</html>
<%
    if (request.getParameter("submit") != null) {
    try {
        Connection con;
        PreparedStatement ps = null;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plant_nursery", "root", "root");
        Statement st = con.createStatement();
        System.out.println("Connection created");
        String otp = request.getParameter("otp");
        String PIN = (String) session.getAttribute("pin");
        System.out.println(PIN);
        if (otp.equals(PIN)) {
%>
<script type="text/javascript">
    window.location = "placeorder.jsp";
</script>
<%
        }
else{
System.out.println("Incorrect OTP");
%>
<script type="text/javascript">
    alert("Incorrect OTP.");
    window.location = "buynow.jsp";
</script>
<%
}
    } catch (Exception se) {
        se.printStackTrace();
    }
}
%>
