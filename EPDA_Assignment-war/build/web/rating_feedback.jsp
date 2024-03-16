<%-- 
    Document   : rating_feedback
    Created on : Jul 22, 2023, 7:27:55 PM
    Author     : ASUS
--%>

<%@page import="model.Rating"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rating & Feedback</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" 
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <style>
            .section{
                min-height: 100vh;
                width: 100%;
                background: url('image/background.jpg')no-repeat;
                background-position: center;
                background-size: cover;
            }
            .form-box{
                background: transparent;
                border: 2px solid rgba(255, 255, 255, 0.5);
                border-radius: 20px;
                backdrop-filter: blur(15px);
                padding: 20px; 
                margin: 100px 20px 20px 20px;
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
        <%
            String role = (String) request.getAttribute("role");
            String action = (String) request.getAttribute("action");
            Rating r = (Rating) request.getAttribute("rating");
            Integer cus_rate = r.getCus_rating();
            String cus_feed = r.getCus_comments();
            Integer own_rate = r.getOwner_rating();
            String own_feed = r.getOwner_comments();
        %>
        <script>
            window.onload = function () {
                var message = "${updateMessage}";
                if (message) {
                    alert(message);
                }
            };
        </script>
        <%if (role.equals("owner")) {%>
        <jsp:include page="owner_navbar.jsp" />
        <%} else {%>
        <jsp:include page="customer_navbar.jsp" />
        <%}%>

        <div class="section">
            <div class="container-fluid" style="padding-top: 80px; position: relative;">
                <div style="text-align: center; color: white;">
                    <h2>Rating and Feedback</h2>
                </div>
            </div>
            <form method="POST" action="Rating_Feedback">
                <input type="hidden" name="id" value="<%=r.getSales().getId()%>">
                <input type="hidden" name="action" value="<%=action%>">
                <input type="hidden" name="add_action" value="add_feedback">
                <input type="hidden" name="role" value="<%=role%>">
                <div class="container" style="display: flex; justify-content: center; align-items: center;">
                    <div class="form-box">
                        <div class="form-value">
                            <h2>Customer Feedback</h2>
                            <div class="inputbox">
                                <label for="cus_rate" class="form-label" style="top: 50%; left: 5px; color: white; font-size: 1em;">Rating</label> 
                                <input type="number" name="cus_rate" min="1" max="5" class="form-control" id="cus_rate" <%= role.equals("customer") ? "required" : ""%>  size="20" autocomplete="off" value="<%=cus_rate%>" <%= role.equals("owner") ? "readonly" : ""%>
                                       <%= cus_rate != null ? "readonly" : ""%> style="background: transparent; border: none; outline: none; font-size: 1em; color: white; border-radius: 0; border-bottom: 2px solid white;">
                            </div>
                            <div class="inputbox">
                                <label for="cus_feed" class="form-label" style="top: 50%; left: 5px; color: white; font-size: 1em;">Feedback</label>
                                <textarea class="form-control" id="cus_feed" rows="3" autocomplete="off" maxlength="300" name="cus_feed" <%= role.equals("customer") ? "required" : ""%> <%= role.equals("owner") ? "readonly" : ""%>
                                          <%= !cus_feed.equals("") ? "readonly" : ""%> style="background: transparent; border: none; outline: none; font-size: 1em; color: white; border-radius: 0; border-bottom: 2px solid white; resize: none"><%=cus_feed%></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="form-box">
                        <div class="form-value">
                            <h2>Owner Comment</h2>
                            <div class="inputbox">
                                <label for="own_rate" class="form-label" style="top: 50%; left: 5px; color: white; font-size: 1em;">Rating</label>
                                <input type="number" name="own_rate" min="1" max="5" class="form-control" id="own_rate" size="20" autocomplete="off" value="<%=own_rate%>" <%= role.equals("owner") ? "required" : ""%> <%= role.equals("customer") ? "readonly" : ""%>
                                       <%= own_rate != null ? "readonly" : ""%> style="background: transparent; border: none; outline: none; font-size: 1em; color: white; border-radius: 0; border-bottom: 2px solid white;">
                            </div>
                            <div class="inputbox">
                                <label for="own_feed" class="form-label" style="top: 50%; left: 5px; color: white; font-size: 1em;">Comment</label>
                                <textarea class="form-control" id="own_feed" rows="3" autocomplete="off" maxlength="300" name="own_feed" <%= role.equals("owner") ? "required" : ""%> <%= role.equals("customer") ? "readonly" : ""%>
                                          <%= !own_feed.equals("") ? "readonly" : ""%> style="background: transparent; border: none; outline: none; font-size: 1em; color: white; border-radius: 0; border-bottom: 2px solid white; resize: none"><%=own_feed%></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container" style="display: flex; justify-content: center; align-items: center;">
                    <div class="row w-50">
                        <div class="col" style="margin:10px">
                            <button type="submit" style="border-radius: 10px; width: 100%;">Confirm</button>
                        </div>
                        <div class="col" style="margin:10px;">
                            <button type="button" style="border-radius: 10px; width: 100%;"  onclick="window.location.href = 'History?action=<%=action%>'">Back</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" 
                integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" 
                crossorigin="anonymous"></script>

        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    </body>
</html>
