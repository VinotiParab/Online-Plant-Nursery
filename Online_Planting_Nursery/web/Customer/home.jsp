<%-- 
    Document   : home
    Created on : Dec 29, 2018, 11:23:56 PM
    Author     : VINOTI
--%>

<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="slideshow-container" style="background-color: #33cc33" width="100">

            <div class="mySlides fade" style="background-color: #33cc33" width="100">
                <div class="numbertext">1 / 3</div>
                <a href="VegetableSeeds.jsp">
                    <img src="${pageContext.request.contextPath}/Images/vegetable_seeds.jpg" 
                         height="400px" style="width:100%">
                </a>
                <div class="text"><h1 style="color: white; font-size: 50px;">BEST VEGETABLE SEEDS</h1></div>
            </div>

            <div class="mySlides fade" style="background-color: #33cc33" width="100">
                <div class="numbertext">2 / 3</div>
                <a href="IndoorPlants.jsp">
                    <img src="${pageContext.request.contextPath}/Images/indoor_plants.jpg" 
                         height="400px" style="width:100%">
                </a>
                <div class="text"><h1 style="color: black; font-size: 50px;">INDOOR PLANTS</h1></div>
            </div>

            <div class="mySlides fade" style="background-color: #33cc33" width="100">
                <div class="numbertext">3 / 3</div>
                <a href="GardenTools.jsp">
                    <img src="${pageContext.request.contextPath}/Images/garden_tools.jpeg" 
                         height="400px" style="width:100%">
                </a>
                <div class="text"><h1 style="color: white; font-size: 50px;">GARDEN TOOLS</h1></div>
            </div>

        </div>
        <br>

        <div style="text-align:center">
            <span class="dot"></span> 
            <span class="dot"></span> 
            <span class="dot"></span> 
        </div>

        <script>
            var slideIndex = 0;
            showSlides();

            function showSlides() {
                var i;
                var slides = document.getElementsByClassName("mySlides");
                var dots = document.getElementsByClassName("dot");
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                slideIndex++;
                if (slideIndex > slides.length) {
                    slideIndex = 1;
                }
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }
                slides[slideIndex - 1].style.display = "block";
                dots[slideIndex - 1].className += " active";
                setTimeout(showSlides, 2000); // Change image every 2 seconds
            }
        </script>
        <br><br>
        <table align="center" border="0" cellspacing="8px" 
               style="width: 90%; height: 100%; font-size: 20px;
               font-family: fantasy; font-style: inherit; text-align: center; color: darkorchid;">
            <tr>
                <td width="30%"><a href="under100.jsp">
                        <h1 style="color: #555; font-size: 50px; align-content: center">UNDER ₹100</h1></a></td>
                <td><a href="under100.jsp">
                        <img src="${pageContext.request.contextPath}/Images/under100.jpg" 
                             height="200px" style="width:50%">
                    </a></td>
            </tr>
            <tr>
                <td><a href="gardenOffers.jsp">
                        <img src="${pageContext.request.contextPath}/Images/gardenOffers.jpg" 
                             height="200px" style="width:50%">
                    </a></td>
                <td width="30%"><a href="gardenOffers.jsp">
                        <h1 style="color: #555; font-size: 50px; align-content: center">Garden Accessories<br>
                        25% off</h1></a></td>
            </tr>
        </table>
    </body>
</html>