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
        <form:form action="savepayment" modelAttribute="paymentobj">
            <label class="option"><b>Name: </b><form:input path="username" readonly="true" /></label>
            <br>
            <label class="option"><b>Type: </b><form:input path="eventname" readonly="true" /></label>
            <br>
            <label class="option"><b>Cost: </b><form:input path="amount" readonly="true" /></label>
            <br>
            <label class="option"><b>Enter Quantity: </b><form:input path="quantity" type="number" /></label>
            <br>
            <input type="submit" id="btn" value="Submit">
        </form:form>
        <a href="fetchallproducts" class="back-btn">Back</a> <!-- Adjusted the button to be a styled link -->
    </div>
</body>
</html>