<%-- 
    Document   : contactus
    Created on : Feb 17, 2019, 12:25:24 AM
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
<jsp:include page="header.jsp" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {font-family: Arial, Helvetica, sans-serif;}
            * {box-sizing: border-box;}

            input[type=text],[type=email], select, textarea {
                width: 100%;
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
                margin-top: 6px;
                margin-bottom: 16px;
                resize: vertical;
            }

            input[type=submit] {
                background-color: #4CAF50;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type=submit]:hover {
                background-color: #45a049;
            }

            .container {
                border-radius: 5px;
                background-color: #f2f2f2;
                padding: 20px;
            }
        </style>
    </head>
    <body>

        <h3>Contact Form</h3>

        <div class="container">
            <form method="post">
                <label for="fname">First Name</label>
                <input type="text" id="fname" name="firstname" placeholder="Your name.." required>

                <label for="lname">Last Name</label>
                <input type="text" id="lname" name="lastname" placeholder="Your last name.." required>

                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Enter email" name="email" required>

                <label for="subject">Subject</label>
                <textarea id="subject" name="subject" placeholder="Write something.." style="height:200px" required>
                    
                </textarea>

                <input type="submit" value="Submit">
            </form>
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
                    String firstname = request.getParameter("firstname");
                    String lastname = request.getParameter("lastname");
                    String email = request.getParameter("email");
                    String subject1 = request.getParameter("subject");
                    System.out.println(email);
                    ps = con.prepareStatement("insert into feedback (fname,lname,email,subject) values(?,?,?,?)");
                    ps.setString(1, firstname);
                    ps.setString(2, lastname);
                    ps.setString(3, email);
                    ps.setString(4, subject1);
                    int i = ps.executeUpdate();
                    if (i > 0) {
                        try {
                            String host = "smtp.gmail.com";
                            String user = " your email id ";
                            String pass = " password ";
                            String to = email;
                            String from = " your email id ";
                            String subject = "THANK YOU FROM PLANT NURSERY!";
                            String messageText = "Feedback is a gift. Ideas are the currency of our future. "
                                    + "Let people see you value both feedback and ideas.";
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
            alert("THANK YOU FOR FEEDBACK.");
            window.location = "home.jsp";
        </script>
        <%
            } catch (Exception ex) {
                System.out.println(ex);
            }
        } else {
        %>
        <script type="text/javascript">
            alert("Invalid details. Please check the details.");
            window.location = "contactus.jsp";
        </script>
        <%
                    }
                } catch (Exception se) {
                    se.printStackTrace();
                }
            }
        %>
    </body>
</html>