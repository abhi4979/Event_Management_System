<%@page import="com.jsp.eventmanagementsystem.entity.Event"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Eventify Dashboard</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
    body {
        font-family: Arial, sans-serif;
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

    .event {
        border: 1px solid #000;
        padding: 15px;
        margin: 15px;
        width: 300px;
        display: inline-block;
        vertical-align: top;
    }

    .event img {
        height: 200px;
        width: 300px;
    }

    .content {
        text-align: center;
        padding: 20px;
    }
    .event button{
         background-color:  #007bff;
         border-radius: 10%;
    }
    .event button a{
      text-decoration: none;
    }
</style>
</head>
<body>

<div class="navbar">
    <div class="logo-container">
         <span class="logo">Event<span class="logo-highlight">ify</span></span>
    </div>
    <div class="nav-links">
       <a href="HomeProject.jsp"><i class="fas fa-home" style="color: black;"></i></a>
        <a href="browseevent">Browse Event</a>
        <a href="FilterEvent.jsp">Filter</a>
        <a href="bookedevent">Booked Events</a>
    </div>
    <div class="icons">
        <a href="userlogout"><i class="fas fa-sign-out-alt" style="color:black;"></i></a>
    </div>
</div>

<div class="content">
    <h1 style="font-size: 30px;">All Event lists For You</h1>
    <% List<Event> events = (List<Event>) request.getAttribute("eventobj"); %>
    <% if (events != null) { 
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
       } %>
</div>

</body>
</html>
