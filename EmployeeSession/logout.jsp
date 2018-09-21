<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log Out</title>
</head>
<body>
<%
	try{
		session.removeAttribute("fName");
		session.removeAttribute("lName");
		session.setAttribute("loggedIn","no");
		session.setAttribute("msg", "Successfully logged out");
		response.sendRedirect("index.jsp");
		
	}catch(Exception e){
		
	}
%>

</body>
</html>