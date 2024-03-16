<%-- 
    Document   : manage_property
    Created on : Jul 18, 2023, 1:55:01 AM
    Author     : ASUS
--%>

<%@page import="model.Property"%>
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
                $('#propertyTable').DataTable({
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
        <script>
            window.onload = function () {
                var message = "${updateMessage}";
                if (message) {
                    alert(message);
                }
            };
        </script>
        <jsp:include page="owner_navbar.jsp" />
        <% String action = (String) request.getAttribute("action");%>
        <div class="section">
            <div class="container-fluid" style="padding-top: 80px;">
                <div style="text-align: center; color: white;">
                    <h2>Manage Property For <%= action.substring(0, 1).toUpperCase() + action.substring(1)%></h2>
                </div>
                <div class="search-container" style="margin-top:47px;">
                    <div class="row">
                        <div class="col text-end">
                            <div class="input-group">
                                <input type="text" id="search" class="form-control" style="height: 31px;" placeholder="Search" autocomplete="off" name="query">
                                <span type="button" class="input-group-text" style="background-color: white; border: none; cursor: pointer;" onclick="window.location.href = 'Manage_Property?action=update_table_<%=action%>&query=' + encodeURIComponent(document.getElementById('search').value)">
                                    <ion-icon name="search-outline"></ion-icon>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <table id="propertyTable" class="table table-striped table-dark">
                    <thead>
                        <tr>
                            <th class="align-middle text-center-left">Property Name</th>
                            <th class="align-middle text-center-left">Listed Date</th>
                            <th class="align-middle text-center-left">Property Type</th>
                            <th class="align-middle text-center-left">Furnishing</th>
                            <th class="align-middle text-center-left">Room No</th>
                            <th class="align-middle text-center-left">Toilet No</th>
                            <th class="align-middle text-center-left">Floor Size</th>
                            <th class="align-middle text-center-left">Location</th>
                                <% if (action.equals("rent")) { %>
                            <th class="align-middle text-center-left">Rent Price</th>
                                <% } else if (action.equals("sale")) { %>
                            <th class="align-middle text-center-left">Sale Price</th>
                                <% }%>
                            <th data-orderable="false" style="width: 200px;">
                                <form>
                                    <button name="action" value="<%=action%>" class="btn btn-primary" formaction="add_property.jsp"><ion-icon name="add-circle"></ion-icon></button>
                                </form>
                            </th>
                        </tr>
                    </thead>
                    <tbody class="table-group-divider">
                        <% try {
                                List<Property> propertis = (List<Property>) request.getAttribute("property_list");
                                for (Property item : propertis) {
                                    long id = item.getId();
                                    String p_name = item.getProperty_name();
                                    String p_type = item.getProperty_type();
                                    String l_date = item.getListed_date();
                                    String furn = item.getFurnishing();
                                    String r_no = item.getRoom_no();
                                    String t_no = item.getToilet_no();
                                    String f_size = item.getFloor_size();
                                    String location = item.getLocation();
                                    String r_price = item.getRent_price();
                                    String s_price = item.getSale_price();
                        %>
                        <tr>
                            <td class="align-middle text-center-left"><%=p_name%></td>
                            <td class="align-middle text-center-left"><%=l_date.substring(0, 10)%></td>
                            <td class="align-middle text-center-left"><%=p_type.substring(0, 1).toUpperCase() + p_type.substring(1)%></td>
                            <td class="align-middle text-center-left"><%=furn.substring(0, 1).toUpperCase() + furn.substring(1)%></td>
                            <td class="align-middle text-center-left"><%=r_no%></td>
                            <td class="align-middle text-center-left"><%=t_no%></td>
                            <td class="align-middle text-center-left"><%=f_size%></td>
                            <td class="align-middle text-center-left"><%=location.substring(0, 1).toUpperCase() + location.substring(1)%></td>
                            <% if (action.equals("rent")) {%>
                            <td class="align-middle text-center-left rent-price"><%= r_price%></td>
                            <% } else if (action.equals("sale")) {%>
                            <td class="align-middle text-center-left sale-price"><%= s_price%></td>
                            <% }%>
                            <td>
                                <div class="row">
                                    <form class="col" method="post" action="Owner_Action">
                                        <input type="hidden" name="id" value="<%= id%>">
                                        <input type="hidden" name="table" value="<%= action%>">
                                        <button name="action"  value="edit_property" class="btn btn-primary"><ion-icon name="create"></ion-icon></button>
                                    </form>
                                    <form class="col" method="post" action="Owner_Action">
                                        <input type="hidden" name="id" value="<%= id%>">
                                        <input type="hidden" name="table" value="<%= action%>">
                                        <button name="action"  value="delete_property" class="btn btn-danger"><ion-icon name="trash"></ion-icon></button>
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
