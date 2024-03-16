<%-- 
    Document   : sale_report
    Created on : Jul 23, 2023, 8:17:44 PM
    Author     : ASUS
--%>

<%@page import="java.util.Arrays"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="model.Sales"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Monthly Sales Report</title>
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
            Calendar currentDate = Calendar.getInstance();
            int month = currentDate.get(Calendar.MONTH);
            int year = currentDate.get(Calendar.YEAR);
            List<Sales> sale = (List<Sales>) request.getAttribute("sale");
            int[] no_sale_culmulative = new int[month + 1];
            int[] sale_culmulative = new int[month + 1];
            for (Sales salesObj : sale) {
                String transDateStr = salesObj.getTrans_date();
                SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date date = inputFormat.parse(transDateStr);
                SimpleDateFormat monthFormat = new SimpleDateFormat("MM");
                SimpleDateFormat yearFormat = new SimpleDateFormat("yyyy");
                String trans_month = monthFormat.format(date);
                String trans_year = yearFormat.format(date);
                if (trans_year.equals(year + "") && trans_month.equals("01")) {
                    no_sale_culmulative[0]++;
                    sale_culmulative[0] += (salesObj.getTrans_type().equals("rent") ? Integer.parseInt(salesObj.getProperty().getRent_price()) : Integer.parseInt(salesObj.getProperty().getSale_price()));

                } else if (trans_year.equals(year + "") && trans_month.equals("02")) {
                    no_sale_culmulative[1]++;
                    sale_culmulative[1] += (salesObj.getTrans_type().equals("rent") ? Integer.parseInt(salesObj.getProperty().getRent_price()) : Integer.parseInt(salesObj.getProperty().getSale_price()));

                } else if (trans_year.equals(year + "") && trans_month.equals("03")) {
                    no_sale_culmulative[2]++;
                    sale_culmulative[2] += (salesObj.getTrans_type().equals("rent") ? Integer.parseInt(salesObj.getProperty().getRent_price()) : Integer.parseInt(salesObj.getProperty().getSale_price()));

                } else if (trans_year.equals(year + "") && trans_month.equals("04")) {
                    no_sale_culmulative[3]++;
                    sale_culmulative[3] += (salesObj.getTrans_type().equals("rent") ? Integer.parseInt(salesObj.getProperty().getRent_price()) : Integer.parseInt(salesObj.getProperty().getSale_price()));

                } else if (trans_year.equals(year + "") && trans_month.equals("05")) {
                    no_sale_culmulative[4]++;
                    sale_culmulative[4] += (salesObj.getTrans_type().equals("rent") ? Integer.parseInt(salesObj.getProperty().getRent_price()) : Integer.parseInt(salesObj.getProperty().getSale_price()));

                } else if (trans_year.equals(year + "") && trans_month.equals("06")) {
                    no_sale_culmulative[5]++;
                    sale_culmulative[5] += (salesObj.getTrans_type().equals("rent") ? Integer.parseInt(salesObj.getProperty().getRent_price()) : Integer.parseInt(salesObj.getProperty().getSale_price()));

                } else if (trans_year.equals(year + "") && trans_month.equals("07")) {
                    no_sale_culmulative[6]++;
                    sale_culmulative[6] += (salesObj.getTrans_type().equals("rent") ? Integer.parseInt(salesObj.getProperty().getRent_price()) : Integer.parseInt(salesObj.getProperty().getSale_price()));

                } else if (trans_year.equals(year + "") && trans_month.equals("08")) {
                    no_sale_culmulative[7]++;
                    sale_culmulative[7] += (salesObj.getTrans_type().equals("rent") ? Integer.parseInt(salesObj.getProperty().getRent_price()) : Integer.parseInt(salesObj.getProperty().getSale_price()));

                } else if (trans_year.equals(year + "") && trans_month.equals("09")) {
                    no_sale_culmulative[8]++;
                    sale_culmulative[8] += (salesObj.getTrans_type().equals("rent") ? Integer.parseInt(salesObj.getProperty().getRent_price()) : Integer.parseInt(salesObj.getProperty().getSale_price()));

                } else if (trans_year.equals(year + "") && trans_month.equals("10")) {
                    no_sale_culmulative[9]++;
                    sale_culmulative[9] += (salesObj.getTrans_type().equals("rent") ? Integer.parseInt(salesObj.getProperty().getRent_price()) : Integer.parseInt(salesObj.getProperty().getSale_price()));

                } else if (trans_year.equals(year + "") && trans_month.equals("11")) {
                    no_sale_culmulative[10]++;
                    sale_culmulative[10] += (salesObj.getTrans_type().equals("rent") ? Integer.parseInt(salesObj.getProperty().getRent_price()) : Integer.parseInt(salesObj.getProperty().getSale_price()));

                } else if (trans_year.equals(year + "") && trans_month.equals("12")) {
                    no_sale_culmulative[11]++;
                    sale_culmulative[11] += (salesObj.getTrans_type().equals("rent") ? Integer.parseInt(salesObj.getProperty().getRent_price()) : Integer.parseInt(salesObj.getProperty().getSale_price()));

                }

            }

        %>
        <script>
            function drawChart() {
                var currentDate = new Date();
                var currentMonth = currentDate.getMonth();
                var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
                var monthList = months.slice(0, currentMonth + 1);
                var no_sale_culmulative = <%= Arrays.toString(no_sale_culmulative)%>;
                var sale_culmulative = <%= Arrays.toString(sale_culmulative)%>;

                new Chart('myChart1', {
                    type: 'bar',
                    data: {
                        datasets: [{
                                type: 'bar',
                                label: 'Number of Sales',
                                data: no_sale_culmulative,
                                backgroundColor: 'rgba(54, 162, 235, 0.8)',
                                yAxisID: 'left',
                                order: 2
                            }, {
                                type: 'line',
                                label: 'Total Sale Amount',
                                data: sale_culmulative,
                                borderColor: 'white',
                                yAxisID: 'right',
                                order: 1
                            }],
                        labels: monthList,
                    },
                    options: {
                        scales: {
                            x: {
                                grid: {
                                    display: false,
                                },
                                ticks: {
                                    color: 'white',
                                },
                            },
                            left: {
                                type: 'linear',
                                position: 'left',
                                grid: {
                                    display: false,
                                },
                                ticks: {
                                    stepSize: 1,
                                    color: 'white',
                                },
                            },
                            right: {
                                type: 'linear',
                                position: 'right',
                                grid: {
                                    display: false,
                                },
                                ticks: {
                                    stepSize: 1,
                                    color: 'white',
                                },
                            },
                        },
                        plugins: {
                            title: {
                                display: true,
                                text: 'Monthly Sales',
                                font: {
                                    size: 18,
                                },
                                color: 'white',
                            },
                            legend: {
                                display: true,
                                labels: {
                                    color: 'white',
                                }
                            }
                        }
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
                    <h2>Monthly Sales Report</h2>
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
                    link.download = "Sale_Report.png";
                    link.href = canvas.toDataURL('image/png');
                    link.click();
                    alert("Successfully exported the report to image");
                });
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
    </body>
</html>
