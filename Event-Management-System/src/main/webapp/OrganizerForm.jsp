<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <div>
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
			<form:input path="company_name" id="company_name" placeholder="Enter company Name" required="required" type="text" />
			<span id="emailError" class="error"></span>
			<br>
			<form:input path="password" id="password" placeholder="Enter Password" required="required" type="password" />
			<span id="passwordError" class="error"></span>
			<br>
			<input type="submit" id="btn" value="Register">
		</form:form>
	</div>
</body>
</html>