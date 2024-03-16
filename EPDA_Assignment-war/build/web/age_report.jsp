<%-- 
    Document   : age_report
    Created on : Jul 23, 2023, 4:26:15 PM
    Author     : ASUS
--%>

<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Age Report</title>
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
                background: transparent;
                width: calc(33.33% - 40px);
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
            List<Integer> owner_age = (List<Integer>) request.getAttribute("owner_age");
            List<Integer> cus_age = (List<Integer>) request.getAttribute("cus_age");
            List<Integer> combined_age = (List<Integer>) request.getAttribute("combined_age");

            int[] combine_ageGroupsCumulative = new int[5];
            int[] owner_ageGroupsCumulative = new int[5];
            int[] cus_ageGroupsCumulative = new int[5];

            for (int age : combined_age) {
                if (age >= 21 && age <= 30) {
                    combine_ageGroupsCumulative[0]++;
                } else if (age >= 31 && age <= 40) {
                    combine_ageGroupsCumulative[1]++;
                } else if (age >= 41 && age <= 50) {
                    combine_ageGroupsCumulative[2]++;
                } else if (age >= 51 && age <= 60) {
                    combine_ageGroupsCumulative[3]++;
                } else if (age >= 61) {
                    combine_ageGroupsCumulative[4]++;
                }
            }

            for (int age : owner_age) {
                if (age >= 21 && age <= 30) {
                    owner_ageGroupsCumulative[0]++;
                } else if (age >= 31 && age <= 40) {
                    owner_ageGroupsCumulative[1]++;
                } else if (age >= 41 && age <= 50) {
                    owner_ageGroupsCumulative[2]++;
                } else if (age >= 51 && age <= 60) {
                    owner_ageGroupsCumulative[3]++;
                } else if (age >= 61) {
                    owner_ageGroupsCumulative[4]++;
                }
            }

            for (int age : cus_age) {
                if (age >= 21 && age <= 30) {
                    cus_ageGroupsCumulative[0]++;
                } else if (age >= 31 && age <= 40) {
                    cus_ageGroupsCumulative[1]++;
                } else if (age >= 41 && age <= 50) {
                    cus_ageGroupsCumulative[2]++;
                } else if (age >= 51 && age <= 60) {
                    cus_ageGroupsCumulative[3]++;
                } else if (age >= 61) {
                    cus_ageGroupsCumulative[4]++;
                }
            }


        %>
        <script>
            function drawChart() {
                var ageGroups = ['21-30', '31-40', '41-50', '51-60', '61+'];
                var combine_cumulativeCounts = <%= Arrays.toString(combine_ageGroupsCumulative)%>;
                var cus_cumulativeCounts = <%= Arrays.toString(cus_ageGroupsCumulative)%>;
                var owner_cumulativeCounts = <%= Arrays.toString(owner_ageGroupsCumulative)%>;

                new Chart('myChart1', {
                    type: 'bar',
                    data: {
                        labels: ageGroups,
                        datasets: [{
                                label: 'Owner & Customer',
                                data: combine_cumulativeCounts,
                                backgroundColor: ['rgba(54, 162, 235, 0.8)', 'rgba(255, 99, 132, 0.8)', 'rgba(75, 192, 192, 0.8)', 'rgba(153, 102, 255, 0.8)', 'rgba(255, 159, 64, 0.8)'],
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
                                text: 'Owner & Customer',
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

                new Chart('myChart2', {
                    type: 'bar',
                    data: {
                        labels: ageGroups,
                        datasets: [{
                                label: 'Owner',
                                data: owner_cumulativeCounts,
                                backgroundColor: ['rgba(54, 162, 235, 0.8)', 'rgba(255, 99, 132, 0.8)', 'rgba(75, 192, 192, 0.8)', 'rgba(153, 102, 255, 0.8)', 'rgba(255, 159, 64, 0.8)'],
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
                                text: 'Owner',
                                font: {
                                    size: 18,
                                    color: 'white',
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

                new Chart('myChart3', {
                    type: 'bar',
                    data: {
                        labels: ageGroups,
                        datasets: [{
                                label: 'Customer',
                                data: cus_cumulativeCounts,
                                backgroundColor: ['rgba(54, 162, 235, 0.8)', 'rgba(255, 99, 132, 0.8)', 'rgba(75, 192, 192, 0.8)', 'rgba(153, 102, 255, 0.8)', 'rgba(255, 159, 64, 0.8)'],
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
                                text: 'Customer',
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
                    <h2>Age Report</h2>
                </div>
            </div>
            <div class="container" style="padding-top:30px; padding-bottom: 50px;">
                <button type="button" class="button" onclick="exportToImage()" style=" margin: 20px; border-radius: 10px;">Export</button>
                <button type="button" class="button" onclick="window.location.href = 'admin_home.jsp'" style=" margin: 20px; border-radius: 10px;">Back</button>
            </div>
            <div class="form-box" id="form-box">
                <div class="chart-container">
                    <canvas id="myChart1" width="400px" height="400px"></canvas>
                </div>
                <div class="chart-container">
                    <canvas id="myChart2" width="400px" height="400px"></canvas>
                </div>
                <div class="chart-container">
                    <canvas id="myChart3" width="400px" height="400px"></canvas>
                </div>
            </div>
        </section>
        <script>
            function exportToImage() {
                const formBox = document.getElementById('form-box');

                html2canvas(formBox, {backgroundColor: 'black'}).then((canvas) => {
                    const link = document.createElement('a');
                    link.download = "Age_Report.png";
                    link.href = canvas.toDataURL('image/png');
                    link.click();
                    alert("Successfully exported the report to image");
                });
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
    </body>
</html>
