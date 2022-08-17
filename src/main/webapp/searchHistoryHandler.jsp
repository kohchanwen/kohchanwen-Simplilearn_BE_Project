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
        
<c:set var="userEmail" scope="session" value="${param.name}"/>

<!-- sql:query  tag --> 
<sql:query dataSource="${db}" var="rs" scope="session">  
	SELECT * from booking 
	INNER JOIN flight_detail ON booking.flight_no = flight_detail.flight_no 
	INNER JOIN register_detail ON booking.username = register_detail.username
	WHERE booking.username = ?
	<sql:param value="${userEmail}" />
</sql:query>
<c:set var="flightCount" scope="session" value="${rs.getRowCount()}"/>

<c:if test="${flightCount == 0 || flightCount == null}">
   <c:redirect url="adminDashboard.jsp?error=1"/>
</c:if>
<c:if test="${flightCount > 0}">
   <c:redirect url="historyDetail.jsp"/>
</c:if>

</body>
</html>