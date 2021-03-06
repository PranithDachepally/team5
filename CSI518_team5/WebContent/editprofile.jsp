<%@ page import = "schoolsystem.DatabaseAccess"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	if(session.getAttribute("user")==null) {
		response.sendRedirect("login.jsp?referrer=editprofile.jsp");
	}

	String role=(String)session.getAttribute("role");
	String jobID = request.getParameter("id");

	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>School Management System | Edit Profile</title>
<script src="js/angular.min.js"></script>
<link rel="stylesheet" href="css/local.css">
<link rel="stylesheet" type="text/css" href="css/LoginButton.css">
</head>
<body background="pictures/editprofile.png" style="    background-repeat: no-repeat;
    background-size: 400px;
    background-position: center 200px;">
	<h2>School Management System | Edit Profile</h2>
	<jsp:include page='footer.jsp'></jsp:include>
	<%
	if((role.equals("admin"))){
	%>
	<div ng-app="ProfileApp" ng-controller="profileController"> 
<table class="jobstable">
	<thead>
		<tr>
		<th>Name</th>
		<th>Update</th>
		
		</tr>
	</thead>
	<tbody>
	<tr ng-repeat="i in users">
		<td>{{ i.firstname }}&nbsp;{{ i.lastname }}</td>
		<td><a href="editRole.jsp?id={{i.iduser}}&firstname={{i.firstname}}&lastname={{i.lastname}}"><button>Update</button></a></td>
			
	</tr>
	</tbody>
	
	</table>
<% 
	}
%>	
<% 
if((role.equals("student")||role.equals("teacher")||role.equals("parent"))) {
	%>
<a href="updatePassword.jsp"><button class="button" style='background: #7F7FFF;'>Update Your Password</button></a>
<%
}
%>
<script>

var app = angular.module('ProfileApp', []);

app.controller("profileController",function($scope,$http) {

	$http.get("Users").then(function(response){
		
		$scope.users=response.data;
		
	});
	
});

</script>	
</body>
</html>