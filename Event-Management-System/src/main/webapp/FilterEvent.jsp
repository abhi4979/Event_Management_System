<%@page import="com.jsp.eventmanagementsystem.entity.Event"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Filter Events by Price</title>
</head>
<body>
  <div align="center">
    <h1>Filter Events by Price Range</h1>
    <form action="filtereventinfo" method="get">
      <label for="minPrice">Minimum Price:</label>
      <input type="number" id="minPrice" name="mincost" step="0.01" required>
      <br><br>
      <label for="maxPrice">Maximum Price:</label>
      <input type="number" id="maxPrice" name="maxcost" step="0.01" required>
      <br><br>
      <input type="submit" value="filter">
    </form>

  </div>
</body>
</html>
