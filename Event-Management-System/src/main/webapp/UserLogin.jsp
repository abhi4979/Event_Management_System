<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>${message}</h1>
<h1>User Login Form</h1>
		<form action="userloginvalidate" method="post">
			<input type="email" name="email" id="email" placeholder="Enter Your email"
				required="required"><br> <input type="password"
				name="password" placeholder="Enter Password" required="required"><br>

			<input type="submit" value="Login" id="btn">

		</form>
</body>
</html>