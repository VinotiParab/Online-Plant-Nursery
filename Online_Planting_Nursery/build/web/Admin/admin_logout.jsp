<%-- 
    Document   : admin_logout
    Created on : Feb 18, 2019, 1:18:32 AM
    Author     : VINOTI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            session.invalidate();

        %>
        <script type="text/javascript">
            alert("You have successfully logged out.");
            window.location="admin_login.jsp";
            </script>
    </body>
</html>
