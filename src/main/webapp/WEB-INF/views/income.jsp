<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Income</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f7f9fc;
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
        }
        .main-content {
            margin-top: 60px;
            margin-left: 250px;
            padding: 50px;
            transition: margin-left 0.3s ease-in-out;
        }

        .main-content h1, .main-content h2 {
            color: #4e63d7;
        }

        .card {
            background: white;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
        }

        table {
            border-collapse: separate;
            border-spacing: 0;
            width: 100%;
            margin-bottom: 20px;
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        thead th {
            background-color: #4e63d7;
            color: #53a0b3;
            font-weight: bold;
            text-align: left;
            padding: 15px;
        }

        tbody tr:nth-child(even) {
            background-color: #f2f4f7;
        }

        tbody tr:hover {
            background-color: #eaecee;
        }

        tbody td {
            text-align: left;
            padding: 15px;
            color: #333;
        }

        @media (max-width: 768px) {
            .main-content {
                margin-left: 0;
            }
        }
    </style>
</head>
<body>

<jsp:include page="sidebar.jsp" />

<!-- Main Content -->
<div class="main-content">
    <h1>Income</h1>

    <!-- Add Income Form -->
    <div class="card">
        <form method="post" action="/income">
            <div class="mb-3">
                <label for="source" class="form-label">Source:</label>
                <input type="text" name="source" id="source" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="amount" class="form-label">Amount:</label>
                <input type="number" name="amount" id="amount" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary w-100"><i class="bi bi-plus-circle"></i> Add Income</button>
        </form>
    </div>

    <!-- Income List -->
    <h2>Income List</h2>
    <div class="card">
        <form method="get" action="/income/filter" class="mb-3">
            <div class="row g-3">
                <div class="col-md-5">
                    <label for="startDate" class="form-label">Start Date:</label>
                    <input type="date" name="startDate" id="startDate" class="form-control" required>
                </div>
                <div class="col-md-5">
                    <label for="endDate" class="form-label">End Date:</label>
                    <input type="date" name="endDate" id="endDate" class="form-control" required>
                </div>
                <div class="col-md-2 d-flex align-items-end">
                    <button type="submit" class="btn btn-primary w-100"><i class="bi bi-search"></i> Filter</button>
                </div>
            </div>
        </form>
        <table class="table table-hover">
            <thead>
            <tr>
                <th>Source</th>
                <th>Amount</th>
                <th>Date</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="income" items="${incomes}">
                <tr>
                    <td><strong>${income.source}</strong></td>
                    <td>${income.amount} BDT</td>
                    <td><fmt:formatDate value="${income.date}" pattern="dd MMMM, yyyy" /></td>
                    <td>
                        <form action="/income/delete" method="post">
                            <input type="hidden" name="incomeId" value="${income.id}" />
                            <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this income?')">
                                <i class="bi bi-trash"></i> Delete
                            </button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- Bootstrap JS and Icons -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.js"></script>

</body>
</html>