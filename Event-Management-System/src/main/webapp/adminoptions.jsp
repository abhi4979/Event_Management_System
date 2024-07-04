<%@page import="com.jsp.eventmanagementsystem.entity.Admin"%>
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
        margin: 0;
        padding: 0;
        background-color: #f0f0f0;
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

    .navbar .nav-links {
        display: flex;
        align-items: center;
    }

    .navbar .nav-links a {
        margin-left: 15px;
        font-size: 20px;
        color:black;
    }

    .navbar .icons {
        display: flex;
        align-items: center;
       
    }

    .navbar .icons a {
         margin-left: 15px;
        font-size: 24px;
        color: black;
         
    }
     .navbar .nav-links a {
        margin-left: 15px;
        margin-right:30px;
         font-size: 24px;
         
    }
    .main-content {
        display: flex;
        justify-content: center;
        align-items: center;
        height: calc(100vh - 50px);
    }
    .options-container {
        background-color: #fff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
    }
    .options-container h1 {
        margin-bottom: 20px;
        color: #333;
    }
    .options-container a {
        display: block;
        padding: 10px 20px;
        margin: 10px 0;
        background-color: #007bff;
        color: #fff;
        text-decoration: none;
        border-radius: 5px;
        font-size: 18px;
        transition: background-color 0.3s;
    }
    .options-container a:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<div class="navbar">
   <div class="logo-container">
         <span class="logo">Event<span class="logo-highlight">ify</span></span>
    </div>
     <div class="icons">
      
         <a href="HomeProject.jsp"><i class="fas fa-home" style="color: black;"></i></a>
        <a href="adminlogout"><i class="fas fa-sign-out-alt" style="color:black;"></i></a>
    </div>
</div>
<div class="main-content">
    <div class="options-container">
<%Admin admin=(Admin)session.getAttribute("admininfo"); %>

	<%if(admin!=null) { %>
	<div class="main_div">
		<h1>${message}</h1>
		<h1>Choose an Option</h1>
		<a href="fetchunapprovedorganizers" class="main_a">Approve Event Organizers</a>
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
	 </div>
</div>
</body>
</html>