<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> REGISTER JSP </title>
</head>
<body>

<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>

<%
String name=(String)session.getAttribute("u_name");  

String tid=request.getParameter("tid");
String topic=request.getParameter("topic");
String desc=request.getParameter("des");
String dates = request.getParameter("dates");
String priority = request.getParameter("priority");

Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection(  "jdbc:mysql://localhost:3306/management","root","devam12345");  
Statement stmt=con.createStatement();  	

stmt.executeUpdate("update task set task_topic='"+topic+"', task_description='"+desc+"',date='"+dates+"',priority='"+priority+"' where taskid='"+tid+"' and username='"+name+"'");

System.out.println("Registered");
response.sendRedirect("welcome_2.jsp");
%>



</body>
</html>