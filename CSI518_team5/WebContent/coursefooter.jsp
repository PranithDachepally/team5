<span style="font-size: 12px;"><span style="font-size: 14px;"><%@ page
			language="java" import="java.sql.*,java.io.*,java.util.*"%>
		<%@ page contentType="text/html;charset=utf-8"%>
		<link rel="stylesheet" type="text/css" href="css/LoginButton.css">
		<link rel="stylesheet" type="text/css" href="css/NavBar.css"> 
		<!-- begin footer include -->
		<footer>
			<link rel="stylesheet"
				href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
			<%
				String user = (String) session.getAttribute("user");
				String role = (String) session.getAttribute("role");

				if (user != null) {
			%>
<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/Ugurlu81/team5.git
=======

>>>>>>> refs/remotes/origin/master
			<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a class="active" href="courses.jsp">Courses</a></li>
				<li><a href="">Appointments</a></li>
				<li><a href="">Time Table</a></li>
				<li><a href="editprofile.jsp">Edit Profile</a></li>


				<%
					// <a href="editprofile.jsp">Edit Profile</a>
				%>
				<%
					if (role.equals("admin")) {
				%>
				<li><a href="reports.jsp">Reports</a></li>

				<%
					} else if (role.equals("teacher")) {
				%>

				<li><a href="sendMessage.jsp">Sending Message</a></li>
				<%
					} else if (role.equals("parent") || role.equals("teacher") || role.equals("student")) {
				%>
				<li><a href="searchMessage.jsp">Message</a></li>
				<%
					}
				%>

				<li><a style='float: right;' href="Logout">Logout</a></li>
			</ul>
			<h4>User:<%=user%>, Role:<%=role%></h3>
			<hr />
			<%
				//driver
					String driverName = "com.mysql.jdbc.Driver";
					//database name 
					String userName = "team5";
					//password 
					String userPasswd = "icsi518";
					//database name 
					String dbName = "csi518_school_sys";
					//table name
					String tableName = "course";
					//url connection 
					String url = "jdbc:mysql://localhost:3306/" + dbName + "?user=" + userName + "&password=" + userPasswd;
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					Connection connection = DriverManager.getConnection(url);
					Statement statement = connection.createStatement();
					String sql;
					if (role.equals("admin")|| role.equals("student")) {
						sql = "SELECT * FROM course ";
					} else {
						sql = "SELECT * FROM course WHERE instructor = '" + user + "'";
					}
					ResultSet rs = statement.executeQuery(sql);
			%>

			<div class="container">
				<table id="courseTable" class="table table-dark table-striped" align
					center>
					<tr>
						<th>
							<%
								out.print("course_id");
							%>
						</th>
						<th>
							<%
								out.print("course_name");
							%>
						</th>
						<th>
							<%
								out.print("course_capacity");
							%>
						</th>
						<th>
							<%
								out.print("instructor");
							%>
						</th>
						<%if (role.equals("admin")){ %>
						<th>
							<span class = "edit">edit</span> 
						</th>
						<th>
							<span class = "delete">delete</span> 
						</th>
						<%} %>
						<%if (role.equals("student")){ %>
						<th>
							<span class = "enroll">enroll</span> 
						</th>
						<%} %>
					</tr>
					<%
						while (rs.next()) {
					%>
					<tr>
						<td>
							<%
								out.print(rs.getString(1));
							%>
						</td>
						<td>
							<%
								out.print(rs.getString(2));
							%>
						</td>
						<td>
							<%
								out.print(rs.getString(3));
							%>
						</td>
						<td>
							<%
								out.print(rs.getString(4));
							%>
						</td>
						<%if (role.equals("admin")){ %>
						<td class="operation">
						<% 	out.println("<a href=courses.jsp>edit</a>");%>
						</td>
						<td class="operation">
						<% 	out.println("<a href=courses.jsp>delete</a>");%>
						</td>
						<%} %>
						<%if (role.equals("student")){ %>
						<td class="operation">
						<% 	out.println("<a href=courses.jsp>enroll</a>");%>
						</td>
						<%} %>
					</tr>
					<%
						}
					%>
				</table>
			</div>

			<%
				} else {
			%>
			<a href="login.jsp">Sign In</a> &nbsp;&nbsp;|&nbsp;&nbsp; <a
				href="register.jsp">Register</a>

			<%
				}
			%>
		</footer> <!-- end footer include -->