<%@ page import="com.jsp.eventmanagementsystem.entity.Event" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Eventify Dashboard</title>
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
        font-size: 30px;
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
        padding: 20px;
    }

    .form-container {
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 900px; /* Adjusted max-width for a professional look */
        overflow-x: auto; /* Allow horizontal scroll if needed */
    }

    .form-container h1 {
        font-size: 24px;
        margin-bottom: 20px;
        text-align: center;
    }

    .event {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-bottom: 20px;
        padding: 20px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .event img {
        max-width: 100%;
        height: auto;
        border-radius: 10px;
    }

    .event h2 {
        margin: 10px 0;
        font-size: 20px;
    }

    .event p {
        margin: 5px 0;
        font-size: 14px;
    }

    .event button {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        margin-top: 10px;
    }

    .event button a {
        color: white;
        text-decoration: none;
    }

    .event button:hover {
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
        <a href="showuseroption"><i class="fas fa-arrow-left"></i></a>
        <a href="HomeProject.jsp"><i class="fas fa-home"></i></a>
        <a href="userlogout"><i class="fas fa-sign-out-alt"></i></a>
    </div>
</div>
<div class="main-content">
    <div class="form-container">
        <h1>Events List</h1>
        <% List<Event> events = (List<Event>) request.getAttribute("eventlist"); %>
        <% if (events != null && !events.isEmpty()) { 
            for (Event event : events) { %>
                <div class="event">
                    <div><img src="<%= event.getImageUrl() %>" alt="Event Image"></div>
                    <h2><%= event.getName() %></h2>
                    <p><strong>Description:</strong> <%= event.getDescription() %></p>
                    <p><strong>Date:</strong> <%= event.getDate() %></p>
                    <p><strong>Time:</strong> <%= event.getTime() %></p>
                    <p><strong>Location:</strong> <%= event.getLocation() %></p>
                    <p><strong>Available Tickets:</strong> <%= event.getAvl_ticket() %></p>
                    <p><strong>Ticket Price:</strong> <%= event.getTicket_price() %></p>
                    <p><strong>Type:</strong> <%= event.getType() %></p>
                    <button><a href="bookevent?id=<%= event.getEvent_id() %>">Book</a></button>
                </div>
        <%   } 
        } else { %>
            <h1>No records found</h1>
        <% } %>
    </div>
</div>
</body>
</html>
