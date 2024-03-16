<%-- 
    Document   : add_property
    Created on : Jul 18, 2023, 12:29:26 PM
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
            window.onload = function () {
                var message = "${updateMessage}";
                if (message) {
                    alert(message);
                }
            };
        </script>
        <jsp:include page="owner_navbar.jsp" />
        <%
            String result = request.getParameter("action");
        %>
        <div class="section">
            <section>
                <div class="container" style=" margin-top: 30px;">
                    <div class="col-12 col-sm-8 col-md-6 m-auto">
                        <div class="form-box p-3">
                            <div class="card-body">
                                <h2 style="font-size: 2em; color: white; text-align: center;">Add Property</h2>
                                <form action="Add_Property" method="POST" class="row g-3">
                                    <div class="col-md-12">
                                        <label for="p_name" class="form-label" style="top: 50%; left: 5px; color: white; font-size: 1em;">Property Name</label>
                                        <input type="text" name="p_name" class="form-control" required id="p_name"  size="20" autocomplete="off" style="background: transparent; border: none; outline: none; font-size: 1em; color: white; border-radius: 0; border-bottom: 2px solid white;">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="p_type" class="form-label" style="top: 50%; left: 5px; color: white; font-size: 1em;">Property Type</label>
                                        <select name="p_type" id="p_type" class="form-select" required
                                                style="background: transparent; border: none; outline: none; font-size: 1em; color: white; border-radius: 0; border-bottom: 2px solid white;" >
                                            <option value="" style="background: black;" disabled selected>Select Type</option>
                                            <option value="bungalow" style="background: black;">Bungalow</option>
                                            <option value="semi-d" style="background: black;">Semi-D</option>
                                            <option value="terrace" style="background: black;">Terrace</option>
                                            <option value="townhouse" style="background: black;">Townhouse</option>
                                            <option value="penthouse" style="background: black;">Penthouse</option>
                                            <option value="condominium  " style="background: black;">Condominium/Serviced Residence</option>
                                            <option value="apartment" style="background: black;">Apartment/Flat</option>
                                            <option value="shophouse" style="background: black;">Shophouse</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="furnishing" class="form-label" style="top: 50%; left: 5px; color: white; font-size: 1em;">Furnishing</label>
                                        <select name="furnishing" id="furnishing" class="form-select" style="background: transparent; border: none; outline: none; font-size: 1em; color: white; border-radius: 0; border-bottom: 2px solid white;" required>
                                            <option value="" style="background: black;" disabled selected>Select Type</option>
                                            <option value="unfurnished" style="background: black;">Unfurnished</option>
                                            <option value="partially furnished" style="background: black;">Partially Furnished</option>
                                            <option value="fully furnished" style="background: black;">Fully Furnished</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="r_no" class="form-label" style="top: 50%; left: 5px; color: white; font-size: 1em;">Number of Rooms</label>
                                        <input type="number" name="r_no" min="1" class="form-control" id="r_no" required  size="20" autocomplete="off" 
                                               style="background: transparent; border: none; outline: none; font-size: 1em; color: white; border-radius: 0; border-bottom: 2px solid white;">
                                    </div>
                                    <div class="col-md-4">
                                        <label for="t_no" class="form-label" style="top: 50%; left: 5px; color: white; font-size: 1em;">Number of Toilets</label>
                                        <input type="number" name="t_no" min="1" class="form-control" id="t_no" required  size="20" autocomplete="off" 
                                               style="background: transparent; border: none; outline: none; font-size: 1em; color: white; border-radius: 0; border-bottom: 2px solid white;">
                                    </div>
                                    <div class="col-md-4">
                                        <label for="f_size" class="form-label" style="top: 50%; left: 5px; color: white; font-size: 1em;">Floor Size(sq ft)</label>
                                        <input type="number" name="f_size" min="50" class="form-control" id="f_size" size="20" autocomplete="off" required
                                               style="background: transparent; border: none; outline: none; font-size: 1em; color: white; border-radius: 0; border-bottom: 2px solid white;">
                                    </div>
                                    <div class="col-md-12">
                                        <label for="location" class="form-label" style="top: 50%; left: 5px; color: white; font-size: 1em;">Location</label>
                                        <select name="location" id="location" class="form-select" required
                                                style="background: transparent; border: none; outline: none; font-size: 1em; color: white; border-radius: 0; border-bottom: 2px solid white;" >
                                            <option value="" style="background: black;" disabled selected>Select Type</option>
                                            <option value="johor" style="background: black;">Johor</option>
                                            <option value="kedah" style="background: black;">Kedah</option>
                                            <option value="kelantan" style="background: black;">Kelantan</option>
                                            <option value="malacca" style="background: black;">Malacca</option>
                                            <option value="negeri sembilan" style="background: black;">Negeri Sembilan</option>
                                            <option value="pahang" style="background: black;">Pahang</option>
                                            <option value="penang" style="background: black;">Penang</option>
                                            <option value="perak" style="background: black;">Perak</option>
                                            <option value="peris" style="background: black;">Perlis</option>
                                            <option value="sabah" style="background: black;">Sabah</option>
                                            <option value="sarawak" style="background: black;">Sarawak</option>
                                            <option value="selangor" style="background: black;">Selangor</option>
                                            <option value="terengganu" style="background: black;">Terengganu</option>
                                            <option value="kuala lumpur" style="background: black;">Kuala Lumpur</option>
                                            <option value="labuan" style="background: black;">Labuan</option>
                                            <option value="putrajaya" style="background: black;">Putrajaya</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="r_price" class="form-label" style="top: 50%; left: 5px; color: white; font-size: 1em;">Rent Price</label>
                                        <input type="number" name="r_price"  <%= result.equals("sale") ? "min='0'" : "min='1'"%> class="form-control" id="r_price" size="20" autocomplete="off"  <%= result.equals("rent") ? "required" : ""%>
                                               style="background: transparent; border: none; outline: none; font-size: 1em; color: white; border-radius: 0; border-bottom: 2px solid white;">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="s_price" class="form-label" style="top: 50%; left: 5px; color: white; font-size: 1em;">Sale Price</label>
                                        <input type="number" name="s_price"  <%= result.equals("rent") ? "min='0'" : "min='1'"%> class="form-control" id="s_price" size="20" autocomplete="off" <%= result.equals("sale") ? "required" : ""%>
                                               style="background: transparent; border: none; outline: none; font-size: 1em; color: white; border-radius: 0; border-bottom: 2px solid white;">
                                    </div>
                                    <div class="col-md-12">
                                        <label for="desc" class="form-label" style="top: 50%; left: 5px; color: white; font-size: 1em;">Description</label>
                                        <textarea class="form-control" id="desc" rows="3" autocomplete="off" maxlength="300" name="desc"
                                                  style="background: transparent; border: none; outline: none; font-size: 1em; color: white; border-radius: 0; border-bottom: 2px solid white; resize: none"></textarea>
                                    </div>
                                    <div class="col" style="margin-top: 17px;">
                                        <div class="row">
                                            <div class="col">
                                                <button type="submit" style="border-radius: 10px;" name="action" value=<%=result%> class="w-100" style="border-radius: 40px;">Add</button>
                                            </div>
                                            <div class="col" >
                                                <button type="button" style="border-radius: 10px;" onclick="window.location.href = 'Manage_Property?action=<%=result%>'" class="w-100" style="border-radius: 40px;">Cancel</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-XXXXX" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
    </body>
</html>
