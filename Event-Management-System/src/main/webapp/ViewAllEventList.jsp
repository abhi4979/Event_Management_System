<%@page import="java.util.List"%>
<%@page import="com.jsp.eventmanagementsystem.entity.Event"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Event List</title>
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

    .navbar .icons {
        display: flex;
        align-items: center;
    }

    .navbar .icons a {
        margin-left: 15px;
        font-size: 24px;
        color: black;
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
        max-width: 1200px; /* Adjust max-width as needed */
        overflow-x: auto; /* Allow horizontal scroll if needed */
    }

    .form-container h1 {
        font-size: 30px;
        margin-bottom: 20px;
        text-align: center;
    }

    .form-container table {
        width: 100%;
        border-collapse: collapse;
    }

    .form-container table th, .form-container table td {
        padding: 12px;
        text-align: center;
        border: 1px solid #ddd;
    }

    .form-container table th {
        background-color: #007bff;
        color: white;
    }

    .form-container table tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    .form-container table tr:hover {
        background-color: #ddd;
    }

    .form-container table a {
        text-decoration: none;
        color: #007bff;
    }

    .form-container table a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
<div class="navbar">
    <div class="logo-container">
        <span class="logo">Event<span class="logo-highlight">ify</span></span>
    </div>
    <div class="icons">
        <a href="adminoptions.jsp"><i class="fas fa-arrow-left"></i></a>
        <a href="HomeProject.jsp"><i class="fas fa-home"></i></a>
        <a href="adminlogout"><i class="fas fa-sign-out-alt"></i></a>
    </div>
</div>
<div class="main-content">
    <div class="form-container">
        <h1>Event List</h1>
        ${message}
        <%
            List<Event> events = (List<Event>) request.getAttribute("eventbyadmin");
            if (events != null) {
                %>
                <table>
                    <tr>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Location</th>
                        <th>Available Tickets</th>
                        <th>Ticket Price</th>
                        <th>Type</th>
                        <th>Update</th>
                        <th>Delete</th>
                    </tr>
                    <%
                        for (Event event : events) {
                            %>
                            <tr>
                                <td><%= event.getName() %></td>
                                <td><%= event.getDescription() %></td>
                                <td><%= event.getDate() %></td>
                                <td><%= event.getTime() %></td>
                                <td><%= event.getLocation() %></td>
                                <td><%= event.getAvl_ticket() %></td>
                                <td><%= event.getTicket_price() %></td>
                                <td><%= event.getType() %></td>
                                <td><a href="updateeventbyadmin?id=<%= event.getEvent_id() %>">Update</a></td>
                                <td><a href="deleteevent?id=<%= event.getEvent_id() %>">Delete</a></td>
                            </tr>
                            <%
                        }
                    %>
                </table>
                <%
            } else {
                %>
                <p>No events found.</p>
                <%
            }
        %>
    </div>
</div>
</body>
</html>
