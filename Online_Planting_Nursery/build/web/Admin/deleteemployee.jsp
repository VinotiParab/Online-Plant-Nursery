<%-- 
    Document   : deleteemployee
    Created on : Jan 30, 2019, 11:00:52 AM
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
    <%
        try
            {
                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Welcome");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/plant_nursery","root","root");
                System.out.println("Connection created");
                Statement st=con.createStatement();
                String empid = request.getParameter("empid");
                PreparedStatement ps=con.prepareStatement("select * from employee where empid="+empid);
                ResultSet rs= ps.executeQuery();
                while(rs.next()){
                %>
                <body>
                    <h1>Employee Details</h1>
                    <form method="post">
                        <input type="hidden" name="empid" value="<%=rs.getString("empid") %>">
                        <!--<input type="text" name="empid" value="<%=rs.getString("empid") %>">--><br>
                        First Name:
                        <input type="text" name="fname" disabled="true" value="<%=rs.getString("fname") %>"><br>
                        Last Name:
                        <input type="text" name="lname" disabled="true" value="<%=rs.getString("lname") %>"><br>
                        Address:
                        <input type="text" name="address" disabled="true" value="<%=rs.getString("address") %>"><br>
                        Mobile:
                        <input type="text" name="mobile" disabled="true" value="<%=rs.getString("mobile") %>"><br>
                        Email:
                        <input type="text" name="email" disabled="true" value="<%=rs.getString("email") %>"><br>
                        <input type="submit" value="REMOVE EMPLOYEE">
                    </form>
                    <%}
            } catch (Exception e) {
                e.printStackTrace();
                }
                    %>
                </body>
</html>
<%
    String employeeid=request.getParameter("empid");
    if(employeeid != null){
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Welcome");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/plant_nursery","root","root");
            System.out.println("Connection created");
            Statement st=con.createStatement();
            int i=st.executeUpdate("delete from employee where empid="+employeeid);
            if (i>0){
            %>
                <script type="text/javascript">
                    alert("Employee successfully removed !");
                    window.location= "right.jsp";
                    </script>
                    <% }
}catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
}
%>