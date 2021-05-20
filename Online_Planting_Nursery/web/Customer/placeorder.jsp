<%-- 
    Document   : placeorder
    Created on : Feb 16, 2019, 12:38:37 AM
    Author     : VINOTI
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.AuthenticationFailedException"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
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
        <%!
            String email, shipto, delivery, productname, image, description, mode;
            int pid, quantity, totalprice;
        %>
        <%
            email = (String) session.getAttribute("email");
            if (email != null) {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plant_nursery", "root", "root");
                    Statement st = con.createStatement();
                    shipto = (String) session.getAttribute("name");
                    System.out.println(shipto);
                    delivery = (String) session.getAttribute("address");
                    System.out.println(delivery);
                    System.out.println("Here");

                    int pid = (Integer) (session.getAttribute("pid"));
                    //pid = (int) session.getAttribute("pid");
                    System.out.println("product id" + pid);
                    productname = (String) session.getAttribute("productname");
                    System.out.println(productname);
                    image = (String) session.getAttribute("image");
                    description = (String) session.getAttribute("description");
                    System.out.println("description" + description);
                    //Date date = new Date();
                    quantity = (Integer) session.getAttribute("quantity");
                    System.out.println("Quantity" + quantity);
                    totalprice = (Integer) session.getAttribute("totalprice");
                    System.out.println("totalprice" + totalprice);
                    mode = (String) session.getAttribute("mode");

                    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
                    java.util.Date curDate = new java.util.Date();
                    System.out.println(formatter.format(curDate.getTime()));

                    Date postDate;
                    Calendar c_s = Calendar.getInstance();
                    c_s.setTime(curDate);
                    c_s.add(Calendar.DAY_OF_MONTH, 7);
                    postDate = c_s.getTime();

                    java.sql.Date schedule_date = new java.sql.Date(curDate.getTime());
                    java.sql.Date due_date = new java.sql.Date(postDate.getTime());

                    System.out.println("Sql schedule date " + schedule_date);
                    System.out.println("Sql due date " + due_date);

                    PreparedStatement ps = con.prepareStatement("insert into orderdetails "
                            + "(productid,productname,image,description,ordered,"
                            + "shipto,delivery,delivered,quantity,totalprice,mode) values(?,?,?,?,?,?,?,?,?,?,?)");
                    ps.setInt(1, pid);
                    ps.setString(2, productname);
                    ps.setString(3, image);
                    ps.setString(4, description);
                    ps.setDate(5, schedule_date);
                    ps.setString(6, shipto);
                    ps.setString(7, delivery);
                    ps.setDate(8, due_date);
                    ps.setInt(9, quantity);
                    ps.setInt(10, totalprice);
                    ps.setString(11, "cod");
                    int i = ps.executeUpdate();
                    if (i > 0) {

                        //out.println("You are sucessfully registered");
                        //out.println("</br><a href=\"home.html\">HOME</a>");
                        try {
                            String host = "smtp.gmail.com";
                            String user = " your email id ";
                            String pass = " password ";
                            String to = email;
                            String from = " your email id ";
                            String subject = "Your Order for " + productname + " has been successfully placed";
                            String messageText = productname
                                    + "Quantity " + quantity
                                    + "Amount payable " + totalprice
                                    + "Your product will be delivered within 7 days."
                                    + "Thank you for shopping with PLANT NURSERY!"
                                    + "";
                            boolean sessionDebug = false;

                            Properties props = System.getProperties();

                            props.put("mail.smtp.starttls.enable", "true");
                            props.put("mail.smtp.host", host);
                            props.put("mail.smtp.port", "587");
                            props.put("mail.smtp.auth", "true");
                            props.put("mail.smtp.starttls.required", "true");

                            java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
                            Session mailSession = Session.getDefaultInstance(props, null);
                            mailSession.setDebug(sessionDebug);
                            Message msg = new MimeMessage(mailSession);
                            msg.setFrom(new InternetAddress(from));
                            InternetAddress[] addr = {new InternetAddress(to)};
                            msg.setRecipients(Message.RecipientType.TO, addr);
                            msg.setSubject(subject);
                            msg.setSentDate(new Date());
                            msg.setText(messageText);

                            Transport transport = mailSession.getTransport("smtp");
                            transport.connect(host, user, pass);
                            transport.sendMessage(msg, msg.getAllRecipients());
                            transport.close();
                            System.out.println("message send successfully");
        %>
        <script type="text/javascript">
            alert("Your order is successfully placed.");
            window.location = "home.jsp";
        </script>

        <%
                    } catch (Exception ex) {
                        System.out.println("Mail Error" + ex.getMessage());
                    }

                } else {
                    out.println("Invalid registration.....");
                    out.println("</br><a href=\"reg.html\">Please Registration</a>");
                }
            } catch (SQLException se) {
                System.out.println("SQL Error" + se.getMessage());
            }
        } else {
        %>
        <script type="text/javascript">
            window.location = "login.jsp";
        </script>
        <%
            }
        %>

        

    </body>
</html>