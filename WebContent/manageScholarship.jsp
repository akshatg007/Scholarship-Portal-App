<%@page import="com.scholarship.scholarship.ScholarshipDao"%>
<%@page import="com.scholarship.scholarship.ScholarshipDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Scholarships</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@include file="main_header.jsp"%>
	<%@include file="admin_menu.jsp"%>
	<div>
		<h1 align="center">Manage Scholarships</h1>
		<table style="width: 100%" id="tables">
			<tr>
				<th>S.No.</th>
				<th>Name</th>
				<th>Description</th>
				<th>State</th>
				<th>Stream</th>
				<th>Operations</th>
			</tr>
			<%
				ArrayList<ScholarshipDto> al = new ScholarshipDao().getAllScholarship();
				if (al != null) {
					int s = 0;
					for (ScholarshipDto dto : al) {
			%>
			<tr>
				<td><%=++s%></td>
				<td><%=dto.getName()%></td>
				<td><%=dto.getDescription()%></td>
				<td><%=dto.getState()%></td>
				<td><%=dto.getStream()%></td>
				<td><a href="updateScholarship.jsp?id=<%=dto.getId()%>">Update</a>
					<a href="deleteScholarship.jsp?id=<%=dto.getId()%>">Delete</a></td>
			</tr>
			<%
				}
				} else {
					response.sendRedirect("addScholarship.jsp");
				}
			%>
		</table>
	</div>


</body>
</html>