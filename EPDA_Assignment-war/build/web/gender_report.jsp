<%@page import="model.Customer"%>
<%@page import="java.util.List"%>
<%@page import="model.Owner"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gender Report</title>
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

            .legend-container {
                display: flex;
                justify-content: flex-end;
                padding: 10px;
                position: absolute;
                top: 10px;
                right: 10px;
                background-color: rgba(255, 255, 255, 0.8);
                border-radius: 10px;
            }

            .legend-item {
                display: flex;
                align-items: center;
            }

            .legend-color {
                width: 10px;
                height: 10px;
                margin-right: 5px;
            }

            .legend-label {
                font-size: 14px;
                color: black;
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
            int male_owner = ((List<Owner>) request.getAttribute("male_owner")).size();
            int female_owner = ((List<Owner>) request.getAttribute("female_owner")).size();
            int male_cus = ((List<Customer>) request.getAttribute("male_cus")).size();
            int female_cus = ((List<Customer>) request.getAttribute("female_cus")).size();
        %>
        <script>
            var gender_label = ['Male', 'Female'];


            function drawChart() {
                var maleOwnerData = <%= male_owner%>;
                var femaleOwnerData = <%= female_owner%>;
                var maleCusData = <%= male_cus%>;
                var femaleCusData = <%= female_cus%>;
                new Chart('myChart1', {
                    type: 'pie',
                    data: {
                        labels: gender_label,
                        datasets: [{
                                label: 'Chart 1',
                                data: [maleOwnerData + maleCusData, femaleOwnerData + femaleCusData],
                                backgroundColor: ['rgb(54, 162, 235)', 'rgb(255, 99, 132)'],
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
                    },
                });

                new Chart('myChart2', {
                    type: 'pie',
                    data: {
                        labels: gender_label,
                        datasets: [{
                                label: 'Chart 2',
                                data: [maleOwnerData, femaleOwnerData],
                                backgroundColor: ['rgb(54, 162, 235)', 'rgb(255, 99, 132)'],
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
                                },
                                color: 'white',
                            },
                        },
                    },
                });

                new Chart('myChart3', {
                    type: 'pie',
                    data: {
                        labels: gender_label,
                        datasets: [{
                                label: 'Chart 3',
                                data: [maleCusData, femaleCusData],
                                backgroundColor: ['rgb(54, 162, 235)', 'rgb(255, 99, 132)'],
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
                    <h2>Gender Report</h2>
                </div>
            </div>
            <div class="container" style="padding-top:30px; padding-bottom: 50px;">
                <button type="button" class="button" onclick="exportToImage()" style=" margin: 20px; border-radius: 10px;">Export</button>
                <button type="button" class="button" onclick="window.location.href = 'admin_home.jsp'" style=" margin: 20px; border-radius: 10px;">Back</button>
            </div>
            <div class="form-box" id="form-box">
                <div class="legend-container">
                    <div class="legend-item">
                        <div class="legend-color" style="background-color: rgb(54, 162, 235);"></div>
                        <div class="legend-label" style="font-size:18px">Male</div>
                    </div>
                    <div class="legend-item" style=" margin-left: 20px;">
                        <div class="legend-color" style="background-color: rgb(255, 99, 132);"></div>
                        <div class="legend-label" style="font-size:18px">Female</div>
                    </div>
                </div>
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
                    link.download = "Gender_Report.png";
                    link.href = canvas.toDataURL('image/png');
                    link.click();
                    alert("Successfully exported the report to image");
                });
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
    </body>
</html>
