<%-- 
    Document   : compare_property
    Created on : Jul 20, 2023, 8:06:54 PM
    Author     : ASUS
--%>

<%@page import="model.Property"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">

        <style>
            .section{
                min-height: 100vh;
                width: 100%;
                background: url('image/background.jpg')no-repeat;
                background-position: center;
                background-size: cover;
            }
            .form-box{
                background: transparent;
                border-radius: 25px;
                display: inline-flex;
                align-items: center;
                padding: 20px;
            }
            .image-content,
            .card-content{
                display: flex;
                flex-direction: column;
                align-items: center;
                padding: 10px 14px;
            }
            .image-content{
                position: relative;
                row-gap: 5px;
                padding: 25px 0;
            }
            .overlay{
                position: absolute;
                left: 0;
                top: 0;
                height: 100%;
                width: 100%;
                background-color: black;
                border-radius: 25px 25px 0 25px;
            }
            .overlay::before,
            .overlay::after{
                content: '';
                position: absolute;
                right: 0;
                bottom: -40px;
                height: 40px;
                width: 40px;
                background-color: black;
            }
            .overlay::after{
                border-radius: 0 25px 0 0;
                background-color: #FFF;
            }
            .card-image{
                position: relative;
                height: 150px;
                width: 150px;
                border-radius: 50%;
                background: #FFF;
                padding: 3px;
            }
            .card-image .card-img{
                height: 100%;
                width: 100%;
                object-fit: cover;
                border-radius: 50%;
            }
            .name{
                font-size: 18px;
                font-weight: 500;
                color: #333;
            }
            .description{
                font-size: 14px;
                color: #707070;
                text-align: left;
                padding-right: 10px;
            }

            .button{
                width: 100%;
                border: none;
                font-size: 16px;
                font-weight: 600;
                color: white;
                padding: 8px 16px;
                background-color: black;
                border-radius: 6px;
                cursor: pointer;
                transition: all 0.3s ease;
            }
            .button:hover{
                background: #265DF2;
            }

            .button2{
                border: none;
                font-size: 16px;
                font-weight: 600;
                color: black;
                padding: 8px 16px;
                background-color: white;
                border-radius: 6px;
                cursor: pointer;
                transition: all 0.3s ease;
            }
            .button2:hover{
                background: #265DF2;
            }

            @media screen and (max-width: 768px) {
                .slide-content{
                    margin: 0 10px;
                }
                .swiper-navBtn{
                    display: none;
                }
            }
        </style>
    </head>
    <body>
        <%
            HttpSession s = request.getSession(false);
            List<Property> properties = (List<Property>) s.getAttribute("compare_list");
            String action = (String) request.getAttribute("action");
            Property property_1 = null;
            Property property_2 = null;

            property_1 = properties.get(0);
            property_2 = properties.get(1);

            String p_name_1 = "";
            String room_no_1 = "";
            String toilet_no_1 = "";
            String list_date_1 = "";
            String floor_size_1 = "";
            String funishing_1 = "";
            String location_1 = "";
            String owner_1 = "";
            String p_type_1 = "";
            String desc_1 = "";
            String r_price_1 = "";
            String s_price_1 = "";

            String p_name_2 = "";
            String room_no_2 = "";
            String toilet_no_2 = "";
            String list_date_2 = "";
            String floor_size_2 = "";
            String funishing_2 = "";
            String location_2 = "";
            String owner_2 = "";
            String p_type_2 = "";
            String desc_2 = "";
            String r_price_2 = "";
            String s_price_2 = "";

            if (property_1 != null) {
                p_name_1 = property_1.getProperty_name();
                room_no_1 = property_1.getRoom_no();
                toilet_no_1 = property_1.getToilet_no();
                list_date_1 = property_1.getListed_date().substring(0, 10);
                floor_size_1 = property_1.getFloor_size();
                funishing_1 = property_1.getFurnishing().substring(0, 1).toUpperCase() + property_1.getFurnishing().substring(1);
                location_1 = property_1.getLocation().substring(0, 1).toUpperCase() + property_1.getLocation().substring(1);
                owner_1 = property_1.getOwner1().getId();
                p_type_1 = property_1.getProperty_type().substring(0, 1).toUpperCase() + property_1.getProperty_type().substring(1);
                desc_1 = property_1.getDescription().length() > 0 ? property_1.getDescription() : "No Description";
                r_price_1 = property_1.getRent_price();
                s_price_1 = property_1.getSale_price();
            }

            if (property_1 != null) {
                p_name_2 = property_2.getProperty_name();
                room_no_2 = property_2.getRoom_no();
                toilet_no_2 = property_2.getToilet_no();
                list_date_2 = property_2.getListed_date().substring(0, 10);
                floor_size_2 = property_2.getFloor_size();
                funishing_2 = property_2.getFurnishing().substring(0, 1).toUpperCase() + property_2.getFurnishing().substring(1);
                location_2 = property_2.getLocation().substring(0, 1).toUpperCase() + property_2.getLocation().substring(1);
                owner_2 = property_2.getOwner1().getId();
                p_type_2 = property_2.getProperty_type().substring(0, 1).toUpperCase() + property_2.getProperty_type().substring(1);
                desc_2 = property_2.getDescription().length() > 0 ? property_2.getDescription() : "No Description";
                r_price_2 = property_2.getRent_price();
                s_price_2 = property_2.getSale_price();
            }

        %>
        <script>
            window.onload = function () {
                var message = "${updateMessage}";
                if (message) {
                    alert(message);
                }
            };
        </script>
        <jsp:include page="customer_navbar.jsp" />
        <div class="section">
            <div class="container-fluid" style="padding-top: 80px;">
                <div style="text-align: center; color: white;">
                    <h2>Compare Property</h2>
                </div>
            </div>
            <div style="display: flex; justify-content: center; align-items: center;">
                <div class="row">
                    <div class="form-box">
                        <div class="card swiper-slide" style="border-radius: 25px; width: 600px; margin: 10px;">
                            <div class="image-content">
                                <span class="overlay"></span>
                                <div class="card-image">
                                    <ion-icon name="home-outline" alt="" class="card-img"></ion-icon>
                                </div>
                            </div>

                            <div class="card-content">

                                <h2 class="name"><%=p_name_1%></h2>
                                <table>
                                    <tr>
                                        <td><p class="description">Owner</p></td>
                                        <td><p class="description"><%= owner_1%></p></td>
                                    </tr>
                                    <tr>
                                        <td><p class="description">Property Type</p></td>
                                        <td><p class="description"><%= p_type_1%></p></td>
                                    </tr>
                                    <tr>
                                        <td><p class="description">Location</p></td>
                                        <td><p class="description"><%= location_1%></p></td>
                                    </tr>
                                    <tr>
                                        <td><p class="description">Floor Size(sqft)</p></td>
                                        <td><p class="description"><%= floor_size_1%></p></td>
                                    </tr>
                                    <tr>
                                        <td><p class="description">Number of Rooms</p></td>
                                        <td><p class="description"><%= room_no_1%></p></td>
                                    </tr>
                                    <tr>
                                        <td><p class="description">Number of Toilets</p></td>
                                        <td><p class="description"><%= toilet_no_1%></p></td>
                                    </tr>
                                    <tr>
                                        <td><p class="description">Furnishing</p></td>
                                        <td><p class="description"><%= funishing_1%></p></td>
                                    </tr>

                                    <% if ("rent".equals(action)) {%>
                                    <tr>
                                        <td><p class="description">Rent Price</p></td>
                                        <td><p class="description"><%= r_price_1%></p></td>
                                    </tr>
                                    <% } else if ("sale".equals(action)) {%>
                                    <tr>
                                        <td><p class="description">Sales Price</p></td>
                                        <td><p class="description"><%= s_price_1%></p></td>
                                    </tr>
                                    <% }%>
                                    <td><p class="description">Listed Date</p></td>
                                    <td><p class="description"><%= list_date_1%></p></td>
                                    </tr>
                                    <tr>
                                        <td><p class="description">Description</p></td>
                                        <td><p class="description"><%= desc_1%></p></td>
                                    </tr>
                                </table>
                            </div>

                        </div>

                        <div class="card swiper-slide" style="border-radius: 25px;  width: 600px;  margin: 10px;">
                            <div class="image-content">
                                <span class="overlay"></span>
                                <div class="card-image">
                                    <ion-icon name="home-outline" alt="" class="card-img"></ion-icon>
                                </div>
                            </div>

                            <div class="card-content">
                                <h2 class="name"><%=p_name_2%></h2>
                                <table>
                                    <tr>
                                        <td><p class="description">Owner</p></td>
                                        <td><p class="description"><%= owner_2%></p></td>
                                    </tr>
                                    <tr>
                                        <td><p class="description">Property Type</p></td>
                                        <td><p class="description"><%= p_type_2%></p></td>
                                    </tr>
                                    <tr>
                                        <td><p class="description">Location</p></td>
                                        <td><p class="description"><%= location_2%></p></td>
                                    </tr>
                                    <tr>
                                        <td><p class="description">Floor Size(sqft)</p></td>
                                        <td><p class="description"><%= floor_size_2%></p></td>
                                    </tr>
                                    <tr>
                                        <td><p class="description">Number of Rooms</p></td>
                                        <td><p class="description"><%= room_no_2%></p></td>
                                    </tr>
                                    <tr>
                                        <td><p class="description">Number of Toilets</p></td>
                                        <td><p class="description"><%= toilet_no_2%></p></td>
                                    </tr>
                                    <tr>
                                        <td><p class="description">Furnishing</p></td>
                                        <td><p class="description"><%= funishing_2%></p></td>
                                    </tr>

                                    <% if ("rent".equals(action)) {%>
                                    <tr>
                                        <td><p class="description">Rent Price</p></td>
                                        <td><p class="description"><%= r_price_2%></p></td>
                                    </tr>
                                    <% } else if ("sale".equals(action)) {%>
                                    <tr>
                                        <td><p class="description">Sales Price</p></td>
                                        <td><p class="description"><%= s_price_2%></p></td>
                                    </tr>
                                    <% }%>


                                    <td><p class="description">Listed Date</p></td>
                                    <td><p class="description"><%= list_date_2%></p></td>
                                    </tr>
                                    <tr>
                                        <td><p class="description">Description</p></td>
                                        <td><p class="description"><%= desc_2%></p></td>
                                    </tr>
                                </table>
                            </div>

                        </div>
                    </div>
                    <div class="row" style="display: flex; justify-content: center;">
                        <button type="button" class="button2" style="width: 20%;" id="backButton" onclick="window.location.href = 'View_Property?action=<%=action%>&add_action=clear_compare_list'">
                            Back
                        </button>
                    </div>
                </div>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
            <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
            <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    </body>
</html>
