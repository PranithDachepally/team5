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
<h2>School Management System | Courses </h2>
<jsp:include page='coursefooter.jsp'></jsp:include>
<title>Create Class</title>
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
	if(session.getAttribute("user")!=null){

%>
</div>
<div ng-app="jobsApp">

</div>

<%
}
%>
</body>
</html>
