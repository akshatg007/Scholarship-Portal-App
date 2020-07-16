<%@page import="com.scholarship.student.StudentDao"%>
<%@page import="com.scholarship.student.StudentDto"%>
<%@page import="com.scholarship.utility.ScholarshipUtility"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.scholarship.scholarship.ScholarshipDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Scholarship</title>
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
<jsp:useBean id="dto" class="com.scholarship.scholarship.ScholarshipDto"></jsp:useBean>
<jsp:setProperty property="*" name="dto" />

<%
	if (request.getMethod().equalsIgnoreCase("post")) {
		if (new ScholarshipDao().addScholarship(dto)) {
			boolean flag1 = true;
			String state = request.getParameter("state");
			String stream = request.getParameter("stream");
			ArrayList<StudentDto> al = new StudentDao().checkStudent(state, stream);
			if (al != null) {
				for (StudentDto dto1 : al) {
					if (dto1 != null) {
						boolean flag = new ScholarshipUtility().sendMailSpecific(dto1.getEmail());
						if (flag == false) {
							flag1 = false;
							new ScholarshipDao().deleteScholarshipSpecific();
							out.print("<script> alert('There are some Server problems...')</script>");
						}
					}
				}
			}
			if (flag1 == true) {
				response.sendRedirect("manageScholarship.jsp");
			}
		} else {
			out.print("Failed");
		}
	}
%>


</head>
<body>
	<%@include file="main_header.jsp"%>
	<%@include file="admin_menu.jsp"%>
	<div style="width: 50%; margin-left: 25%; margin-top: 5%">
		<%
			String mystates = request.getParameter("state");
			String mystream = request.getParameter("stream");
		%>
		<h1 align="center">Add Scholarship</h1>
		<form action="addScholarship.jsp" method="post">
			<input type="text" name="name" required="required"
				autofocus="autofocus" placeholder="Enter Scholarship name"
				class="field"> <input type="text" name="description"
				required="required" placeholder="Enter Scholarship Description"
				class="field"> <select id="stream" name="stream" required=""
				class="field" onchange="DoOnResubmit()">
				<%
					ArrayList<String> al = ScholarshipUtility.getAllStreams1();

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
					ArrayList<String> al1 = ScholarshipUtility.getAllStates1();

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

			</select> <input type="submit" id="SubmitButton" onclick="DoOnSubmit()"
				value="Add Scholarship" />

		</form>
</body>
</html>