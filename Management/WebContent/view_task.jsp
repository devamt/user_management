<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>


<!DOCTYPE html>
<html>
<head>
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
        
table, td, th {  
  border: 1px solid #ddd;
  text-align: left;
}

table {
  border-collapse: collapse;
  width: 100%;
  background-color:white;
}

th, td {
  padding: 15px;
}



</style>

</head>
<body>

		<div class="textbox">
       	<i class="fa fa-user fa-5x" aria-hidden="true"></i> 
        </div>
<form>
<table border="1">
<tr>
<td>Task ID</td>
<td>Task Topic</td>
<td>Task Description</td>
<td>Priority</td>

</tr>
<%

String name=(String)session.getAttribute("u_name");  


try{
Class.forName("com.mysql.jdbc.Driver");
Connection con= DriverManager.getConnection( "jdbc:mysql://localhost:3306/management", "root", "devam12345");
Statement stmt=con.createStatement();  	
ResultSet resultSet = stmt.executeQuery(" select * from task where username='"+name+"'");
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("taskid") %></td>
<td><%=resultSet.getString("task_topic") %></td>
<td><%=resultSet.getString("task_description") %></td>
<td><%=resultSet.getString("priority") %></td>
</tr>
<%
}
con.close();
}
 catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</form>
</body>
</html>