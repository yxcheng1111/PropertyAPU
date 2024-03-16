<%-- 
    Document   : location_report
    Created on : Jul 23, 2023, 5:08:13 PM
    Author     : ASUS
--%>

<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Property Location Report</title>
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
                width: 80%;
                height: 60%;
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                background: transparent;
                border: 2px solid rgba(255, 255, 255, 0.5);
                border-radius: 20px;
                backdrop-filter: blur(15px);
                position: relative;
                margin-top: 20px;
            }

            .chart-container {
                width: calc(100% - 40px);
                min-width: 300px;
                height: 985px;
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
            List<String> location = (List<String>) request.getAttribute("location");

            int[] location_cumulative1 = new int[16];

            for (String locate : location) {
                if (locate.equals("johor")) {
                    location_cumulative1[0]++;
                } else if (locate.equals("kedah")) {
                    location_cumulative1[1]++;
                } else if (locate.equals("kelantan")) {
                    location_cumulative1[2]++;
                } else if (locate.equals("malacca")) {
                    location_cumulative1[3]++;
                } else if (locate.equals("negeri sembilan")) {
                    location_cumulative1[4]++;
                } else if (locate.equals("pahang")) {
                    location_cumulative1[5]++;
                } else if (locate.equals("penang")) {
                    location_cumulative1[6]++;
                } else if (locate.equals("perak")) {
                    location_cumulative1[7]++;
                } else if (locate.equals("peris")) {
                    location_cumulative1[8]++;
                } else if (locate.equals("sabah")) {
                    location_cumulative1[9]++;
                } else if (locate.equals("sarawak")) {
                    location_cumulative1[10]++;
                } else if (locate.equals("selangor")) {
                    location_cumulative1[11]++;
                } else if (locate.equals("terengganu")) {
                    location_cumulative1[12]++;
                } else if (locate.equals("kuala lumpur")) {
                    location_cumulative1[13]++;
                } else if (locate.equals("labuan")) {
                    location_cumulative1[14]++;
                } else if (locate.equals("putrajaya")) {
                    location_cumulative1[15]++;
                }
            }
        %>
        <script>
            function drawChart() {
                var locations1 = ['Johor', 'Kedah', 'Kelantan', 'Malacca', 'Negeri Sembilan', 'Pahang', 'Penang', 'Perak','Peris', 'Sabah', 'Sarawak', 'Selangor', 'Terengganu', 'Kuala Lumpur', 'Labuan', 'Putrajaya']


                var location_count1 = <%= Arrays.toString(location_cumulative1)%>;
               

                new Chart('myChart1', {
                    type: 'bar',
                    data: {
                        labels: locations1,
                        datasets: [{
                                data: location_count1,
                                backgroundColor: [
                                    'rgba(54, 162, 235, 0.8)',
                                    'rgba(255, 99, 132, 0.8)',
                                    'rgba(75, 192, 192, 0.8)',
                                    'rgba(153, 102, 255, 0.8)',
                                    'rgba(255, 159, 64, 0.8)',
                                    'rgba(255, 205, 86, 0.8)',
                                    'rgba(128, 0, 128, 0.8)',
                                    'rgba(220, 20, 60, 0.8)',
                                ],

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
                                text: 'Property Location',
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
                    <h2>Property Location Report</h2>
                </div>
            </div>
            <div class="container" style="padding-top:30px; padding-bottom: 50px;">
                <button type="button" class="button" onclick="exportToImage()" style=" margin: 20px; border-radius: 10px;">Export</button>
                <button type="button" class="button" onclick="window.location.href = 'admin_home.jsp'" style=" margin: 20px; border-radius: 10px;">Back</button>
            </div>
            <div class="form-box" id="form-box">
                <div class="chart-container">
                    <canvas id="myChart1"></canvas>
                </div>
                
            </div>
        </section>
        <script>
            function exportToImage() {
                const formBox = document.getElementById('form-box');

                html2canvas(formBox, {backgroundColor: 'black'}).then((canvas) => {
                    const link = document.createElement('a');
                    link.download = "Location_Report.png";
                    link.href = canvas.toDataURL('image/png');
                    link.click();
                    alert("Successfully exported the report to image");
                });
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
    </body>
</html>
