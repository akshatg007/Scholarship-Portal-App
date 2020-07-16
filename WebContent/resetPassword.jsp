<%@page import="com.scholarship.student.StudentDao"%>
<%
	String emailx = (String) session.getAttribute("email");
	if (emailx == null) {
		response.sendRedirect("forgetPassword.jsp");
	}
%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reset Password</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@include file="main_header.jsp"%>
	<%@include file="main_menu.jsp"%>
	<%
		if (request.getMethod().equalsIgnoreCase("post")) {

			String pass = request.getParameter("password");
			String email = (String) session.getAttribute("email");
			if (new StudentDao().changePassword(email, pass)) {
				session.removeAttribute("email");
				response.sendRedirect("login.jsp");
			}
		}
	%>
	<div style="width: 50%; margin-left: 25%; margin-top: 5%;"
		class="container">
		<div style="text-align: center; font-weight: bold; font-size: 20px;">Reset
			Password</div>
		<form action="resetPassword.jsp" method="post">

			<label for="fname">Enter new password</label> <input type="text" class="field"
				id="pass" name="password" placeholder="Enter new Password" autofocus
				required="required">

			<center>
				<input type="submit" class="field" value="Submit">
			</center>
			<br />

		</form>
	</div>


</body>
</html>