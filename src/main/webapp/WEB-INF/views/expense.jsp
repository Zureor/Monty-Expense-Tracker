<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Expenses</title>
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
  <h1>Expenses</h1>

  <!-- Add Expense Form -->
  <div class="card">
    <form method="post" action="/expense">
      <div class="mb-3">
        <label for="category" class="form-label">Category:</label>
        <input type="text" name="category" id="category" class="form-control" required>
      </div>
      <div class="mb-3">
        <label for="amount" class="form-label">Amount:</label>
        <input type="number" name="amount" id="amount" class="form-control" required>
      </div>
      <div class="mb-3">
        <label for="description" class="form-label">Description:</label>
        <input type="text" name="description" id="description" class="form-control">
      </div>
      <button type="submit" class="btn btn-primary w-100"><i class="bi bi-plus-circle"></i> Add Expense</button>
    </form>
  </div>

  <!-- Expense List -->
  <h2>Expense List</h2>
  <div class="card">
    <form method="get" action="/expense/filter" class="mb-3">
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
        <th>Category</th>
        <th>Amount</th>
        <th>Description</th>
        <th>Date</th>
        <th>Action</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="expense" items="${expenses}">
        <tr>
          <td><strong>${expense.category}</strong></td>
          <td>${expense.amount} BDT</td>
          <td>${expense.description}</td>
          <td><fmt:formatDate value="${expense.date}" pattern="dd MMMM, yyyy" /></td>
          <td>
            <form action="/expense/delete" method="post">
              <input type="hidden" name="expenseId" value="${expense.id}" />
              <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this expense?')">
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