<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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

	<table id="customers">
		<tr>
			<th>From</th>
			<th>To</th>
			<th>Content<th>
		</tr>
 
		<c:forEach items="${key_list}" var="msg">
			
        	<tr>
				<td>${msg.from}</td><td>${msg.name}</td> <td>${msg.content}</td> 
			</tr>
			
		</c:forEach>
 
 
 
 
	</table>

</body>
</html>