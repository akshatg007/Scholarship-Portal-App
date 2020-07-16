
<%@page import="com.scholarship.student.StudentDao"%>
<%@page import="com.scholarship.student.StudentDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="css/style.css" type="text/css" rel="stylesheet">
</head>
<body>

	<%
		if (request.getMethod().equalsIgnoreCase("post")) {
			String uname = request.getParameter("uname");
			String pwd = request.getParameter("pwd");
			String user = request.getParameter("user");
			if (user != null && "admin".equalsIgnoreCase(user)) {
				if (uname.equals("admin") && pwd.equals("admin")) {
					String s = "admin";
					session.setAttribute("admin", s);
					response.sendRedirect("admin.jsp");
				} else {
					out.print("<script type='text/javascript'>alert('Please Enter valid login details');</script>");
				}
			} else if (user != null && "student".equalsIgnoreCase(user)) {

				StudentDto dto1 = new StudentDao().loginStudent(uname, pwd);

				if (dto1 == null) {
					out.print("<script type='text/javascript'>alert('Please Enter valid login details');</script>");

				} else {
					session.setAttribute("sid", dto1.getSid());
					response.sendRedirect("student.jsp");
				}
			} else {
				out.print("<script type='text/javascript'>alert('Please Enter valid login details');</script>");
			}
		}
	%>


	<%@ include file="main_header.jsp"%>
	<%@ include file="main_menu.jsp"%>
	<div style="width: 30%; margin-left: 30%; margin-top: 5%">
		<a style="margin-left: 85%" href="register.jsp">Register</a>
		<form action="login.jsp" method="post">
			<h2 style="font-size: 20px; color: red" align="center">Login</h2>
			<div>
				<input style="margin-left: 30%;" type="radio" name="user"
					checked="checked" value="admin">Admin <input type="radio"
					name="user" value="student"> Student
			</div>
			<input class="field" type="text" name="uname"
				placeholder="Enter username" required="required"
				autofocus="autofocus"> <input class="field" type="password"
				name="pwd" placeholder="Enter password" required="required">
			<input type="submit" value="signin">
		</form>
		<a href="forgetPassword.jsp">Forget Password</a>
	</div>
</body>
</html>