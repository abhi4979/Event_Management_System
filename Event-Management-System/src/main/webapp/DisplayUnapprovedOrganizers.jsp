<%@page import="com.jsp.eventmanagementsystem.entity.Event_Organizer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
    List<Event_Organizer> organizers = (List<Event_Organizer>) request.getAttribute("unapprovedorganizers");
    %>
	<table border="1">
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Email</th>
				<th>Mobile Number</th>
				<th>Status</th>
				<th>Approve</th>
			</tr>
		</thead>
		<tbody>
			<%
            for (Event_Organizer h : organizers) {
            %>
			<tr>
				<td><%=h.getOrg_id()%></td>
				<td><%=h.getName()%></td>
				<td><%=h.getEmail()%></td>
				<td><%=h.getMobilenumber()%></td>
				<td><%=h.getStatus()%></td>
				<td><a href="approveorganizer?id=<%=h.getOrg_id()%>">Approve</a></td>
			</tr>
			<%
            }
            %>
		</tbody>
	</table>

	<div class="container">
		<a href="adminoptions.jsp">Back to Menu</a> <a href="adminlogout">Logout</a>
	</div>
</body>
</html>