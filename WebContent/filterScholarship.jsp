<%@page import="com.scholarship.scholarship.ScholarshipDto"%>
<%@page import="com.scholarship.scholarship.ScholarshipDao"%>
<%@page import="com.scholarship.utility.ScholarshipUtility"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Filter Scholarship</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function DoOnSubmit() {
		if ((document.getElementById("state").value == "---Select States---")
				&& (document.getElementById("stream").value == "---Select Streams---")) {
			document.getElementById("SubmitButton").disabled = true;
			alert("Please select a filter");
		} else {
			document.getElementById("SubmitButton").disabled = false;
		}

	}

	function DoOnResubmit() {
		if ((document.getElementById("state").value != "---Select States---")
				|| (document.getElementById("stream").value != "---Select Streams---")) {
			document.getElementById("SubmitButton").disabled = false;
		}
	}
</script>


<%
	ArrayList<ScholarshipDto> al = null;
	if (request.getMethod().equalsIgnoreCase("post")) {
		String state = request.getParameter("state");
		String stream = request.getParameter("stream");
		if (state != "---Select States---" && stream != "---Select Streams---") {
			al = new ScholarshipDao().ScholarshipByStateStream(state, stream);
		} else if (state != "---Select States---" && stream == "---Select Streams---") {
			al = new ScholarshipDao().ScholarshipByState(state);
		} else if (state == "---Select States---" && stream != "---Select Streams---") {
			al = new ScholarshipDao().ScholarshipByStream(stream);
		} else {
			al = null;
		}
	}
%>


</head>
<body>
	<%@include file="main_header.jsp"%>
	<%@include file="student_menu.jsp"%>
	<div style="width: 50%; margin-left: 25%; margin-top: 5%">
		<%
			String mystates = request.getParameter("state");
			String mystream = request.getParameter("stream");
		%>
		<h1 align="center">Filter Scholarships</h1>
		<form action="filterScholarship.jsp" method="post">
			<select id="stream" name="stream" required="" class="field"
				onchange="DoOnResubmit()">
				<%
					ArrayList<String> al1 = ScholarshipUtility.getAllStreams1();

					if (mystream != null) {
				%>
				<option value="<%=mystream%>"><%=mystream%></option>

				<%
					for (String fl1 : al1) {
							if (!(fl1.equalsIgnoreCase(mystream))) {
				%>
				<option value="<%=fl1%>"><%=fl1%></option>
				<%
					}
						}
					} else {
				%>
				<option value="---Select Streams---">---Select Streams---</option>
				<%
					for (String data1 : al1) {
				%>
				<option value="<%=data1%>"><%=data1%></option>
				<%
					}
					}
				%>

			</select><select id="state" name="state" required="" class="field"
				onchange="DoOnResubmit()">
				<%
					ArrayList<String> al2 = ScholarshipUtility.getAllStates1();

					if (mystates != null) {
				%>
				<option value="<%=mystates%>"><%=mystates%></option>

				<%
					for (String fl1 : al2) {
							if (!(fl1.equalsIgnoreCase(mystates))) {
				%>
				<option value="<%=fl1%>"><%=fl1%></option>
				<%
					}
						}
					} else {
				%>
				<option value="---Select States---">---Select States---</option>
				<%
					for (String data1 : al2) {
				%>
				<option value="<%=data1%>"><%=data1%></option>
				<%
					}
					}
				%>

			</select> <input type="submit" id="SubmitButton" onclick="DoOnSubmit()"
				value="Add Scholarship" />

		</form>
		<%
			if (request.getMethod().equalsIgnoreCase("post") && al != null) {
		%>
		<div>
			<h1 align="center">All Scholarships</h1>
			<table style="width: 100%" id="tables">
				<tr>
					<th>S.No.</th>
					<th>Name</th>
					<th>Description</th>
					<th>State</th>
					<th>Stream</th>
				</tr>
				<%
					int s = 0;
						for (ScholarshipDto dto : al) {
				%>
				<tr>
					<td><%=++s%></td>
					<td><%=dto.getName()%></td>
					<td><%=dto.getDescription()%></td>
					<td><%=dto.getState()%></td>
					<td><%=dto.getStream()%></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>

		<%
			}
		%>
	</div>

</body>
</html>