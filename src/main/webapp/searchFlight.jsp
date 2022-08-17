<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Airline Buddy</title>
</head>
<body>
<%
  if (request.getParameter("error") != null)
          out.println("<b>Your session has expired or is invalid</b><br>");
%>
	<form action="searchFlightHandler.jsp" method="post">
		<label for="dateOfTravel">Date of travel:</label><br> 
		<input type="date" name="dateOfTravel" id="dateOfTravel" style="font-size: 24px; margin-bottom: 5px" required><br>
		<label for="sourceCity">Source City:</label><br> 
		<input type="text"name="sourceCity" id="sourceCity" maxlength="100" style="font-size: 24px; margin-bottom: 5px" required><br>
		<label for="destinationCity">Destination City:</label><br> 
		<input type="text"name="destinationCity" id="destinationCity" maxlength="100" style="font-size: 24px; margin-bottom: 5px" required><br>
		<label for="noOfTravelers">Number of travelers:</label><br> 
		<input type="number"name="noOfTravelers" id="noOfTravelers" min="1" max="200" style="font-size: 24px; margin-bottom: 5px" required><br>
		<br>
		<button>Submit</button>
	</form>
</body>
</html>