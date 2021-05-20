<%-- 
    Document   : customerlist
    Created on : Jan 20, 2019, 8:08:04 PM
    Author     : VINOTI
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
                background-image: url("chestnut-leaf.jpg");
            }
        </style>
    </head>
    <body>
        <h3 style=" font-family: fantasy; font-size: 30px; color: cyan;">
            <center>CUSTOMER LIST</center></h3>
        <form method="post">
            <table frame="box" rules="all" align="center" bordercolor="black" border="4" cellspacing="2px" 
               style="width: 90%; height: 100%; font-size: 20px; background-color: white;
               font-family: fantasy; font-style: inherit; text-align: center; color: darkorchid;">
                <tr style="color: chartreuse"><th>Sr no.</th>
                        <th>Customer Name</th>
                        <th>Address</th>
                        <th>Mobile</th>
                        <th>Email</th>
                    </tr>
                    <%
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Welcome");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/plant_nursery","root","root");
                System.out.println("Connection created");
                Statement st=con.createStatement();
                PreparedStatement ps=con.prepareStatement("select custid,name,address,mobile,email from customer");
                ResultSet rs=ps.executeQuery();
                while(rs.next())
                        {
                    %>
                    <tr>
                        <% for(int j=0; j<=4; j++)
                        {
                            Object obj=rs.getObject(j+1);
                        %>
                        <td><%=obj.toString()%>
                        </td>
                        <%}}
                        %>
                    </tr>
                </table>
                        <%
                    }
                    catch (Exception e){
                        System.out.println("Error: "+e.getMessage());
                        }
                        %>
        </form>
    </body>
</html>
