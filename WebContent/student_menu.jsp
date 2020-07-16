<%
Integer id=(Integer)session.getAttribute("sid");
if(id==null){
	response.sendRedirect("login.jsp");
}
%>

<ul>
<li><a href="student.jsp">Home</a></li>
<li><a href="view_Scholarship.jsp">View All Scholarships</a></li>
<li><a href="filterScholarship.jsp">Filter Scholarship</a></li>
<li><a href="feedback.jsp">Feedback</a></li>
<li><a href="update_Student.jsp">Update Profile</a></li>
<li style="float: right"><a href="student_signOut.jsp">Sign out</a></li>
</ul>