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
        
<c:set var="pwd" scope="session" value="${param.oPwd}"/>
<c:set var="nPwd" scope="session" value="${param.nPwd}"/>

<!-- sql:query  tag --> 
<sql:query dataSource="${db}" var="rs">  
	SELECT * from admin_login WHERE username = ? AND password = ?
	<sql:param value="${adminName}" />
	<sql:param value="${pwd}" />
</sql:query>
<c:set var="LoginCount" scope="session" value="${rs.getRowCount()}"/>
 
<c:if test="${LoginCount == 0 || LoginCount == null}">
   <c:redirect url="adminLoginPage.jsp?error=1"/>
</c:if>

<!-- sql:update  tag --> 
<sql:update dataSource="${db}" var="updatePwd">  
	UPDATE admin_login SET password = ? WHERE username = ?
	<sql:param value="${nPwd}" />
	<sql:param value="${adminName}" />
	
</sql:update>
<c:set var="updatePwdCount" scope="session" value="${updatePwd}"/>
 
<c:if test="${updatePwdCount == 0 || updatePwdCount == null}">
   <c:redirect url="changePwd.jsp?error=1"/>
</c:if>
<c:if test="${updatePwdCount > 0}">
   <c:out value="Password changed" />
   <button onclick="location.href='/PG_FSD_BE_Project/adminDashboard.jsp'">Back</button>
</c:if>

</body>
</html>