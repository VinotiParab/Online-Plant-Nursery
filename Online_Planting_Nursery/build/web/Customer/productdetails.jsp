<%-- 
    Document   : productdetails
    Created on : Dec 30, 2018, 12:23:19 AM
    Author     : VINOTI
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.lang.String"%>
<jsp:include page="header.jsp" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <style>
            body{
                background-color: white;
            }
            .btn {
                font-size: 20px;
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
        <br>
        <form action="buynow.jsp" method="post">
            <table frame="box" align="center" bordercolor="black" cellspacing="10" 
                   style="width: 90%; height: 100%; font-size: 20px; background-color: white;">
                <%
                    try {
                        String category, productname, image, description;
                        int quantity, price, pid;
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plant_nursery", "root", "root");
                        Statement st = con.createStatement();
                        //productname = (String) session.getAttribute("productname");
                        productname = request.getParameter("productname");
                        System.out.println(productname);
                        image = (String) session.getAttribute("image");
                        System.out.println(image);
                        ResultSet rs = st.executeQuery("select * from "
                                + "product where productname=productname and image=image");
                        if (rs.next()) {
                            pid = rs.getInt("pid");
                            session.setAttribute("pid", pid);
                            String img = rs.getString("image");
                            String pname = rs.getString("productname");
                            description = rs.getString("description");
                            quantity = rs.getInt("quantity");
                            price = rs.getInt("price");
                %>
                <tr>
                    <td rowspan="4" width="20%">
                        <img src="${pageContext.request.contextPath}/Images/<%=img%>" height="150" width="150">
                        <% session.setAttribute("image", img);%>
                    </td>
                    <td><%=pname%>
                        <% session.setAttribute("productname", pname);%>
                    </td>
                </tr>
                <tr>
                    <td><%=description%>
                        <% session.setAttribute("description", description);%></td>
                </tr>
                <tr><td>₹ <%=price%>
                        <% session.setAttribute("price", price);%></td>
                </tr>
                <tr>
                    <td> 
                        <select name="quantity" style="width: 10%; font-size: 30px" required>
                            <% for (int i = 1; i <= quantity; i++) {
                            %>
                            <option value= "<%= i%>">
                                <%
                                    out.println(i);
                                    //session.setAttribute("quantity", request.getParameter("quantity"));
                                %>
                            </option>
                            <% }
                            %>
                        </select></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <a href="buynow.jsp"><button align="right" class="btn">BUY NOW</button>
                    </td>
                </tr>
                <%}
                %>
            </table>
        </form>
        <%
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>