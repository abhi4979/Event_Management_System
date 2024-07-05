<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login Form</title>
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
        justify-content: space-around;
        align-items: center;
        width: 60%;
        max-width: 1000px;
        background-color: #00FFFF;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        padding: 50px;
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
        background-color: #00FFFF;
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
      .content button{
  background-color: #007bff;
  padding: 12px 20px;
      border-radius:10%;
  }
  .content a {
    
    color: #fff;
    border: none;
    text-decoration:none;

    amrgin-top:30px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s;
  }

  .content a:hover {
    color: #0056b3;
  }
  
</style>
</head>
<body>
    <div class="container">
        <div class="login-container">
            <h1>${message}</h1>
            <h2>Admin Login Form</h2>
            <form action="adminloginvalidate" method="post">
                <input type="email" name="email" id="email" placeholder="Enter Your email" required><br>
                <input type="password" name="password" placeholder="Enter Password" required><br>

                <input type="submit" value="Login">
                <div class="forgot-password">
                    <a href="ForgotPassword.jsp">Forgot Password?</a>
                </div>
            </form>
        </div>
        <div class="content">
           <h2>Admin in Eventify</h2>
      <p>In an Event Management System, the admin plays a pivotal role in overseeing all operational aspects. They manage user roles, permissions, and system configurations, ensuring smooth functionality. Admins handle event approvals, monitor financial transactions, and resolve disputes. They collaborate with organizers to maintain event quality and compliance with policies. Additionally, admins analyze system data to improve user experience and operational efficiency. 
      Effective communication, problem-solving skills, and a keen eye for detail are essential for admins to maintain a secure and efficient event platform.</p>
       <button><a href="HomeProject.jsp">Back</a></button>
        </div>
    </div>
</body>
</html>
