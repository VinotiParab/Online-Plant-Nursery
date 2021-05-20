<%-- 
    Document   : removeemployee
    Created on : Dec 26, 2018, 11:25:44 AM
    Author     : VINOTI
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remove Employee Page</title>
        <style>
            body{
                background-image: url("chestnut-leaf.jpg");
            }
            </style>
    </head>
    <body>
        <h3 style=" font-family: fantasy; font-size: 30px; color: cyan;">
            <center>REMOVE EMPLOYEE</center></h3>
        <form method="post">
            <table frame="box" rules="all" align="center" bordercolor="black" border="4" cellspacing="2px" 
               style="width: 90%; height: 100%; font-size: 20px; background-color: white;
               font-family: fantasy; font-style: inherit; text-align: center; color: darkorchid;">
                <tr style="color: chartreuse">
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Mobile</th>
                        <th>Email address</th>
                        <th></th>
                    </tr>
                    <%
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Welcome");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/plant_nursery","root","root");
                System.out.println("Connection created");
                Statement st=con.createStatement();
                PreparedStatement ps=con.prepareStatement("select empid,fname,lname,mobile,email from employee");
                ResultSet rs=ps.executeQuery();
                while(rs.next()){
                    %>
                    <tr>
                        <td><%=rs.getString("fname") %></td>
                        <td><%=rs.getString("lname") %></td>
                        <td><%=rs.getString("mobile") %></td>
                        <td><%=rs.getString("email") %></td>
                        <td><a href="deleteemployee.jsp?empid=<%=rs.getString("empid")%>">DELETE</a></td>
                    </tr>
            </table>
            <%}
            }
                catch (Exception e){
                    System.out.println("Error: "+e.getMessage());
                }
            %>
        </form>
    </body>
</html>
