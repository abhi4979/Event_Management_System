<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Event Organizer Login</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .container {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        width: 80%;
        max-width: 1000px;
        background-color: #00FFFF;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        padding: 30px;
        border-radius: 10px;
    }
    .login-container {
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        width: 300px;
        text-align: center;
    }
    .login-container h1 {
        margin-top: 0;
        color: #333;
    }
    .login-container form {
        display: flex;
        flex-direction: column;
    }
    .login-container form input[type="email"],
    .login-container form input[type="password"] {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 3px;
        box-sizing: border-box;
        font-size: 16px;
    }
    .login-container form input[type="submit"] {
        width: 100%;
        background-color: #007bff;
        color: #fff;
        border: none;
        padding: 10px;
        margin-top: 10px;
        border-radius: 3px;
        cursor: pointer;
        font-size: 16px;
    }
    .login-container form input[type="submit"]:hover {
        background-color: #0056b3;
    }
    .forgot-password {
        text-align: center;
        margin-top: 10px;
    }
    .forgot-password a {
        color: #007bff;
        text-decoration: none;
    }
    .forgot-password a:hover {
        text-decoration: underline;
    }
    .content {
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        width: 400px;
        margin-left: 20px; 
    }
    .content h2 {
        color: #333;
    }
    .content p {
        color: #666;
        line-height: 1.6;
    }
    .content button {
        background-color: #007bff;
        padding: 10px 20px;
        margin-top: 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }
    .content button a {
        color: #fff;
        text-decoration: none;
    }
    .content button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<div class="container">
    <div class="login-container">
        <h1>${message}</h1>
        <h1>Event Organizer Login</h1>
        <form action="organizerloginvalidate" method="post">
            <input type="email" name="email" id="email" placeholder="Enter Your Email" required>
            <input type="password" name="password" placeholder="Enter Password" required>
            <input type="submit" value="Login" id="btn">
        </form>
        <div class="forgot-password">
            <a href="ForgotByOrg.jsp">Forgot Password?</a>
        </div>
    </div>
    <div class="content">
        <h2>Event Organizer in Eventify</h2>
        <p>An Event Organizer in an Event Management System is responsible for planning, coordinating, and executing events. This role involves managing event logistics, including venue selection, catering, and scheduling. The organizer collaborates with clients to understand their requirements and ensures all aspects of the event align with their vision. They oversee the event's timeline, budget, and staff, ensuring everything runs smoothly on the event day. Effective communication, organizational skills, and attention to detail are essential for an event organizer to create memorable and successful events that meet or exceed client expectations.</p>
        <button><a href="HomeProject.jsp">Back</a></button>
    </div>
</div>
</body>
</html>
