<%-- 
    Document   : login
    Created on : Jun 6, 2023, 3:56:09 PM
    Author     : guan.kiat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <style>
            section{
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                width: 100%;
                background: url('image/background.jpg')no-repeat;
                background-position: center;
                background-size: cover;
            }

            .form-box-login .icon-close{
                position: absolute;
                top: 0;
                right: 0;
                width: 45px;
                height: 45px;
                background: white;
                font-size: 2em;
                display: flex;
                justify-content: center;
                align-items: center;
                border-bottom-left-radius: 20px;
                cursor: pointer;
                z-index: 1;
            }
            .form-box-login{
                position: relative;
                width: 400px;
                height: 450px;
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
                top: 50%;
                left: 5px;
                transform: translateY(-50%);
                color: white;
                font-size: 1em;
                pointer-events: none;
                transition: .5s;
            }
            input:focus ~ label,
            input:valid ~ label{
                top: -5px;
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
            .forget{
                margin: -15px 0 15px;
                font-size: .9em;
                color: white;
                display: flex;
                justify-content: space-between;
            }
            .forget a{
                color: white;
                text-decoration: none;
            }
            .forget a:hover{
                text-decoration: underline;
            }
            button{
                width: 100%;
                height: 40px;
                background: white;
                border: none;
                outline: none;
                cursor: pointer;
                font-size: 1em;
                font-weight: 600;
            }
            .register{
                font-size: .9em;
                color: white;
                text-align: center;
                margin: 25px 0 10px;
            }
            .register p a{
                text-decoration: none;
                color: white;
                font-weight: 600;
            }
            .register p a:hover{
                text-decoration: underline;

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

        <jsp:include page="login_header.jsp" />
        <section>
            <div class="form-box-login">
                <span class="icon-close">
                    <ion-icon name="close"></ion-icon>
                </span>
                <div class="form-value">
                    <form action="Login" method="POST">
                        <h2>Login</h2>
                        <div class="inputbox">
                            <ion-icon name="person-outline"></ion-icon>
                            <input type="text" required name="username" size="20" autocomplete="off">
                            <label for="">Username</label>
                        </div>
                        <div class="inputbox">
                            <ion-icon name="lock-closed-outline"></ion-icon>
                            <input type="password" required name="password" size="20" autocomplete="off" id="password">
                            <label for="passwordInput">Password</label>
                        </div>
                        <div class="forget">
                            <div class="col">
                                <input type="checkbox" name="checkbox" id="showPasswordCheckbox" onclick="showPassword()">
                                <label for="showPasswordCheckbox">Show Password</label>
                            </div>
                            <div>
                                <a href="forgot_password.jsp">Forgot Password?</a>
                            </div>
                        </div>

                        <script>
                            function showPassword() {
                                var password = document.getElementById('password');
                                if (password.type === 'password') {
                                    password.type = 'text';
                                } else {
                                    password.type = 'password';
                                }
                            }
                        </script>
                        <button type="submit" style="border-radius: 10px;">Login</button>
                        <div class="register">
                            <p>Don't have a account? <a href="register.jsp">Sign Up</a></p>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
    </body>
</html>
