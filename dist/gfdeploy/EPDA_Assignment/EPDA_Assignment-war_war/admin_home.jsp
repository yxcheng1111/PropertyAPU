<%-- 
    Document   : admin_home
    Created on : Jul 15, 2023, 8:09:37 PM
    Author     : ASUS
--%>

<%@page import="model.UserAcc"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Home</title>
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

        </style>
    </head>
    <body>
        <script>
            window.onload = function () {
                var message = "${updateMessage}";
                if (message) {
                    alert(message);
                }
            };
        </script>
        <%
            HttpSession s = request.getSession();
            UserAcc useracc = (UserAcc) s.getAttribute("login");
        %>
        <section>
            <jsp:include page="admin_navbar.jsp" />
            <div class="container">
                <div style="text-align: center; margin-bottom: 20px;">
                    <h2 style="font-size: 2em; color: white;">Welcome Back, <%= useracc.getId()%>!</h2>
                    <h2 id="demo" style="font-size: 2em; color: white;"></h2>
                </div>
            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
    </body>
</html>
