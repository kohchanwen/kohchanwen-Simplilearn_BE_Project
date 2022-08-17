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
          out.println("<b>Your session has expired or is invalid.</b><br>");
%>
<h2>Search travel history</h2>
	<form action="searchHistoryHandler.jsp" method="post">
		<label for="name">User Email:</label><br> 
		<input type="email" name="name" id="name" maxlength=255 style="font-size: 24px; margin-bottom: 5px"><br>
		<br>
		<button>Search</button>
		<p class="changePwd"><a href="<c:url value="/changePwd.jsp"/>">Change password</a></p>
</body>
	</form>
	
</html>