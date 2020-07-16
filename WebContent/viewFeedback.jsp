<%@page import="com.scholarship.feedback.FeedbackDao"%>
<%@page import="com.scholarship.feedback.FeedbackDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Feedback</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@include file="main_header.jsp"%>
	<%@include file="admin_menu.jsp"%>
	<div>
		<h1 align="center">Manage Feedbacks</h1>
		<table style="width: 100%" id="tables">
			<tr>
				<th>S.No.</th>
				<th>Feedback</th>
				<th>Operations</th>
			</tr>
			<%
				ArrayList<FeedbackDto> al = new FeedbackDao().getAllFeedback();
				if (al != null) {
					int s = 0;
					for (FeedbackDto dto : al) {
			%>
			<tr>
				<td><%=++s%></td>
				<td><%=dto.getFeed()%></td>
				<td><a href="deleteFeedback.jsp?fid=<%=dto.getFid()%>">Delete</a>
				</td>
			</tr>
			<%
				}
				}
			%>
		</table>
	</div>


</body>
</html>