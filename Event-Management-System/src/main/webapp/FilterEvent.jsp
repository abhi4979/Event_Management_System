<%@page import="com.jsp.eventmanagementsystem.entity.Event"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Filter Events by Price</title>
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
        flex-direction: column;
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
        font-size: 34px;
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
        margin-left: 15px;
        margin-right:20px;
    }

    .container {
        background: #fff;
        padding: 20px 40px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
        margin-top: 80px;
        width: 300px;
    }

    .container h1 {
        margin-bottom: 20px;
    }

    label {
        display: block;
        margin-bottom: 10px;
    }

    input[type="number"] {
        width: calc(100% - 22px);
        padding: 5px;
        border: 1px solid #ccc;
        border-radius: 5px;
        margin-bottom: 20px;
    }

    input[type="submit"] {
        background-color:#007bff;
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
</style>
</head>
<body>
<div class="navbar">
    <div class="logo-container">
        <span class="logo">Event<span class="logo-highlight">ify</span></span>
    </div>
    <div class="icons">
        <a href="showuseroption"><i class="fas fa-arrow-left" style="color: black; font-size: 24px;"></i></a>
        <a href="showuseroption" style="color:black;">Back to menu</a>
        <a href="logout"><i class="fas fa-sign-out-alt" style="color: black; font-size: 24px;"></i></a>
    </div>
</div>

<div class="container">
    <h1>Filter Events by Price Range</h1>
    <form action="filtereventinfo" method="get">
        <label for="minPrice"><b>Minimum Price:</b></label>
        <input type="number" id="minPrice" name="mincost" step="0.01" required>
        
        <label for="maxPrice"><b>Maximum Price:</b></label>
        <input type="number" id="maxPrice" name="maxcost" step="0.01" required>
        
        <input type="submit" value="Filter">
    </form>
</div>
</body>
</html>
