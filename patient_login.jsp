<%@page import="java.sql.*"%>

<%@page import="com.ex.*" %>
<%
Connection con=DbConnection.getConnection();
String name=request.getParameter("patient_Fname");
String password=request.getParameter("patient_pwd");
PreparedStatement ps=con.prepareStatement("select * from patient where patient_Fname=? and patient_pwd=?");
ps.setString(1,name);
ps.setString(2,password);
ResultSet rs=ps.executeQuery();
if(rs.next()){
	
session.setAttribute("id",rs.getInt(1));
session.setAttribute("Fname",rs.getString(3));

response.sendRedirect("patient_home.html?msg=sucess");
}

%>
