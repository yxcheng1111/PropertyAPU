<%-- 
    Document   : edit_user
    Created on : Jul 16, 2023, 8:21:28 PM
    Author     : ASUS
--%>

<%@page import="model.Customer"%>
<%@page import="model.Owner"%>
<%@page import="model.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <style>
            div.dataTables_info {
                color: white !important;
            }

            div.dataTables_length {
                color: white !important;
            }

            div.dataTables_filter {
                color: white !important;
            }
            section{
                display: flex;
                justify-content: center;
                align-items: center;
            }
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
                margin-top: 15vh;
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
        <jsp:include page="admin_navbar.jsp" />
        <div class="section">
            <section>
                <div class="container" style=" margin-top: 85px;">
                    <div class="col-12 col-sm-8 col-md-6 m-auto">
                        <div class="form-box p-3">
                            <div class="card-body">
                                <% try {
                                        String username = "";
                                        String email = "";
                                        String dob = "";
                                        String name = "";
                                        String gender = "";
                                        String phone = "";

                                        String user = (String) request.getAttribute("user");

                                        if (user.equals("Staff")) {
                                            Admin admin = (Admin) request.getAttribute("admin");
                                            username = admin.getId();
                                            email = admin.getEmail();
                                            dob = admin.getDob();
                                            name = admin.getName();
                                            gender = admin.getGender();
                                            phone = admin.getPhone();
                                        } else if (user.equals("Owner")) {
                                            Owner admin = (Owner) request.getAttribute("owner");
                                            username = admin.getId();
                                            email = admin.getEmail();
                                            dob = admin.getDob();
                                            name = admin.getName();
                                            gender = admin.getGender();
                                            phone = admin.getPhone();
                                        } else {
                                            Customer admin = (Customer) request.getAttribute("cus");
                                            username = admin.getId();
                                            email = admin.getEmail();
                                            dob = admin.getDob();
                                            name = admin.getName();
                                            gender = admin.getGender();
                                            phone = admin.getPhone();
                                        }
                                %>

                                <h2 style="font-size: 2em; color: white; text-align: center;">Edit ${user}</h2>
                                <form action="Update" method="POST" class="row g-3">
                                    <input type="hidden" name="role"  value="<%=user.toLowerCase()%>">
                                    <input type="hidden" name="action"  value="edit_user">
                                    <div class="col-md-6">
                                        <label for="username" class="form-label" style="top: 50%; left: 5px; color: white; font-size: 1em;">Username</label>
                                        <input type="text" name="username" value="<%=username%>" class="form-control" required id="username"  size="20" autocomplete="off" style="background: transparent; border: none; outline: none; font-size: 1em; color: white; border-radius: 0; border-bottom: 2px solid white;" readonly >
                                    </div>
                                    <div class="col-md-6">
                                        <label for="name" class="form-label" style="top: 50%; left: 5px; color: white; font-size: 1em;">Name</label>
                                        <input type="text" name="name" value="<%=name%>" class="form-control" id="name" required  size="20" autocomplete="off" style="background: transparent; border: none; outline: none; font-size: 1em; color: white; border-radius: 0; border-bottom: 2px solid white;">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="gender" class="form-label" style="top: 50%; left: 5px; color: white; font-size: 1em;">Gender</label>
                                        <select name="gender" id="gender" class="form-select" style="background: transparent; border: none; outline: none; font-size: 1em; color: white; border-radius: 0; border-bottom: 2px solid white;">
                                            <option value="male" style="background: black;" <% if (gender.equals("male")) { %>selected<% } %>>Male</option>
                                            <option value="female" style="background: black;" <% if (gender.equals("female")) { %>selected<% }%>>Female</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="dob" class="form-label" style="top: 50%; left: 5px; color: white; font-size: 1em;">D.O.B</label>
                                        <input type="date" name="dob" value="<%=dob%>" class="form-control" id="dob" required  size="20" autocomplete="off" style="background: transparent; border: none; outline: none; font-size: 1em; color: white; border-radius: 0; border-bottom: 2px solid white;" readonly>
                                    </div>

                                    <div class="col-12">
                                        <label for="email" class="form-label" style="top: 50%; left: 5px; color: white; font-size: 1em;">Email</label>
                                        <input type="email" name="email" value="<%=email%>" class="form-control" id="email" required  size="20" autocomplete="off" style="background: transparent; border: none; outline: none; font-size: 1em; color: white; border-radius: 0; border-bottom: 2px solid white;">
                                    </div>
                                    <div class="col-12">
                                        <label for="phone" class="form-label" style="top: 50%; left: 5px; color: white; font-size: 1em;">Phone No</label>
                                        <input type="text" name="phone" value="<%=phone%>" class="form-control" id="phone" required  size="20" autocomplete="off" style="background: transparent; border: none; outline: none; font-size: 1em; color: white; border-radius: 0; border-bottom: 2px solid white;">
                                    </div>
                                    <div class="col" style="margin-top: 17px;">
                                        <div class="row">
                                            <div class="col">
                                                <button type="submit" style="border-radius: 10px;" class="w-100" style="border-radius: 40px;">Update</button>
                                            </div>
                                            <div class="col" >
                                                <button type="button" style="border-radius: 10px;" onclick="window.location.href = 'Manage_User?role=<%= user.toLowerCase() %>&action=cancel'" class="w-100" style="border-radius: 40px;">Cancel</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>


                                <% } catch (Exception e) {
                                        e.printStackTrace();
                                        // Handle the exception appropriately
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-XXXXX" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
    </body>
</html>
