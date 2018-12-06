
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.util.*"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="schoolsystem.*" %>

<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String user = (String)session.getAttribute("user");
	String role = (String)session.getAttribute("role");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Discuss</title>
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
//ResultSet rs=DatabaseAccess.getUsers();
String delete = (String)request.getParameter("delete");
if (delete!=null){
	int delete_id = Integer.parseInt(delete);
	System.out.println("delete: "+ delete_id);
	DatabaseAccess.deleteDiscuss(delete_id);
	response.sendRedirect("getDiscussion.jsp");
	return;
}
ResultSet rs=DatabaseAccess.getDiscuss();
try {
	
	System.out.println("getdata");
	while (rs.next()) {
		String name = rs.getString("discuss_name");
		int id = rs.getInt("discuss_id");
		Map map = new HashMap<>(); 	
		map.put("name", name);
		map.put("id", id);
		System.out.println(map);
		list.add(map);
		
	}
} catch (Exception e) {
	e.printStackTrace();
}


//System.out.println("Redirect....");
request.setAttribute("key_list",list);

%>

	<table id="customers">
		<tr>
			<th>Discussion Board</th>
			<%
				if(role!=null && (role.equals("admin") || role.equals("teacher"))) {
			%>
			<td><a href="addDiscussion.jsp">Add</a></td>
			<%
				}
			%>
		</tr>
 
		<c:forEach items="${key_list}" var="d">
        	<tr>
				<td><a href="/CSI518_team5/getComment.jsp?discuss_id=${d.id}">${d.name}</a></td>
				<%
				if(role!=null && (role.equals("admin") || role.equals("teacher"))) {
				%>
				<td><a href="/CSI518_team5/getDiscussion.jsp?delete=${d.id}"><button type="submit">Delete</button></a></td>
				<%
				}
				%>
			</tr>
			
		</c:forEach>
 
 
 
 
	</table>

</body>

</html>
