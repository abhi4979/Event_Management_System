<%@page import="com.jsp.eventmanagementsystem.entity.Payment"%>
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
   <div align="center">
		<h1>Booked User List</h1>
	
		<% List<Payment> payments = (List<Payment>) request.getAttribute("paymentinformation"); %>
		<table border="1">
			<tr>
				<th>Event Name</th>
				<th>User Name</th>
				<th>No. Of Tickets</th>
				<th>Total Amount</th>
				<th>Payment Status</th>
			</tr>
			<% if (payments != null) { 
               for (Payment payment : payments) { %>
			<tr>
				<td><%= payment.getEventname()%></td>
				<td><%= payment.getUsername() %></td>
				<td><%= payment.getQuantity()%></td>
				<td><%= payment.getAmount() %></td>
				<td><%= payment.getStatus()%></td>
			</tr>
			<%   } 
           } %>
		</table>
		<div class="links">
			<a href="OrganizerOptions.jsp">Back to main menu</a> <a
				href="organizerlogout">Log Out</a>
		</div>
</body>
</html>