<%-- 
    Document   : PlantsCare
    Created on : Feb 18, 2019, 8:52:32 AM
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
        <br>
        <form action="productdetails.jsp" method="post">
            <table align="center" cellspacing="10" style="width: 90%; height: 100%; font-size: 30px;">
                <%
                    try {
                        String category, subcategory, productname, image, description;
                        int pid, quantity, price;
                        Class.forName("com.mysql.jdbc.Driver");
                        System.out.println("Welcome");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plant_nursery", "root", "root");
                        System.out.println("Connection created");
                        PreparedStatement ps = con.prepareStatement("select * from product where category='Plants Care'");
                        ResultSet rs = ps.executeQuery();
                            while (rs.next()) {
                                pid = rs.getInt("pid");
                                //session.setAttribute("pid", pid);
                                category = rs.getString("category");

                %>
                <tr>
                    <td rowspan="2">
                        <a href="productdetails.jsp">
                            <%image = rs.getString("image");%>
                            <img src="${pageContext.request.contextPath}/Images/<%=image%>" height="150" width="150">
                            <%session.setAttribute("image", image);%>
                        </a>
                    </td>
                    <td style="width: 65%;">
                        <%productname = rs.getString("productname");%>
                        <a href="productdetails.jsp"><%=productname%>
                            <%session.setAttribute("productname", productname);%>
                        </a>
                    </td>
                </tr>
                <tr>
                    <td><%price = rs.getInt("price");%>
                        ₹<%=price%></td>
                </tr>

                <%
                            }
                        }
                    catch (Exception ex) {
                        System.out.println("OOPs" + ex.getMessage());
                    }
                %>
            </table>
        </form>
    </body>
</html>