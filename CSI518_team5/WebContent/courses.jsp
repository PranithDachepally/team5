<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	String user = (String)session.getAttribute("user");
	String role = (String)session.getAttribute("role");


%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Class</title>
<link rel="stylesheet" href="css/local.css">
</head>
<body background="pictures/pic0.jpg">
<%

	if(role.equals("admin")) {

		
%>
<h3>Would you like to create a class?</h3>
<a href="createclass.jsp">Create Class</a><br>
<% 
}
%>

</body>
</html>
