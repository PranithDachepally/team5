<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% 
	if(session.getAttribute("user")==null) {
		response.sendRedirect("login.jsp?referrer=createjobs.jsp");
	}

	String role  = (String)session.getAttribute("role");
	if(!(role.equals("admin"))) {
		response.sendRedirect("index.jsp");
	}
	
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>School Management System | Create Class</title>

<script src="js/validate.js"></script>
<link rel="stylesheet" href="css/local.css">
<link rel="stylesheet" type="text/css" href="css/NavBar.css"> 
<link rel="stylesheet" type="text/css" href="css/LoginButton.css">



</head>

<body background="pictures/pic0.jpg" >
<%
	String user = (String)session.getAttribute("user");
	
	if(user!=null) {
%>
		<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a class="active" href="courses.jsp">Courses</a></li>
				<li><a href="">Appointments</a></li>
				<li><a href="">Time Table</a></li>
				<li><a href="editprofile.jsp">Edit Profile</a></li>
				<%
					if (role.equals("admin")) {
				%>
				<li><a href="reports.jsp">Reports</a></li>

				<%
					} else if (role.equals("teacher")) {
				%>

				<li><a href="sendMessage.jsp">Sending Message</a></li>
				<%
					} else if (role.equals("parent") || role.equals("teacher") || role.equals("student")) {
				%>
				<li><a href="searchMessage.jsp">Message</a></li>
				<%
					}
				%>

				<li><a style='float: right;' href="Logout">Logout</a></li>
			</ul>
			<h4>User:<%=user%>, Role:<%=role%></h3>
			<hr />


<div ng-app="classApp" ng-controller="classController" style="float:center";>
<form name="myform" method="post" onsubmit="return validateForm('course','false')">
<input type="hidden" name="action" value="new"/>
<table class="orgtable">
<tr><th>Course Name:</th><td><input type="text" name="name"/></td></tr>
<tr><th>Course Capacity:</th><td><input type="text" name="capacity"/></td></tr>
<tr>
<th>Instructor</th>
<td>
<select name="instructorid" value="{{i.idusers}}">
<option ng-repeat="i in instructor">{{i.firstname}} {{i.lastname}}</option>
</select>

</td>
</tr>

<tr style="border: 0px;">
<td style="border: 0px;"><input type="submit" id="submit"/></td>
<td style="border: 0px;">
<span style="display: inline;" class="errormsg" id="errormsg"></span>
<span style="display: inline;" class="successmsg" id="successmsg"></span>
</td>
</tr>
</table> 
</form> 
</div>
	<%} else {
%>
		<a href="login.jsp">Sign In</a> &nbsp;&nbsp;|&nbsp;&nbsp;
		<a href="register.jsp">Register</a>

<%
	}
	%>
<script>

var app = angular.module('classApp', []); // jobsApp to classApp

app.controller("classController",function($scope,$http) { // jobsController to classController
	
	$http.get("Users?action=get_instructor").then(function(response){  // Jobs to course
		
		$scope.instructor=response.data;
		
	});
	
	
});

</script> 
</body>
</html>