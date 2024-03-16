<%-- 
    Document   : forgot_password
    Created on : Jul 8, 2023, 3:03:14 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Page</title>
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
            .form-box-forgot .icon-close{
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
            .form-box-forgot{
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
            button{
                width: 50%;
                height: 40px;
                background: white;
                border: none;
                outline: none;
                cursor: pointer;
                font-size: 1em;
                font-weight: 600;
            }
        </style>
    </head>
    <body>
        <script>
            window.onload = function() {
                var message = "${updateMessage}";
                if (message) {
                    alert(message);
                }
            };
        </script>
        <jsp:include page="login_header.jsp" />
        <section>
            <div class="form-box-forgot">
                <span class="icon-close">
                    <ion-icon name="close"></ion-icon>
                </span>
                <div class="form-value">
                    <form action="Forgot_Password" method="POST">
                        <h2>Reset Password</h2>
                        <div class="inputbox">
                            <ion-icon name="person-outline"></ion-icon>
                            <input type="text" required name="username" size="20" autocomplete="off">
                            <label for="">Username</label>
                        </div>
                        <div class="inputbox">
                            <ion-icon name="mail-outline"></ion-icon>
                            <input type="email" required name="email" size="20" autocomplete="off">
                            <label for="">Email</label>
                        </div>
                        <div class="inputbox">
                            <ion-icon name="call-outline"></ion-icon>
                            <input type="text" required name="phone" size="20" autocomplete="off">
                            <label for="">Phone No</label>
                        </div>
                        <div class="col">
                            <div class="row">
                                <div class="col">
                                    <button type="submit" style="border-radius: 10px;" class="w-100">Reset</button>
                                </div>
                                <div class="col">
                                    <button type="button" style="border-radius: 10px;" onclick="window.location.href = 'login.jsp'" class="w-100">Cancel</button>
                                </div>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    </body>
</html>
