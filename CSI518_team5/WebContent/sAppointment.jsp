<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
           <%@ page import ="java.util.*"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="schoolsystem.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Making a Appointment</title>
</head>
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
	
	List<Map> time = new ArrayList<Map>();
	String nine = "9:00";
	String eight = "8:00";
	Map timemap = new HashMap<>();
	timemap.put("nine", nine);
	timemap.put("eight", eight);
	time.add(timemap);
	
	List<Map> date = new ArrayList<Map>();
	Map datemap = new HashMap<>();
	datemap.put("Monday", "Monday");
	datemap.put("Tuesday","Tuesday");
	datemap.put("Wednesday","Wednesday");
	datemap.put("Thursday", "Thursday");
	datemap.put("Friday", "Friday");
	date.add(datemap);
	
	request.setAttribute("time", time);
	request.setAttribute("date", date);
%>
<body>
<h1>Please choose a Instructor below</h1>

	<form action="/CSI518_team5/Appointment" method="post">
		Instructor:<select class="teacher-name" name="teachername">
		<c:forEach items="${key_list}" var="apt">
			
        	<option id="${apt.userid}" value = "${apt.userid}">${apt.firstname}</option>
			
		</c:forEach>
		</select>
		Time:<select class="time" name="time">
		<c:forEach items="${time}" var="time">
			
        	<option id= "${time.eight}" value="${time.eight}">8:00</option>
        	<option id= "${time.nine}" value="${time.nine}">9:00</option>
			
		</c:forEach>
		</select>
		Date:<select class="date" name="date">
		<c:forEach items="${date}" var="date">
			
        	<option id= "${date.Monday}" value="${date.Monday}">Monday</option>
        	<option id= "${date.Tuesday}" value="${date.Tuesday}">Tuesday</option>
        	<option id= "${date.Wednesday}" value="${date.Wednesday}">Wednesday</option>
        	<option id= "${date.Thursday}" value="${date.Thursday}">Thursday</option>
        	<option id= "${date.Friday}" value="${date.Friday}">Friday</option>
			
		</c:forEach>
		</select>
		<input type="submit" value="submit">
	</form>
	
</body>
</html>
