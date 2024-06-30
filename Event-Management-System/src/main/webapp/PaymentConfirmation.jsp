<%@page import="com.jsp.eventmanagementsystem.entity.Payment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
  <div>
   <%Payment payment=(Payment)request.getAttribute("paymentobj"); %>
  <form action="confirmpayment">
    <label>Enter Card Number:<input type="text"></label>
    <label>Enter SFC code:<input type="text"></label>
    <label>Total Amount:<input type="number" value="<%= payment.getAmount() %>" readonly="true"></label>
    <input type="submit">
  </form>
  </div>
</body>
</html>