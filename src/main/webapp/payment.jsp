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
<style>
      div {
        margin-top: 10px;
        margin-bottom: 10px;
        padding: 10px;
        border: 1px solid black;
      }
      h2 {
        margin-left: 50px;
      }
      button {
        display: block;
        margin-left: 50px;
        font-size: 32px;
      }
      
</style>
        
<div>
<h2>Payment Page</h2>
<img src="frame.png" alt="Payment" width="500" height="600" />
<h2><c:out value="Total Price = $${noOfTravelers * price}"/></h2>
<button onclick="location.href='/PG_FSD_BE_Project/registerDetailHandler.jsp'">Done</button>
</div>

</body>
</html>