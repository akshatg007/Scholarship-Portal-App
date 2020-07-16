<%@page import="com.scholarship.student.StudentDao"%>
<%
	String id = request.getParameter("sid");
	if (id != null) {
		int sid = Integer.parseInt(id);
		new StudentDao().deleteStudent(sid);
		response.sendRedirect("manageStudent.jsp");
	} else {
		response.sendRedirect("manageStudent.jsp");
	}
%>