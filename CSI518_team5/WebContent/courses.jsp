<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user = (String)session.getAttribute("user");
	String role = (String)session.getAttribute("role");


%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>School Management System | Courses</title>
<link rel="stylesheet" href="css/local.css">
</head>
<body background="pictures/pic0.jpg" >
<script src="/js/getCourse.js"></script>

<h2>School Management System | Courses </h2>

<jsp:include page='footer.jsp'></jsp:include>


<script src="js/angular.min.js"></script>

</head>
<body background="pictures/pic0.jpg">

<%
	if(session.getAttribute("user")!=null){

%>
<!--  Role:  <%= role %> -->
<div ng-app="jobsApp" ng-controller="jobsController"> 

<table class="jobstable">
	<thead>
		<tr>
		<th>Course ID</th>
		<th>Course Name</th>
		<th>Capacity</th>
		<%// <th>Instructor</th> %>
		
		<%
			if(role.equals("student")){
		%>
		<th>Enroll</th>
		<%
			}
		%>
		<%
			if(role.equals("admin")) {
		%>
		<th>Edit</th>
		<th>Delete</th>
		<th>Students</th>
		<%
			}
		%>		
		</tr>
	</thead>
	<tbody>
	<tr ng-repeat="i in courses" ng-repeat = "x in instructors">
		<td>{{ i.course_id }}</td>
		<td>{{ i.course_name }}</td>
		<td>{{ i.course_capcity }}</td>
		<%//<td>{{ x.iduser }}</td>%>
		<%
			if(role.equals("student")) {
		%>
		<td><a href="enroll.jsp?id={{ i.course_id }}">Enroll</a></td>
		<%
			}
		%>
		<%
			if(role.equals("admin")) {
		%>
		<td><a href="editcourse.jsp?id={{ i.course_id }}">Edit</a></td>
		<%
			}
		%>
		<%
			if(role.equals("admin")) {
		%>
		<td><a href="deletecourse.jsp?id={{ i.course_id }}">Delete</a></td>
		<%
			}
		%>

		<%
			if(role.equals("admin")) {
		%>
		<td><a href="enrolledStudent.jsp?id={{ i.course_id }}">Students</a></td>
		<%
			}
		%>
	</tr>
	</tbody>

</table>
		<%
			if(role.equals("admin")) {
		%>		
				<a href="createclass.jsp"><button>Add New Course</button></a>
		<%
			}
		%>

</div>

<%
}
%>
<script>

var app = angular.module('jobsApp', []);

app.controller("jobsController",function($scope,$http) {
	
	$http.get("course").then(function(response){
		
		$scope.courses=response.data;
		
	});
	$http.get("Users?action=getInstructorName").then(function(response){
		$scope.instructors=response.data;
	});

	
	
});

</script>
</body>
</html>
