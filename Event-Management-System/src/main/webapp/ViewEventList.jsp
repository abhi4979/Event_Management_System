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

    .navbar .icons {
        display: flex;
        align-items: center;
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
    <div class="icons">
        <a href="FilterEvent.jsp"><i class="fas fa-arrow-left" style="color: black; font-size: 34px;"></i></a>
        <a href="showuseroption">Back to menu</a>
        <a href="userlogout"><i class="fas fa-sign-out-alt" style="color:black; font-size: 34px"></i></a>
    </div>
</div>

<div class="content">
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

</body>
</html>
