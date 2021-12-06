<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

</head>
<body bgcolor="wheat">
<br><br><br><br>
<center><h1>Welcome to Patient Home</h1></center>
<br><br><br>
<a href="patient_profile.jsp">Profile</a>
<br><br><br>
<%@page import="java.sql.*" %>
<table align="center" border="2" cellpadding="20" width="500" height="150">
<tr>
<td>Patient Id</td><td>First Name</td><td>Last Name</td><td>Gender</td><td>Age</td><td>Action</td>
</tr>
<%
Connection con=null;
PreparedStatement ps=null;
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/hospital";
String username="root";
String password="3306";
	 con=DriverManager.getConnection(url,username,password);
	 
String name=(String)session.getAttribute("Fname");

	 ps=con.prepareStatement("select * from patient where patient_Fname=?");
	 ps.setString(1,name);
	ResultSet rs=ps.executeQuery();
	
	while(rs.next()){

		
		%>
<tr><td><%=rs.getInt(1) %></td><td><%=rs.getString(3) %></td><td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td> <td><%=rs.getInt(6) %></td>
<td><a href="update_patient_profile.jsp?id=<%=rs.getInt(1)%>">Update</a></td>
</tr>
<%} %>
</table>
</body>
</html> 