
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
	if (role==null){
		System.out.println("redirect");
		response.sendRedirect("/CSI518_team5/login.jsp");
		return;
	}
	int userid = (int)session.getAttribute("userid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Discuss</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
  
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
String discussid = (String)request.getParameter("discuss_id");
int discuss_id = Integer.parseInt(discussid);
System.out.println("discuss_id: "+discuss_id);

String delete = (String)request.getParameter("delete");
if (delete!=null){
	int delete_id = Integer.parseInt(delete);
	System.out.println("delete: "+ delete_id);
	DatabaseAccess.deleteComment(delete_id);
	response.sendRedirect("/CSI518_team5/getComment.jsp?discuss_id="+discuss_id);
	return;
}

String comment = (String)request.getParameter("Comment_content");
if (comment!=null && comment!=""){
	System.out.println("Start adding");
	Boolean result = false;
	comment c = new comment();
	c.setdiscussid(discuss_id); 
	c.setComment(comment); 
	c.setiduser(userid); 
	//store info in the database!!
	System.out.println("DatabaseAccess");
	result = DatabaseAccess.addComment(c);
}

ResultSet rs=DatabaseAccess.getComment(discuss_id);
try {
	
	System.out.println("getdata");
	while (rs.next()) {
		String comment_content = rs.getString("comment_content");
		int id = rs.getInt("comment_id");
		Map map = new HashMap<>(); 	
		map.put("comment_content", comment_content);
		map.put("id", id);
		//map.put("id", id);
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
		</tr>
 
		<c:forEach items="${key_list}" var="c">
        	<tr>
				<td>${c.comment_content}</td>
				<%
				if(role!=null && (role.equals("admin") || role.equals("teacher"))) {
				%>
				<td><a href="/CSI518_team5/getComment.jsp?discuss_id=<%=discuss_id%>&delete=${c.id}"><button type="submit">Delete</button></a></td>
				<%
				}
				%>
			</tr>
			
		</c:forEach>
 
 
 
 
	</table>
	
					<div class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12">
                        <div class="panel panel-danger">
                            <div class="panel-body">
                                <form id="reused_form" class="form-email"  action="/CSI518_team5/getComment.jsp?discuss_id=<%=discuss_id%>" method="post" class="login100-form validate-form" >
                                    <div class="form-group">
                                        <label >Comment</label>
                                        <textarea rows="3" name="Comment_content" required class="form-control" placeholder="Type Your Comment"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <button class="btn btn-raised btn-lg btn-warning" type="submit">Add</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

</body>

</html>
