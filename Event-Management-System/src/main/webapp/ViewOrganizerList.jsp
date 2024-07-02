<%@page import="com.jsp.eventmanagementsystem.entity.Event_Organizer"%>
<%@page import="com.jsp.eventmanagementsystem.entity.User"%>
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
		<h1>Event Organizer List</h1>
		${message}
		<% List<Event_Organizer> org = (List<Event_Organizer>) request.getAttribute("orgbyadmin"); %>
		<table border="1">
			<tr>
			    <th>Id</th>
				<th>Name</th>
				<th>Email</th>
				<th>Mobile Number</th>
				<th>Update</th>
				<th>Delete</th>
			</tr>
			<% if (org != null) { 
               for (Event_Organizer o : org) { %>
			<tr>
			    <td><%= o.getOrg_id() %></td>
				<td><%= o.getName() %></td>
				<td><%= o.getEmail() %></td>
				<td><%= o.getMobilenumber() %></td>
				<td><%= o.getCompany_name() %></td>
				<td><a href="updateorganizer?id=<%= o.getOrg_id() %>">Update</a></td>
				<td><a href="deleteorganizer?id=<%= o.getOrg_id() %>">Delete</a></td>

			</tr>
			<%   } 
           } %>
		</table>
		<div class="links">
			<a href="adminoptions.jsp">Back to main menu</a> <a
				href="adminlogout">Log Out</a>
		</div>
</body>
</html>