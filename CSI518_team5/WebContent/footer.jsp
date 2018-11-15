<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!-- begin footer include -->
<link rel="stylesheet" type="text/css" href="css/NavBar.css">
<link rel="stylesheet" type="text/css" href="css/LoginButton.css">
<footer>

<%
	String user = (String)session.getAttribute("user");
	String role = (String)session.getAttribute("role");

	if(user!=null) {
%>
		<ul>
  		<li><a class="active" href="index.jsp">Home</a></li>
		<li><a href="">Appointments</a></li>
		<li><a href="">Time Table</a></li>
		<li><a href="editprofile.jsp">Edit Profile</a></li>  
<%

	if(role.equals("admin")) {
%>
		<li><a href="reports.jsp">Reports</a></li>

<% }else if(role.equals("teacher")){ %>

    	<li><a href="sendMessage.jsp">Sending Message</a></li>
<%		
	}else if(role.equals("parent")||role.equals("teacher")||role.equals("student")){
%>
		<li><a href="searchMessage.jsp">Message</a></li>	
<%	
	}
%>
		
	    <li><a style='float: right;' href="Logout" >Logout</a></li>
	    </ul>
	    
	    <h4>User: <%= user %>, Role: <%= role %></h3>
<%
	}else {
%>
			
	    <a class="button" href="login.jsp"><span>Sign In </span></a>
		<a class="button" href="register.jsp"><span>Register </span></a>
<%
	}
%>
</footer>
<!-- end footer include -->
