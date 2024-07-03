<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Password Creation Form</title>
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
    .container form input[type="password"] {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 3px;
        box-sizing: border-box;
        font-size: 16px;
    }
    .container form input[type="submit"],
    .container form button {
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
    .container form input[type="submit"]:hover,
    .container form button:hover {
        background-color: #0056b3;
    }
    .container form .error {
        color: red;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>Password Creation Form</h1>
        <form:form action="savepasswordbyuser" modelAttribute="passwordobj" id="myuser">
            Enter New Password:<br>
            <form:input path="password" id="password" placeholder="Enter New Password" required="required" type="password" />
            <br>
            Confirm Password:<br>
            <input id="confirmPassword" placeholder="Enter Confirm Password" required="required" type="password" oninput="checkPasswordMatch()">
            <span id="passwordError" class="error"></span>
            <br>
            <input type="submit" id="btn" value="Create">
            <button type="button" onclick="goBack()">Back</button>
        </form:form>
    </div>

    <script>
    document.addEventListener("DOMContentLoaded", function() {
        const form = document.getElementById("myuser");

        form.addEventListener("submit", function(event) {
        	
        	 const passwordInput = document.getElementById("password");

        	 const password = passwordInput.value;
             const minLength = 8;
             const hasUpperCase = /[A-Z]/.test(password);
             const hasLowerCase = /[a-z]/.test(password);
             const hasDigit = /\d/.test(password);
             const hasSpecialChar = /[!@#$%^&*(),.?":{}|<>]/.test(password);

             if (password.length < minLength || !hasUpperCase || !hasLowerCase || !hasDigit || !hasSpecialChar) {
                 alert("Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one digit, and one special character.");
                 event.preventDefault();
                 return;
             }
         });
     });
        
        function checkPasswordMatch() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;

            if (password !== confirmPassword) {
                document.getElementById("passwordError").innerText = "Passwords do not match";
            } else {
                document.getElementById("passwordError").innerText = "";
            }
        }

        function goBack() {
            window.history.back();
        }
    </script>
</body>
</html>
