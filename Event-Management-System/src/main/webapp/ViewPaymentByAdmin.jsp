<%@page import="com.jsp.eventmanagementsystem.entity.Payment"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booked User List</title>
</head>
<body>
   <div align="center">
        <h1>Booked User List</h1>
    
        <% List<Payment> payments = (List<Payment>) request.getAttribute("payobj"); %>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Event Name</th>
                <th>User Name</th>
                <th>No. Of Tickets</th>
                <th>Total Amount</th>
                <th>Payment Status</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
            <% if (payments != null) { 
               for (Payment payment : payments) { %>
            <tr>
                <td><%= payment.getPayment_id()%></td> 
                <td><%= payment.getEventname()%></td>
                <td><%= payment.getUsername() %></td>
                <td><%= payment.getQuantity()%></td>
                <td><%= payment.getAmount() %></td>
                <td><%= payment.getStatus()%></td>
                <td><a href="updatep?id=<%= payment.getPayment_id()%>">Update</a></td>
                <td><a href="deletep?id=<%= payment.getPayment_id()%>">Delete</a></td>
            </tr>
            <%   } 
           } %>
        </table>
        <div class="links">
            <a href="adminoptions.jsp">Back to main menu</a> 
            <a href="adminlogout">Log Out</a>
        </div>
</body>
</html>
