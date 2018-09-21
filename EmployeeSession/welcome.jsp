<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<h1 align="center">Welcome to Home Page</h1>
</head>
<body>
<%
	try{
		//getting attributes from login_process.jsp in case the user loged in successfully
		String firstName=session.getAttribute("fName").toString();
		String lastName=session.getAttribute("lName").toString();
		out.print("<h1>"+ "You Logged In as "+firstName+" "+lastName+"</h1>");
		
		out.print("<a href='logout.jsp'>Log Out</a>");
		out.print("<br>");
		out.print("session id is: "+session.getId());
		
	}catch(Exception e){
		//session.setAttribute("msg", "Something went wrong");
		response.sendRedirect("index.jsp");
		
	}
	
%>
</body>
</html>