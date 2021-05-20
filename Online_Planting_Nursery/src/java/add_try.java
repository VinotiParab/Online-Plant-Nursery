/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Part;

/**
 *
 * @author VINOTI
 */
@WebServlet("/add_try")
@MultipartConfig(fileSizeThreshold= 1024*1024*2, //2MB
        maxFileSize=1024*1024*10, //10MB
        maxRequestSize=1024*1024*50)
public class add_try extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            PreparedStatement ps;
            ResultSet rs;
            String path = "C:/Users/Documents/NetBeansProjects/Online_Planting_Nursery/web/Images/";
            String category = request.getParameter("category");
                System.out.println(category);
                String subcategory = request.getParameter("subcategory");
                System.out.println(subcategory);
                String productname = request.getParameter("productname");
                Part part = request.getPart("image");
                String fileName = extractFileName(part);
                String str = path + File.separator + fileName;
                File fileSaveDir = new File(str);
                part.write(str + File.separator);
                String description = request.getParameter("description");
                String quantity = request.getParameter("quantity");
                String price = request.getParameter("price");

                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Welcome");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_plant_nursery", "root", "root");
                System.out.println("Connection created");
                Statement st = con.createStatement();
                ps = null;
                rs = null;
                
                ps = con.prepareStatement("insert into product(category, subcategory, productname, image, description, quantity, price) "
                        + "values(?,?,?,?,?,?,?)");
                ps.setString(1, category);
                ps.setString(2, subcategory);
                ps.setString(3, productname);
                ps.setString(4, str);
                ps.setString(5, description);
                ps.setString(6, quantity);
                ps.setString(7, price);
                int i = ps.executeUpdate();
                if (i > 0) {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert(\"Product details entered sucessfully.\");");
                    out.println("window.location = \"admin.html\";");
                    out.println("</script>");
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert(\"Product details not entered successfully.\");");
                    out.println("window.location = \"add1.html\";</script>");
                }
        }
        catch (ClassNotFoundException | SQLException ex) {
                ex.printStackTrace();
            }
    }
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("fileName")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
/**
 * Handles the HTTP <code>GET</code> method.
 *
 * @param request servlet request
 * @param response servlet response
 * @throws ServletException if a servlet-specific error occurs
 * @throws IOException if an I/O error occurs
 */
