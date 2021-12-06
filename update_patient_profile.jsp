<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

</head>
<body bgcolor="wheat">
<br><br><br><br>
<center><h1>Welcome to Patient profile Update
<br><br><br>
<a href="patient_profile.jsp">Profile</a> |
<a href="apply_appointment.jsp">Apply Appointment</a> |
<a href="view_appointment.jsp">View Appointment</a> |
<a href="index.jsp">Logout</a>

</h1></center>
<br><br><br><br>
<%@page import="java.sql.*" %>
<%
int id=Integer.parseInt(request.getParameter("id"));
Connection con=null;
PreparedStatement ps=null;
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/hospital";
String username="root";
String password="3306";
	 con=DriverManager.getConnection(url,username,password);
	 ps=con.prepareStatement("select * from patient where patient_id=?");
	 ps.setInt(1,id);
	ResultSet rs=ps.executeQuery();
	
	while(rs.next()){

		

%>
<form action="./patient_profile_update.jsp" method="get" align="center">
<input type="hidden" name="id" value=<%=rs.getInt(1) %>>
<input type="text" name="fname" value=<%=rs.getString(3) %>>
<input type="text" name="lname" value=<%=rs.getString(4) %> >
<input type="text" name="Gender" value=<%=rs.getString(5) %>>
<input type="text" name="Age" value=<%=rs.getInt(6) %> >
<input type="submit" value="Update">
</form>
<%} %>
</body>
</html>