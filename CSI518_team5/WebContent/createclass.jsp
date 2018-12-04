<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
           <%@ page import ="java.util.*"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="schoolsystem.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% 
	if(session.getAttribute("user")==null) {
		response.sendRedirect("login.jsp?referrer=createjobs.jsp");
	}

	String role  = (String)session.getAttribute("role");
//	String firstname = (String)request.getParameter("firstname");
//	String lastname = (String)request.getParameter("lastname");
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

<%
List<Map> list =new ArrayList<Map>();
	ResultSet rs = DatabaseAccess.getInstructors();
	try {
		
		System.out.println("getInstructors");
		while (rs.next()) {
			String fname = rs.getString("firstname");
			String lname = rs.getString("lastname");
			int userid = rs.getInt("iduser");
			//System.out.println("Teachername: " + fname + lname);
		
			
			
			Map map = new HashMap<>(); 
			map.put("firstname", fname);			
			map.put("lastname", lname);	
			map.put("userid", userid);
			//map.put("content", content);
			
			System.out.println(map);
			list.add(map);
			
			for (@SuppressWarnings("rawtypes") Map map_1 :list) {
				System.out.println(map_1);
			}
			
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	request.setAttribute("key_list",list);
	%>

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
<select class="teacher-name" name="instructorName">
		<c:forEach items="${key_list}" var="apt">
			
        	<option id="${apt.userid}" value = "${apt.userid}">${apt.firstname} ${apt.lastname}</option>
			
		</c:forEach>
		</select>

<% //<select name="instructorName"/>
//<option ng-repeat="x in instructor" value = "{{x.iduser}}">{{x.firstname}} {{x.lastname}}</option>
//</select>
%>
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