<%-- 
    Document   : register
    Created on : Jul 7, 2023, 3:10:12 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            .form-box-reg .icon-close{
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
            .form-box-reg{
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
            .card-body h2{
                font-size: 2em;
                color: white;
                text-align: center;
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
                margin-top: 5px
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
            <div class="container">
                <div class="col-12 col-sm-8 col-md-6 m-auto">
                    <div class="form-box-reg p-3">
                        <span class="icon-close">
                            <ion-icon name="close"></ion-icon>
                        </span>
                        <div class="card-body">
                            <h2>Register</h2>
                            <form action="Register" method="POST" class="row g-3">
                                <div class="col-md-6">
                                    <label for="username" class="form-label" style="top: 50%; left: 5px; color: white; font-size: 1em;">Username</label>
                                    <input type="text" class="form-control" required id="username" name="username" size="20" autocomplete="off" style="background: transparent; border: none; outline: none; font-size: 1em; color: white; border-radius: 0; border-bottom: 2px solid white;">
                                </div>
                                <div class="col-md-6">
                                    <label for="password" class="form-label" style="top: 50%; left: 5px; color: white; font-size: 1em;">Password</label>
                                    <input type="password" class="form-control" id="password" required name="password" size="20" autocomplete="off" style="background: transparent; border: none; outline: none; font-size: 1em; color: white; border-radius: 0; border-bottom: 2px solid white;">
                                </div>
                                <div class="col-md-5">
                                    <label for="name" class="form-label" style="top: 50%; left: 5px; color: white; font-size: 1em;">Name</label>
                                    <input type="text" class="form-control" id="name" required name="name" size="20" autocomplete="off" style="background: transparent; border: none; outline: none; font-size: 1em; color: white; border-radius: 0; border-bottom: 2px solid white;">
                                </div>
                                <div class="col-md-4">
                                    <label for="gender" class="form-label" style="top: 50%; left: 5px; color: white; font-size: 1em;">Gender</label>
                                    <select name="gender" required id="gender" class="form-select" style="background: transparent; border: none; outline: none; font-size: 1em; color: white; border-radius: 0; border-bottom: 2px solid white;">
                                        <option value="" style="background: black;" disabled selected>Select Gender</option>
                                        <option value="male" style="background: black;">Male</option>
                                        <option value="female" style="background: black;">Female</option>
                                    </select>
                                </div>
                                <div class="col-md-3">
                                    <label for="dob" class="form-label" style="top: 50%; left: 5px; color: white; font-size: 1em;">D.O.B</label>
                                    <input type="date" class="form-control" id="dob" required name="dob" size="20" autocomplete="off" style="background: transparent; border: none; outline: none; font-size: 1em; color: white; border-radius: 0; border-bottom: 2px solid white;">
                                </div>

                                <div class="col-12">
                                    <label for="email" class="form-label" style="top: 50%; left: 5px; color: white; font-size: 1em;">Email</label>
                                    <input type="email" class="form-control" id="email" required name="email" size="20" autocomplete="off" style="background: transparent; border: none; outline: none; font-size: 1em; color: white; border-radius: 0; border-bottom: 2px solid white;">
                                </div>
                                <div class="col-md-6">
                                    <label for="phone" class="form-label" style="top: 50%; left: 5px; color: white; font-size: 1em;">Phone No</label>
                                    <input type="text" class="form-control" id="phone" required name="phone" size="20" autocomplete="off" style="background: transparent; border: none; outline: none; font-size: 1em; color: white; border-radius: 0; border-bottom: 2px solid white;">
                                </div>
                                <div class="col-md-6">
                                    <label for="userrole" class="form-label" style="top: 50%; left: 5px; color: white; font-size: 1em; ">User Type</label>
                                    <select name="userrole" required id="userrole" class="form-select" style="background: transparent; border: none; outline: none; font-size: 1em; color: white; border-radius: 0; border-bottom: 2px solid white;">
                                        <option value="" style="background: black;" disabled selected>Select Type</option>
                                        <option value="owner" style="background: black;">Owner</option>
                                        <option value="customer" style="background: black;">Customer</option>
                                    </select>
                                </div>
                                <div class="col">
                                    <button type="submit" style="border-radius: 10px;" class="w-100">Register</button>
                                </div>
                                <div class="register">
                                    <p>Already have a account? <a href="login.jsp">Login</a></p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    </body>
</html>
