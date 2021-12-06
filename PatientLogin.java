package com.ex;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class PatientRegister
 */

public class PatientLogin extends HttpServlet {
	
	Connection con=null;
	PreparedStatement ps=null;
public void init(ServletConfig config) {
	con=DbConnection.getConnection();
}
public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException {
	String Name=request.getParameter("patient_Fname");
	String password=request.getParameter("patient_pwd");
	try {
	
		ps=con.prepareStatement("select * from patient where patient_Fname=? and patient_pwd=?");
		ps.setString(1, Name);
		ps.setString(2, password);
		ResultSet rs=ps.executeQuery();
		HttpSession hs=request.getSession();
		if(rs.next()) {
			hs.setAttribute("patient_id", rs.getInt(1));
			hs.setAttribute("patient_Fname",rs.getString(3));
			
			response.sendRedirect("patient_home.html");
			
		}
		else {
			response.sendRedirect("patient_login.html");
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
	
}
}




