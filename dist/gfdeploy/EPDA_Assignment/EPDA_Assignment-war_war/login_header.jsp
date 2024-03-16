<%-- 
    Document   : login_header
    Created on : Jul 16, 2023, 11:39:32 AM
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
            header{
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                padding: 20px 100px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                z-index: 99;
            }
            .logo{
                font-size: 2em;
                color: white;
                user-setect:none;
            }

            .navigation .btnLogin-popup{
                width: 130px;
                height: 50px;
                background: transparent;
                border: 2px solid white;
                outline: none;
                border-radius: 6px;
                cursor: pointer;
                font-size: 1.1em;
                color: white;
                font-weight: 500;
                margin-left: 40px;
                transition: .5s;
            }

            .navigation .btnLogin-popup:hover{
                background: white;
                color: #162938;
            }

            .navigation .btnRegister-popup{
                width: 130px;
                height: 50px;
                background: transparent;
                border: 2px solid white;
                outline: none;
                border-radius: 6px;
                cursor: pointer;
                font-size: 1.1em;
                color: white;
                font-weight: 500;
                margin-left: 40px;
                transition: .5s;
            }

            .navigation .btnRegister-popup:hover{
                background: white;
                color: #162938;
            }
        </style>
    </head>
    <body>
        <header>
            <h2 class="logo">PropertyAPU</h2>
            <nav class="navigation">
                <button class="btnLogin-popup">Login</button>
                <button class="btnRegister-popup">Register</button>
            </nav>
        </header>

        <script>
            document.addEventListener('DOMContentLoaded', () => {
                const btnlogin = document.querySelector('.btnLogin-popup');
                const btnregister = document.querySelector('.btnRegister-popup');
                const formlogin = document.querySelector('.form-box-login');
                const formreg = document.querySelector('.form-box-reg');
                const formforgot = document.querySelector('.form-box-forgot');
                const iconclose = document.querySelector('.icon-close');


                btnlogin.addEventListener('click', () => {
                    if (formlogin) {
                        formlogin.style.transform = 'scale(1)';
                    } else {
                        window.location.href = 'login.jsp';
                    }
                });


                btnregister.addEventListener('click', () => {
                    if (formreg) {
                        formreg.style.transform = 'scale(1)';
                    } else {
                        window.location.href = 'register.jsp';
                    }
                });

                if (formlogin || formreg || formforgot) {
                    iconclose.addEventListener('click', () => {
                        if (formlogin) {
                            formlogin.style.transform = 'scale(0)';
                        }
                        if (formreg) {
                            formreg.style.transform = 'scale(0)';
                        }
                        if (formforgot) {
                            formforgot.style.transform = 'scale(0)';
                        }
                    });
                }
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
    </body>
</html>
