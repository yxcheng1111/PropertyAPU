<%-- 
    Document   : admin_home
    Created on : Jul 7, 2023, 11:09:00 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <style>
            header {
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

            .logo {
                font-size: 2em;
                color: white;
                user-setect: none;
            }

            .navigation {
                display: flex;
            }

            .navigation a {
                position: relative;
                font-size: 1.1em;
                color: white;
                text-decoration: none;
                font-weight: 500;
                margin-left: 20px;
                padding: 0 25px; 
            }

            .navigation a::after {
                content: '';
                left: 0;
                bottom: -6px;
                position: absolute;
                width: 100%;
                height: 3px;
                background: white;
                border-radius: 5px;
                transform: scaleX(0);
                transform-origin: right;
                transition: transform .5s;
            }

            .navigation a:hover::after {
                transform-origin: left;
                transform: scaleX(1);
            }

            .dropdown-menu {
                background: transparent;
            }

            .dropdown-menu a {
                color: white;
            }

            .dropdown-menu::before {
                border-bottom-color: white;
            }

            .dropdown-menu::after {
                border-top-color: white;
            }
        </style>
    </head>
    <body>
        <%@ page import="model.UserAcc" %>
        <% HttpSession s = request.getSession(false);
            int count = (Integer) s.getAttribute("pending_count"); %>
        <header>
            <h2 class="logo">PropertyAPU</h2>
            <nav class="navigation">
                <a class="nav-link" href="admin_home.jsp">Home</a>
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="true">Manage User
                    <%if (count != 0) {%>
                    <span class="position-absolute top-50 start-100 translate-middle badge rounded-pill bg-danger">
                        <%=count%>
                        <span class="visually-hidden">unread messages</span>
                    </span>
                    <%}%>
                </a>
                <ul class="dropdown-menu">
                    <form action="Manage_User" method="POST">
                        <%
                            UserAcc user = (UserAcc) s.getAttribute("login");
                            if (user != null && user.getRole().equals("admin")) { %>
                        <li><a class="dropdown-item" href="Manage_User?role=staff&action=edit_user">Manage Staff</a></li>
                            <% }%>
                        <li><a class="dropdown-item" href="Manage_User?role=customer&action=edit_user">Manage Customer</a></li>
                        <li><a class="dropdown-item" href="Manage_User?role=owner&action=edit_user">Manage Owner</a></li>
                        <li><a class="dropdown-item" href="Manage_User?role=owner_pending&action=edit_user">Pending Approval 
                                <%if (count != 0) {%>
                                <span class="position-absolute top-50 start-100 translate-middle badge rounded-pill bg-danger">
                                    <%=count%>
                                    <span class="visually-hidden">unread messages</span>
                                </span>
                                <%}%>
                            </a>
                        </li>
                    </form>
                </ul>
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="true">Reports</a>
                <ul class="dropdown-menu">
                    <form>
                        <li><a class="dropdown-item" href="Report?action=gender">Gender Report</a></li>
                        <li><a class="dropdown-item" href="Report?action=age">Age Report</a></li>
                        <li><a class="dropdown-item" href="Report?action=location">Location Report</a></li>
                        <li><a class="dropdown-item" href="Report?action=login">Last 24 Hours User Login Report</a></li>
                        <li><a class="dropdown-item" href="Report?action=sale">Monthly Sales Report</a></li>
                    </form>
                </ul>
                <%  if (user != null && user.getRole().equals("staff")) { %>
                <a class="nav-link" href="Manage_User?role=staff&action=edit_profile">Edit Profile</a>
                <% }%>
                <%  if (user != null && user.getRole().equals("admin")) { %>
                <a class="nav-link" href="update_password.jsp">Change Password</a>
                <% }%>
                <a class="nav-link" href="Logout">Logout</a>
            </nav>
        </header>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    </body>
</html>
