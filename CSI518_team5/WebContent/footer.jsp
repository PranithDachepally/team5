<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- begin footer include -->
<footer>
<hr/>

<%
	String user = (String)session.getAttribute("user");
	String role = (String)session.getAttribute("role");

	if(user!=null) {
%>
		<a href="index.jsp">Home</a> <br>
		<a href="">Appointments</a><br>
		<a href="">Time Table</a><br>
		<a href="editprofile.jsp">Edit Profile</a><br>   
<%

	if(role.equals("admin")) {
%>
		<a href="reports.jsp">Reports</a>

<% }else if(role.equals("teacher")){ %>

    	<a href="sendMessage.jsp">Sending Message</a>
<%		
	}else if(role.equals("parent")||role.equals("teacher")||role.equals("student")){
%>
		<a href="searchMessage.jsp">Message</a>
			
<%	
	}
%>
		<h4>User: <%= user %>, Role: <%= role %></h3>	
	    <a href="Logout"><button>Logout</button></a><br/>
<%
	}else {
%>
		
	    <a href="login.jsp">Sign In</a> <br>
		<a href="register.jsp">Register</a>
<%
	}
%>
</footer>
<!-- end footer include -->
