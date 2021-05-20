<%-- 
    Document   : changepassword
    Created on : Feb 17, 2019, 12:24:12 PM
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

        <!--<script>
                        var password = document.getElementById("password");
                        var confirm_password = document.getElementById("confirm_password");

                        function validatePassword() {
                            if (password.value !== confirm_password.value) {
                                confirm_password.setCustomValidity("Passwords Don't Match");
                            } else {
                                confirm_password.setCustomValidity('');
                            }
                        }
                        password.onchange = validatePassword;
                        confirm_password.onkeyup = validatePassword;
                    </script>-->
        <style>
            body {
                font-family: Arial, Helvetica, sans-serif;
                font-size: 25px;
            }

            .d{
                background-color: #669900;
            }

            /* Full-width input fields */
            input[type=text], input[type=password], input[type=email] {
                width: 80%;
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
                width: 7cm;
                height: 1.5cm;
                font-size : 20px;
                font-weight: bold;
                font-family: Arial,Helvetica,sans-serif;
                border-radius: 10%;
            }
        </style>
    </head>
    <body>
        <div align="center" class="d">
            <h1><b>CHANGE PASSWORD</b></h1>
        </div>
        <br>
        <div align="center">
            <form method="post">
                <table border="0">
                    <tr>
                        <td>Set New Password: </td>
                        <td><input type = "password" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" 
                                   title="Must contain at least one number and one uppercase and lowercase letter,
                                   and at least 6 or more characters" id="password" required>
                        </td>
                    </tr>
                    <!--<tr>
                        <td>Confirm Password: </td>
                        <td><input type = "password" name="confirm_password" title="Reenter the Password" 
                                   id="confirm_password" required></td>
                    </tr>-->
                    <tr>
                    <br>
                    <td colspan="2" align="center"><br>
                        <input type="submit" name="submit" value="CHANGE PASSWORD">
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
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plant_nursery", "root", "root");
                    Statement st = con.createStatement();
                    System.out.println("Connection created");
                    String email = (String) session.getAttribute("email");
                    System.out.println("last"+email);
                    String password = request.getParameter("password");
                    System.out.println(password);
                    //PreparedStatement ps = con.prepareStatement("select * from customer where email=email");
                    //ResultSet rs = ps.executeQuery();
                    //while (rs.next()) {
                    //int i = st.executeUpdate("update customer set password=md5(password) where email=email");
                    PreparedStatement ps = con.prepareStatement("update customer set password=md5(?) where "
                            + "email='" + email + "'");
                    ps.setString(1, email);
                    int i = ps.executeUpdate();
                    if (i > 0) {
                        String host = "smtp.gmail.com";
                        String user = " your email id ";
                        String pass = " password ";
                        String to = email;
                        String from = " your email id ";
                        String subject = "Your Password Changed Plant Nursery account";
                        String messageText = "Password Changed Successfully."
                                + " The password is changed for the account " + email
                                + ". Thanks,"
                                + "The Plant Nursery account team";
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
            alert("The passsword is successfully changed.");
            window.location = "login.jsp";
        </script>
        <%
        } else {
        %>
        <script type="text/javascript">
            alert("The email address is not valid.");
            window.location = "forgotpassword.jsp";
        </script>
        <%
                    }
                    //} 
                } catch (Exception se) {
                    se.printStackTrace();
                }
            }
        %>

    </body>
</html>
