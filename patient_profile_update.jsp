<%@page import="java.sql.*" %>
<%

String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String gender=request.getParameter("Gender");
int age=Integer.parseInt(request.getParameter("Age"));
int patient_id=Integer.parseInt(request.getParameter("id"));
Connection con=null;
PreparedStatement ps=null;
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/hospital";
String username="root";
String password="3306";
	 con=DriverManager.getConnection(url,username,password);
	 
	 ps=con.prepareStatement("update patient set patient_Fname=?,patient_Lname=?,patient_gender=?,patient_age=? where patient_id=?");
	 ps.setString(1,fname);
	 ps.setString(2,lname);
	 ps.setString(3,gender);
	 ps.setInt(4,age);
	 ps.setInt(5,patient_id);
	 int x=ps.executeUpdate();
	 if(x!=0)
		 response.sendRedirect("patient_profile.jsp?msg=Updated");
%>