<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
    justify-content: center;
    align-items: center;
    height: 100vh;
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
  }

  .form-container {
    width: 40%; 
    height:500px;
    border:1px solid black;
    background-color: #fff;
  }

  .form-container h1 {
    font-size: 24px;
    margin-bottom: 20px;
    text-align: center;
    margin-top:30px;
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
    <div class="form-container">
		<h1>Admin Register Form</h1>
		<form:form action="saveadmin" modelAttribute="adminobj" id="myadmin">
			<form:input path="name" id="name" placeholder="Enter Name" required="required" type="text" />
			<span id="nameError" class="error"></span>
			<br>
			<form:input path="email" id="email" placeholder="Enter Email" required="required" type="email" />
			<span id="emailError" class="error"></span>
			<br>
                <form:input path="mobilenumber" id="mobileNumber" placeholder="Enter Mobile Number" required="required" type="text" />
                <br>
			<br>
			<form:input path="password" id="password" placeholder="Enter Password" required="required" type="password" />
			<span id="passwordError" class="error"></span>
			<br>
			<input type="submit" id="btn" value="Register">
		</form:form>
	</div>
    <div class="content">
      <h2>Admin in Eventify</h2>
      <p>In an Event Management System, the admin plays a pivotal role in overseeing all operational aspects. They manage user roles, permissions, and system configurations, ensuring smooth functionality. Admins handle event approvals, monitor financial transactions, and resolve disputes. They collaborate with organizers to maintain event quality and compliance with policies. Additionally, admins analyze system data to improve user experience and operational efficiency. 
      Effective communication, problem-solving skills, and a keen eye for detail are essential for admins to maintain a secure and efficient event platform.</p>
       <button><a href="HomeProject.jsp">Back</a></button>
    </div>
  </div>
   <script>
        document.addEventListener("DOMContentLoaded", function() {
            const form = document.getElementById("myadmin");

            form.addEventListener("submit", function(event) {
                // Get form inputs
                const nameInput = document.getElementById("name");
                const emailInput = document.getElementById("email");
               
                const mobileNumberInput = document.getElementById("mobileNumber");
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