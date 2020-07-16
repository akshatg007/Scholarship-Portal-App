<%@page import="com.scholarship.utility.ScholarshipUtility"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.scholarship.student.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>REGISTRATION</title>
<link href="css/style.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	function DoOnSubmit() {
		if ((document.getElementById("state").value == "null")
				&& (document.getElementById("stream").value == "null")) {
			document.getElementById("SubmitButton").disabled = true;
			alert("Please select all options...");
		} else {
			document.getElementById("SubmitButton").disabled = false;
		}

	}

	function DoOnResubmit() {
		if ((document.getElementById("state").value == "null")
				&& (document.getElementById("stream").value == "null")) {
			document.getElementById("SubmitButton").disabled = false;
		}
	}
</script>
<jsp:useBean id="dto" class="com.scholarship.student.StudentDto"></jsp:useBean>
<jsp:setProperty property="*" name="dto" />

<%
	if (request.getMethod().equalsIgnoreCase("post")) {
		if (new StudentDao().addStudent(dto)) {
			response.sendRedirect("manageStudent.jsp");
		} else {
			out.print("Failed");
		}
	}
%>

</head>
<body>
	<%@include file="main_header.jsp"%>
	<%@include file="main_menu.jsp"%>
	<div style="width: 50%; margin-left: 25%; margin-top: 5%">
		<%
			String mystates = request.getParameter("state");
			String mystream = request.getParameter("stream");
		%>
		<h1 align="center">Student Registration</h1>
		<form action="register.jsp" method="post">
			<input type="text" name="sname" placeholder="Enter student name" autofocus=""
				class="field" required required pattern="[A-z|\s]*"
				onchange="this.setCustomValidity(validity.patternMismatch ? 'Please Enter Only Alphabets for Student Name' : '');" />
			<input type="text" name="uname" placeholder="Enter user name"
				class="field" required /><input type="password" name="pwd"
				placeholder="Enter Password" class="field" required /><input
				type="email" placeholder="Enter your email " name="email"
				class="field" required /><input type="text"
				placeholder="Enter your phone number" name="phone" class="field"
				required="" pattern="[0-9]{10}"
				onchange="this.setCustomValidity(validity.patternMismatch ? 'Please Enter Only 10 digits for  phone no.' : '');">
			<select id="stream" name="stream" required="" class="field"
				onchange="DoOnResubmit()">
				<%
					ArrayList<String> al = ScholarshipUtility.getAllStreams();

					if (mystream != null) {
				%>
				<option value="<%=mystream%>"><%=mystream%></option>

				<%
					for (String fl1 : al) {
							if (!(fl1.equalsIgnoreCase(mystream))) {
				%>
				<option value="<%=fl1%>"><%=fl1%></option>
				<%
					}
						}
					} else {
				%>
				<option value="null">---Select Streams---</option>
				<%
					for (String data1 : al) {
				%>
				<option value="<%=data1%>"><%=data1%></option>
				<%
					}
					}
				%>

			</select><select id="state" name="state" required="" class="field"
				onchange="DoOnResubmit()">
				<%
					ArrayList<String> al1 = ScholarshipUtility.getAllStates();

					if (mystates != null) {
				%>
				<option value="<%=mystates%>"><%=mystates%></option>

				<%
					for (String fl1 : al1) {
							if (!(fl1.equalsIgnoreCase(mystates))) {
				%>
				<option value="<%=fl1%>"><%=fl1%></option>
				<%
					}
						}
					} else {
				%>
				<option value="null">---Select States---</option>
				<%
					for (String data1 : al1) {
				%>
				<option value="<%=data1%>"><%=data1%></option>
				<%
					}
					}
				%>

			</select> <input type="radio" name="gender" value="Male" checked="">Male
			<input type="radio" name="gender" value="Female">Female <input
				type="submit" id="SubmitButton" onclick="DoOnSubmit()"
				value="Register" />
		</form>
	</div>
</body>
</html>