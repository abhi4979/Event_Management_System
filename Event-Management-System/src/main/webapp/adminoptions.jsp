<%@page import="com.jsp.eventmanagementsystem.entity.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%Admin admin=(Admin)session.getAttribute("admininfo"); %>

	<%if(admin!=null) { %>
	<div class="main_div">
		<h1>${message}</h1>
		<h1>Choose an Option</h1>
		<a href="fetchunapprovedorganizers" class="main_a">Approve Event Organizers</a><br>
		<a href="adduserbyadmin">Add new User</a>
		<a href="viewallusers">View All Users</a>
		<a href="vieweventbyadmin">View All Event List</a>
		<a href="viewallorganizers">View All Event Organizers</a>
		<a href="paymentlist">View All payment List</a>
	</div>
	<%} else { %>
	<div class="main_div">
		<a href="adminlogin.jsp" class="main_a">Login First</a>
	</div>
	<%} %>
</body>
</html>