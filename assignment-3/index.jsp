<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Electricity Bill Calculator</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card shadow-lg rounded-4 border-0">
                    <div class="card-body p-4 p-md-5">
                        <h2 class="text-center mb-4 text-primary">Electricity Bill Calculator</h2>
                        <p class="text-muted text-center mb-4">Calculate your electricity bill using the slab-wise tariff.</p>

                        <form action="calculate" method="post" class="row g-3">
                            <div class="col-md-8">
                                <label for="units" class="form-label">Enter Units Consumed</label>
                                <input type="number" class="form-control form-control-lg" id="units" name="units" min="0" step="0.01" placeholder="Example: 320" required>
                            </div>
                            <div class="col-md-4 d-flex align-items-end">
                                <button type="submit" class="btn btn-primary btn-lg w-100">Calculate</button>
                            </div>
                        </form>

                        <%
                            String error = (String) request.getAttribute("error");
                            Double totalBill = (Double) request.getAttribute("totalBill");
                            String breakdown = (String) request.getAttribute("breakdown");
                            Double units = (Double) request.getAttribute("units");
                        %>

                        <% if (error != null) { %>
                            <div class="alert alert-danger mt-4" role="alert"><%= error %></div>
                        <% } %>

                        <% if (totalBill != null) { %>
                            <div class="alert alert-success mt-4">
                                <h4 class="alert-heading">Result</h4>
                                <p class="mb-1"><strong>Units consumed:</strong> <%= String.format("%.2f", units) %></p>
                                <p class="mb-1"><strong>Total bill:</strong> ₹<%= String.format("%.2f", totalBill) %></p>
                                <hr>
                                <p class="mb-0"><strong>Breakdown:</strong><br><%= breakdown %></p>
                            </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="assets/app.js"></script>
</body>
</html>
