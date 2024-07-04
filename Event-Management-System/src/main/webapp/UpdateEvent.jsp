<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f0f0f0;
    }
    .navbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: #87CEFA;
        padding: 10px 20px;
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

    .navbar .logo {
        display: flex;
        align-items: center;
    }

    .navbar .logo img {
        height: 40px;
    }

    .logo-container {
        display: flex;
        align-items: center;
        margin-left: 20px;
    }

    .logo {
        font-size: 45px;
        font-weight: bold;
        color: black;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
    }

    .logo-highlight {
        color: #ffc107; 
    }

    .navbar .nav-links {
        display: flex;
        align-items: center;
    }

    .navbar .nav-links a {
        margin-left: 15px;
        font-size: 20px;
        color:black;
    }

    .navbar .icons {
        display: flex;
        align-items: center;
    }

    .navbar .icons a {
        margin-left: 15px;
        font-size: 34px;
    }

    .navbar .nav-links a {
        margin-left: 15px;
        margin-right:30px;
        font-size: 24px;
    }

    .main-content {
        display: flex;
        justify-content: center;
        align-items: center;
        height: calc(100vh - 50px);
        padding: 20px;
    }

    .form-container {
        background-color: #fff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 600px;
        text-align: center; 
    }

    .form-container h2 {
        margin-bottom: 20px;
        color: #333;
    }

    .form-container table {
        width: 100%;
        border-collapse: collapse;
    }

    .form-container table td {
        padding: 10px;
    }

    .form-container table td:first-child {
        text-align: right;
        padding-right: 20px;
        font-weight: bold;
    }

    .form-container table input,
    .form-container table textarea,
    .form-container table select {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .form-container table input[type="submit"] {
        background-color: #007bff;
        color: #fff;
        border: none;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s;
    }

    .form-container table input[type="submit"]:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<div class="navbar">
    <div class="logo-container">
        <span class="logo">Event<span class="logo-highlight">ify</span></span>
    </div>
    <div class="icons">
    <a href="showevent"><i class="fas fa-arrow-left" style="color: black;"></i></a>
        <a href="HomeProject.jsp"><i class="fas fa-home" style="color: black;"></i></a>
        <a href="organizerlogout"><i class="fas fa-sign-out-alt" style="color:black;"></i></a>
    </div>
</div>
<div class="main-content">
    <div class="form-container">
<h2>Event Form</h2>
    <form:form action="updateeventinfo" modelAttribute="eventexistinginfo" id="myevent" method="post">
        <table>
              <form:hidden path="event_id" />
            <tr>
                <td>Name:</td>
                <td><form:input path="name" required="required"/></td>
            </tr>
            <tr>
                <td>Description:</td>
                <td><form:textarea path="description" required="required"/></td>
            </tr>
            <tr>
                <td>Date:</td>
                <td><form:input path="date" type="date" required="required"/></td>
            </tr>
            <tr>
                <td>Time:</td>
                <td><form:input path="time" type="time" required="required"/></td>
            </tr>
            <tr>
                <td>Location:</td>
                <td><form:input path="location" required="required"/></td>
            </tr>
            <tr>
                <td>Available Tickets:</td>
                <td><form:input path="avl_ticket" type="number" required="required"/></td>
            </tr>
            <tr>
                <td>Ticket Price:</td>
                <td><form:input path="ticket_price" type="number" step="0.01" required="required"/></td>
            </tr>
            <tr>
              <td>Type</td>
               <td>
                    <form:select path="type" required="required">
                        <form:option value="public" label="Public"/>
                        <form:option value="private" label="Private"/>
                    </form:select>
                </td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Submit" /></td>
            </tr>
        </table>
    </form:form>
    </div>
    </div>
</body>
</html>