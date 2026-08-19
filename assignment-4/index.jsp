<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Electricity Bill Calculator</title>

    <link rel="stylesheet" href="style.css">
</head>

<body>

<div class="container">

    <div class="card">

        <h1>Electricity Bill Calculator</h1>
        <p class="subtitle">Calculate your electricity bill based on units consumed</p>

        <form method="post">

            <label for="units">Enter Units Consumed</label>

            <input type="number"
                   id="units"
                   name="units"
                   min="0"
                   placeholder="e.g. 250"
                   required>

            <button type="submit">Calculate Bill</button>

        </form>

        <%
            String unitsStr = request.getParameter("units");

            if (unitsStr != null && !unitsStr.isEmpty()) {

                try {

                    int units = Integer.parseInt(unitsStr);

                    if (units < 0) {
        %>

                        <div class="error">
                            Please enter a valid number of units.
                        </div>

        <%
                    } else {

                        double bill = 0;

                        if (units <= 50) {

                            bill = units * 3.50;

                        } else if (units <= 150) {

                            bill = (50 * 3.50)
                                 + ((units - 50) * 4.00);

                        } else if (units <= 250) {

                            bill = (50 * 3.50)
                                 + (100 * 4.00)
                                 + ((units - 150) * 5.20);

                        } else {

                            bill = (50 * 3.50)
                                 + (100 * 4.00)
                                 + (100 * 5.20)
                                 + ((units - 250) * 6.50);
                        }

        %>

                        <div class="result">

                            <h2>Electricity Bill</h2>

                            <div class="bill-row">
                                <span>Units Consumed</span>
                                <strong><%= units %> Units</strong>
                            </div>

                            <div class="bill-row total">
                                <span>Total Bill</span>
                                <strong>₹ <%= String.format("%.2f", bill) %></strong>
                            </div>

                        </div>

        <%
                    }

                } catch (NumberFormatException e) {
        %>

                    <div class="error">
                        Please enter a valid number.
                    </div>

        <%
                }
            }
        %>

        <div class="slabs">

            <h3>Rate Slabs</h3>

            <div class="slab">
                <span>First 50 Units</span>
                <span>₹3.50 / Unit</span>
            </div>

            <div class="slab">
                <span>Next 100 Units</span>
                <span>₹4.00 / Unit</span>
            </div>

            <div class="slab">
                <span>Next 100 Units</span>
                <span>₹5.20 / Unit</span>
            </div>

            <div class="slab">
                <span>Above 250 Units</span>
                <span>₹6.50 / Unit</span>
            </div>

        </div>

    </div>

</div>

</body>
</html>