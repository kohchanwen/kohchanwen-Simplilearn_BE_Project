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
<body>
<style>
	  h2 {
		 margin-left: 150px;
	  }
      div {
        margin-top: 10px;
        margin-bottom: 10px;
        padding: 10px;
        border: 1px solid black;
      }
      label {
        display: inline-block;
        width: 150px;
        text-align: right;
      }
      input {
        font-size: 24px;
        margin-bottom: 10px;
      }
      button {
        margin-left: 150px;
      }
      table {
        margin-bottom: 20px;
       
      }
</style>
        
<div>
<h2>Confirmation Page</h2>
<h2>Thank you for booking with us!</h2>
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
	<c:if test="${table.flight_no == flightChosen}">
	<c:set var="price" scope="session" value="${table.price}"/>
	<c:set var="bookedSeats" scope="session" value="${table.booked_seats}"/>
	<c:set var="totalSeats" scope="session" value="${table.total_seats}"/>
		<tr>  
			<td><c:out value="${table.flight_no}"/></td>  
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
	 </c:if>  
	</c:forEach>  
</table>  
<form action="payment.jsp" method="post">
		<label for="fullName">Full Name:</label>
		<input type="text" name="fullName" id="fullName" maxlength="255" required value="${fullName}" disabled><br>
		<label for="email">Email:</label> 
		<input type="email" name="email" id="email" maxlength="255" required value="${email}" disabled><br>
		<label for="address">Address:</label> 
		<input type="text" name="address" id="address" maxlength="1000" required value="${address}" disabled><br>
		<label for="passportNo">Passport Number:</label>
		<input type="text" name="passportNo" id="passportNo" maxlength="255" required value="${passportNo}" disabled><br>
		<label for="country">Country:</label> 
		<input type="text" name="country" id="country" maxlength="255" required value="${country}" disabled><br>
		<label for="mobile">Mobile:</label> 
		<input type="tel" name="mobile" id="mobile" required value="${mobile}" disabled><br>
		<label for="age">Age:</label>
		<input type="number" name="age" id="age" required value="${age}" disabled><br>
		<br>
</form>
</div>

</body>
</html>