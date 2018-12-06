<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	String user = (String)session.getAttribute("user");
	String role = (String)session.getAttribute("role");
	String courseId = request.getParameter("id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>School Management System | Courses</title>
<link rel="stylesheet" href="css/local.css">
<script src="js/angular.min.js"></script>
</head>
<h2>School Management System | Courses </h2>
<jsp:include page='coursefooter.jsp'></jsp:include>

<body>
<div ng-app="ClassApp" ng-controller="classController"> 
<table class="jobstable">
	<thead>
		<tr>
		<th>ID</th>
		<th>Course ID</th>
		<th>Course Name</th>		
		<th>Student ID</th>
		<th>First Name</th>
		<th>Last Name</th>
		
		</tr>
	</thead>
	<tbody>
	<tr ng-repeat="i in record">
		<td>{{ i.idclass }}</td>
		<td>{{ i.course_id }}</td>
		<td>{{ i.course_name }}</td>		
		<td>{{ i.user_id }}</td>
		<td>{{ i.firstname }}</td>
		<td>{{ i.lastname }}</td>		
		<%//<td>{{ x.iduser }}</td>%>
		<%
			if(role.equals("student")) {
		%>

		<%
			}
		%>
		<%
			if(role.equals("admin")) {
		%>

		<%
			}
		%>
		<%
			if(role.equals("admin")) {
		%>

		<%
			}
		%>

		<%
			if(role.equals("admin")) {
		%>

		<%
			}
		%>
	</tr>
	</tbody>
</table>
</div>


<script>

var app = angular.module('ClassApp', []);

app.controller("classController",function($scope,$http) {
	
	$http.get("classes?id=<%=courseId%>").then(function(response){
		
		$scope.record=response.data;
		
	});	
	
});

</script>

</body>
</html>