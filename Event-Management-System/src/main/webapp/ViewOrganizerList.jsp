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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
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

    .navbar .icons a {
        margin-left: 15px;
        font-size: 24px;
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

    .content {
        text-align: center;
        padding: 20px;
    }

    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    table th, table td {
        padding: 10px;
        text-align: center;
        border: 1px solid #ddd;
    }

    table th {
        background-color: #007bff;
        color: white;
    }

    table tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    table tr:hover {
        background-color: #ddd;
    }

    table a {
        text-decoration: none;
        color: #007bff;
    }

    table a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
<div class="navbar">
    <div class="logo-container">
        <span class="logo">Event<span class="logo-highlight">ify</span></span>
    </div>
    <div class="icons">
        <a href="adminoptions.jsp"><i class="fas fa-arrow-left" style="color: black;"></i></a>
        <a href="HomeProject.jsp"><i class="fas fa-home" style="color: black;"></i></a>
        <a href="adminlogout"><i class="fas fa-sign-out-alt" style="color:black;"></i></a>
    </div>
</div>
<div class="content">
		<h1>Event Organizer List</h1>
		${message}
		<% List<Event_Organizer> org = (List<Event_Organizer>) request.getAttribute("orgbyadmin"); %>
		<table border="1">
			<tr>
			    <th>Id</th>
				<th>Name</th>
				<th>Email</th>
				<th>Mobile Number</th>
				<th>Company Name</th>
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
		</div>
		
</body>
</html>