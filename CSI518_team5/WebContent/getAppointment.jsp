

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.util.*"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="schoolsystem.*" %>

<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment</title>
<style>
#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}
#customers td, #customers th {
    border: 1px solid #ddd;
    padding: 8px;
}
#customers tr:nth-child(even){background-color: #f2f2f2;}
#customers tr:hover {background-color: #ddd;}
#customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
}
</style>
</head>
<body>

<jsp:include page='footer.jsp'></jsp:include>
<%
List<Map> list =new ArrayList<Map>();
//HttpSession session = request.getSession(false);
int userid = (int)session.getAttribute("userid");
System.out.println("userid: "+ userid);
//DatabaseAccess r = new DatabaseAccess();

ResultSet rs=DatabaseAccess.getAppointment(userid);
try {
	
	System.out.println("getdata");
	while (rs.next()) {
		String sfirstname = rs.getString("sfirstname");
		String slastname = rs.getString("slastname");
		String time = rs.getString("time");
		String date = rs.getString("date");
		//String content = rs.getString("content");
		
		
		Map map = new HashMap<>(); 
		map.put("sfirstname", sfirstname);			
		map.put("slastname", slastname);
		map.put("time", time);
		map.put("date",date);
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


//System.out.println("Redirect....");
request.setAttribute("key_list",list);

%>
	<table id="customers">
		<tr>
			<th>Firstname</th>
			<th>Lastname</th>
			<th>Time</th>
			<th>Date</th>
			
		</tr>
 
		<c:forEach items="${key_list}" var="apt">
			
        	<tr>
				<td>${apt.sfirstname}</td><td>${apt.slastname}</td><td>${apt.time}</td><td>${apt.date}</td>
			</tr>
			
		</c:forEach>
 
 
 
 
	</table>

</body>

</html>
