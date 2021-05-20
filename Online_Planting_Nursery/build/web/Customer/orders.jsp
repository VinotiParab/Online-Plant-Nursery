<%-- 
    Document   : orders
    Created on : Feb 17, 2019, 9:32:20 AM
    Author     : VINOTI
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page session="true"%>
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
        <h3><center>My Orders</center></h3>
        <form method="post" action="cancelorder.jsp">
            <table frame="box" align="center" bordercolor="black" cellspacing="10" 
                   style="width: 90%; height: 100%; font-size: 20px; background-color: white;">

                <%
                    try {
                        String productname, image;
                        Date delivered;
                        int oid, quantity, totalprice;
                        Class.forName("com.mysql.jdbc.Driver");
                        System.out.println("Welcome");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plant_nursery", "root", "root");
                        System.out.println("Connection created");
                        Statement st = con.createStatement();
                        String shipto = (String) session.getAttribute("name");
                        session.setAttribute("shipto", shipto);
                        System.out.println(shipto);
                        PreparedStatement ps = con.prepareStatement("select * from orderdetails where shipto=shipto");
                        ResultSet rs = ps.executeQuery();
                        if (rs.next()) {
                            while (rs.next()) {
                                oid = rs.getInt("oid");
                                session.setAttribute("oid", oid);
                                productname = rs.getString("productname");
                                image = rs.getString("image");
                                delivered = rs.getDate("delivered");
                                quantity = rs.getInt("quantity");
                                totalprice = rs.getInt("totalprice");
                                SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
                                java.util.Date curDate = new java.util.Date();
                                System.out.println(formatter.format(curDate.getTime()));

                                //Date postDate;
                                //Calendar c_s = Calendar.getInstance();
                                //c_s.setTime(curDate);
                                //c_s.add(Calendar.DATE,-3);
                                //postDate = c_s.getTime();
                                java.sql.Date schedule_date = new java.sql.Date(curDate.getTime());
                                //java.sql.Date due_date = new java.sql.Date(postDate.getTime());

                                System.out.println("Sql schedule date " + schedule_date);
                                //System.out.println("Sql due date " + due_date);
%>
                <tr>
                <tr>
                    <td rowspan="4">
                        <img src="${pageContext.request.contextPath}/Images/<%=image%>" height="150" width="150">
                        <%session.setAttribute("image", image);%>
                        </a>
                    </td>
                    <td style="width: 65%;">
                        <%=productname%>
                        <%session.setAttribute("productname", productname);%>
                    </td>
                </tr>
                <tr>
                    <td>Delivery Date <%=delivered%></td>
                </tr>
                <tr>
                    <td>Quantity <%=quantity%></td>
                </tr>
                <tr>
                    <td>Total Price ₹<%=totalprice%></td>

                    <%
                        if (schedule_date.compareTo(delivered) <= 0) {
                    %>
                    <td><a href="cancelorder.jsp" class="btn">CANCEL ORDER</a></td>
                            <%
                                    }
                                }
                            } else {
                            %><br><br><br<tr align="center" >
                <h1><center>Oops no orders</center></h1>
                </tr>
                <%
                    }
                %>
            </table>
            <%
                } catch (Exception e) {
                    System.out.println("Error: " + e.getMessage());
                }
            %>
        </form>
    </body>
</html>