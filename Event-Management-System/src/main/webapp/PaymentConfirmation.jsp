<%@page import="com.jsp.eventmanagementsystem.entity.Payment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Confirmation</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .navbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: #87CEFA;
        padding: 10px 20px;
        width: 100%;
        position: fixed;
        top: 0;
        left: 0;
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

    .navbar .logo-container {
        display: flex;
        align-items: center;
    }

    .navbar .logo {
        font-size: 24px;
        font-weight: bold;
        color: black;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
    }

    .navbar .logo-highlight {
        color: #ffc107; 
    }

    .navbar .icons {
        display: flex;
        align-items: center;
    }

    .navbar .icons a {
        margin-left: 45px;
    }

    .container {
        background: #fff;
        padding: 20px 40px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 300px;
        text-align: center;
        margin-top: 80px;
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
        width: 150px;
    }

    input[type="text"],
    input[type="number"] {
        width: calc(100% - 160px);
        padding: 5px;
        border: 1px solid #ccc;
        border-radius: 5px;
        margin-left: 10px;
    }

    input[type="submit"] {
        background-color: #333;
        color: white;
        border: none;
        padding: 10px 15px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
        margin-top: 20px;
    }

    input[type="submit"]:hover {
        background-color: #555;
    }

    input[readonly] {
        background-color: #e9e9e9;
        border: none;
    }
</style>
<script>
    function validateCardNumber(input) {
        const cardNumber = input.value.replace(/\D/g, '');
        if (cardNumber.length < 13 || cardNumber.length > 19) {
            alert('Please enter a valid card number.');
            return false;
        }
        return true;
    }

    function validateCVVCode(input) {
        const cvvCode = input.value.replace(/\D/g, '');
        if (cvvCode.length !== 3 && cvvCode.length !== 4) {
            alert('Please enter a valid CVV code.');
            return false;
        }
        return true;
    }

    function validateForm() {
        const cardNumberInput = document.getElementById('cardNumber');
        const cvvCodeInput = document.getElementById('cvvCode');

        return validateCardNumber(cardNumberInput) && validateCVVCode(cvvCodeInput);
    }
</script>
</head>
<body>
<div class="navbar">
    <div class="logo-container">
        <span class="logo">Event<span class="logo-highlight">ify</span></span>
    </div>
    <div class="icons">
        <a href="showuseroption"><i class="fas fa-arrow-left" style="color: black; font-size: 24px;"></i></a>
        <a href="showuseroption">Back to menu</a>
        <a href="logout"><i class="fas fa-sign-out-alt" style="color: black; font-size: 24px;"></i></a>
    </div>
</div>

<div class="container">
    <h2>Payment Confirmation</h2>
    <% Payment payment = (Payment) request.getAttribute("paymentobj"); %>
    <form action="confirmpayment" onsubmit="return validateForm()">
        <div class="option">
            <label><b>Enter Card Number:</b> <input type="text" id="cardNumber" required></label>
        </div>
        <div class="option">
            <label><b>Enter CVV code:</b> <input type="text" id="cvvCode" required></label>
        </div>
        <div class="option">
            <label><b>Total Amount:</b> <input type="number" value="<%= payment.getAmount() %>" readonly="true"></label>
        </div>
        <input type="submit" value="Submit">
    </form>
</div>
</body>
</html>
