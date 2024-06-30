<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Event Form</title>
</head>
<body>
    <h2>Event Form</h2>
    <form:form action="saveevent" modelAttribute="eventobj" id="myevent">
        <table>
            <tr>
                <td>Name:</td>
                <td><form:input path="name" /></td>
            </tr>
            <tr>
                <td>Description:</td>
                <td><form:textarea path="description" /></td>
            </tr>
            <tr>
                <td>Date:</td>
                <td><form:input path="date" type="date" /></td>
            </tr>
            <tr>
                <td>Time:</td>
                <td><form:input path="time" type="time" /></td>
            </tr>
            <tr>
                <td>Location:</td>
                <td><form:input path="location" /></td>
            </tr>
            <tr>
                <td>Available Tickets:</td>
                <td><form:input path="avl_ticket" type="number" /></td>
            </tr>
            <tr>
                <td>Ticket Price:</td>
                <td><form:input path="ticket_price" type="number" step="0.01" /></td>
            </tr>
            <tr>
                <td>Type:</td>
                <td><form:input path="type" /></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Submit" /></td>
            </tr>
        </table>
    </form:form>
</body>
</html>
