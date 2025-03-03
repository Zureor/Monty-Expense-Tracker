<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dashboard</title>
  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

  <style>
    body {
      background: #f7f9fc;
      margin: 0;
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
      border: none;
      border-radius: 10px;
      box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .card:hover {
      transform: translateY(-5px);
      box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.2);
    }

    @media (max-width: 768px) {
      .main-content {
        margin-left: 0;
      }
    }
  </style>
</head>
<body>

<!-- Sidebar -->
<jsp:include page="sidebar.jsp" />

<div class="main-content">
  <h1>Welcome, ${user.name}!</h1>
  <div class="row g-4">
    <!-- Income -->
    <div class="col-lg-4 col-md-6">
      <div class="card text-center p-4">
        <i class="bi bi-wallet2 display-4 text-primary mb-3"></i>
        <h3 class="text-primary">This Month's Income</h3>
        <p class="text-muted fs-5">${currentMonthIncome} BDT</p>
      </div>
    </div>

    <!-- Expense -->
    <div class="col-lg-4 col-md-6">
      <div class="card text-center p-4">
        <i class="bi bi-cash-stack display-4 text-danger mb-3"></i>
        <h3 class="text-danger">This Month's Expense</h3>
        <p class="text-muted fs-5">${currentMonthExpense} BDT</p>
      </div>
    </div>

    <!-- Balance -->
    <div class="col-lg-4 col-md-6">
      <div class="card text-center p-4">
        <i class="bi bi-bank display-4 text-success mb-3"></i>
        <h3 class="text-success">Total Available Balance</h3>
        <p class="text-muted fs-5">${availableBalance} BDT</p>
      </div>
    </div>
  </div>
</div>


<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>