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
        
<c:set var="dateOfTravel" scope="session" value="${param.dateOfTravel}"/>
<c:set var="sourceCity" scope="session" value="${param.sourceCity}"/>
<c:set var="destinationCity" scope="session" value="${param.destinationCity}"/>
<c:set var="noOfTravelers" scope="session" value="${param.noOfTravelers}"/>

<!-- sql:query  tag --> 
<sql:query dataSource="${db}" var="rs" scope="session">  
	SELECT * from flight_detail WHERE date_of_travel = ? AND source_city = ? AND destination_city = ? 
	<sql:param value="${dateOfTravel}" />
	<sql:param value="${sourceCity}" />
	<sql:param value="${destinationCity}" />
</sql:query>
<c:set var="flightCount" scope="session" value="${rs.getRowCount()}"/>

<c:if test="${flightCount == 0 || flightCount == null}">
   <c:redirect url="searchFlight.jsp?error=1"/>
</c:if>
<c:if test="${flightCount > 0}">
   <c:redirect url="flightDetail.jsp"/>
</c:if>

</body>
</html>