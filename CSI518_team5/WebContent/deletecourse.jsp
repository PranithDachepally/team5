<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<% 
	if(session.getAttribute("user")==null) {
		response.sendRedirect("login.jsp?referrer=deletecourse.jsp");
	}
	String course_id = request.getParameter("id");
	String role = (String)session.getAttribute("role");
	
	
	if(course_id==null) {
		response.sendRedirect("course.jsp");
	}
	if(!(role.equals("admin") )) {
		response.sendRedirect("course.jsp");
	}
	
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>School Management System | Delete Course</title>
<script src="js/angular.min.js"></script>
<script src="js/validate.js"></script>

<link rel="stylesheet" href="css/local.css">
</head>
<body>
<h2>School Management System | Delete Course (ID= <%= course_id %>)</h2>
<jsp:include page='footer.jsp'></jsp:include>
<% 
	if(session.getAttribute("user")!=null) {
		
		
%>		
<!--  Role:  <%= role %> -->

	<form name="myform" method="post" onsubmit="return validateForm('course','false')">
		<input type="hidden" name="id" value="<%= course_id %>"/>
		<input type="hidden" name="action" value="delete"/>
		Do you really want to delete?
		<input type="submit"/>
		<span style="display: inline;" class="errormsg" id="errormsg"></span>
		<span style="display: inline;" class="successmsg" id="successmsg"></span>
		
	</form>






<%
		}
%>	

</body>
</html>
