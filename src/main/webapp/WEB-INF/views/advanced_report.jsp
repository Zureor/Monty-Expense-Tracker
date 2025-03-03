<%--
  Created by IntelliJ IDEA.
  User: evanahmedshoaib
  Date: 23/1/25
  Time: 2:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Advanced Report</title>
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
            margin-left: 250px;
            margin-top: 60px;
            padding: 50px;
            transition: margin-left 0.3s ease-in-out;
        }

        .main-content h1 {
            font-size: 2rem;
            color: #4e63d7;
            margin-bottom: 20px;
        }

        .card {
            background: white;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
        }

        @media (max-width: 768px) {
            .main-content {
                margin-left: 0;
            }
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

        th, td {
            text-align: left;
            padding: 15px;
        }

        thead th {
            background-color: #4e63d7;
            color: #53a0b3;
            font-weight: bold;

        }

        tbody tr:nth-child(even) {
            background-color: #f2f4f7;
        }

        tbody tr:hover {
            background-color: #eaecee;
        }

        td {
            color: #333;
        }

        th {
            font-size: 1rem;
            font-family: 'Arial', sans-serif;
        }

        tbody td {
            font-size: 0.9rem;
        }
    </style>
</head>
<body>

<jsp:include page="sidebar.jsp" />

<!-- Main Content -->
<div class="main-content">
    <h1>Financial Report</h1>

    <!-- Income Table -->
    <div class="card">
        <h2>Monthly Income</h2>
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">Month</th>
                <th scope="col">Total Income</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Object[]> incomeData = (List<Object[]>) request.getAttribute("monthlyIncome");
                if (incomeData != null && !incomeData.isEmpty()) {
                    for (Object[] row : incomeData) {
            %>
            <tr>
                <td><%= row[0] %></td> <!-- Month -->
                <td><%= row[1] %></td> <!-- Total Income -->
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="2">No data available</td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>

    <!-- Expenses Table -->
    <div class="card">
        <h2>Monthly Expenses</h2>
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">Month</th>
                <th scope="col">Total Expense</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Object[]> expenseData = (List<Object[]>) request.getAttribute("monthlyExpenses");
                if (expenseData != null && !expenseData.isEmpty()) {
                    for (Object[] row : expenseData) {
            %>
            <tr>
                <td><%= row[0] %></td> <!-- Month -->
                <td><%= row[1] %></td> <!-- Total Expense -->
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="2">No data available</td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>

    <!-- Category-wise Expenses Table -->
    <div class="card">
        <h2>Expenses By Category</h2>
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">Category</th>
                <th scope="col">Total Expense</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Object[]> categoryData = (List<Object[]>) request.getAttribute("categoryExpenses");
                if (categoryData != null && !categoryData.isEmpty()) {
                    for (Object[] row : categoryData) {
            %>
            <tr>
                <td><%= row[0] %></td> <!-- Category -->
                <td><%= row[1] %></td> <!-- Total Expense -->
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="2">No data available</td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>