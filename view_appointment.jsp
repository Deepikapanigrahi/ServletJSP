<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

</head>
<body bgcolor="wheat">
<br><br><br><br>
<center><h1>Welcome to Patient Home
<br><br><br>
<a href="patient_profile.jsp">Profile</a> |
<a href="apply_appointment.jsp">Apply Appointment</a> |
<a href="view_appointment.jsp">View Appointment</a> |
<a href="index.jsp">Logout</a>

</h1></center>
<br><br><br><br>
<%@page import="com.ex.*"%>
<%@page import="java.sql.*" %>
<table border="2" widht="600" height="250" cellpadding="20" align="center">
<tr><td>Patient Name</td><td>Date</td><td>Time</td><td>Location</td><td>Phone</td><td>Specialist</td><td>Doctor</td><td>Status</td></tr>
<%
Connection con=DbConnection.getConnection();
PreparedStatement ps=con.prepareStatement("select * from appointment");
ResultSet rs=ps.executeQuery();
while(rs.next()){
	

%>
<tr><td><%=rs.getString("patient_name") %></td>
<td><%=rs.getString("date_of_appointment") %></td>
<td><%=rs.getString("time_of_appointment") %></td>
<td><%=rs.getString("location") %></td>
<td><%=rs.getInt("phone") %></td>
<td><%=rs.getString("specialist") %></td>
<td><%=rs.getString("doctor_name") %></td>
<td><%=rs.getString("status") %></td>
</tr>

<%} %>
</table>
</body>
</html>