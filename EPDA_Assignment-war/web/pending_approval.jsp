<%-- 
    Document   : pending_approval
    Created on : Jul 17, 2023, 5:56:03 PM
    Author     : ASUS
--%>

<%@page import="model.Owner"%>
<%@page import="java.util.List"%>
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
                $('#ownerTable').DataTable({
                    "order": [[6, "asc"]],
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
            .search-container {
                position: absolute;
                top: 80px;
                right: 13px;
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
                margin-bottom: 20px;
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
                    <h2>Owner Pending Approval</h2>
                </div>
                <div class="search-container" style="margin-top:47px;">
                    <div class="row">
                        <div class="col text-end">
                            <div class="input-group">
                                <input type="text" id="search" class="form-control" style="height: 31px;" placeholder="Search" autocomplete="off" name="query">
                                <span type="button" class="input-group-text" style="background-color: white; border: none; cursor: pointer;" onclick="window.location.href = 'Manage_User?role=owner_pending&action=update_table&query=' + encodeURIComponent(document.getElementById('search').value)">
                                    <ion-icon name="search-outline"></ion-icon>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>                <table id="ownerTable" class="table table-striped table-dark">
                    <thead>
                        <tr>
                            <th class="align-middle text-center-left">Username</th>
                            <th class="align-middle text-center-left">Name</th>
                            <th class="align-middle text-center-left">Gender</th>
                            <th class="align-middle text-center-left">D.O.B</th>
                            <th class="align-middle text-center-left">Email</th>
                            <th class="align-middle text-center-left">Phone No</th>
                            <th class="align-middle text-center-left">Approval Status</th>
                            <th data-orderable="false" class="align-middle text-center-left" style="width: 200px;">Action</th>
                        </tr>
                    </thead>
                    <tbody class="table-group-divider">
                        <% try {
                                List<Owner> admins = (List<Owner>) request.getAttribute("owner_list");
                                for (Owner item : admins) {
                                    String username = item.getId();
                                    String email = item.getEmail();
                                    String dob = item.getDob();
                                    String name = item.getName();
                                    String gender = item.getGender();
                                    String phone = item.getPhone();
                                    String status = item.getApproval_status();
                        %>
                        <tr>
                            <td class="align-middle text-center-left"><%= username%></td>
                            <td class="align-middle text-center-left"><%= name%></td>
                            <td class="align-middle text-center-left"><%= gender%></td>
                            <td class="align-middle text-center-left"><%= dob%></td>
                            <td class="align-middle text-center-left"><%= email%></td>
                            <td class="align-middle text-center-left"><%= phone%></td>
                            <td class="align-middle text-center-left"><%= status%></td>
                            <td>
                                <div class="row">
                                    <div class="col">
                                        <button type="button" onclick="window.location.href = 'Approval?username=<%= username%>&action=<%= (status.equals("rejected") ? "approve_rejected" : "approve")%>'" class="btn btn-primary">
                                            <ion-icon name="checkmark-outline"></ion-icon>
                                        </button>
                                    </div>
                                    <div class="col">
                                        <button type="button" onclick="window.location.href = 'Approval?username=<%= username%>&action=reject'" class="btn btn-danger" <% if (status.equals("rejected")) { %>disabled<% }%>><ion-icon name="close-outline"></ion-icon></button>
                                    </div>
                                    <div class="col">            
                                        <button type="button" onclick="window.location.href = 'Delete?username=<%= username%>&action=owner_pending'" class="btn btn-danger" <% if (status.equals("pending")) { %>disabled<% }%> ><ion-icon name="trash"></ion-icon></button>      
                                    </div>
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
