<%-- 
    Document   : delete_process
    Created on : Feb 13, 2019, 11:54:47 PM
    Author     : VINOTI
--%>

<%@page import="java.net.URLDecoder"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String pname = (String) session.getAttribute("productname");
            String productname = request.getParameter("productname");
            if (productname != null) {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    System.out.println("Welcome");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plant_nursery", "root", "root");
                    System.out.println("Connection created");
                    Statement st = con.createStatement();
                    //int i = st.executeUpdate("delete from product where productname=?");
                    String query = "delete from product where productname=?";
                    PreparedStatement ps = con.prepareStatement(query);
                    ps.setString(1, productname);
                    System.out.println(productname);
                    int a = ps.executeUpdate();
                     if(a>0)
            {
        %>
        <script type="text/javascript">
            alert("Product successfully deleted !");
            window.location = "right.jsp";
        </script>
        <%} 
}catch (Exception e) {
                    System.out.print(e);
                    e.printStackTrace();
                }
            }
        %>
    </body>
</html>
