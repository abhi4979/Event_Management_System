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
<h2>Event Form</h2>
    <form:form action="updateuserinfo" modelAttribute="userexistinginfo" id="myuser" method="post">
        <table>
            <tr>
                <td>Id:</td>
                <td><form:input path="user_id" readonly="true"/></td>
            </tr>
            <tr>
                <td>Name:</td>
                <td><form:input path="name" /></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><form:textarea path="email" /></td>
            </tr>
            <tr>
                <td>Mobile Number:</td>
                <td><form:input path="mobilenumber" type="number" /></td>
            </tr>
            
         
            <tr>
                <td colspan="2"><input type="submit" value="Submit" /></td>
            </tr>
        </table>
    </form:form>
</body>
</html>