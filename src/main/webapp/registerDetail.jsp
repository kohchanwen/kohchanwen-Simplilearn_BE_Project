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
	  h2 {
		 margin-left: 150px;
	  }
      div {
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
</style>
<body>
<%
  if (request.getParameter("error") != null)
          out.println("<b>Your session has expired or is invalid.</b><br>");
%>
<div>
<c:set var="flightChosen" scope="session" value="<%=request.getParameter(\"flightNo\")%>"/>

<h2>Fill in your personal details</h2>
<form action="reviewDetail.jsp" method="post">
		<label for="fullName">Full Name:</label>
		<input type="text" name="fullName" id="fullName" maxlength="255" required><br>
		<label for="email">Email:</label> 
		<input type="email" name="email" id="email" maxlength="255" required><br>
		<label for="address">Address:</label> 
		<input type="text" name="address" id="address" maxlength="1000" required><br>
		<label for="passportNo">Passport Number:</label>
		<input type="text" name="passportNo" id="passportNo" maxlength="255" required><br>
		<label for="country">Country:</label> 
		<input type="text" name="country" id="country" maxlength="255" required><br>
		<label for="mobile">Mobile:</label> 
		<input type="tel" name="mobile" id="mobile" required><br>
		<label for="age">Age:</label>
		<input type="number" name="age" id="age" required><br>
		<br>
		<button>Review</button>
</form>
</div>

</body>
</html>