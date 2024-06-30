<!DOCTYPE html>
<%@page import="com.jsp.eventmanagementsystem.entity.Event"%>
<%@page import="java.util.List"%>
<html>
<head>
<meta charset="UTF-8">
<title>Event Form</title>
</head>
<body>

<h2>Event Form</h2>
    <% List<Event> events = (List<Event>) request.getAttribute("alleventlist"); %>

<form action="vieweventlist" method="post">
    <label for="location">Location:</label>
    <select id="location" name="location" required>
        <option value="">Select Location</option>
       <% if (events != null) { %>
    <% for (Event e : events) { %>
        <option><%= e.getLocation() %></option>
    <% } %>
<% } %>
    </select>
    <br><br>
    
    <label for="date">Date:</label>
    <input type="date" id="date" name="date" required>
    <br><br>
    
    <label for="category">Category:</label>
    <select id="type" name="type" required>
        <option value="">Select Category</option>
        <option value="private">Private</option>
        <option value="public">Public</option>
    </select>
    <br><br>
    
    <input type="submit" value="Submit">
</form>

</body>
</html>
