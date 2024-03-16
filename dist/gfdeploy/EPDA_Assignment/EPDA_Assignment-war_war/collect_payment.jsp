<%-- 
    Document   : collect_payment
    Created on : Jul 22, 2023, 10:03:54 AM
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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10.0.4/swiper-bundle.min.css">

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
                border: 2px solid rgba(255,255,255,0.5);
                border-radius: 20px;
                backdrop-filter:blur(15px);
                display: flex;
                justify-content: center;
                align-items: center;
                margin-bottom: 20px;
            }


            .slide-container{
                width: 100%;
                padding: 40px 0;
            }
            .slide-content{
                margin: 0 40px;
                overflow: hidden;
                border-radius: 25px;
            }
            .card{
                background-color: #FFF;
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
            .swiper-navBtn{
                color: gray;
                transition: color 0.3s ease;
            }
            .swiper-navBtn:hover{
                color: white;
            }
            .swiper-navBtn::before,
            .swiper-navBtn::after{
                font-size: 35px;
            }
            .swiper-button-next{
                right: 0;
            }
            .swiper-button-prev{
                left: 0;
            }
            .swiper-pagination-bullet{
                background-color: gray;
                opacity: 1;
            }
            .swiper-pagination-bullet-active{
                background-color: white;
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
            List<Property> properties = (List<Property>) request.getAttribute("on_going");
        %>
        <script>
            window.onload = function () {
                var message = "${updateMessage}";
                if (message) {
                    alert(message);
                }
            };
        </script>
        <jsp:include page="owner_navbar.jsp" />
        <div class="section">
            <div class="container-fluid" style="padding-top: 80px; position: relative;">
                <div style="text-align: center; color: white;">
                    <h2>On-going Payment</h2>
                </div>
            </div>

            <% if (properties != null && !properties.isEmpty()) {%>
            <div class="slide-container swiper">
                <div class="slide-content">

                    <div class="card-wrapper swiper-wrapper">
                        <% try {
                                for (Property item : properties) {
                                    Long trans_id = item.getSales().getId();
                                    String trans_date = item.getSales().getTrans_date();
                                    String cus = item.getSales().getCustomer().getId();
                                    String p_name = item.getProperty_name();
                                    String location = item.getLocation().substring(0, 1).toUpperCase() + item.getLocation().substring(1);
                                    String p_type = item.getProperty_type().substring(0, 1).toUpperCase() + item.getProperty_type().substring(1);
                                    Long p_id = item.getId();
                                    String start_date = item.getSales().getStart_date();
                                    String price = item.getSales().getTrans_type().equals("rent")?item.getRent_price():item.getSale_price();
                        %>
                        <div class="card swiper-slide" style="border-radius: 25px;">
                            <div class="image-content">
                                <span class="overlay"></span>
                                <div class="card-image">
                                    <ion-icon name="home-outline" alt="" class="card-img"></ion-icon>
                                </div>
                            </div>
                            <div class="card-content">
                                <h2 class="name"><%=p_name%></h2>
                                <table>
                                    <tr>
                                        <td><p class="description">Transaction ID</p></td>
                                        <td><p class="description"><%= trans_id%></p></td>
                                    </tr>
                                    <tr>
                                        <td><p class="description">Transaction Date</p></td>
                                        <td><p class="description"><%= trans_date%></p></td>
                                    </tr>
                                    <tr>
                                        <td><p class="description"><%=item.getSales().getTrans_type().equals("rent")?"Tenant":"Buyer"%></p></td>
                                        <td><p class="description"><%= cus%></p></td>
                                    </tr>
                                    <tr>
                                        <td><p class="description">Property ID</p></td>
                                        <td><p class="description"><%= p_id%></p></td>
                                    </tr>
                                    <tr>
                                        <td><p class="description">Property Type</p></td>
                                        <td><p class="description"><%= p_type%></p></td>
                                    </tr>
                                    <tr>
                                        <td><p class="description"><%=item.getSales().getTrans_type().equals("rent")?"Rent":"Sale"%> Price</p></td>
                                        <td><p class="description"><%= price%></p></td>
                                    </tr>
                                    <tr>
                                        <td><p class="description">Start Date</p></td>
                                        <td><p class="description"><%= start_date%></p></td>
                                    </tr>
                                    <tr>
                                        <td><p class="description">Location</p></td>
                                        <td><p class="description"><%= location%></p></td>
                                    </tr>

                                </table>
                                <div class="row" style="width:100%">
                                    <div class="col">
                                        <button type="button" class="button" onclick="window.location.href = 'Collect_Payment?action=complete&id=<%=item.getId()%>'">
                                            Collect Payment
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </div>

                </div>
                <div class="swiper-button-next swiper-navBtn"></div>
                <div class="swiper-button-prev swiper-navBtn"></div>
                <div class="swiper-pagination"></div>
            </div>
            <%} else {%>
            <div style="text-align: center; color: white; padding: 150px">
                <h2>There are no on-going payment currently!</h2>
            </div>
            <%}%>
        </div>  

        <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
        <script>
            var swiper = new Swiper(".slide-content", {
                slidesPerView: 5,
                spaceBetween: 25,
                loop: false,
                centerSlide: 'true',
                fade: 'true',
                grabCursor: 'true',
                pagination: {
                    el: ".swiper-pagination",
                    clickable: true,
                    dynamicBullets: true,
                },
                navigation: {
                    nextEl: ".swiper-button-next",
                    prevEl: ".swiper-button-prev",
                },

                breakpoints: {
                    0: {
                        slidesPerView: 1,
                    },
                    520: {
                        slidesPerView: 2,
                    },
                    768: {
                        slidesPerView: 3,
                    },
                    1024: {
                        slidesPerView: 4,
                    },
                    1440: {
                        slidesPerView: 5,
                    },
                },
            });

        </script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
    </body>
</html>
