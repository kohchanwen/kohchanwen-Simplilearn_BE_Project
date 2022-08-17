<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, com.mysql.jdbc.Driver"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Airline Booking</title>
</head>
<style>
  table{
    margin-bottom: 20px;
  }
</style>
<body>
<h1>Master History List for <c:out value="${userEmail}"/></h1>
<table border="2" width="100%">  
<tr>  
<th>Flight Number</th>  
<th>Booking ID</th>
<th>User Email</th>
<th>Address</th>
<th>Mobile</th>
<th>Full Name</th>
<th>Identity</th>
<th>Country</th>
</tr>  
	<c:forEach var="table" items="${rs.rows}">  
		<tr>  
			<td><a href="<c:url value="/registerDetail.jsp?flightNo=${table.flight_no}"/>"><c:out value="${table.flight_no}"/></a></td>  
			<td><c:out value="${table.booking_id}"/></td> 
			<td><c:out value="${table.username}"/></td> 
			<td><c:out value="${table.address}"/></td> 
			<td><c:out value="${table.mobile}"/></td> 
			<td><c:out value="${table.full_name}"/></td> 
			<td><c:out value="${table.identity_no}"/></td>
			<td><c:out value="${table.country}"/></td>  
		</tr>  
	</c:forEach>  
</table>  
<table border="2" width="100%">  
<tr>  
<th>Flight Number</th>  
<th>Airline Name</th>  
<th>Price</th>  
<th>Source City</th>
<th>Destination City</th>  
<th>Departure Time From Source</th>  
<th>Arrival Time To Destination</th> 
<th>Total Seats</th> 
<th>Booked Seats</th>
<th>Seats Available</th>
<th>Date of Travel</th> 
<th>Class</th> 
</tr>  
	<c:forEach var="table" items="${rs.rows}">  
		<tr>  
			<td><a href="<c:url value="/registerDetail.jsp?flightNo=${table.flight_no}"/>"><c:out value="${table.flight_no}"/></a></td>  
			<td><c:out value="${table.airline_name}"/></td>  
			<td><c:out value="${table.price}"/></td>  
			<td><c:out value="${table.source_city}"/></td>  
			<td><c:out value="${table.destination_city}"/></td>
			<td><c:out value="${table.departure_time_from_source}"/></td>
			<td><c:out value="${table.arrival_time_to_destination}"/></td>
			<td><c:out value="${table.total_seats}"/></td>
			<td><c:out value="${table.booked_seats}"/></td>
			<td><c:out value="${table.total_seats - table.booked_seats}"/></td>
			<td><c:out value="${table.date_of_travel}"/></td>
		    <td><c:out value="${table['class']}"/></td>
		</tr>  
	</c:forEach>  
</table>  
</body>
</html>