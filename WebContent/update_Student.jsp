<%@page import="com.scholarship.utility.ScholarshipUtility"%>
<%@page import="com.scholarship.student.StudentDao"%>
<%@page import="com.scholarship.student.StudentDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Profile</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@include file="main_header.jsp"%>
	<%@include file="student_menu.jsp"%>
	<%
		if (request.getMethod().equalsIgnoreCase("post")) {
	%>
	<jsp:useBean id="dto" class="com.scholarship.student.StudentDto"></jsp:useBean>
	<jsp:setProperty property="*" name="dto" />

	<%
		if (new StudentDao().updateStudent(dto)) {
				response.sendRedirect("student.jsp");
			} else {
				out.print("failed");
			}
		}
		Integer sid = (Integer) session.getAttribute("sid");
		if (sid != null) {

			StudentDto dto = new StudentDao().getStudent(sid);
			if (dto != null) {
	%>
	<div style="width: 50%; margin-left: 25%; margin-top: 5%">
	<h1 align="center">Update Profile</h1>
		<%
			String mystate = request.getParameter("state");
					String mygender = request.getParameter("gender");
					String mystream = request.getParameter("stream");
		%>
		<form action="update_Student.jsp" method="post">
			<input type="hidden" name="sid" value="<%=dto.getSid()%>"> <input
				type="text" value="<%=dto.getSname()%>" name="sname"
				placeholder="Enter student name" class="field" required required
				pattern="[A-z|\s]*"
				onchange="this.setCustomValidity(validity.patternMismatch ? 'Please Enter Only Alphabets for Student Name' : '');" />
			<input type="text" value="<%=dto.getUname()%>" name="uname"
				placeholder="Enter user name" class="field" required /><input
				type="password" value="<%=dto.getPwd()%>" name="pwd"
				placeholder="Enter Password" class="field" required /><input
				type="email" value="<%=dto.getEmail()%>"
				placeholder="Enter your email " name="email" class="field" required /><input
				type="text" placeholder="Enter your phone number"
				value="<%=dto.getPhone()%>" name="phone" class="field" required=""
				pattern="[0-9]{10}"
				onchange="this.setCustomValidity(validity.patternMismatch ? 'Please Enter Only 10 digits for  phone no.' : '');">
			<select id="stream" name="stream" required="" class="field">
				<option value="<%=dto.getStream()%>"><%=dto.getStream()%></option>
				<%
					for (String fl : ScholarshipUtility.getAllStreams()) {
								if (!(dto.getStream().equalsIgnoreCase(fl))) {
				%>
				<option value="<%=fl%>"><%=fl%></option>

				<%
					}
							}
				%>

			</select> <select id="state" name="state" required="" class="field">
				<option value="<%=dto.getState()%>"><%=dto.getState()%></option>
				<%
					for (String fl : ScholarshipUtility.getAllStates()) {
								if (!(dto.getState().equalsIgnoreCase(fl))) {
				%>
				<option value="<%=fl%>"><%=fl%></option>

				<%
					}
							}
				%>

			</select>
			<%
				if (dto.getGender().equalsIgnoreCase("Male")) {
			%>
			<input checked="" type="radio" name="gender" value="Male">Male
			<input type="radio" name="gender" value="Female">Female
			<%
				} else {
			%>
			<input type="radio" name="gender" value="Male">Male <input
				type="radio" checked="" name="gender" value="Female">Female
			<%
				}
			%>
			<input type="submit" value="Update Profile" id="SubmitButton">
		</form>
	</div>

	<%
		}
		}
	%>
</body>
</html>