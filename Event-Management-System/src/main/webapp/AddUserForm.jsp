<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Register Form</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }

  body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    display: flex;
    flex-direction: column;
    align-items: center;
    min-height: 100vh; 
  }

  .navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #87CEFA;
    padding: 10px 20px;
    width: 100%; /* Occupy full width */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); 
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

  .container {
    display: flex;
    justify-content: space-around;
    align-items: center;
    width: 80%;
    max-width: 1000px;
    background-color: #00FFFF;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 50px;
    border-radius: 10px;
    margin-top: 20px; 
  }

  .form-container {
    width: 40%;
    height: 500px;
    border: 1px solid black;
    background-color: #fff;
  }

  .form-container h1 {
    font-size: 24px;
    margin-bottom: 20px;
    text-align: center;
    margin-top: 30px;
  }

  .form-container form {
    text-align: center;
  }

  .form-container input[type="text"],
  .form-container input[type="email"],
  .form-container input[type="number"],
  .form-container input[type="password"] {
    width: 90%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
  }

  .form-container input[type="submit"] {
    background-color: #007bff;
    color: #fff;
    border: none;
    padding: 12px 20px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s;
  }

  .form-container input[type="submit"]:hover {
    background-color: #0056b3;
  }

  .content {
    width: 50%;
    padding: 20px;
  }

  .content h2 {
    font-size: 24px;
    margin-bottom: 20px;
    text-align: center;
  }

  .content p {
    line-height: 1.6;
    text-align: justify;
  }

  .content button {
    background-color: #007bff;
    padding: 12px 20px;
    border-radius: 10%;
  }

  .content a {
    color: #fff;
    border: none;
    text-decoration: none;
    margin-top: 30px;
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
<div class="navbar">
    <div class="logo-container">
         <span class="logo">Event<span class="logo-highlight">ify</span></span>
    </div>
    <div class="icons">
        <a href="adminoptions.jsp"><i class="fas fa-arrow-left" style="color: black;"></i></a>
        <a href="adminoptions.jsp" style="color: black;">Back to menu</a>
        <a href="adminlogout"><i class="fas fa-sign-out-alt" style="color:black;"></i></a>
    </div>
</div>
<div class="container">
    <div class="form-container">
      <h1>Add a new User</h1>
      <form action="saveuserbyadmin"  modelAttribute="userobject" method="post" id="myuser">
        <input type="text" id="name" name="name" placeholder="Enter Name" required>
        <br><span id="nameError" class="error"></span><br>
        <input type="email" id="email" name="email" placeholder="Enter Email" required>
        <br><span id="emailError" class="error"></span><br>
        <input type="number" id="mobilenumber" name="mobilenumber" placeholder="Enter Mobile Number" required>
        <br><span id="mobileError" class="error"></span><br>
        <input type="password" id="password" name="password" placeholder="Enter Password" required>
        <br><span id="passwordError" class="error"></span><br>
        <input type="submit" id="btn" value="Register">
      </form>
    </div>
  </div>
<script>
        document.addEventListener("DOMContentLoaded", function() {
            const form = document.getElementById("myuser");

            form.addEventListener("submit", function(event) {
                // Get form inputs
                const nameInput = document.getElementById("name");
                const emailInput = document.getElementById("email");
               
                const mobileNumberInput = document.getElementById("mobilenumber");
                const passwordInput = document.getElementById("password");

                // Validate name
                if (nameInput.value.trim() === "") {
                    alert("Name is required.");
                    event.preventDefault();
                    return;
                }

                // Validate email format
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
                // Validate password
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
    </script>
</body>
</html>
