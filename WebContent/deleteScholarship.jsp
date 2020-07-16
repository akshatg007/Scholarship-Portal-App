<%@page import="com.scholarship.scholarship.ScholarshipDao"%>
<%
	String id = request.getParameter("id");
	if (id != null) {
		int sid = Integer.parseInt(id);
		new ScholarshipDao().deleteScholarship(sid);
		response.sendRedirect("manageScholarship.jsp");
	} else {
		response.sendRedirect("manageScholarship.jsp");
	}
%>