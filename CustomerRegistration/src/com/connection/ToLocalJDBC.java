package com.connection;

import java.io.IOException;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ToLocalJDBC
 */
@WebServlet("/ToLocalJDBC")
public class ToLocalJDBC extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ToLocalJDBC() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msg, first_name, last_name, date_of_birth, zip_code, email, password;
		/*String msg, first_name, middle_name, last_name, date_of_birth, SSN;
		first_name = request.getParameter("fname");
		middle_name = request.getParameter("mname");
		last_name = request.getParameter("lname");
		date_of_birth = "1996-09-09";
		SSN = request.getParameter("ssn");*/
		
		first_name= request.getParameter("first-name");
		last_name= request.getParameter("last-name");
		date_of_birth= request.getParameter("date-of-birth");
		email= request.getParameter("email");
		password= request.getParameter("psw");
		password= request.getParameter("psw-repeat");
		
		msg = "";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			java.sql.Connection connects = DriverManager.getConnection("jdbc:mysql://localhost:3306/dci", "clarissam", "coderight");
		
			//String sql = "INSERT INTO customer_info (first_name, middle_name, last_name, date_of_birth, SSN, a_id, cs_id, e_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
			
			String sql = "INSERT INTO pwd (email, password) VALUES(?, ?); "
					+ "INSERT INTO contact_info(a_id, c_id, street_address, apt_number, city, state, zip_code, country, email, phone, mobile, secondary_address) "
					+ "values(last_insert_id(), 1,'X',1,'X','X', 1, 'X', ?, 'X', 'X', 'X'); "
					+ "INSERT INTO customer_employment(e_id, c_id, company_name, profession, annual_income, fed_tax_id) "
					+ "VALUES(last_insert_id(),1, 'X', 'X', 1, 1);"
					+ "INSERT INTO customer_status(cs_id, c_id, ethnicity, gender, veteran, disability, citizenship, immigration, marital_status, coverage_type, number_of_dependents)"
					+ "VALUES(last_insert_id(), 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);"
					+ "INSERT INTO customer_info(c_id, first_name, middle_name, last_name, date_of_birth, SSN, a_id, cs_id, e_id)"
					+ "VALUES(last_insert_id(), ?, 'X', ?, ?, 1, 1, 1, 1);";
			
			PreparedStatement pst = connects.prepareStatement(sql);
			
			pst.setString(1, email);
			pst.setString(2, password);
			
			pst.setString(3, email);
			
			pst.setString(4, first_name);
			pst.setString(5, last_name);
			pst.setString(6, date_of_birth);
		
		
			/* pst.setString(1, first_name);
			 pst.setString(2, middle_name);
			 pst.setString(3, last_name);
			 pst.setString(4, date_of_birth);
			 pst.setString(5, SSN);
			 pst.setInt(6, 2);
			 pst.setInt(7, 2);
			 pst.setInt(8, 2);*/
			 
			 pst.executeUpdate();
			 
			
			 
			 msg = "You're application has been sent!";
			 System.out.println(msg);
			
			 
			 
		} catch (ClassNotFoundException e1) {
			msg = e1.getMessage();
			e1.printStackTrace();
		} catch (SQLException e) {
			msg = e.getMessage();
			e.printStackTrace();
		} catch (Exception e) {
			msg = e.getMessage();
			e.printStackTrace();
		}
		request.setAttribute("msg",  msg);
		request.getRequestDispatcher("/index.html").forward(request, response);
		
		
	}

}
