<%-- 
    Document   : Plants1
    Created on : Feb 20, 2019, 11:01:29 AM
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
                        PreparedStatement ps = con.prepareStatement("select * from product where category='Plants'");
                        ResultSet rs = ps.executeQuery();
                        if (rs.next()) {
                            while (rs.next()) {
                                pid = rs.getInt("pid");
                                //session.setAttribute("pid", pid);
                                category = rs.getString("category");
                                productname = rs.getString("productname");
                                image = rs.getString("image");
                                quantity = rs.getInt("quantity");
                                price = rs.getInt("price");
                %>
                <tr>
                    <td rowspan="3">
                        <a href="productdetails.jsp">
                            <img src="${pageContext.request.contextPath}/Images/<%=image%>" height="150" width="150">
                            <%session.setAttribute("image", image);%>
                        </a>
                    </td>
                    <td style="width: 65%;">
                        <a href="productdetails.jsp"><%=productname%>
                            <%session.setAttribute("productname", productname);%>
                        </a>
                    </td>
                </tr>
                <tr>
                    <td>In Stock: <%=quantity%></td>
                </tr>
                <tr>
                    <td>₹<%=price%></td>
                </tr>

                <%
                            }
                        }
                    } catch (Exception ex) {
                        System.out.println("OOPs" + ex.getMessage());
                    }
                %>
            </table>
        </form>
    </body>
</html>
