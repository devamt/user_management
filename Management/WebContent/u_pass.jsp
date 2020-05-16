<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>update password jsp</title>
</head>
<body>

<%@page import="java.*" %>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>

<%
String name=(String)session.getAttribute("u_name");  


String passw2 = request.getParameter("pass4");
String passw3 = request.getParameter("pass5");
String userid = request.getParameter("usern");

Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection(  "jdbc:mysql://localhost:3306/management","root","devam12345");  
Statement stmt=con.createStatement();
ResultSet rs = stmt.executeQuery("select * from user where username = '"+name+"'");

if(rs.next())
	
{
     if(rs.getString(1).equals(name)) //to check current username
     {
    	 if(passw2.equals(passw3)) //to check new and re-typed password
    	 {
    		 stmt.executeUpdate("update user set password = '"+passw3+"' where username = '"+name+"'"); 
    		 response.sendRedirect("welcome_1.jsp");
    	 }
    	 
    	 else
    	 {
    		 System.out.println("Password not matched");
    		 response.sendRedirect("03.html");
    	 }
     }
     
     else
     {
    	 response.sendRedirect("04.html");
         
     }
}

else
{
	out.println("error");
}
%>

</body>
</html>