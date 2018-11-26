
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
<title>Message</title>
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
String username = (String)session.getAttribute("user");
System.out.println("username: "+ username);
//DatabaseAccess r = new DatabaseAccess();

ResultSet rs=DatabaseAccess.getMessage(username);
try {
	
	System.out.println("getdata");
	while (rs.next()) {
		String from = rs.getString("from");
		String to = rs.getString("name");
		String content = rs.getString("content");
		
		
		Map map = new HashMap<>(); 
		map.put("from", from);			
		map.put("to", to);		
		map.put("content", content);
		
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
			<th>From</th>
			<th>To</th>
			<th>Content<th>
		</tr>
 
		<c:forEach items="${key_list}" var="msg">
			
        	<tr>
				<td>${msg.from}</td><td>${msg.to}</td> <td>${msg.content}</td> 
			</tr>
			
		</c:forEach>
 
 
 
 
	</table>

</body>

</html>
