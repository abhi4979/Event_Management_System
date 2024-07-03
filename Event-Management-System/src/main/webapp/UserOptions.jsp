<%@page import="com.jsp.eventmanagementsystem.entity.Event"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
    }</style>
</head>
<body>
<div>
<h1>Attendee Dashboard</h1>
<a href="browseevent">Browse Event</a>
<a href="FilterEvent.jsp">Filter</a>

<div align="center">
    <h1>Event Management</h1>
   
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
</div>
</body>
</html>