<%@page import="com.jsp.eventmanagementsystem.entity.Event_Organizer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Event Organizer Approval</title>
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
         font-size: 34px;
         
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
        overflow-x: auto; 
    }
    .options-container h1 {
        margin-bottom: 20px;
        color: #333;
    }
    .options-container table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    .options-container table th,
    .options-container table td {
        padding: 12px;
        text-align: center;
        border: 1px solid #ddd;
    }
    .options-container table th {
        background-color: #007bff;
        color: white;
    }
    .options-container table td {
        background-color: #f9f9f9;
    }
    .options-container table td a {
        display: inline-block;
        padding: 6px 12px;
        background-color: #007bff;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s;
    }
    .options-container table td a:hover {
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
         <a href="adminoptions.jsp"><i class="fas fa-arrow-left" style="color: black; font-size: 34px;"></i></a>
         <a href="HomeProject.jsp"><i class="fas fa-home" style="color: black;"></i></a>
        <a href="adminlogout"><i class="fas fa-sign-out-alt" style="color:black;"></i></a>
    </div>
</div>
<div class="main-content">
    <div class="options-container">
	<%
    List<Event_Organizer> organizers = (List<Event_Organizer>) request.getAttribute("unapprovedorganizers");
    %>
	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Email</th>
				<th>Mobile Number</th>
				<th>Status</th>
				<th>Approve</th>
			</tr>
		</thead>
		<tbody>
			<%
            for (Event_Organizer organizer : organizers) {
            %>
			<tr>
				<td><%= organizer.getOrg_id() %></td>
				<td><%= organizer.getName() %></td>
				<td><%= organizer.getEmail() %></td>
				<td><%= organizer.getMobilenumber() %></td>
				<td><%= organizer.getStatus() %></td>
				<td><a href="approveorganizer?id=<%= organizer.getOrg_id() %>">Approve</a></td>
			</tr>
			<%
            }
            %>
		</tbody>
	</table>
	</div>
</div>
</body>
</html>
