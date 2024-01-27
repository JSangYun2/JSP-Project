<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import =  "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Class.forName("com.mysql.jdbc.Driver");
	String jdbcURL = "jdbc:mysql://localhost:3306/jsp_project";
	String dbUser = "root";
	String dbPass = "rootpw";
	
	Connection conn = null;
	conn = DriverManager.getConnection(jdbcURL,dbUser,dbPass);
%>
</body>
</html>