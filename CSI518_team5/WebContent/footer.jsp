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

		
		<a href="index.jsp">Home</a>&nbsp;&nbsp;|&nbsp;&nbsp;
	   <% // <a href="editprofile.jsp">Edit Profile</a> %>
<%

	if(role.equals("admin")||role.equals("teacher")||role.equals("parent")) {

		
%>

		
		&nbsp;&nbsp;|&nbsp;&nbsp;<a href="reports.jsp">Reports</a>

<% } %>

    	<h4>User: <%= user %>, Role: <%= role %></h3>	
	    <a href="Logout"><button>Logout</button></a><br/>
<%	
		} else {
%>
		<a href="login.jsp">Sign In</a> &nbsp;&nbsp;|&nbsp;&nbsp;
		<a href="register.jsp">Register</a>

<%
	}
%>
</footer>
<!-- end footer include -->