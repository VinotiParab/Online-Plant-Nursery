<%-- 
    Document   : signup
    Created on : Jan 22, 2019, 4:11:32 PM
    Author     : VINOTI
--%>

<%@page import="java.util.Date"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.AuthenticationFailedException"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>REGISTRATION PAGE</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body {
                font-family: Arial, Helvetica, sans-serif;
            }

            /* Full-width input fields */
            input[type=text], input[type=password], input[type=email] {
                width: 50%;
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

            /* Overwrite default styles of hr */
            hr {
                border: 1px solid #f1f1f1;
                margin-bottom: 25px;
            }

            /* Set a style for the submit button */
            .registerbtn {
                font-size: 25px;
                background-color: #4CAF50;
                color: white;
                padding: 16px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 15%;
                opacity: 0.9;
                font-weight: bold;
                font-family: Arial,Helvetica,sans-serif;
                border-radius: 10%;
            }

            .registerbtn:hover {
                opacity: 1;
            }

            /* Add a blue text color to links */
            a {
                color: dodgerblue;
            }

            /* Set a grey background color and center the text of the "sign in" section */
            .signin {
                background-color: #f1f1f1;
                text-align: center;
            }
        </style>
    </head>
    <body style="font-size:25px;">
        <div align="center" style="background-color: #669900;">
            <h1><b>REGISTER</b></h1>
        </div>
        <form method="post" >
            <p>Please fill in this form to create an account.</p>
            <hr>
            Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <input type = "text" name = "name" title="Enter your Name" required/>
            <br>
            Address &nbsp;&nbsp;&nbsp;: <input type = "text" name = "address" title="Enter Address" required/>
            <br>
            Mobile no &nbsp;: <input type = "text" name = "mobile" title="Enter Mobile number" pattern="^[6-9]\d{9}$" required/>
            <br>
            Email    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : <input type = "email" title="Enter Email" name="email" 
                                                                   pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" 
                                                                   required />
            <br>
            Password  : <input type = "password" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" 
                               title="Must contain at least one number and one uppercase and lowercase letter, and at least 6 or more characters" 
                               required/>
            <hr>
            <center>
                <button type="submit" class="registerbtn" name="button">Register</button>
            </center>
            <div align="center">
                <p>Already have an account? <a href="login.jsp">Sign in</a>.</p>
            </div>
        </form>
    </body>
</html>
<%
    try {
        Connection con;
        PreparedStatement ps = null;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plant_nursery", "root", "root");
        Statement st = con.createStatement();
        System.out.println("Connection created");
        String name = request.getParameter("name");
        System.out.println(name);
        String address = request.getParameter("address");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        System.out.println(email);
        String password = request.getParameter("password");
        ps = con.prepareStatement("insert into customer (name,address,mobile,email,password) "
                + "values(?,?,?,?,md5(?))");
        ps.setString(1, name);
        ps.setString(2, address);
        ps.setString(3, mobile);
        ps.setString(4, email);
        ps.setString(5, password);
        int i = ps.executeUpdate();
        if (i > 0) {

            //out.println("You are sucessfully registered");
            //out.println("</br><a href=\"home.html\">HOME</a>");
            try {
                int otp = (int) (Math.random() * 9000) + 1000;
                String pin = otp + "";
                session.setAttribute("pin", pin);
                String host = "smtp.gmail.com";
                String user = " your email id ";
                String pass = " password ";
                String to = email;
                String from = " your email id ";
                String subject = "This is confirmation email for your Online Plant Nursery account. ";
                String messageText = "Please insert this number " + pin
                        + " to activate your account.";
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
    alert("You have successfully send OTP to your email.");
    window.location = "verify.jsp";
</script>
<%
            } catch (Exception ex) {
                System.out.println(ex);
            }

        } else {
            out.println("Invalid registration.....");
            out.println("</br><a href=\"reg.html\">Please Registration</a>");
        }
    } catch (Exception se) {
        se.printStackTrace();
    }
%>

