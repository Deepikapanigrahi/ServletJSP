<%@page import="java.sql.*"%>

<%@page import="com.ex.*" %>
<%
Connection con=DbConnection.getConnection();
String name=request.getParameter("doctor_name");
String password=request.getParameter("doctor_password");
PreparedStatement ps=con.prepareStatement("select * from doctor where doctor_name=? and doctor_password=?");
ps.setString(1,name);
ps.setString(2,password);
ResultSet rs=ps.executeQuery();

if(rs.next()){
session.setAttribute("id",rs.getInt(1));
session.setAttribute("name",rs.getString(3));
session.setAttribute("specialist", rs.getString("doctor_specialisation"));
response.sendRedirect("doctor_home.html?msg=sucess");
}

%>
