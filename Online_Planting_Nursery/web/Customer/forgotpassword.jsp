<%-- 
    Document   : forgotpassword
    Created on : Feb 3, 2019, 11:12:30 PM
    Author     : VINOTI
--%>

<%@page import="java.util.Random"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, Helvetica, sans-serif;
            }

            /* Full-width input fields */
            input[type=text], input[type=password], input[type=email] {
                width: 100%;
                padding: 15px;
                margin: 5px 0 22px 0;
                display: inline-block;
                border: none;
                background: #f1f1f1;
            }

            input[type=text]:focus, input[type=password],input[type=email]:focus {
                background-color: #ddd;
                outline: none;
            }

            input[type=submit] {
                width: 5cm;
                height: 1.5cm;
                font-size : 20px;
                font-weight: bold;
                font-family: Arial,Helvetica,sans-serif;
                border-radius: 10%;
            }
        </style>
    </head>
    <body style="font-size:25px;">
        <div align="center" style="background-color: #669900;">
            <h1><b>FORGOT YOUR PASSWORD</b></h1>
        </div>
        <br>
        <center>To reset your password, enter your registered email address. We will email you the OTP immediately.
        </center>
        <br>
        <div align="center">
            <form method="post" >
                <table border="0">
                    <tr>
                        <td>Email: </td>
                        <td>&nbsp;<input type="email" name="email" title="Enter your email address"
                                         pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required></td>
                    </tr>
                    <tr>
                    <br>
                    <td colspan="2" align="center"><br>
                        <input type="submit" name="submit" value="VERIFY">
                    </td>
                    </tr>
                </table>
            </form>
            <br><br>
            <a href="home.jsp" style="align-content: center;">BACK TO HOME</a>
        </div>

        <%
            if (request.getParameter("submit") != null) {
                try {
                    Connection con;
                    PreparedStatement ps = null;
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plant_nursery", "root", "root");
                    Statement st = con.createStatement();
                    System.out.println("Connection created");
                    String email = request.getParameter("email");
                    System.out.println(email);
                    session.setAttribute("email", email);
                    ps = con.prepareStatement("select email from customer where email=?");
                    ps.setString(1, email);
                    ResultSet rs = ps.executeQuery();
                    //while (rs.next()) {
                    if (rs.next()) {
                        // Using random method 
                        int otp = (int) (Math.random() * 9000) + 1000;
                        String pin = otp + "";
                        session.setAttribute("pin", pin);
                        String host = "smtp.gmail.com";
                        String user = " your email id ";
                        String pass = " password ";
                        String to = email;
                        String from = " your email id ";
                        String subject = "Online Plant Nursery account password reset";
                        String messageText = "Password reset code. "
                                + "Please use this code to reset the password for the account " + email
                                + ". Here is your code: " + pin
                                + ". Thanks,"
                                + "The Online Plant Nursery account team";
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
                        InternetAddress[] address = {new InternetAddress(to)};
                        msg.setRecipients(Message.RecipientType.TO, address);
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
            alert("You have successfully send an email.");
            window.location = "forgot_process.jsp";
        </script>
        <%
        } else {
        //out.println("Invalid email.");
        %>
        <script type="text/javascript">
            alert("Your email address is invalid.");
            window.location = "forgotpassword.jsp";
        </script>
        <% }
                    //}
                } catch (Exception se) {
                    se.printStackTrace();
                }
            }
        %>

    </body>
</html>
