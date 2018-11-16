<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SearchMessage</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
    font-family: Arial;
}
* {
    box-sizing: border-box;
}
form.example input[type=text] {
    padding: 10px;
    font-size: 17px;
    border: 1px solid grey;
    float: left;
    width: 80%;
    background: #f1f1f1;
}
form.example button {
    float: left;
    width: 20%;
    padding: 10px;
    background: #2196F3;
    color: white;
    font-size: 17px;
    border: 1px solid grey;
    border-left: none;
    cursor: pointer;
}
form.example button:hover {
    background: #0b7dda;
}
form.example::after {
    content: "";
    clear: both;
    display: table;
}
</style>
</head>
<body>
<jsp:include page='footer.jsp'></jsp:include>
<form class="example" action="searchMessage" style="margin:left;max-width:300px;">
<input type="text" placeholder="Type Username here...." name="username">
<button type="submit" name="Submit"><i class="fa fa-search"></i></button>
</form>


</body>
</html>