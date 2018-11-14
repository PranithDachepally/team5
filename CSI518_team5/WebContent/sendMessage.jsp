<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="js/validate.js"></script>
<title>Email</title>
</head>
<body>
<h1>Sending a message</h1>


<form class="form-email"  action="/CSI518_team5/main" method="post" class="login100-form validate-form">
	<span class="label-input3">from:</span>
	<input class="input3" type="text" name="from" placeholder="teacher name here"><br>
	<span class="label-input1">to:</span>
	<input class="input1" type="text" name="to" placeholder="Parent email here"><br>
	<span class="label-input2"> Content:</span><br>
	<textarea rows="5" cols="18" class="label-input2" type="text" name="content" placeholder="Content...">Enter email content here.</textarea><br>
	<input type="submit" value="Submit">
	<a href="index.jsp">Back</a><br/>
</form> 

</body>
</html>