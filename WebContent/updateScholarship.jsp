<%@page import="com.scholarship.utility.ScholarshipUtility"%>
<%@page import="com.scholarship.scholarship.ScholarshipDto"%>
<%@page import="com.scholarship.scholarship.ScholarshipDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Scholarship</title>
<link href="css/style.css" rel="stylesheet" type="text/css">

<jsp:useBean id="dto" class="com.scholarship.scholarship.ScholarshipDto"></jsp:useBean>
<jsp:setProperty property="*" name="dto" />

<%
	if (request.getMethod().equalsIgnoreCase("post")) {
		if (new ScholarshipDao().updateScholarship(dto)) {
			response.sendRedirect("manageScholarship.jsp");
		} else {
			out.print("Failed");
		}
	}
%>

</head>
<body>
	<%@include file="main_header.jsp"%>
	<%@include file="admin_menu.jsp"%>

	<%
		String id = request.getParameter("id");
		if (id != null) {

			ScholarshipDto dto1 = new ScholarshipDao().getScholarship(Integer.parseInt(id));
			if (dto1 != null) {
	%>
	<div style="width: 50%; margin-left: 25%; margin-top: 5%">
		<h1 align="center">Update Scholarship</h1>
		<%
			String mystates = request.getParameter("state");
					String mystream = request.getParameter("stream");
		%>
		<form action="updateScholarship.jsp" method="post">
			<input type="hidden" name="id" value="<%=dto1.getId()%>"> <input
				type="text" name="name" required="required"
				value="<%=dto1.getName()%>" placeholder="Enter Scholarship name"
				class="field"> <input type="text" name="description"
				value="<%=dto1.getDescription()%>" required="required"
				placeholder="Enter Scholarship Description" class="field"> <select
				id="stream" name="stream" required="" class="field">
				<option value="<%=dto1.getStream()%>"><%=dto1.getStream()%></option>
				<%
					for (String fl : ScholarshipUtility.getAllStreams1()) {
								if (!(dto1.getStream().equalsIgnoreCase(fl))) {
				%>
				<option value="<%=fl%>"><%=fl%></option>

				<%
					}
							}
				%>

			</select> <select id="state" name="state" required="" class="field">
				<option value="<%=dto1.getState()%>"><%=dto1.getState()%></option>
				<%
					for (String fl : ScholarshipUtility.getAllStates1()) {
								if (!(dto1.getState().equalsIgnoreCase(fl))) {
				%>
				<option value="<%=fl%>"><%=fl%></option>

				<%
					}
							}
				%>

			</select> <input type="submit" value="Update Scholarship" id="SubmitButton">
		</form>
	</div>

	<%
		}
		}
	%>

</body>
</html>