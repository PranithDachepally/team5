<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% 
	if(session.getAttribute("user")==null) {
		response.sendRedirect("login.jsp?referrer=createjobs.jsp");
	}

	String role  = (String)session.getAttribute("role");
	String firstname = (String)request.getParameter("firstname");
	String lastname = (String)request.getParameter("lastname");
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
<jsp:include page='footer.jsp'></jsp:include>


<div ng-app="classApp" ng-controller="classController" style="float:center";>
<form name="myform" method="post" onsubmit="return validateForm('course','false')">
<input type="hidden" name="action" value="new"/>
<table class="orgtable">
<tr><th>Course Name:</th><td><input type="text" name="name"/></td></tr>
<tr><th>Course Capacity:</th><td><input type="text" name="capacity"/></td></tr>
<tr>
<th>Instructor</th>
<td>
<select name="instructorid" >
<option ng-repeat="x in instructor" value="{{x.firstname}} {{x.lastname}}">{{x.firstname}} {{x.lastname}}</option>
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

<script>



var app = angular.module('classApp', []); 

app.controller("classController",function($scope,$http) { 
	
	$http.get("Users?action=get_instructor").then(function(response){  
		
		$scope.instructor=response.data;
		
	});
	
	
});


</script> 
</body>
</html>