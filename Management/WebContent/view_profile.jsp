<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>INDEX JSP</title>

<style> 

@import "https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"; 

form{
	   
       position: relative;
       z-index: 1;
       background: lightblue;
       max-width: 560px;
       margin: 0 auto 100px;
       padding: 45px;
       text-align: center;
}

.textbox i{
       margin: 30px 640px 0;
}

form input{
       outline : 1;
       width: 70%;
       box-sizing: border-box;
       padding: 15px;
       
}

.button{
        	width: 100%;
        	background: none;
        	border : 2px solid;
        	color: black;
        	font-size: 18px;
        	
        }
        

a {
    background-color: grey;
    box-shadow: 0 5px 0 darkred;
    color: white;
    padding: 1em 1.5em;
    position: relative;
    text-decoration: none;
    text-transform: uppercase;
}


</style>



</head>
<body>
		<div class="textbox">
       	<i class="fa fa-user fa-5x" aria-hidden="true"></i> 
        </div>
<form>


<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%
String name=(String)session.getAttribute("u_name");  

Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection(  "jdbc:mysql://localhost:3306/management","root","devam12345");  
Statement stmt=con.createStatement();  	
ResultSet rs = stmt.executeQuery("select * from user where username = '"+name+"'");

%>

<TABLE cellpadding="15" border=normal  align=center style="background-color: lightyellow;">

<%
if(rs.next()) { 
	
%>
<TR>
<TD> Username &nbsp&nbsp&nbsp: &nbsp&nbsp&nbsp<%=rs.getString(1)%></TD>
</TR>
<TR>	
<TD>&nbsp&nbsp Name &nbsp: &nbsp&nbsp&nbsp&nbsp&nbsp<%=rs.getString(3)%></TD>
</TR>
<TR>
<TD>&nbsp&nbsp&nbsp &nbsp&nbsp &nbsp&nbsp&nbsp Email_ID &nbsp:&nbsp&nbsp&nbsp <%=rs.getString(4)%></TD>
</TR>

<TR>
<TD>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Phone_Number &nbsp: &nbsp<%=rs.getString(5)%></TD>
</TR>
<TR>
<TD>Address &nbsp : &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<%=rs.getString(6)%></TD>
</TR>


<% } %>
</TABLE>

<br><br><br>
<p align="center">
<a href="welcome_1.jsp" class=button >BACK</a>
</p>

</form>



</body>
</html>





