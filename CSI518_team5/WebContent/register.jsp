<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>School Management System | Register</title>
<script src="js/validate.js"></script>
<link rel="stylesheet" href="css/local.css">
</head>
<body>
<h2>School Management System | Register</h2>


	<form name="myform" method="post" onsubmit="return validateForm('Register','false')">
		<table class="orgtable" ng-repeat="i in job" id="orgform">
		<tr><th colspan="2">First Name</th></tr>
		<tr><td colspan="2"><input  size="50" id="title" type="text" class="jobform" name="firstname" required /></td></tr>
		<tr><th colspan="2">Last Name</th></tr>
		<tr><td colspan="2"><input  size="50" id="title" type="text" class="jobform" name="lastname" required /></td></tr>
		<tr><th colspan="2">Email</th></tr>
		<tr><td colspan="2"><input  size="50" id="title" type="email" class="jobform" name="email" required /></td></tr>
		<tr><th colspan="2">User Name</th></tr>
		<tr><td colspan="2"><input  size="50" id="title" type="text" class="jobform" name="username" required /></td></tr>
		<tr><th colspan="2">Password</th></tr>
		<tr><td colspan="2"><input  size="50" id="title" type="password" class="jobform" name="password" required /></td></tr>
		<tr><th colspan="2">Confirm password</th></tr>
		<tr><td colspan="2"><input  size="50" id="title" type="password" class="jobform" name="confirm" required /></td></tr>
		
		<input type="hidden" name="action" value="add"/>
		<table cellpadding="0" cellspacing="0" style="border: 0px;">
		<tr style="border: 0px;">
		<td style="border: 0px;"><input type="submit" id="submit"/></td>
		<td style="border: 0px;">
		<span style="display: inline;" class="errormsg" id="errormsg"></span>
		<span style="display: inline;" class="successmsg" id="successmsg"></span>
		</td>
		</tr>
		</table>
	</form>
	<hr/>
	<a href="index.jsp"/>Home</a>
</body>
</html>