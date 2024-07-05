<%@page import="com.jsp.eventmanagementsystem.entity.Event"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event Form</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
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

    .navbar .icons {
        display: flex;
        align-items: center;
    }

    .navbar .icons a {
        margin-left: 15px;
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
    
    .container {
        width: 50%;
        margin: 50px auto;
        background: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h2 {
        text-align: center;
        color: #333;
    }

    form {
        display: flex;
        flex-direction: column;
    }

    label {
        margin: 10px 0 5px;
        font-weight: bold;
    }

    select, input[type="date"], input[type="submit"] {
        padding: 10px;
        margin: 5px 0 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
        background-color: 
    }

    input[type="submit"] {
        background-color:  #007bff;
        color: white;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #555;
    }
</style>
</head>
<body>

<div class="navbar">
    <div class="logo-container">
         <span class="logo">Event<span class="logo-highlight">ify</span></span>
    </div>
    <div class="icons">
        <a href="showuseroption"><i class="fas fa-arrow-left" style="color: black; font-size: 34px;"></i></a>
        <a href="userlogout"><i class="fas fa-sign-out-alt" style="color:black;font-size: 34px;" ></i></a>
    </div>
</div>

<div class="container">
    <h2>Event Form</h2>
    <% List<Event> events = (List<Event>) request.getAttribute("alleventlist"); %>
    <form action="vieweventlist" method="post">
        <label for="location">Location:</label>
        <select id="location" name="location" required>
            <option value="">Select Location</option>
            <% if (events != null) { %>
                <% for (Event e : events) { %>
                    <option value="<%= e.getLocation() %>"><%= e.getLocation() %></option>
                <% } %>
            <% } %>
        </select>
        
        <label for="date">Date:</label>
        <input type="date" id="date" name="date" required>
        
        <label for="category">Category:</label>
        <select id="type" name="type" required>
            <option value="">Select Category</option>
            <option value="private">Private</option>
            <option value="public">Public</option>
        </select>
        
        <input type="submit" value="Submit">
    </form>
</div>

</body>
</html>
