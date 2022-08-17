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
<title>Insert title here</title>
</head>
<body>

<!-- sql:setDataSource tag -->
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/airline"  
     user="root"  password="simplilearn"/>  

<c:if test="${(bookedSeats + noOfTravelers) > totalSeats || flightChosen == null}">
   <c:redirect url="registerDetail.jsp?error=1"/>
</c:if>
       
<!-- sql:update  tag --> 
<sql:update dataSource="${db}" var="reg" scope="session">  
	INSERT INTO register_detail VALUES(?,?,?,?,?,?,?)
	<sql:param value="${email}" />
	<sql:param value="${address}" />
	<sql:param value="${age}" />
	<sql:param value="${mobile}" />
	<sql:param value="${fullName}" />
	<sql:param value="${passportNo}" />
	<sql:param value="${country}" />
</sql:update>

<sql:update dataSource="${db}" var="booking" scope="session">  
	INSERT INTO booking (username, flight_no)VALUES(?,?)
	<sql:param value="${email}" />
	<sql:param value="${flightChosen}" />
</sql:update>

<c:if test="${(bookedSeats + noOfTravelers) <= totalSeats}">
   <sql:update dataSource="${db}" var="booking" scope="session">  
	UPDATE flight_detail SET booked_seats = ? WHERE flight_no = ?;
	<sql:param value="${bookedSeats + noOfTravelers}" />
	<sql:param value="${flightChosen}" />
</sql:update>
</c:if>


<c:set var="registerCount" scope="session" value="${reg}"/> 

<c:if test="${registerCount == 0 || registerCount == null}">
   <c:redirect url="registerDetail.jsp?error=1"/>
</c:if>
<c:if test="${registerCount > 0}">
   <c:redirect url="confirmation.jsp"/>
</c:if> 

</body>
</html>