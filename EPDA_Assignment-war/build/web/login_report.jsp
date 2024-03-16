<%-- 
    Document   : login_report
    Created on : Jul 23, 2023, 7:04:50 PM
    Author     : ASUS
--%>

<%@page import="java.util.List"%>
<%@page import="model.UserAcc"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Report</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.3.2/html2canvas.min.js"></script>


        <style>
            section {
                display: flex;
                flex-direction: column; /* Align items vertically */
                align-items: center;
                min-height: 100vh;
                width: 100%;
                background: url('image/background.jpg') no-repeat;
                background-position: center;
                background-size: cover;
            }

            .form-box {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                background: transparent;
                border: 2px solid rgba(255, 255, 255, 0.5);
                border-radius: 20px;
                backdrop-filter: blur(15px);
                position: relative;
                margin-top: 20px;
            }

            .chart-container {
                min-width: 300px;
                height: 40%;
                padding: 10px;
                text-align: center;
                margin: 20px;
                display: flex;
                flex-direction: column;
                justify-content: center;
            }

            .container {
                display: flex;
                justify-content: center;
                align-items: center;
                flex-wrap: wrap;

            }

            button {
                width: 150px;
                height: 40px;
                background: white;
                border: none;
                outline: none;
                cursor: pointer;
                font-size: 1em;
                font-weight: 600;
                margin: 5px;
                border-radius: 10px;
            }
        </style>
    </head>
    <body>
        <%
            List<UserAcc> cus_login = (List<UserAcc>) request.getAttribute("cus_login");
            List<UserAcc> own_login = (List<UserAcc>) request.getAttribute("own_login");
            int cus_count = cus_login.size();
            int own_count = own_login.size();
        %>
        <script>
            function drawChart() {
                var user = ['Owner & Customer', 'Owner', 'Customer'];
                var cus_count = <%= cus_count%>;
                var own_count = <%= own_count%>;

                new Chart('myChart1', {
                    type: 'bar',
                    data: {
                        labels: user,
                        datasets: [{
                                data: [(cus_count + own_count), own_count, cus_count],
                                backgroundColor: ['rgba(54, 162, 235, 0.8)', 'rgba(255, 99, 132, 0.8)', 'rgba(75, 192, 192, 0.8)'],
                                hoverOffset: 15,
                            }],
                    },
                    options: {
                        plugins: {
                            legend: {
                                display: false,
                            },
                            title: {
                                display: true,
                                text: 'Number of User Login in Past 24 hours',
                                font: {
                                    size: 18,
                                },
                                color: 'white',
                            },
                        },
                        scales: {
                            x: {
                                grid: {
                                    color: 'rgba(255, 255, 255, 0.1)',
                                },
                                ticks: {
                                    color: 'white',
                                },
                            },
                            y: {
                                beginAtZero: true,
                                grid: {
                                    color: 'rgba(255, 255, 255, 0.1)',
                                },
                                ticks: {
                                    stepSize: 1,
                                    color: 'white',
                                },
                            },
                        },
                    },
                });
            }

            window.onload = function () {
                var message = "${updateMessage}";
                if (message) {
                    alert(message);
                }
                drawChart();
            };

        </script>
        <jsp:include page="admin_navbar.jsp" />
        <section>
            <div class="container-fluid" style="padding-top: 80px;">
                <div style="text-align: center; color: white;">
                    <h2>Login Report</h2>
                </div>
            </div>
            <div class="container" style="padding-top:30px; padding-bottom: 50px;">
                <button type="button" class="button" onclick="exportToImage()" style=" margin: 20px; border-radius: 10px;">Export</button>
                <button type="button" class="button" onclick="window.location.href = 'admin_home.jsp'" style=" margin: 20px; border-radius: 10px;">Back</button>
            </div>
            <div class="form-box" id="form-box">
                <div class="chart-container">
                    <canvas id="myChart1" width="600px" height="600px"></canvas>
                </div>
            </div>
        </section>
        <script>
            function exportToImage() {
                const formBox = document.getElementById('form-box');

                html2canvas(formBox, {backgroundColor: 'black'}).then((canvas) => {
                    const link = document.createElement('a');
                    link.download = "Login_Report.png";
                    link.href = canvas.toDataURL('image/png');
                    link.click();
                    alert("Successfully exported the report to image");
                });
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
    </body>
</html>
