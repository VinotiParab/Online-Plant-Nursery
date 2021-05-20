<%-- 
    Document   : buynow
    Created on : Dec 30, 2018, 1:10:19 PM
    Author     : VINOTI
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<jsp:include page="header.jsp" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            function printDiv(divName) {
                var printContents = document.getElementById(divName).innerHTML;
                w = window.open();
                w.document.write(printContents);
                w.print();
                w.close();
            }
        </script>
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
        <br>
        <%!
            String email, shipto, delivery, productname, image, description;
            int pid, quantity, price, totalprice;
        %>
        <%
            if (session.getAttribute("email") == null) {
        %>
        <script type="text/javascript">
            window.location = "login.jsp";
        </script>
        <%
            } else {
                try {
                    //String strpid=(String)session.getAttribute("pid");
                    //int pid= Integer.parseInt(strpid);
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plant_nursery", "root", "root");
                    Statement st = con.createStatement();
                    email = (String) session.getAttribute("email");
                    ResultSet rs = st.executeQuery("select * from customer where email=email");
                    while (rs.next()) {
                        shipto = rs.getString("name");
                        session.setAttribute("name", shipto);
                        delivery = rs.getString("address");
                        session.setAttribute("address", delivery);
                        productname = (String) session.getAttribute("productname");
                        image = (String) session.getAttribute("image");
                        description = (String) session.getAttribute("description");
                        quantity = Integer.parseInt(request.getParameter("quantity"));
                        session.setAttribute("quantity", quantity);
                        price = (Integer) session.getAttribute("price");
                        totalprice = (quantity) * (price);
                        session.setAttribute("totalprice", totalprice);
                    }
                } catch (Exception se) {
                    se.printStackTrace();
                }
            }
        %>
        <div id='printMe'>
            <table frame="box" rules="all" align="center" bordercolor="black" cellspacing="10" 
                   style="width: 90%; height: 100%; font-size: 20px; background-color: white;">
                <tr>
                    <td>
                        LOGIN<br>
                        <%=shipto%><br>
                        <% session.getAttribute("email");%>
                    </td>
                    <td rowspan="7" style="text-align: center; font-size: 20px; width: 45%">
                        PRICE DETAILS<br>
                        Price (<%=quantity%> item) &nbsp;₹ <%=price%><br>
                        Amount Payable &nbsp;₹ <%=totalprice%><br><br>
                        Your product will be delivered within 7 days.
                        <button onclick="printDiv('printMe')" class="btn">PRINT</button>
                    </td>
                </tr>
                <tr>
                    <td>
                        DELIVERY ADDRESS<br>
                        <%=delivery%>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style="width: 100%; font-size: 20px; background-color: darkseagreen">ORDER SUMMARY</div>
                        <table rules="cols" cellspacing="10" 
                               style="width: 95%; height: 50%; font-size: 20px;">
                            <tr>
                                <td rowspan="4">
                                    <img src="${pageContext.request.contextPath}/Images/<%=image%>" height="150" width="150">
                                </td>
                                <td style="width: 65%;">
                                    <%=productname%>
                                </td>
                            </tr>
                            <tr>
                                <td><%=description%></td>
                            </tr>
                            <tr>
                                <td><%=quantity%></td>
                            </tr>
                            <tr>
                                <td>₹ <%=price%></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="home.jsp"><button align="left" class="btn">REMOVE</button></a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;
                        <a href="cod.jsp"><button align="right" class="btn">CONTINUE</button></a>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>
