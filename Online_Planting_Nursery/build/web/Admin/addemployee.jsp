<%-- 
    Document   : addemployee
    Created on : Dec 26, 2018, 10:43:08 AM
    Author     : VINOTI
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
                background-image: url("chestnut-leaf.jpg");
                color: black;
                font-family: fantasy;
                font-variant-ligatures: historical-ligatures;
                font-size:30px;
                size: A4;
                font-weight:bold;
            }
            td{
                font-family: Arial, Helvetica, sans-serif, fantasy; 
                font-style: inherit; 
                font-size: xx-large;
                width: 60%;
                padding: 5px;
            }
            input[type=submit],[type=reset] {
                width: 3cm;
                height: 1.5cm;
                font-size : 20px;
                font-weight: bold;
                font-family: Arial,Helvetica,sans-serif;
                border-radius: 10%;
                align-items: center;
            }
        </style>
    </head>
    <body>
        <div>
            <font size="5">
            <h3 style=" font-family: fantasy; font-size: 30px; color: cyan;">
            <center>ADD EMPLOYEE</center></h3>
            <br><br>
            <form method="post" >
                <br>
                <table border="0" align="center" style=" color: black; width: 70%">
                    <tr>
                        <td>FIRST NAME :</td>
                        <td><input type = "text" name = "fname" placeholder="Enter First Name" style="width: 80%;" 
                                   required="required"/></td>
                    </tr>
                    <tr>
                        <td>LAST NAME :</td>
                        <td><input type = "text" name = "lname" placeholder="Enter Last Name" style="width: 80%;" 
                                   required="required"/></td>                        
                    </tr>
                    <tr>
                        <td>ADDRESS :</td>
                        <td><input type="text" name="address" placeholder="Enter Address" style="width: 80%;" 
                                   required="required"></td>
                    </tr>
                    <tr>
                        <td>MOBILE NO. :</td>
                        <td><input type="text" name="mobile" pattern="^[6-9]\d{9}$" style="width: 80%;" 
                                   required="required"></td>
                    </tr>
                    <tr>
                        <td>EMAIL :</td>
                        <td><input type = "email" placeholder="Enter Email" name="email" 
                                         pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" style="width: 80%;" 
                                         required="required"/></td>
                    </tr>
                    <tr>
                        <td>PASSWORD  :</td>
                        <td><input type = "password" placeholder="Enter Password" name="password" 
                                   pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" 
                                   title="Must contain at least one number and one uppercase 
                                   and lowercase letter, and at least 6 or more characters" 
                                   style="width: 80%;" required="required"/></td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="submit" value="SUBMIT"></td>
                        <td><input type="reset" name="reset" value="RESET"></td>
                    </tr>
                </table>
            </form>
        </div>
        <%
            if(request.getParameter("submit")!=null){
      try
      {
          Class.forName("com.mysql.jdbc.Driver");
          System.out.println("Welcome");
          Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/plant_nursery","root","root");
          System.out.println("Connection created");
          Statement st=con.createStatement();
          PreparedStatement ps = null;
          ResultSet rs=null;
          String fname=request.getParameter("fname");
          String lname=request.getParameter("lname");
          String address=request.getParameter("address");
          String mobile =request.getParameter("mobile");
          String email=request.getParameter("email");
          String pass = request.getParameter("password");
          ps=con.prepareStatement("insert into employee(fname, lname, address, mobile, email, password) "
                  + "values(?,?,?,?,?,md5(?))");
          ps.setString(1, fname);
          ps.setString(2, lname);
          ps.setString(3, address);
          ps.setString(4, mobile);
          ps.setString(5, email);
          ps.setString(6, pass);
          int i=ps.executeUpdate();
          if(i>0)
          {
            %>
            <script type="text/javascript">
                alert("You are sucessfully registered the employee");
                window.location="right.jsp";
            </script>
            <%
          }
          else
          {
            %>
            <script type="text/javascript">
                alert("Invalid registration.....");
                window.location="admin.jsp";
                        </script>
                        <%
          }
      }
      catch(Exception ex)
      {
          ex.printStackTrace();
      }
}
        %>
    </body>
</html>
