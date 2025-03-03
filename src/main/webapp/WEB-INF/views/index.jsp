<%--
  Created by IntelliJ IDEA.
  User: evanahmedshoaib
  Date: 23/1/25
  Time: 2:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom CSS -->
  <style>
    body {
      background: linear-gradient(to right, #e6e9f1, #f7f9fc);
      height: 100vh;
      margin: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      font-family: 'Arial', sans-serif;
    }

    .login-container {
      max-width: 900px;
      width: 100%;
      background: #fff;
      border-radius: 30px;
      box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.1);
      display: flex;
      overflow: hidden;
    }

    .left-panel {
      background: #4e63d7;
      color: #fff;
      flex: 1;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      text-align: center;
      padding: 50px;
      border-radius: 30px;
    }

    .left-panel h1 {
      font-size: 2rem;
      font-weight: bold;
      margin-bottom: 20px;
    }
    .left-panel h5 {
      margin-bottom: 30px;
    }

    .left-panel p {
      margin-bottom: 10px;
    }

    .left-panel .btn {
      border: 2px solid #fff;
      border-radius: 30px;
      padding: 10px 20px;
      color: #fff;
      font-weight: bold;
      transition: all 0.3s ease;
    }

    .left-panel .btn:hover {
      background: #fff;
      color: #4e63d7;
    }

    .right-panel {
      flex: 1;
      padding: 60px;
      display: flex;
      flex-direction: column;
      justify-content: center;
    }

    .right-panel h3 {
      font-size: 1.8rem;
      font-weight: bold;
      margin-bottom: 30px;
      text-align: center;
    }

    .form-control {
      border-radius: 30px;
      height: 50px;
      font-size: 1rem;
      margin-bottom: 20px;
      padding: 10px 20px;
    }

    .btn-primary {
      border-radius: 30px;
      height: 50px;
      font-size: 1rem;
      font-weight: bold;
      background: #4e63d7;
      border: none;
    }

    .btn-primary:hover {
      background: #3c4db8;
    }

    .invalidAlert {
      font-size: 0.9rem;
      color: #4e63d7;
      text-decoration: none;
      margin-bottom: 20px;
      display: block;
      text-align: right;
    }

  </style>
</head>
<body>
<div class="login-container">
  <!-- Left Panel -->
  <div class="left-panel">
    <img src="/images/logo.svg" alt="Monty Logo" width="200" height="100">
    <h5>Your personal money manager.</h5>
    <p>Don't have an account?</p>
    <a href="/signup" class="btn">Register</a>
  </div>

  <!-- Right Panel -->
  <div class="right-panel">
    <h3>Login</h3>
    <form action="/login" method="post">
      <input type="text" name="username" class="form-control" placeholder="Username" required>
      <input type="password" name="password" class="form-control" placeholder="Password" required>
      <p class="invalidAlert">${message}</p>
      <button type="submit" class="btn btn-primary w-100">Login</button>
    </form>
  </div>
</div>

<!-- Bootstrap Icons -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.js"></script>
</body>
</html>