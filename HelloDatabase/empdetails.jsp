<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.util.*,java.sql.*,java.io.*"%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Employee Portal</title>

</head>

<body>

	<%
		Connection con;
	%>

	<%
		Statement s = null;
	%>

	<%
		ResultSet rs = null;
	%>

	<%
		PreparedStatement stmt = null;
	%>
	<%
		try {
			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/company?useSSL=false", "root",
					"Sonemma08*");
			String sqlGet = "select * from employee where first_name like ?;";
			String sqlAll = "select * from employee;";
			String sqlSet = "UPDATE employee SET first_name =? WHERE emp_id=?;";

			if (request.getParameter("Retrieve").equals("yes")) {
				stmt = con.prepareStatement(sqlGet);
				stmt.setString(1, (request.getParameter("fname"))+"%" );
				rs = stmt.executeQuery();

			}

			if (request.getParameter("Save").equals("yes")) {
				stmt = con.prepareStatement(sqlSet);
				stmt.setString(1, (request.getParameter("fname")));
				stmt.setInt(2, Integer.parseInt((request.getParameter("emp_id"))));
				stmt.executeUpdate();
				con.commit();

			}

			if (request.getParameter("showALL").equals("yes")) {
				stmt = con.prepareStatement(sqlAll);
				//stmt.setString(1, ("%"+request.getParameter("fname")));
				rs = stmt.executeQuery();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	%>


	<div id="dt_table">
		<table border='4' cellpadding='6' cellspacing='3' width="300px">
			<tr bgcolor="66FF00">
				<th><%=rs.getMetaData().getColumnName(1)%></th>
				<th><%=rs.getMetaData().getColumnName(2)%></th>
				<th><%=rs.getMetaData().getColumnName(3)%></th>
				<th><%=rs.getMetaData().getColumnName(4)%></th>
				<th><%=rs.getMetaData().getColumnName(5)%></th>
				<th><%=rs.getMetaData().getColumnName(6)%></th>
			</tr>

			<tr>

				<% 
					if (request.getParameter("Retrieve").equals("yes")) {
						while (rs.next())

						{
							%>
							<td><%=rs.getString(1)%></td>
							<td><%=rs.getString(2)%></td>
							<td><%=rs.getString(3)%></td>
							<td><%=rs.getString(4)%></td>
							<td><%=rs.getString(5)%></td>
							<td><%=rs.getString(6)%></td>
							<%
					}
					}
					if (request.getParameter("showALL").equals("yes")) {
						while (rs.next())

						{
						%>
					<tr>
						<td><%=rs.getString(1)%></td>
						<td><%=rs.getString(2)%></td>
						<td><%=rs.getString(3)%></td>
						<td><%=rs.getString(4)%></td>
						<td><%=rs.getString(5)%></td>
						<td><%=rs.getString(6)%></td>
					</tr>
					<%
				}
				}
					System.out.println(rs.getMetaData());
					rs.close();
					stmt.close();
					//con.close();
			%>


			</tr>
		</table>

	</div>

</body>

</html>