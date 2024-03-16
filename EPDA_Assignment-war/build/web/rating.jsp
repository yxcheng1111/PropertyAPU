<%-- 
    Document   : rating
    Created on : Jul 23, 2023, 2:21:16 AM
    Author     : ASUS
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Rating"%>
<%@page import="java.util.List"%>
<%@page import="model.Property"%>
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
                position: relative;
                width: 400px;
                padding: 20px;
                background: transparent;
                border: 2px solid rgba(255,255,255,0.5);
                border-radius: 20px;
                backdrop-filter:blur(15px);
                display: flex;
                justify-content: center;
                align-items: center;
                overflow: hidden;
                transition: transform .5s ease, height .2s ease;
            }
            .form-value h2{
                font-size: 2em;
                color: white;
                text-align: center;
            }
            .inputbox{
                position: relative;
                margin: 30px 0;
                width: 310px;
                border-bottom: 2px solid white;
            }
            .inputbox label{
                position: absolute;
                left: 5px;
                transform: translateY(-50%);
                color: white;
                font-size: 1em;
                pointer-events: none;
                transition: .5s;
            }
            .inputbox input{
                width: 100%;
                height: 50px;
                background: transparent;
                border: none;
                outline: none;
                font-size: 1em;
                padding: 0 35px 0 5px;
                color: white;
            }
            .inputbox ion-icon{
                position: absolute;
                right: 8px;
                color: white;
                font-size: 1.2em;
                top: 15px;
            }
            input:valid ~ label{
                top: -5px;
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
            String username = (String) request.getAttribute("username");
            String role = (String) request.getAttribute("role");
            List<Rating> r = (List<Rating>) request.getAttribute("rating");
            Double total_rating = 0.0;
            if (role.equals("customer")) {
                for (Rating item : r) {
                    total_rating += item.getOwner_rating();

                }
            } else {
                for (Rating item : r) {
                    total_rating += item.getCus_rating();
                }
            }
            Double average_rating = r.size() == 0 ? 0 : total_rating / r.size();
            DecimalFormat df = new DecimalFormat("#.##");
            String formatted_average_rating = df.format(average_rating);
        %>
        <script>
            window.onload = function () {
                var message = "${updateMessage}";
                if (message) {
                    alert(message);
                }
            };
        </script>
        <jsp:include page="admin_navbar.jsp" />
        <div class="section">
            <div class="container-fluid" style="padding-top: 80px; position: relative;">
                <div style="text-align: center; color: white;">
                    <h2>Rating and Feedback Analysis</h2>
                </div>
            </div>
            <div class="container" style="display: flex; justify-content: center; align-items: center; margin-top: 20px; margin-bottom: 20px">
                <div class="form-box">
                    <div class="form-value">
                        <h2>Overall Rating</h2>
                        <div class="inputbox">
                            <ion-icon name="person-outline"></ion-icon>
                            <input type="text" readonly autocomplete="off" value="<%=username%>">
                            <label for="">User</label>
                        </div>
                        <div class="inputbox">
                            <ion-icon name="star-outline"></ion-icon>
                            <input readonly type="text" autocomplete="off" value="<%=formatted_average_rating%>">
                            <label for="">Average Rating</label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container" style="display: flex; justify-content: center; align-items: center;">
                <button type="button" class="button" onclick="window.location.href = 'Manage_User?role=<%=role%>&action=edit_user'" style="width: 150px;">Back</button>
            </div>
            <%if (r.size() != 0) {%>
            <div class="slide-container swiper">
                <div class="slide-content">
                    <div class="card-wrapper swiper-wrapper">
                        <% try {
                                String name = "";
                                Long trans_id = null;
                                Long prop_id = null;
                                String comment = "";
                                Integer rating = null;

                                for (Rating item : r) {
                                    trans_id = role.equals("customer") ? item.getSales().getId() : item.getSales().getId();
                                    prop_id = role.equals("customer") ? item.getSales().getProperty().getId() : item.getSales().getProperty().getId();
                                    name = role.equals("customer") ? item.getOwner().getId() : item.getCus().getId();
                                    rating = role.equals("customer") ? item.getOwner_rating() : item.getCus_rating();
                                    comment = role.equals("customer") ? item.getOwner_comments() : item.getCus_comments();

                        %>
                        <div class="card swiper-slide" style="border-radius: 25px;">
                            <div class="image-content">
                                <span class="overlay"></span>
                                <div class="card-image">
                                    <ion-icon name="home-outline" alt="" class="card-img"></ion-icon>
                                </div>
                            </div>
                            <div class="card-content">
                                <h2 class="name"><%=name%></h2>
                                <table>
                                    <tr>
                                        <td><p class="description">Transaction ID</p></td>
                                        <td><p class="description"><%= trans_id%></p></td>
                                    </tr>
                                    <tr>
                                        <td><p class="description">Property ID</p></td>
                                        <td><p class="description"><%= prop_id%></p></td>
                                    </tr>
                                    <tr>
                                        <td><p class="description">Rating</p></td>
                                        <td><p class="description"><%= rating%></p></td>
                                    </tr>
                                    <tr>
                                        <td><p class="description">Comment</p></td>
                                        <td><p class="description"><%= comment%></p></td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                        <%
                                }
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
            <div class="container-fluid" style="text-align: center; color: white; padding: 150px">
                <h2>There are no rating for <%=role%> <%=username%> currently!</h2>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    </body>
</html>
