<%-- 
    Document   : view_property
    Created on : Jul 20, 2023, 9:40:04 AM
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
            List<Property> properties = (List<Property>) request.getAttribute("property_list");
            String action = (String) request.getAttribute("action");
        %>
        <script>
            window.onload = function () {
                var message = "${updateMessage}";
                if (message) {
                    alert(message);
                }
            };
            function openModalWithData(id) {
                const propertyIdInput = document.getElementById('property_id');
                propertyIdInput.value = id;
                const modal = new Modal(document.getElementById('staticBackdrop'));
                modal.show();
            }
        </script>
        <jsp:include page="customer_navbar.jsp" />
        <div class="section">
            <form>
                <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="staticBackdropLabel">Confirm Date</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <label for="confirm_date" class="form-label" style="top: 50%; left: 5px; color: black; font-size: 1em;">Confirm Date:</label>
                                <input type="date" class="form-control" id="confirm_date_input" required name="confirm_date" size="20" autocomplete="off" 
                                       style="font-size: 1em; color: black; border-radius: 0;" min="<%=java.time.LocalDate.now().plusDays(1)%>">
                                <input type="hidden" class="form-control" id="property_id" name="property_id">
                            </div>
                            <div class="modal-footer">
                                <input type="hidden" name="action" value="<%=action%>">
                                <input type="hidden" name="add_action" value="<%=action%>">
                                <button type="submit" class="btn btn-primary">Confirm</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <div class="container-fluid" style="padding-top: 80px; position: relative;">
                <div style="text-align: center; color: white;">
                    <h2>Property For <%= action.substring(0, 1).toUpperCase() + action.substring(1)%></h2>
                </div>
                <% if (properties != null && !properties.isEmpty()) {%>
                <button style="display: inline-block;
                        position: absolute;
                        top: 10px;
                        right: 10px;
                        width: 50px;
                        height: 50px;
                        border-radius: 50%;
                        background-color: white;
                        text-align: center;
                        line-height: 50px;
                        font-size: 20px;
                        cursor: pointer;
                        margin-top: 64px;
                        margin-right: 85px;
                        transition: background-color 0.3s ease;"
                        onmouseover="this.style.backgroundColor = '#265DF2';"
                        onmouseout="this.style.backgroundColor = 'white';"
                        onclick="window.location.href = 'View_Property?add_action=filter_property&action=<%=action%>'">
                    <ion-icon name="options" style="color:black;"></ion-icon></ion-icon>
                </button>
                <%}%>
                <% if (properties != null && !properties.isEmpty()) {%>
                <button style="display: inline-block;
                        position: absolute;
                        top: 10px;
                        right: 10px;
                        width: 50px;
                        height: 50px;
                        border-radius: 50%;
                        background-color: white;
                        text-align: center;
                        line-height: 50px;
                        font-size: 20px;
                        cursor: pointer;
                        margin-top: 64px;
                        margin-right: 25px;
                        transition: background-color 0.3s ease;"
                        onmouseover="this.style.backgroundColor = '#265DF2';"
                        onmouseout="this.style.backgroundColor = 'white';"
                        onclick="window.location.href = 'View_Property?action=<%=action%>'">
                    <ion-icon name="close"></ion-icon>
                </button>
                <%}%>
            </div>

            <% if (properties != null && !properties.isEmpty()) {%>
            <div class="slide-container swiper">
                <div class="slide-content">
                    <div class="card-wrapper swiper-wrapper">
                        <% try {
                                for (Property item : properties) {
                                    String p_name = item.getProperty_name();
                                    String room_no = item.getRoom_no();
                                    String toilet_no = item.getToilet_no();
                                    String list_date = item.getListed_date().substring(0, 10);
                                    String floor_size = item.getFloor_size();
                                    String funishing = item.getFurnishing().substring(0, 1).toUpperCase() + item.getFurnishing().substring(1);
                                    String location = item.getLocation().substring(0, 1).toUpperCase() + item.getLocation().substring(1);
                                    String owner = item.getOwner1().getId();
                                    String p_type = item.getProperty_type().substring(0, 1).toUpperCase() + item.getProperty_type().substring(1);
                                    String desc = item.getDescription().length() > 0 ? item.getDescription() : "No Description";
                                    String r_price = item.getRent_price();
                                    String s_price = item.getSale_price();
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
                                        <td><p class="description">Owner</p></td>
                                        <td><p class="description"><%= owner%></p></td>
                                    </tr>
                                    <tr>
                                        <td><p class="description">Property Type</p></td>
                                        <td><p class="description"><%= p_type%></p></td>
                                    </tr>
                                    <tr>
                                        <td><p class="description">Location</p></td>
                                        <td><p class="description"><%= location%></p></td>
                                    </tr>
                                    <tr>
                                        <td><p class="description">Floor Size(sqft)</p></td>
                                        <td><p class="description"><%= floor_size%></p></td>
                                    </tr>
                                    <tr>
                                        <td><p class="description">Number of Rooms</p></td>
                                        <td><p class="description"><%= room_no%></p></td>
                                    </tr>
                                    <tr>
                                        <td><p class="description">Number of Toilets</p></td>
                                        <td><p class="description"><%= toilet_no%></p></td>
                                    </tr>
                                    <tr>
                                        <td><p class="description">Furnishing</p></td>
                                        <td><p class="description"><%= funishing%></p></td>
                                    </tr>

                                    <% if ("rent".equals(action)) {%>
                                    <tr>
                                        <td><p class="description">Rent Price</p></td>
                                        <td><p class="description"><%= r_price%></p></td>
                                    </tr>
                                    <% } else if ("sale".equals(action)) {%>
                                    <tr>
                                        <td><p class="description">Sales Price</p></td>
                                        <td><p class="description"><%= s_price%></p></td>
                                    </tr>
                                    <% }%>

                                    <tr>
                                        <td><p class="description">Listed Date</p></td>
                                        <td><p class="description"><%= list_date%></p></td>
                                    </tr>
                                    <tr>
                                        <td><p class="description">Description</p></td>
                                        <td><p class="description"><%= desc%></p></td>
                                    </tr>
                                </table>
                                <div class="row" style="width:100%">
                                    <div class="col">
                                        <button type="button" class="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="openModalWithData('<%=item.getId()%>')">
                                            <% if ("sale".equals(action)) { %>
                                            Buy
                                            <% } else { %>
                                            Rent
                                            <% }%>
                                        </button>
                                    </div>
                                    <div class="col">
                                        <button type="button" class="button" onclick="window.location.href = 'View_Property?add_action=add_compare_list&property=<%=item.getId()%>&action=<%=action%>'">Compare</button>
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
                <h2>There are no property for <%=action%> currently!</h2>
            </div>
            <%}%>
            <% if (properties
                        != null && !properties.isEmpty()) {%>
            <button style="display: inline-block;
                    width: 50px; 
                    height: 50px; 
                    border-radius: 50%; 
                    background-color: white; 
                    color: black;
                    text-align: center;
                    line-height: 50px; 
                    font-size: 20px; 
                    cursor: pointer;
                    transition: background-color 0.3s ease;
                    float: right;
                    margin-right: 40px"
                    onmouseover="this.style.backgroundColor = '#265DF2';"
                    onmouseout="this.style.backgroundColor = 'white';"
                    onclick="window.location.href = 'View_Property?add_action=compare_property&action=<%=action%>'"
                    >
                <ion-icon name="git-compare"></ion-icon>
            </button>
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
