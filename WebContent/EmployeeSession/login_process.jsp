<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<h1 align="center">Your are now in the Login Page</h1>
<h2> you log in as</h2>
</head>
<body>
<%
	//getting parameters from the login form from index.jsp
	String uName=request.getParameter("uName");
	String pass=request.getParameter("pass");
	
	//jdbc implementattion
	Connection conn=null;
	PreparedStatement stmt=null;
	ResultSet rs = null;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/company?useSSL=false", "root",
				"Sonemma08*");
		
		String sqlQuery = "SELECT * FROM company.user where user_name='"+uName+"' and password='"+pass+"';";
		stmt = conn.prepareStatement(sqlQuery);
		rs = stmt.executeQuery();
		
		if(rs.next()){
			//if there is a result then it means the user successfully logged in
			String userId=rs.getString(1);
			String lName=rs.getString(2);
			String fName=rs.getString(3);
			//usage of session
			session.setAttribute("sId", userId);
			session.setAttribute("lName", lName);
			session.setAttribute("fName", fName);
			session.setAttribute("loggedIn","yes");
			//send user to welcome page, 
			response.sendRedirect("welcome.jsp");
			
		}
		else{
			session.setAttribute("msg", "Invalid user name or password");
			//send them back to login page
			response.sendRedirect("index.jsp");
		}
		
	}catch(Exception e){
		out.print("Cause: "+e);
		
	}
%>

</body>
</html>