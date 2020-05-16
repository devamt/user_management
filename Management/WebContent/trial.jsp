<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>


<!DOCTYPE html>
<html>
<body>

<h1>Retrieve data from database in jsp</h1>
<table border="1">
<tr>
<td>first name</td>
<td>last name</td>
<td>City name</td>
<td>Email</td>

</tr>
<%
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con= DriverManager.getConnection( "jdbc:mysql://localhost:3306/management", "root", "devam12345");
Statement stmt=con.createStatement();  	
ResultSet resultSet = stmt.executeQuery(" select * from details ");
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("username") %></td>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("address") %></td>
<td><%=resultSet.getString("phn") %></td>
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
</body>
</html>