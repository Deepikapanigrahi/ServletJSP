package com.ex;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DoctorRegister extends HttpServlet {
	Connection con = null;
	PreparedStatement ps =null;
	public void init(ServletConfig config) {
		con=DbConnection.getConnection();
				
	}
	
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException {
	int doctor_id = Integer.parseInt(request.getParameter("doctor_id"));
	String doctor_name = request.getParameter("doctor_name");
	String doctor_specialisation = request.getParameter("specialist");
	int doctor_mobile = Integer.parseInt(request.getParameter("doctor_mobile"));
	String doctor_location  = request.getParameter("doctor_location");
	String doctor_password = request.getParameter("doctor_password");
	PrintWriter pw = response.getWriter();
	
	try {
		ps =con.prepareStatement("insert into doctor values (?,?,?,?,?,?)");
		ps.setInt(1,doctor_id);
		ps.setString(2, doctor_name);
		ps.setString(3, doctor_specialisation);
		ps.setInt(4, doctor_mobile);
		ps.setString(5, doctor_location);
		ps.setString(6, doctor_password);
		int x = ps.executeUpdate();
		if(x!=0)
			response.sendRedirect("doctor_login.html");
			
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	}
}
