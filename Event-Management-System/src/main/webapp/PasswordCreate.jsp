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
  <h1>Password creation Form</h1>
		<form:form action="savepassword" modelAttribute="passwordobj" id="myorg">
			Enter New Password:<form:input path="password" id="password" placeholder="Enter New Password" required="required" type="password" />
			Enter Confirm Password:<input placeholder="Enter Confirm Password" required="required" type="password">
			<span id="passwordError" class="error"></span>
			<br>
			<input type="submit" id="btn" value="create">
		</form:form>
  </div>
</body>
</html>