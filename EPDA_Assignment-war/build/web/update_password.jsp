<%-- 
    Document   : update_password
    Created on : Jul 17, 2023, 3:23:29 PM
    Author     : ASUS
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
            window.onload = function () {
                var message = "${updateMessage}";
                if (message) {
                    alert(message);
                }
            };
        </script>
        <jsp:include page="admin_navbar.jsp" />
        <section>
            <div class="form-box-forgot">
                <div class="form-value">
                    <form action="Update_Password" method="POST">
                        <h2>Change Password</h2>
                        <div class="inputbox">
                            <input type="text" required name="old_pass" size="20" autocomplete="off">
                            <label for="">Old Password</label>
                        </div>
                        <div class="inputbox">
                            <input type="text" required name="new_pass" size="20" autocomplete="off">
                            <label for="">New Password</label>
                        </div>
                        <div class="inputbox">
                            <input type="text" required name="con_pass" size="20" autocomplete="off">
                            <label for="">Confirm Password</label>
                        </div>
                        <div class="col">
                            <div class="row">
                                <div class="col">
                                    <button type="submit" style="border-radius: 10px;" class="w-100">Confirm</button>
                                </div>
                                <div class="col">
                                    <button type="button" style="border-radius: 10px;" onclick="window.location.href = 'admin_home.jsp'" class="w-100">Cancel</button>
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
