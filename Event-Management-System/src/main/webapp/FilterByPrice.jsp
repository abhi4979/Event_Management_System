<%@page import="com.jsp.eventmanagementsystem.entity.Event"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>Filtered Events</h2>
    <table border="1">
      <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Date</th>
        <th>Time</th>
        <th>Location</th>
        <th>Available Tickets</th>
        <th>Ticket Price</th>
        <th>Type</th>
        <th>Book Ticket</th>
      </tr>
      <% List<Event> events = (List<Event>) request.getAttribute("filterlist");
         if (events != null) {
           for (Event event : events) { %>
        <tr>
          <td><%= event.getName() %></td>
          <td><%= event.getDescription() %></td>
          <td><%= event.getDate() %></td>
          <td><%= event.getTime() %></td>
          <td><%= event.getLocation() %></td>
          <td><%= event.getAvl_ticket() %></td>
          <td><%= event.getTicket_price() %></td>
          <td><%= event.getType() %></td>
          <td><a href="bookevent?id=<%= event.getEvent_id() %>">Book</a></td>
        </tr>
      <% } } else { %>
        <tr>
          <td colspan="9">No events found in this price range.</td>
        </tr>
      <% } %>
    </table>
</body>
</html>