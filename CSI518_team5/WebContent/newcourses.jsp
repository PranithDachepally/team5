<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	if(session.getAttribute("user")==null) {
		response.sendRedirect("login.jsp?referrer=jobs.jsp");
	}

	String role=(String)session.getAttribute("role");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>School Management System | Courses</title>
<link rel="stylesheet" href="css/local.css">
</head>
<body background="pictures/pic0.jpg" >


<h2>School Management System | Courses </h2>
<jsp:include page='footer.jsp'></jsp:include>

<script src="js/angular.min.js"></script>
<link rel="stylesheet" href="css/local.css">
</head>
<body background="pictures/pic0.jpg">
<%
	if(role.equals("admin")) {
		
%>
<div class="container" style="background-color:#E6E6FA;" >

<h3>Would you like to create a class?</h3>
<a href="createclass.jsp">Create Class</a><br>
<% 
}
%>
<% 
	if(session.getAttribute("user")!=null) {
		

%>		
<!--  Role:  <%= role %> -->
<div ng-app="jobsApp" ng-controller="jobsController"> 

<table class="jobstable">
	<thead>
		<tr>
		<th>Course ID</th>
		<th>Course Name</th>
		<th>Capacity</th>
		
		
		<%
			if(role.equals("user")){
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
	<tr ng-repeat="i in courses">
		<td>{{ i.idjobs }}</td>
		<td>{{ i.title }}</td>
		<td>{{ i.description }}</td>

		<%
			if(role.equals("user")) {
		%>
		<td><a href="enroll.jsp?id={{ i.idjobs }}">Enroll</a></td>
		<%
			}
		%>
		<%
			if(role.equals("admin")) {
		%>
		<td><a href="editcourse.jsp?id={{ i.idjobs }}">Edit</a></td>
		<%
			}
		%>
		<%
			if(role.equals("admin")) {
		%>
		<td><a href="deletecourse.jsp?id={{ i.idjobs }}">Delete</a></td>
		<%
			}
		%>
		<%
			if(role.equals("admin")) {
		%>
		<td><a href="enrolledStudent.jsp?id={{ i.idjobs }}">Students</a></td>
		<%
			}
		%>
	</tr>
	</tbody>

</table>
		<%
			if(role.equals("admin")||role.equals("manager")) {
		%>		
				<a href="createjob.jsp"><button>Add New Job</button></a>
		<%
			}
		%>

</div>


<script>

var app = angular.module('jobsApp', []);

app.controller("jobsController",function($scope,$http) {
	
	$http.get("course").then(function(response){
		
		$scope.courses=response.data;
		
	});
	
	
});

</script>
<jsp:include page='footer.jsp'></jsp:include>
<%
	}
%>	
</body>
</html>
