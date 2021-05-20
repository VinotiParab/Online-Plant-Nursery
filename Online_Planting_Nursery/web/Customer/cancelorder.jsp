<%-- 
    Document   : cancelorder
    Created on : Feb 17, 2019, 3:21:32 PM
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
    </head>
    <body>
        <%
            //int oid= Integer.parseInt((String)session.getAttribute("oid"));
            //System.out.println(oid);
            //String shipto = (String) session.getAttribute("shipto");
            //System.out.println(shipto);
            String productname = (String) session.getAttribute("productname");
            //String image = (String) session.getAttribute("image");
            String email=(String) session.getAttribute("email");
            //if (shipto != null && productname != null) {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    System.out.println("Welcome");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plant_nursery", "root", "root");
                    System.out.println("Connection created");
                    Statement st = con.createStatement();
                    int i = st.executeUpdate("delete from orderdetails");
                    if (i > 0) {
                        try {
                            String host = "smtp.gmail.com";
                            String user = " your email id ";
                            String pass = " password ";
                            String to = email;
                            String from = " your email id ";
                            String subject = productname+" from your order has been cancelled";
                            String messageText = "Based on your request, your order"+productname+
                                    " for the below listed item has been cancelled."
                                    + "<table>"
                                    + "<tr rowspan=2>"+productname+"</tr>"
                                    + "</table>"
                                    + "text/html";
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
            alert("Order cancelled successfully !");
            window.location = "home.jsp";
        </script>
        <% }
                    catch (Exception e) {
                    System.out.print(e);
                    e.printStackTrace();
                } }

                } catch (Exception e) {
                    System.out.print(e);
                    e.printStackTrace();
                }
            //}
        %>
    </body>
</html>