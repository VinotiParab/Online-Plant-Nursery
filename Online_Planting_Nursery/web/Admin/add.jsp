<%-- 
    Document   : add
    Created on : Dec 18, 2018, 7:50:08 PM
    Author     : VINOTI
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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
        <font size="5">
        <h3 align="center" style=" font-family: fantasy; font-size: 30px; color: cyan;">
            ADD PRODUCT</h3>
        <br><br>
        <form method="post" action="add_process.jsp" enctype = "multipart/form-data">
            <table border="0" align="center" style=" color: black">
                <tr>
                    <td>CATEGORY:</td>
                    <td><select name="category" id="category" style="width: 80%;" required>
                            <option value="">-Choose a category-</option>
                            <option value="Seeds">SEEDS</option>
                            <option value="Plants">PLANTS</option>
                            <option value="Pots and Planters">POTS & PLANTERS</option>
                            <option value="Garden and Accessories">GARDEN & ACCESSORIES</option>
                            <option value="Plants Care">PLANTS CARE</option>
                            <option value="Books">BOOKS</option>
                        </select></td>
                </tr>

                <tr>
                    <td>PRODUCT NAME:</td>
                    <td><input type="text" name="productname" id="pname" style="width: 80%;" required="required"></td>
                </tr>
                <tr>
                    <td>PICTURE:</td>
                    <td><input type = "file" name = "image" id="image" style="width: 80%;" required="required"></td>
                </tr>
                <tr>
                    <td>DESCRIPTION:</td>
                    <td><input type="text" name="description" id="description" style="width: 80%;" 
                               required="required"></td>
                </tr>
                <tr>
                    <td>QUANTITY:</td>
                    <td><input type="text" name="quantity" id="quantity" style="width: 80%;" required="required"></td>
                </tr>
                <tr>
                    <td>PRICE:</td>
                    <td><input type="text" name="price" id="price" style="width: 80%;" required="required"></td>
                </tr>
                <tr>
                    <td><input type="submit" value="SUBMIT"></td>
                    <td><input type="reset" value="RESET"></td>
                </tr>
            </table>
        </form>
        </font>
    </body>
</html>
