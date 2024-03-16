<%-- 
    Document   : manage_staff
    Created on : Jul 8, 2023, 3:00:45 PM
    Author     : ASUS
--%>

<%@page import="java.util.List"%>
<%@page import="model.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/dataTables.bootstrap5.min.css">

        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.5/js/dataTables.bootstrap5.min.js"></script>

        <script>
            $(document).ready(function () {
                $('#staffTable').DataTable({
                    "bFilter": false,
                });
            })
        </script>
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
                margin-bottom: 20px;
            }
            .search-container {
                position: absolute;
                top: 80px;
                right: 13px;
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
        <%
            String input = (request.getAttribute("input") == null) ? "" : (String) request.getAttribute("input");
        %>
        <script>
            window.addEventListener('DOMContentLoaded', function () {
                var searchInput = document.getElementById('search');
                searchInput.focus();
                searchInput.setSelectionRange(searchInput.value.length, searchInput.value.length);
            });

            window.onload = function () {
                var message = "${updateMessage}";
                if (message) {
                    alert(message);
                }
            };
        </script>

        <jsp:include page="admin_navbar.jsp" />
        <div class="section">
            <div class="container-fluid" style="padding-top: 80px;">
                <div style="text-align: center; color: white;">
                    <h2>Manage Staff</h2>
                </div>
                <div class="search-container" style="margin-top:47px;">
                    <div class="row">
                        <div class="col text-end">
                            <div class="input-group">
                                <input type="text" value="<%=input%>" id="search" class="form-control" style="height: 31px;" placeholder="Search" autocomplete="off" name="query" 
                                       oninput="window.location.href = 'Manage_User?role=staff&action=update_table&query=' + encodeURIComponent(document.getElementById('search').value)">
                            </div>
                        </div>
                    </div>
                </div>
                <table id="staffTable" class="table table-striped table-dark">
                    <thead>
                        <tr>
                            <th class="align-middle text-center-left" style="width: 256px;">Username</th>
                            <th class="align-middle text-center-left" style="width: 175.016px;">Name</th>
                            <th class="align-middle text-center-left" style="width: 198.531px;">Gender</th>
                            <th class="align-middle text-center-left" style="width: 227.266px;">D.O.B</th>
                            <th class="align-middle text-center-left" style="width: 337px;">Email</th>
                            <th class="align-middle text-center-left" style="width: 282.188px;">Phone No</th>
                            <th data-orderable="false" style="width: 200px;">
                                <form>
                                    <button class="btn btn-primary" formaction="add_staff.jsp"><ion-icon name="add-circle"></ion-icon></button>
                                </form>
                            </th>
                        </tr>
                    </thead>
                    <tbody class="table-group-divider">
                        <% try {
                                List<Admin> admins = (List<Admin>) request.getAttribute("admin_list");
                                for (Admin item : admins) {
                                    String username = item.getId();
                                    String email = item.getEmail();
                                    String dob = item.getDob();
                                    String name = item.getName();
                                    String gender = item.getGender();
                                    String phone = item.getPhone();
                        %>
                        <tr>
                            <td class="align-middle text-center-left"><%= username%></td>
                            <td class="align-middle text-center-left"><%= name%></td>
                            <td class="align-middle text-center-left"><%= gender%></td>
                            <td class="align-middle text-center-left"><%= dob%></td>
                            <td class="align-middle text-center-left"><%= email%></td>
                            <td class="align-middle text-center-left">
                                <a href="tel:+6<%= phone%>"><%= phone%></a>
                            </td>
                            <td>
                                <div class="row">
                                    <form class="col" method="post" action="Manage_User">
                                        <input type="hidden" name="username" value="<%= username%>">
                                        <input type="hidden" name="action" value="staff_edit">
                                        <button name="role"  value="staff" class="btn btn-primary"><ion-icon name="create"></ion-icon></button>
                                    </form>
                                    <form class="col" method="post" action="Delete">
                                        <input type="hidden" name="username" value="<%= username%>">
                                        <button name="action"  value="staff" class="btn btn-danger"><ion-icon name="trash"></ion-icon></button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                        <% }
                            } catch (Exception e) {
                                e.printStackTrace();
                                // Handle the exception appropriately
                            }
                        %>
                    </tbody>
                </table>
                <style>
                    .text-center-left {
                        text-align: center;
                        text-align-last: left;
                    }
                </style>
            </div>
        </div>  
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    </body>
</html>
