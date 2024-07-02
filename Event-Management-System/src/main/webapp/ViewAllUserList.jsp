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
		<h1>User List</h1>
		${message}
		<% List<User> users = (List<User>) request.getAttribute("users"); %>
		<table border="1">
			<tr>
			    <th>Id</th>
				<th>Name</th>
				<th>Email</th>
				<th>Mobile Number</th>
				<th>Update</th>
				<th>Delete</th>
			</tr>
			<% if (users != null) { 
               for (User user : users) { %>
			<tr>
			    <td><%= user.getUser_id() %></td>
				<td><%= user.getName() %></td>
				<td><%= user.getEmail() %></td>
				<td><%= user.getMobilenumber() %></td>
				<td><a href="updateuser?id=<%= user.getUser_id() %>">Update</a></td>
				<td><a href="deleteuser?id=<%= user.getUser_id() %>">Delete</a></td>

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