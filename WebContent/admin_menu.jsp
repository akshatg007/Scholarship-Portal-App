
<%
	String str = (String) session.getAttribute("admin");
	if (str == null) {
		response.sendRedirect("login.jsp");
	}
%>


<ul>
	<li><a href="admin.jsp">Home</a></li>
	<li><a href="addScholarship.jsp">Add Scholarship</a></li>
	<li><a href="manageScholarship.jsp">Manage Scholarships</a></li>
	<li><a href="manageStudent.jsp">Manage Student</a></li>
	<li><a href="viewFeedback.jsp">View Feedback</a></li>
	<li style="float: right"><a href="admin_signOut.jsp">Sign out</a></li>
</ul>