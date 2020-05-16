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


String name3=request.getParameter("name2");
String email = request.getParameter("email2");
String phone = request.getParameter("phone2");
String address = request.getParameter("add2");

Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection(  "jdbc:mysql://localhost:3306/management","root","devam12345");  
Statement stmt=con.createStatement();  	
stmt.executeUpdate("update user set name='"+name3+"',email_id='"+email+"',phone='"+phone+"',address='"+address+"' where username='"+name+"' "); 
response.sendRedirect("welcome_1.jsp");
%>



</body>
</html>