<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
try{
	//check if user is already logged if they are then we redirect them to home page
	if((session.getAttribute("loggedIn").toString().equals("yes"))){
		System.out.println("logged in");
		response.sendRedirect("welcome.jsp");//redirecting them to home page
		
	}
	
}catch(Exception e){
	System.out.println("here " +e+session.getId());
}
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<h1 align="center">Welcome to DCI</h1>
</head>
<body>
	<table>
	
		<form name="form" action="login_process.jsp" method="post">
			<tr>
				<td>Username </td>
				<td><input type ="text" name="uName"></td>
			</tr>
			<tr>
				<td>Password </td>
				<td><input type ="password" name="pass"></td>
			</tr>
			<tr>
				<td><input type ="submit" value="Log In"></td>
			</tr>
	
		</form>
	
	</table>
	<br>
	<%
	try{
		//getting message from login_process.jsp wether log in was a succes or not
		String msg= session.getAttribute("msg").toString();
		out.print(msg);
		session.removeAttribute("msg");
		//to change we need to invalidate when log out
		session.invalidate();
		//System.out.println("session id"+session.getId());
		
	}catch(Exception e){
		
	}
		
	%>
	

</body>
</html>