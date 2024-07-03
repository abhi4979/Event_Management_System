<%@page import="java.util.List"%>
<%@page import="com.jsp.eventmanagementsystem.entity.Event"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Event Management</title>
<style>
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
    .links {
        margin-top: 20px;
    }
</style>
</head>
<body>
<div align="center">
    <h1>Event Management</h1>
    ${message}
    <% List<Event> events = (List<Event>) request.getAttribute("events"); %>
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
                <p>
                    <a href="updateevent?id=<%= event.getEvent_id() %>">Update</a> |
                    <a href="delete?id=<%= event.getEvent_id() %>">Delete</a>
                </p>
            </div>
    <%   } 
       } %>
    <div class="links">
        <a href="OrganizerOptions.jsp">Back to main menu</a> 
        <a href="organizerlogout">Log Out</a>
    </div>
</div>
</body>
</html>
