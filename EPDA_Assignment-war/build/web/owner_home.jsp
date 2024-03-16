<%-- 
    Document   : owner_home
    Created on : Jul 7, 2023, 11:09:22 PM
    Author     : ASUS
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Rating"%>
<%@page import="java.util.List"%>
<%@page import="model.UserAcc"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Owner Home</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

        <script type="text/javascript">
            var myVar = setInterval(function () {
                myTimer()
            }, 1000);
            var counter = 0;
            function myTimer() {
                var date = new Date();
                date.setHours(date.getHours() + 8);
                document.getElementById("demo").innerHTML = date.toUTCString();
            }
        </script>
        <style>
            section{
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                width: 100%;
                background-position: center;
                background-size: cover;
                height: 100vh; background: url('image/background.jpg') no-repeat; 
                background-position: center; 
                background-size: cover; 
                width: 100%;
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
                flex-direction: column;
                margin-top: 20px;
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

        </style>
    </head>
    <body>
        <%
            HttpSession s = request.getSession();
            UserAcc useracc = (UserAcc) s.getAttribute("login");
            List<Rating> r = (List<Rating>) s.getAttribute("rating");
            Double total_rating = 0.0;

            for (Rating item : r) {
                total_rating += item.getCus_rating();
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

        <section>
            <jsp:include page="owner_navbar.jsp" />
            <div class="container" style="display: flex;
                 justify-content: center;
                 align-items: center;
                 flex-direction: column; 
                 min-height: 100vh;
                 width: 100%;
                 background-position: center;
                 background-size: cover;">
                <div style="text-align: center; margin-bottom: 20px; align-items: center;">
                    <h2 style="font-size: 2em; color: white;">Welcome Back, <%= useracc.getId()%>!</h2>
                    <h2 id="demo" style="font-size: 2em; color: white; margin-top: 20px"></h2>

                </div>
                <div class="form-box">
                    <div class="form-value">
                        <h2>Overall Rating</h2>
                        <div class="inputbox">
                            <ion-icon name="person-outline"></ion-icon>
                            <input type="text" readonly autocomplete="off" value="<%=useracc.getId()%>">
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
        </section>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
    </body>
</html>
