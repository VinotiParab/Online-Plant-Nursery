<%-- 
    Document   : update_process
    Created on : Jan 26, 2019, 12:58:22 AM
    Author     : VINOTI
--%>

<%@page import="java.sql.*"%>
<%@page import="java.net.URLDecoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Product Details</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
            body{
                background-image: url("chestnut-leaf.jpg");
                color: lightgoldenrodyellow;
                font-family: fantasy;
                font-variant-ligatures: historical-ligatures;
                font-size:30px;
                size: A4;
                font-weight:bold;
            }
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
    <body align="center">
        <h1 align="center">Update Product Details</h1>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Welcome");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plant_nursery", "root", "root");
                System.out.println("Connection created");
                Statement st = con.createStatement();
                String productname = (String) session.getAttribute("productname");
                PreparedStatement ps = con.prepareStatement("select * from product where productname=productname");
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
        %>

        <form method="post" action="update_save.jsp" 
              align="center" style="width: 90%; height: 100%; font-size: 50px;">
            <!--<input type="text" name="pid" value="<%=rs.getString("pid")%>">-->
            <!--<input type="text" name="pid" value="<%=rs.getString("pid")%>">--><br>
            <table frame="box" align="center" bordercolor="black" border="0" cellspacing="10" 
                   style="width: 100%; height: 100%; font-size: 30px; text-align: center; background-color: white;
                   color: orange; margin-left: 1.5cm">
                <tr>
                    <td rowspan="3" width="10%">
                        <img src="${pageContext.request.contextPath}/Images/<%=rs.getString("image")%>" 
                             height="150" width="150">
                    </td>
                    <td width="60%"><%=rs.getString("productname")%></td>
                    <td rowspan="3"><input type="button" name='edit' value='EDIT' style="margin-top: 2cm"></td>
                </tr>
                <tr>
                    <td>In Stock: <input type="text" name="quantity" value="<%=rs.getString("quantity")%>" disabled></td>
                </tr>
                <tr>
                    <td>Price: <input type="text" name="price" value="<%=rs.getString("price")%>" disabled></td>
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
    </body>
</html>


