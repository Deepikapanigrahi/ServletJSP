<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

</head>
<body bgcolor="wheat">
<br><br><br><br>
<center><h1>Welcome to Doctor Home
<br><br><br>
<a href="appointment_view.jsp">View Appointment</a> |
<a href="index.jsp">Logout</a>

</h1></center>
<br><br><br><br>
<%@page import="com.ex.*"%>
<%@page import="java.sql.*" %>
<table border="2" widht="600" height="250" cellpadding="20" align="center">
<tr><td>Patient Name</td><td>Date</td><td>Time</td><td>Location</td><td>Phone</td><td>Specialist</td><td>Doctor</td><td>Status</td><td>Action</td></tr>
<%
Connection con=DbConnection.getConnection();
String specialist=(String)session.getAttribute("specialist");
PreparedStatement ps=con.prepareStatement("select * from appointment where specialist=?");
ps.setString(1, specialist);
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
<%if(rs.getString("status").equalsIgnoreCase("PENDING")){
 %>
<td><a href="accept.jsp?id=<%=rs.getInt(1) %>">Accept</a></td>
<%}else{ %>
<td>Done</td>
<%} %>
</tr>

<%} %>
</table>
</body>
</html>