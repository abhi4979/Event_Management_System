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
<h2>User Payment Form</h2>
    <form:form action="updatepaymentinfo" modelAttribute="paymentobject" id="myuser" method="post">
        <table>
            <tr>
                <td>Id:</td>
                <td><form:input path="payment_id" readonly="true"/></td>
            </tr>
            <tr>
                <td>User Name:</td>
                <td><form:input path="username" /></td>
            </tr>
            <tr>
                <td>Event Name:</td>
                <td><form:textarea path="eventname" /></td>
            </tr>
            <tr>
                <td>No.Of Tickets:</td>
                <td><form:input path="quantity" type="number" /></td>
            </tr>
            <tr>
                <td>Amount:</td>
                <td><form:input path="amount" type="number" /></td>
            </tr>
            <tr>
                <td>Status:</td>
                <td><form:input path="status"  /></td>
            </tr>
            
         
            <tr>
                <td colspan="2"><input type="submit" value="Submit" /></td>
            </tr>
        </table>
    </form:form>
</body>
</html>