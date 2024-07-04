<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Form</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .navbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: #87CEFA;
        width: 100%;
        padding: 10px 20px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .navbar a {
        color: white;
        text-decoration: none;
        padding: 8px 16px;
        font-size: 16px;
    }

    .navbar a:hover {
        background-color: #ddd;
        color: black;
    }

    .logo-container {
        display: flex;
        align-items: center;
    }

    .logo {
        font-size: 24px;
        font-weight: bold;
        color: black;
    }

    .logo-highlight {
        color: #ffc107;
    }

    .icons a {
        margin-left: 15px;
    }

    .container {
        background: #fff;
        padding: 20px 40px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 300px;
        text-align: center;
        margin-top: 30px;
    }

    .container h2 {
        margin-bottom: 20px;
    }

    .option {
        display: block;
        margin-bottom: 15px;
        text-align: left;
    }

    .option b {
        display: inline-block;
        width: 120px;
    }

    input[type="submit"] {
        background-color:  #007bff;
        color: white;
        border: none;
        padding: 10px 15px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    input[type="submit"]:hover {
        background-color: #555;
    }

    input[readonly] {
        background-color: #e9e9e9;
        border: none;
    }

    input[type="number"] {
        width: 50px;
    }
</style>
</head>
<body>
  <div class="navbar">
    <div class="logo-container">
        <span class="logo">Event<span class="logo-highlight">ify</span></span>
    </div>
    <div class="icons">
        <a href="showuseroption"><i class="fas fa-arrow-left" style="color: black; font-size: 24px;"></i></a>
        <a href="showuseroption" style="color: white;">Back to menu</a>
        <a href="logout"><i class="fas fa-sign-out-alt" style="color: black; font-size: 24px;"></i></a>
    </div>
  </div>
    <div class="container">
        <h2>Payment Form</h2>
        <form:form action="savepayment" modelAttribute="paymentobj">
            <label class="option"><b>User Name:</b> <form:input path="username" readonly="true" /></label>
            <label class="option"><b>Event Name:</b> <form:input path="eventname" readonly="true" /></label>
            <label class="option"><b>Ticket Cost:</b> <form:input path="amount" readonly="true" /></label>
            <label class="option"><b>No. Of Tickets:</b> <form:input path="quantity" type="number" /></label>
            <input type="submit" id="btn" value="Submit">
        </form:form>
    </div>
</body>
</html>
