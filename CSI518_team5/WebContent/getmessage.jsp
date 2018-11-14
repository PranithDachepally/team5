<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
table {
	border: 2px #CCCCCC solid;
	width: 360px;
}
 
td,th {
	height: 30px;
	border: #CCCCCC 1px solid;
}
</style>
</head>
<body>
	<table>
		<tr>
			<th>from</th>
			<th>to</th>
			<th>content<th>
		</tr>
 
		<c:forEach items="${key_list}" var="msg">
			
        	<tr>
				<td>${msg.from}</td><td>${msg.name}</td> <td>${msg.content}</td> 
			</tr>
			
		</c:forEach>
 
 
 
 
	</table>

</body>
</html>