<%-- 
    Document   : add_process
    Created on : Jan 18, 2019, 11:45:18 PM
    Author     : VINOTI
--%>

<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.annotation.MultipartConfig"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    </head>
    <body>

        <%!
            PreparedStatement ps;
            ResultSet rs;
            File file;
            int maxSize = 5000 * 1024;
            int maxFactSize = 5000 * 1024;
            String path = "C:/Users/Documents/NetBeansProjects/Online_Planting_Nursery/web/Images/";
            String str;
        %>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Welcome");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plant_nursery", "root", "root");
                System.out.println("Connection created");
                Statement st = con.createStatement();
                ps = null;
                rs = null;
                String category = null, productname = null;
                String description = null, quantity = null, price = null;
                String type = request.getContentType();
                System.out.println(type);
                if (type.indexOf("multipart/form-data") >= 0) {   //check is it multipart or not
                    System.out.print("its an multipart");
                    DiskFileItemFactory disFact = new DiskFileItemFactory();  //for temporary storage
                    disFact.setSizeThreshold(maxFactSize); //limitation on storage i.e threshold
                    disFact.setRepository(new File("c:\\temp")); //temporary file transfer
                    ServletFileUpload upload = new ServletFileUpload(disFact);
                    upload.setSizeMax(maxSize); //setting file size
                    List lis = upload.parseRequest(request);
                    Iterator itr = lis.iterator();
                    while (itr.hasNext()) { //for fetching data
                        FileItem item = (FileItem) itr.next();
                        if (item.isFormField()) {

                            if (item.getFieldName().equals("category")) {
                                category = item.getString();
                            }
                            if (item.getFieldName().equals("productname")) {
                                productname = item.getString();
                            }
                            if (item.getFieldName().equals("description")) {
                                description = item.getString();
                            }
                            if (item.getFieldName().equals("quantity")) {
                                quantity = item.getString();
                            }
                            if (item.getFieldName().equals("price")) {
                                price = item.getString();
                            }
                        } else {
                            str = item.getName();
                            str = productname + (str.substring(str.indexOf(".")));  //for getting the extension
                            System.out.println(str);
                            file = new File(path, str);
                            item.write(file);
                        }
                    }
                }

                ps = con.prepareStatement("insert into product(category, productname, image, description, "
                        + "quantity, price) values(?,?,?,?,?,?)");
                ps.setString(1, category);
                ps.setString(2, productname);
                ps.setString(3, str);
                ps.setString(4, description);
                ps.setString(5, quantity);
                ps.setString(6, price);
                int i = ps.executeUpdate();
                if (i > 0) {
        %>
        <script type="text/javascript">
            alert("Product details entered sucessfully.");
            window.location = "right.jsp";
        </script>
        <%} else {
        %>
        <script type="text/javascript">
            alert("Product details not entered successfully.");
            window.location = "add.jsp";
        </script>
        <%}
            } catch (Exception ex) {
                ex.printStackTrace();
            }

        %>
    </body>
</html>