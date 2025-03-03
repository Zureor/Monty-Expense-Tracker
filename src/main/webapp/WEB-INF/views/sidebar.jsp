<%--
  Created by IntelliJ IDEA.
  User: evanahmedshoaib
  Date: 27/1/25
  Time: 12:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Sidebar</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Bootstrap Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body {
    .sidebar {
      background: #4e63d7;
      color: white;
      height: 100vh;
      position: fixed;
      top: 0;
      left: 0;
      padding: 20px;
      width: 250px;
      transition: transform 0.3s ease-in-out;
      z-index: 1000;
    }

    .sidebar h2 {
      font-size: 1.5rem;
      margin-bottom: 20px;
    }

    .sidebar a {
      color: white;
      text-decoration: none;
      font-size: 1rem;
      margin: 10px 0;
      display: flex;
      align-items: center;
      padding: 10px 15px;
      border-radius: 5px;
      transition: background 0.3s ease;
    }

    .sidebar a i {
      margin-right: 10px;
      font-size: 1.2rem;
    }

    .sidebar a:hover {
      background: #3c4db8;
    }


    .toggle-sidebar {
      display: none;
      position: fixed;
      top: 20px;
      left: 20px;
      background: #4e63d7;
      color: white;
      border: none;
      padding: 10px;
      font-size: 1.2rem;
      border-radius: 5px;
      z-index: 1100;
    }

    .toggle-sidebar i {
      font-size: 1.5rem;
    }

    .toggle-sidebar:focus {
      outline: none;
    }

    @media (max-width: 768px) {
      .sidebar {
        transform: translateX(-100%);
      }

      .sidebar.show {
        transform: translateX(0);
      }

      .toggle-sidebar {
        display: block;
      }
    }
  </style>

</head>
<body>
<button class="toggle-sidebar" id="toggleSidebar">
  <i class="bi bi-list"></i>
</button>
<div class="sidebar" id="sidebar">
  <img src="/images/logo.svg" alt="Monty Logo" class="img-fluid mb-4" width="150">
  <a href="/dashboard"><i class="bi bi-house-door"></i> Home</a>
  <a href="/income"><i class="bi bi-wallet2"></i> Income</a>
  <a href="/expense"><i class="bi bi-cash-stack"></i> Expense</a>
  <a href="/report"><i class="bi bi-bar-chart"></i> Report</a>
  <a href="/login"><i class="bi bi-box-arrow-left"></i> Logout</a>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script>
  const toggleSidebar = document.getElementById('toggleSidebar');
  const sidebar = document.getElementById('sidebar');

  toggleSidebar.addEventListener('click', () => {
    sidebar.classList.toggle('show');
  });
</script>
</body>
</html>
