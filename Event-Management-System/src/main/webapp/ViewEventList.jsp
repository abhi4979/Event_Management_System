<%@page import="com.jsp.eventmanagementsystem.entity.Event"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div align="center">
		<h1>Product Management</h1>
		${message}
		<% List<Event> events = (List<Event>) request.getAttribute("eventlist"); %>
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
			<% if (events != null) { 
               for (Event event : events) { %>
			<tr>
			    <td><%= event.getEvent_id() %></td>
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
			<%   } 
           } %>
		</table>
		<div class="links">
			<a href="#">Back to main menu</a> <a
				href="#">Log Out</a>
		</div>
</body>
</html>