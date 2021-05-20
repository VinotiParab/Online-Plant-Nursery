<%-- 
    Document   : cod
    Created on : Feb 13, 2019, 1:53:18 AM
    Author     : VINOTI
--%>

<%@page import="java.sql.*"%>
<jsp:include page="header.jsp" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .btn {
                font-size: 25px;
                background-color: #4CAF50;
                color: white;
                padding: 16px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                opacity: 0.9;
                font-weight: bold;
                font-family: Arial,Helvetica,sans-serif;
                border-radius: 10%;
            }
        </style>
    </head>
    <body>
        <h3 align="center" style="font-family: serif; font-size: 40px; color: chocolate;">
            OTP GENERATE
        </h3><br><br>
        <form action="placeorder.jsp" method="post">
            <center>
                <div align="center" style=" background-color: blanchedalmond; color: darkorchid; width: 10%; text-align:center;
                     font-size: 30px;">
                    OTP: 
                    <%
                        int otp = (int) (Math.random() * 9000) + 1000;
                        String pin = otp + "";
                    %>
                    <%=pin%>
                </div>
            </center>
            <table align="center" border="0" cellspacing="5px" 
                   style="width: 50%; height: 100%; font-size: 30px; background-color: white;
                   font-family: fantasy; font-style: inherit; text-align: center; color: darkorchid;">
                <tr>
                    <td style="font-size: 30px;"><br>Enter the OTP: </td>
                    <td style="font-size: 30px;"><br><input type="text" name="otp1" title="Enter the above OTP" required></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br>
                        <input type="submit" name="submit" value="SUBMIT" class="btn">
                    </td>
                </tr>
            </table>
        </form>
    </center>

    <%
        if (request.getParameter("submit") != null) {
            try {
                Connection con;
                PreparedStatement ps = null;
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plant_nursery", "root", "root");
                Statement st = con.createStatement();
                System.out.println("Connection created");
                String otp1 = request.getParameter("otp1");
                System.out.println(pin);
                if (otp1.equals(pin)) {
    %>
    <script type="text/javascript">
        window.location = "placeorder.jsp";
    </script>
    <%
    } else {
    %>
    <script type="text/javascript">
        alert("Invalid OTP.");
        window.location = "productdetails.jsp";
    </script>
    <%
                }
            } catch (Exception ex) {
                System.out.println(ex);
            }
        }
    %>
</body>
</html>
