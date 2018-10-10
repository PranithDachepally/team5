<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	String ref = request.getParameter("referrer");

	if(ref==null) {
		ref="index.jsp";
	}

	if(session.getAttribute("user")!=null) {
		response.sendRedirect(ref);
	}


%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>School Management System | Login Page</title>
<script type="text/javascript" src="js/validate.js"></script>
<link rel="stylesheet" href="css/local.css">
</head>
<body>
<h2>School Management System | Sign In</h2>

<form name="myform" action="<%= ref %>" method="post" onsubmit="return validateForm('Login','true')" autocomplete="on">
<table>
<tr>
<th style="color: #ffffff; background-color: #707070;">Username</th>
<td><input type="text" name="username" placeholder="User Name" required autofocus /></td>
</tr>
<tr>
<th style="color: #ffffff; background-color: #707070;">Password</th>
<td><input type="password" placeholder="Password" name="password" required /></td>
</tr>
<tr>
<td><input type="submit" value="Login"></input></td>
</tr>
</table>
</form>
<div class="errormsg" id="errormsg"></div>
<div class="successmsg" id="successmsg"></div>

</body>
</html>
