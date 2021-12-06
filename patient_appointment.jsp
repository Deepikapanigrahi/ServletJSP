<%@page import="com.ex.*"%>
<%@page import="java.sql.*" %>
<%
Connection con=DbConnection.getConnection();
String name=request.getParameter("name");
String date_of_appointment=request.getParameter("date_of_appointment");
String time_of_appointment=request.getParameter("time_of_appointment");
int phone=Integer.parseInt(request.getParameter("phone"));
String location=request.getParameter("location");
String specialist=request.getParameter("specialist");
int id=(Integer)session.getAttribute("id");
PreparedStatement ps=con.prepareStatement("insert into appointment(patient_name,date_of_appointment,time_of_appointment,location,phone,specialist,patient_id,doctor_name,status) values(?,?,?,?,?,?,?,?,?)");
ps.setString(1,name);
ps.setString(2,date_of_appointment);
ps.setString(3,time_of_appointment);
ps.setString(4,location);
ps.setInt(5,phone);
ps.setString(6,specialist);
ps.setInt(7,id);
ps.setString(8,"None");
ps.setString(9,"Pending");
int x=ps.executeUpdate();
if(x!=0)
	response.sendRedirect("view_appointment.jsp");
%>