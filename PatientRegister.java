package com.ex;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class PatientRegister extends HttpServlet {
	Connection con = null;
	PreparedStatement ps =null;
	public void init(ServletConfig config) {
	con=DbConnection.getConnection();
	}
	
	
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException {
	
	String patient_Fname = request.getParameter("patient_Fname");
	String patient_Lname = request.getParameter("patient_Lname");
	String patient_pwd  = request.getParameter("patient_pwd");
	int patient_age = Integer.parseInt(request.getParameter("patient_age"));
	String patient_location  = request.getParameter("patient_location");
	String patient_gender = request.getParameter("patient_gender");
	PrintWriter pw = response.getWriter();
	
	

	
	try {
		
		PreparedStatement pst1 = con.prepareStatement("select max(patient_id)+1 from patient");
		ResultSet rs = pst1.executeQuery();
        int patient_id =0 ;
        while(rs.next())
        {
        	patient_id = rs.getInt(1);
        }
		ps =con.prepareStatement("insert into patient values (?,?,?,?,?,?,?)");
		ps.setInt(1,patient_id);
		ps.setString(2, patient_pwd);
		ps.setString(3, patient_Fname);
		ps.setString(4, patient_Lname);
	    ps.setString(5, patient_gender);
	    ps.setInt(6, patient_age);
	    ps.setString(7, patient_location);
		int x = ps.executeUpdate();
		if(x!=0)
			response.sendRedirect("patient_login.html");
			
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	}
}
