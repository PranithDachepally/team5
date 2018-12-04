<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<% 
	if(session.getAttribute("user")==null) {
		response.sendRedirect("login.jsp?referrer=editprofile.jsp");
	}

	String role=(String)session.getAttribute("role");
	String user = (String)session.getAttribute("user");
	String courseId = request.getParameter("id");
	String courseName = request.getParameter("coursename");
	String courseCapacity = request.getParameter("coursecap");
	if(user==null) {
		response.sendRedirect("courses.jsp");
	}
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>School Management System | Courses</title>
<link rel="stylesheet" href="css/local.css">
<script src="js/angular.min.js"></script>
<script src="js/validate.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<h2>School Management System | Courses </h2>
<jsp:include page='coursefooter.jsp'></jsp:include>
<form name="myform" method="post" onsubmit="return validateForm('EnrollController','false')" autocomplete="on">
<table class="table table-striped	">
		<tr>
		<th>CourseId</th>
		<td ><%= courseId %></td>
		</tr>
		<tr>
		<th>User</th>
		<td ><%= user %></td>
		</tr>
		<tr>
		<th>CourseName</th>
		<td><%= courseName %></td>		
		</tr>
		<tr>
		<th>CourseCapacity</th>
		<td><%= courseCapacity %></td>
		</tr>
	<input type="hidden" name="user" value="<%= user %>"/>
	<input type="hidden" name="id_of_course" value="<%= courseId %>"/>	
	</table>

	<div style="background-color:white; width:350px;" >Are you sure to enroll in this course?
	
	</div>
	<br/><input type="submit"/>
</form>
	<a href="courses.jsp"><button>No</button></a>
<div class="errormsg" id="errormsg"></div>
<div class="successmsg" id="successmsg"></div>
</body>
</html>