<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>
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
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        width: 300px;
        text-align: center;
    }
    .container h1 {
        margin-top: 0;
        color: #333;
    }
    .container form {
        display: flex;
        flex-direction: column;
    }
   .container form button {
        background-color: #007bff;
        width: 70%; 
        padding: 10px;
        margin-top: 10px;
        margin-left:50px;
        border: none;
        border-radius: 3px;
        cursor: pointer;
        font-size: 16px;
    }
    .container form button a {
        color: #fff;
        text-decoration: none;
    }
    .container form button:hover {
        background-color: #0056b3;
    }
    
    .container form input[type="email"],
    .container form input[type="number"] {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 3px;
        box-sizing: border-box;
        font-size: 16px;
    }
    .container form input[type="submit"] {
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
    .container form input[type="submit"]:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>Please Enter Your Details</h1>
        <form action="forgotpasswordbyorg" method="post" id="forgotbyorg">
            <input type="email" name="email" id="email" placeholder="Enter Your Email" required><br>
            <input type="number" name="mobilenumber" id="mobilenumber" placeholder="Enter Mobile Number" required><br>
            <input type="submit" value="Submit">
            <button><a href="OrganizerLogin.jsp">Back</a></button>
        </form>
    </div>
</body>
   <script>
        document.addEventListener("DOMContentLoaded", function() {
            const form = document.getElementById("forgotbyorg");

            form.addEventListener("submit", function(event) {
                const emailInput = document.getElementById("email");
               
                const mobileNumberInput = document.getElementById("mobilenumber");
                               
                const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailPattern.test(emailInput.value.trim())) {
                    alert("Invalid email format.");
                    event.preventDefault();
                    return;
                }
                // Validate mobile number format
                const mobilePattern = /^[6-9]\d{9}$/;
                if (!mobilePattern.test(mobileNumberInput.value.trim())) {
                    alert("Mobile number must be a 10-digit number and it should not start with 0-5");
                    event.preventDefault();
                    return;
                }

               
            });
        });
    </script>
</html>
