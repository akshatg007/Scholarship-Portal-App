<%@page import="com.scholarship.student.StudentDao"%>
<%@page import="com.scholarship.student.StudentDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Students</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file="main_header.jsp"%>
	<%@ include file="admin_menu.jsp"%>
	<div>
		<h1 align="center">Manage Students</h1>
		<table style="width: 100%" id="tables">
			<tr>
				<th>S.No.</th>
				<th>Name</th>
				<th>Uname</th>
				<th>Password</th>
				<th>Email</th>
				<th>Phone</th>
				<th>Gender</th>
				<th>State</th>
				<th>Stream</th>
				<th>Operations</th>
			</tr>
			<%
				ArrayList<StudentDto> al = new StudentDao().getAllStudent();
				if (al != null) {
					int s = 0;
					for (StudentDto dto : al) {
			%>
			<tr>
				<td><%=++s%></td>
				<td><%=dto.getSname()%></td>
				<td><%=dto.getUname()%></td>
				<td><%=dto.getPwd()%></td>
				<td><%=dto.getEmail()%></td>
				<td><%=dto.getPhone()%></td>
				<td><%=dto.getGender()%></td>
				<td><%=dto.getState()%></td>
				<td><%=dto.getStream()%></td>
				<td><a href="deleteStudent.jsp?sid=<%=dto.getSid()%>">Delete</a>

				</td>
			</tr>
			<%
				}
				} else {
					response.sendRedirect("register.jsp");
				}
			%>
		</table>
	</div>
</body>
</html>