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
 <div>
        <div class="container">
    <div class="form-container">
		<h1>Event Organizer Register Form</h1>
		<form:form action="saveorganizer" modelAttribute="organizerobj" id="myorg">
			<form:input path="name" id="name" placeholder="Enter Name" required="required" type="text" />
			<span id="nameError" class="error"></span>
			<br>
			<form:input path="email" id="email" placeholder="Enter Email" required="required" type="email" />
			<span id="emailError" class="error"></span>
			<br>
			<br>
			<form:input path="mobilenumber" id="mobilenumber" placeholder="Enter mobilenumber" required="required" type="number" />
			<span id="emailError" class="error"></span>
			<br>
			<br>
			<form:input path="company_name" id="company_name" placeholder="Enter company Name"  type="text" />
			<span id="emailError" class="error"></span>
			<br>
			<form:input path="password" id="password" placeholder="Enter Password" required="required" type="password" />
			<span id="passwordError" class="error"></span>
			<br>
			<input type="submit" id="btn" value="Register">
			<p>Already have an account? <a href="UserLogin.jsp">Login</a></p>
		</form:form>
	 </div>
    <div class="content">
      <h2>Event Organizer in Eventify</h2>
      <p>An Event Organizer in an Event Management System is responsible for planning, coordinating, and executing events. 
      This role involves managing event logistics, including venue selection, catering, and scheduling. 
      The organizer collaborates with clients to understand their requirements and ensures all aspects of the event align with their vision. 
      They oversee the event's timeline, budget, and staff, ensuring everything runs smoothly on the event day. Effective communication, organizational skills, and attention to detail are essential for an event organizer to create memorable and successful events that meet or exceed client expectations.
      </p>
       <button><a href="HomeProject.jsp">Back</a></button>
    </div>
  </div>
   <script>
        document.addEventListener("DOMContentLoaded", function() {
            const form = document.getElementById("myorg");

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