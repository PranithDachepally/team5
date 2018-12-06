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
		<nav id= "nav">
		<ul>
  		<li id="Home"><a href="index.jsp">Home</a></li>
  		<li><a href="courses.jsp">Courses</a></li>
		<li id="organization"><a href="organization.jsp">Organization</a></li>
		

	
		<li><a href="editprofile.jsp">Edit Profile</a></li>  
<%

	if(role.equals("admin")) {
%>
		<li><a href="reports.jsp">Reports</a></li>
		<li id="sendMessage"><a href="sendMessage.jsp">Sending Message</a></li>
    		<li id="getMessage"><a href="getmessage.jsp">Message</a></li>
    		<li id="GroupNotifaction"><a href="groupnoc.jsp">Group Notication</a></li>


<% 
	}else if(role.equals("teacher")){ 
%>

    	<li id="sendMessage"><a href="sendMessage.jsp">Sending Message</a></li>
    	<li id="getMessage"><a href="getmessage.jsp">Message</a></li>
    	<li><a href="getAppointment.jsp">Appointment</a></li>
    	<li id="Upload"><a href="upload.jsp">Upload</a></li>
    	<li id="Calender"><a href="calender.html">Calender</a></li>
<%		
	}else if(role.equals("parent")){
%>
		<li><a href="getmessage.jsp">Message</a></li>	
<%	
	}else if(role.equals("student")){ 
%>

		<li><a href="getmessage.jsp">Message</a></li>
		<li><a href="sAppointment.jsp">Make a Appointment</a></li>
		<li id="Upload"><a href="upload.jsp">Upload</a></li>
		<li id="Calender"><a href="calender.html">Calender</a></li>
<%
	}
%>	
		<li><a style='float: right;' href="Logout" >Logout</a></li>
	    </ul>
	    </nav>
	    <h4>User: <%= user %>, Role: <%= role %></h4>
<%
	}else {
%>
			
	    <a class="button" href="login.jsp"><span>Sign In </span></a>
		<a class="button" href="register.jsp"><span>Register </span></a>
<%
	}
%>
<script>
$(document).ready(function() {
	// get current URL path and assign 'active' class
	var pathname = window.location.pathname;
	alert(pathname);
	$('.nav > li > a[href="'+pathname+'"]').parent().addClass('active');
})</script>
</footer>
<!-- end footer include -->
