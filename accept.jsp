<%@page import="com.ex.*"%>
<%@page import="java.sql.*" %>
<%
Connection con=DbConnection.getConnection();
int id=Integer.parseInt(request.getParameter("id"));
String name=(String)session.getAttribute("name");
PreparedStatement ps=con.prepareStatement("update appointment set status='Accepted',doctor_name=? where aid=?");
ps.setString(1,name);
ps.setInt(2,id);
int x=ps.executeUpdate();
if(x!=0)
response.sendRedirect("appointment_view.jsp?msg=success");
%>