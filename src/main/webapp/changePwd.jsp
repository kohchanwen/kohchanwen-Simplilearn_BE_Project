<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Airline Buddy</title>
</head>
<style>
  .changePwd {
    display: inline;
    margin-left: 20px;
  }
</style>
<body>

<%
  if (request.getParameter("error") != null)
          out.println("<b>Your session has expired or password is invalid.</b><br>");
%>
	<form action="changePwdHandler.jsp" method="post">
		<label for="oPwd">Old Password:</label><br> 
		<input type="password"name="oPwd" id="oPwd" maxlength="50" style="font-size: 24px; margin-bottom: 5px"><br>
		<label for="nPwd">New Password:</label><br> 
		<input type="password"name="nPwd" id="nPwd" maxlength="50" style="font-size: 24px; margin-bottom: 5px"><br>
		<label for="cPwd">Confirm Password:</label><br> 
		<input type="password"name="cPwd" id="cPwd" maxlength="50" style="font-size: 24px; margin-bottom: 5px"><br>
		<br>
		<button>Submit</button>
</body>
	</form>
	
</html>