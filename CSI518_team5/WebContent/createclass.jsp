<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Course</title>

</head>

<body background="pictures/pic0.jpg" >
<form action=""> 
 
<table align="center">  
<tr>  
    <td class="tdLabel"><label for="register_class_id" class="label">Class ID:</label></td>  
    <td><input type="text" name="id" value="" id="Class_id" style="width:160px"/></td>  
</tr>  
<tr>  
    <td class="tdLabel"><label for="register_class_name" class="label">Class Name:</label></td>  
    <td><input type="text" name="name" id="Class_name" style="width:160px"/></td>  
</tr>  
<tr>  
    <td class="tdLabel"><label for="instructor_id" class="label">Instructor ID:</label></td>  
    <td  
><input type="text" name="instructor" value="" id="instructor_id" style="width:160px"/></td>  
</tr>  
 
<tr>  
    <td colspan="2"><div align="right"><input type="submit" id="create" value="create class"/>  
</div></td>  
</tr>  
</table>  
</form>  
</body>
</html>