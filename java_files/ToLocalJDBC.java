package com.connection;

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
@WebServlet("/connect")
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
		String msg, first_name, last_name, date_of_birth, email, password;
		
		first_name= request.getParameter("first-name");
		last_name= request.getParameter("last-name");
		date_of_birth= request.getParameter("date-of-birth");
		email= request.getParameter("email");
		password= request.getParameter("psw");
	//	password= request.getParameter("psw-repeat");
		
		msg = "";
		Connection connects = null;
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			//Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/dci2?trueSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root123");
			
			
			 connects =DriverManager.getConnection("jdbc:mysql://localhost:3306/dci2?trueSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","root123");
			 if(connects!=null) {
			//String sql = "insert into firstFive (first_name, last_name, date_of_birth, email, password) values(?,?,?,?,?,?)";
			
			
		String sql = "	insert into customer_info (first_name, last_name, date_of_birth, email,password) "+ 
			"values(?,?,?,?,?)";

//		insert into customer_status (c_id) values((select c_id from customer_info where email like "sondorvil@gmail.com"));
//
//		insert into customer_employment (c_id) values((select c_id from customer_info where email like "sondorvil@gmail.com"));
			PreparedStatement pst = connects.prepareStatement(sql);
			
			pst.setString(1, first_name);
			pst.setString(2, last_name);
			
			pst.setString(3, date_of_birth);
         //   pst.setDate(3,date.valueOf(date_of_birth));
        //    pst.setDate(3, java.sql.Date.valueOf(date_of_birth));
			pst.setString(4, email);
			pst.setString(5, password);	
			
			
//			String sql = "insert into goods (id, name, good_type, good_img_url, good_created, good_desc, price ) values(?,? ,?,?,? ,?, ?)";

		 
	
			 
			 pst.executeUpdate();
			 
			connects.close();
			 
			 msg = "You're application has been sent!";
			 System.out.println(msg);
			 }
			 else System.out.println("errir123");
			 
			 
		} catch (ClassNotFoundException e1) {
//			msg = e1.getMessage();
//			e1.printStackTrace();
			System.out.println("error1");
		} catch (SQLException e) {
			msg = e.getMessage();
			e.printStackTrace();
		//	System.out.println("error2");
		} catch (Exception e) {
//			msg = e.getMessage();
//			e.printStackTrace();
			System.out.println("error3");
		}
		request.setAttribute("msg",  msg);
		request.getRequestDispatcher("/UserRegistration.html").forward(request, response);
		}
}