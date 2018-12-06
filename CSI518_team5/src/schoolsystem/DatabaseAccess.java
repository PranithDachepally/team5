package schoolsystem;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DatabaseAccess {
	// Constants for DB access credentials
	private static final String dbUN="team5";
	private static final String dbPW="icsi518";
	private static final String dbName="csi518_school_sys";
	private static final String dbHost="localhost";
	private static final String dbPort="3306";
	private static final String dbURL = "jdbc:mysql://" + dbHost + ":" + dbPort + "/" + dbName;
	
	// Connection variable
	private static Connection dbConn = null;

	// Get connection
	private static boolean dbConnect(){
		if(dbConn==null) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				dbConn =(Connection)DriverManager.getConnection(dbURL,dbUN,dbPW);
			}
			catch (ClassNotFoundException e) {
				e.printStackTrace();
				return false;
			}
			catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
			return true;
		}
		return true;
	}
		public static ResultSet duplicateAppointment() {
		ResultSet rs = null;
		
		if(!dbConnect()) {
			return null;
		}
		
		try {
			
			System.out.println("Inside duplicateAppointment!");
			String sql = "SELECT receiverid,senderid,time,date FROM apt";
			PreparedStatement statement = dbConn.prepareStatement(sql);
			//statement.setInt(1, userid);
			System.out.println("sql: " +sql);
			rs = statement.executeQuery();
			System.out.println("duplicateAppointment Successfully executed query");
			//System.out.println(userid);
				
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rs;
	}
	public static ResultSet getInstructorname() {
		ResultSet rs = null;
		
		if(!dbConnect()) {
			return null;
		}
		
		try {
			System.out.println("Connected to DB");
			//String sql = "SELECT firstname, lastname FROM user WHERE role = 2 ";
			String sql = "select username from user where role = 2";
			//String sql = "SELECT DISTINCT user.iduser, user.firstname, user.lastname FROM user INNER JOIN applications ON user.iduser = instructor.user";
			PreparedStatement statement = dbConn.prepareStatement(sql);
			rs = statement.executeQuery();
			System.out.print("Successfully executed query for all instructor");
				
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rs;
	}

	//get Appointment from database
		public static ResultSet getAppointment(int userid) {
			ResultSet rs = null;
			
			if(!dbConnect()) {
				return null;
			}
			
			try {
				
				System.out.println("Inside getAppointment!");
				String sql = "SELECT sfirstname,slastname,time,date FROM apt WHERE receiverid=?";
				PreparedStatement statement = dbConn.prepareStatement(sql);
				statement.setInt(1, userid);
				System.out.println("sql: " +sql);
				rs = statement.executeQuery();
				System.out.print("getUser Successfully executed query for userid=");
				System.out.println(userid);
					
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
			
			return rs;
		}
	public static boolean addAppointment(Appointment apt) {
		if(!dbConnect()) {
			return false;
		}
		
		try {
			//System.out.println("Connected to DB");
			String sql = "INSERT INTO apt VALUES(?,?,?,?,?,?,?,?)";
			PreparedStatement statement = dbConn.prepareStatement(sql);
			statement.setInt(1, apt.getReceiverid());
			statement.setString(2, apt.getRfirstname());
			statement.setString(3, apt.getRlastname());
			statement.setInt(4, apt.getSenderid());
			statement.setString(5, apt.getSfirstname());
			statement.setString(6, apt.getSlastname());
			statement.setString(7, apt.getTime());
			statement.setString(8, apt.getDate());
			
			
			//System.out.println(statement.toString());
			statement.executeUpdate();
			System.out.println("addAppointment Successfully executed update query.");
		}
		catch (SQLException e) {
			e.printStackTrace();
			return false;
			
		}
		return true;		
	}
	public static boolean addMessage(Message msg) {
		if(!dbConnect()) {
			return false;
		}
		
		try {
			System.out.println("Connected to DB");
			String sql = "INSERT INTO msg VALUES(?,?,?)";
			PreparedStatement statement = dbConn.prepareStatement(sql);
			statement.setString(1, msg.getFrom());
			statement.setString(2, msg.getTo());
			statement.setString(3, msg.getContent());
			
			System.out.println(statement.toString());
			statement.executeUpdate();
			System.out.println("addMessage Successfully executed update query.");
		}
		catch (SQLException e) {
			e.printStackTrace();
			return false;
			
		}
		return true;		
	}
	//get Message from database
	public static ResultSet getMessage(String username) {
		ResultSet rs = null;
		
		if(!dbConnect()) {
			return null;
		}
		
		try {
			/*System.out.println("Connected to DB");
			String sql = "SELECT * FROM msg WHERE name = ";
			//sql =sql+"'"+username+"'";
			sql+=username;
			Statement statement = (Statement) dbConn.createStatement();
			//statement.setString(1, username);
			System.out.println("sql: " +sql);
			rs = statement.executeQuery(sql);
			System.out.print("getMessage Successfully executed query for username=");
			System.out.println(username);*/
			System.out.println("Connected to DB");
			String sql = "SELECT * FROM msg WHERE name=?";
			PreparedStatement statement = dbConn.prepareStatement(sql);
			statement.setString(1, username);
			System.out.println("sql: " +sql);
			rs = statement.executeQuery();
			System.out.print("getUser Successfully executed query for username=");
			System.out.println(username);
				
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rs;
	}
	// Get the username of sender
		public static ResultSet getUsername2(String email) {
			ResultSet rs = null;
			
			if(!dbConnect()) {
				return null;
			}
			
			try {
				System.out.println("Connected to DB");
				String sql = "SELECT * FROM user WHERE email=?";
				PreparedStatement statement = dbConn.prepareStatement(sql);
				statement.setString(1, email);
				rs = statement.executeQuery();
				System.out.print("getUsername2 Successfully executed query for username=");
				System.out.println(email);
					
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
			
			return rs;
		}
	// Add user
	public static boolean addUser(User user) {
		if(!dbConnect()) {
			return false;
		}
		
		try {
			System.out.println("Connected to DB");
			String sql = "INSERT INTO user (username,firstname,lastname,email,password,role) VALUES(?,?,?,?,?,3)";
			PreparedStatement statement = dbConn.prepareStatement(sql);
			statement.setString(1, user.getUsername());
			statement.setString(2, user.getFirstname());
			statement.setString(3, user.getLastname());
			statement.setString(4, user.getEmail());
			statement.setString(5, user.getPassword());
			System.out.println(statement.toString());
			statement.executeUpdate();
			System.out.println("Successfully executed update query.");
		}
		catch (SQLException e) {
			e.printStackTrace();
			return false;
			
		}
		return true;		
	}
	public static boolean addCourse(String courseName, String courseCapacity, String instructor) {
		if(!dbConnect()) {
			return false;
		}
		
		try {
			System.out.println("Connected to DB");
			String sql = "INSERT INTO course (course_name,course_capcity,instructor) VALUES(?,?,?)";
			PreparedStatement statement = dbConn.prepareStatement(sql);
			statement.setString(1, courseName);
			statement.setString(2, courseCapacity);
			statement.setString(3, instructor);
			
			System.out.println(statement.toString());
			statement.executeUpdate();
			System.out.println("Successfully executed update query.");
		}
		catch (SQLException e) {
			e.printStackTrace();
			return false;
			
		}
		return true;		
	}

	public static ResultSet getInstructors() {
		ResultSet rs = null;
		
		if(!dbConnect()) {
			return null;
		}
		
		try {
			System.out.println("Connected to DB");
			//String sql = "SELECT firstname, lastname FROM user WHERE role = 2 ";
			String sql = "select * from user where role = 2";
			//String sql = "SELECT DISTINCT user.iduser, user.firstname, user.lastname FROM user INNER JOIN applications ON user.iduser = instructor.user";
			PreparedStatement statement = dbConn.prepareStatement(sql);
			rs = statement.executeQuery();
			System.out.print("Successfully executed query for all instructor");
				
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rs;
	}
/*	public static ResultSet getInstructorName(int id) {
		ResultSet rs = null;
		
		if(!dbConnect()) {
			return null;
		}
		try {
			System.out.println("Connnected to DB");
			String sql = "SELECT DISTINCT user.firstname, user.lastname FROM user INNER JOIN course ON user.iduser = course.instructor WHERE user.userid=?";
			PreparedStatement statement = dbConn.prepareStatement(sql);
			statement.setInt(1, id);
			rs = statement.executeQuery();
			System.out.println("Succesfully executed query for distinct instructor");
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
				
		return rs;
		
	} 
	*/
	public static boolean deleteCourse(String id) {
	if(!dbConnect()) {
		return false;
	}
	try {
		System.out.println("Connected to DB");
		String sql = "DELETE FROM course WHERE course_id = ?";
		PreparedStatement statement = dbConn.prepareStatement(sql);
		statement.setString(1, id);
		System.out.println(statement.toString());
		statement.executeUpdate();
		System.out.println("Successfully executed delete query. ");
	} catch(SQLException e) {
		e.printStackTrace();
		return false;
	}
	return true;
}
	// get Courses 
	public static ResultSet getcourses() {
		ResultSet rs = null;
		
		if(!dbConnect()) {
			return null;
		}
		
		try {
			System.out.println("Connected to DB");
			String sql = "SELECT * FROM course";
			PreparedStatement statement = dbConn.prepareStatement(sql);
			rs = statement.executeQuery();
			System.out.println("Successfully executed query.");
			
		}
		catch (SQLException e) {
			e.printStackTrace();
			
		}
		
		return rs;
		
	}
	public static ResultSet getCourse(String id) {
		ResultSet rs = null;
		
		if(!dbConnect()) {
			return null;
		}
		
		try {
			System.out.println("Connected to DB");
			String sql = "SELECT * FROM course WHERE course_id=?";
			PreparedStatement statement = dbConn.prepareStatement(sql);
			statement.setString(1, id);
			rs = statement.executeQuery();
			System.out.print("Successfully executed query for id=");
			System.out.println(id);
			
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rs;
	}
	// Get jobs
	public static ResultSet getCourses() {
		ResultSet rs = null;
		
		if(!dbConnect()) {
			return null;
		}
		
		try {
			System.out.println("Connected to DB");
			String sql = "SELECT * FROM course";
			PreparedStatement statement = dbConn.prepareStatement(sql);
			rs = statement.executeQuery();
			System.out.println("Successfully executed query.");
			
		}
		catch (SQLException e) {
			e.printStackTrace();
			
		}
		
		return rs;
		
	}
	
	// Get single user
	public static ResultSet getUser(String username) {
		ResultSet rs = null;
		
		if(!dbConnect()) {
			return null;
		}
		
		try {
			System.out.println("Connected to DB");
			String sql = "SELECT * FROM user WHERE username=?";
			PreparedStatement statement = dbConn.prepareStatement(sql);
			statement.setString(1, username);
			rs = statement.executeQuery();
			System.out.print("Successfully executed query for username=");
			System.out.println(username);
				
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rs;
	}
	// Get user exists
	public static boolean getUserExists(String username) {
		ResultSet rs = getUser(username);
		try {
			if(rs.next()) {
				return true;
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	// Get role
	public static String getRole(int roleid) {
		ResultSet rs = null;
		
		// Default to user
		String role="user";
		
		if(!dbConnect()) {
			return null;
		}
		
		try {
			System.out.println("Connected to DB");
			String sql = "SELECT name FROM role WHERE idroles=?";
			PreparedStatement statement = dbConn.prepareStatement(sql);
			statement.setInt(1, roleid);
			rs = statement.executeQuery();
			System.out.print("Successfully executed query for role=");
			System.out.println(roleid);
				
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			if(rs.next()) {
				role = rs.getString("name");
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			
		}
		return role;
	}
	// Get single user
	public static ResultSet getUserById(int id) {
		ResultSet rs = null;
		
		if(!dbConnect()) {
			return null;
		}
		
		try {
			System.out.println("Connected to DB");
			String sql = "SELECT * FROM user WHERE iduser=?";
			PreparedStatement statement = dbConn.prepareStatement(sql);
			statement.setInt(1, id);
			rs = statement.executeQuery();
			System.out.print("Successfully executed query for iduser=");
			System.out.println(id);
				
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rs;
	}
//get user_id by username	
	public static int getUserIdByName(String username) {
		ResultSet rs = null;
		int userId = -2;
		if(!dbConnect()) {
			return -1;   //get user id has error
		}
		
		try {
			System.out.println("Connected to DB");
			if(getUserExists(username)) {
				String sql = "SELECT iduser FROM user WHERE username=?";
				PreparedStatement statement = dbConn.prepareStatement(sql);
				statement.setString(1, username);
				rs = statement.executeQuery();
				System.out.print("Successfully executed query for username=");
				System.out.println(username);
			}else {
				System.out.print("Failed. User not exists.");
				return -1;
			}
				
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if(rs.next()) {
				userId = rs.getInt("iduser");
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			
		}		
		return userId;
	}	
	
	// Get all users
	public static ResultSet getUsers() {
		ResultSet rs = null;
		
		if(!dbConnect()) {
			return null;
		}
		
		try {
			System.out.println("Connected to DB");
			String sql = "SELECT iduser,firstname,lastname FROM user WHERE NOT username='admin'";
			PreparedStatement statement = dbConn.prepareStatement(sql);
			rs = statement.executeQuery();
			System.out.print("Successfully executed query for all users");
				
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rs;
	}
	// Update the organization row
	public static boolean updateOrg(String name, String description, String contact_name, String contact_email,String email_server, String email_un, String email_pw, String email_port) {
		if(!dbConnect()) {
			return false;
		}
		
		try {
			System.out.println("Connected to DB");
			String sql = "UPDATE organization SET name=?, description=?, contact_name=?, contact_email=?, email_server=?, email_un=?, email_pw=?, email_port=? WHERE idorganization=1 ";
			PreparedStatement statement = dbConn.prepareStatement(sql);
			statement.setString(1, name);
			statement.setString(2, description);
			statement.setString(3, contact_name);
			statement.setString(4, contact_email);
			statement.setString(5, email_server);
			statement.setString(6, email_un);
			statement.setString(7, email_pw);
			statement.setString(8, email_port);
			
			System.out.println(statement.toString());
			statement.executeUpdate();
			System.out.println("Successfully executed update query.");
		}
		catch (SQLException e) {
			e.printStackTrace();
			return false;
			
		}
		return true;
	}

	// Get the single organization row out of table
	public static ResultSet getOrg() {
		ResultSet rs = null;
		
		if(!dbConnect()) {
			return null;
		}
		
		try {
			System.out.println("Connected to DB");
			String sql = "SELECT * FROM organization LIMIT 0,1";
			PreparedStatement statement = dbConn.prepareStatement(sql);
			rs = statement.executeQuery();
			System.out.println("Successfully executed query.");
			
		}
		catch (SQLException e) {
			e.printStackTrace();
			
		}
		
		return rs;
	}
	public static boolean CheckPassword(int uid, String current_password) {
		ResultSet rs = null;
		if(!dbConnect()) {
			return true;
		}
		try {
			System.out.println("Connected to DB");
			String sql = "Select password from user where iduser=?";
		PreparedStatement statement = dbConn.prepareStatement(sql);
		statement.setInt(1, uid);
		rs = statement.executeQuery();
		while(rs.next()) {
			if(rs.getString("password").equals(current_password)){
				System.out.print("Succesfully checked Password for user id=");
				System.out.println(uid);
				return true;
			}
			else {
				System.out.print(" current password does not match the orignal Password for user id=");
				System.out.println(uid);
				return false;
			}
		}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return true;
	}
	
	public static boolean UpdatePassword(int uid,String current_Password, String conf_new_Password, String new_Password) {

		int rs;
		if(!dbConnect()) {
			return false;
		}
		
		try {
			System.out.println("Connected to DB");
			if(!new_Password.equals(conf_new_Password)) {
				return false;
			}
			
			
			String sql = "update user set password = ? where iduser=?";
			PreparedStatement statement = dbConn.prepareStatement(sql);
			statement.setString(1, new_Password);
			statement.setInt(2, uid);
			rs=statement.executeUpdate();
			if(rs==0) {
				return false;
			}

			System.out.print("Successfully updated Password for users id=");
			System.out.println(uid);
			return true;
				
		}
		catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		


	}
// students enroll class	
	public static String EnrollClass(int courseId, int userId) {
		if(!dbConnect()) {
			return null;
		}
		
		try {
			System.out.println("Connected to DB");
			String sql = "INSERT INTO class (course_id,user_id) VALUES(?,?)";
			PreparedStatement statement = dbConn.prepareStatement(sql);
			statement.setInt(1, courseId);
			statement.setInt(2, userId);
			System.out.println(statement.toString());
			statement.executeUpdate();
			System.out.println("Successfully executed update query.");
		}
		catch (SQLException e) {
			e.printStackTrace();			
		}
		return "success";		
	}	
//check if already enrolled
	
public static boolean CheckEnrollment(int courseId, int userId) {
		ResultSet rs = null;
		if(!dbConnect()) {
			return false;
		}
		try {
			System.out.println("Connected to DB");
			String sql = "Select * from class where course_id=? and user_id=?";
		PreparedStatement statement = dbConn.prepareStatement(sql);
		statement.setInt(1, courseId);
		statement.setInt(2, userId);
		rs = statement.executeQuery();
		while(rs.next()) {
				System.out.print("Already Enrolled");
				return false;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return true;
	}
	
public static String UpdateUserRole(int uid, int role) {

		
		if(!dbConnect()) {
			return null;
		}
		
		try {
			System.out.println("Connected to DB");
			String sql = "update user set role = ? where iduser=?";
			PreparedStatement statement = dbConn.prepareStatement(sql);
			statement.setInt(1, role);
			statement.setInt(2, uid);
			int i = statement.executeUpdate();
			if(i==0)
				return "No such row";
			System.out.print("Successfully updated role for idusers=");
			System.out.println(uid);
				
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "success";

	}
public static ResultSet getClassList(int course_id) {
	// TODO Auto-generated method stub
	ResultSet rs = null;
	System.out.print("getclasslist function working");
	if(!dbConnect()) {
		return null;
	}
	
	try {
		System.out.println("Connected to DB");
		String sql = "SELECT * FROM class,user,course WHERE class.course_id=course.course_id AND user.iduser = class.user_id AND class.course_id=?";
		PreparedStatement statement = dbConn.prepareStatement(sql);
		statement.setInt(1, course_id);
		rs = statement.executeQuery();
		System.out.println("Successfully executed query.");
		
	}
	catch (SQLException e) {
		e.printStackTrace();
		
	}
	
	return rs;
}
public static ResultSet getAllClass() {
	// TODO Auto-generated method stub
	
	ResultSet rs = null;
	
	if(!dbConnect()) {
		return null;
	}
	
	try {
		System.out.println("Connected to DB");
		String sql = "SELECT * FROM class";
		PreparedStatement statement = dbConn.prepareStatement(sql);
		rs = statement.executeQuery();
		System.out.println("Successfully executed query.");
		
	}
	catch (SQLException e) {
		e.printStackTrace();
		
	}
	
	return rs;
}
	
public static boolean addComment(comment c) {
	if(!dbConnect()) {
		return false;
	}
	
	try {
		System.out.println("Connected to DB");
		String sql = "INSERT INTO comment (discuss_id,comment_content,iduser) VALUES(?,?,?)";
		PreparedStatement statement = dbConn.prepareStatement(sql);
		statement.setInt(1, c.getdiscussid());
		statement.setString(2, c.getComment());
		statement.setInt(3, c.getiduser());
		System.out.println(statement.toString());
		statement.executeUpdate();
	}
	catch (SQLException e) {
		e.printStackTrace();
		return false;
		
	}
	return true;		
}

public static ResultSet getComment(int discuss_id) {
System.out.println("getComment");
ResultSet rs = null;

if(!dbConnect()) {
	return null;
}

try {
	System.out.println("Connected to DB");
	String sql = "SELECT * FROM comment WHERE discuss_id=?";
	PreparedStatement statement = dbConn.prepareStatement(sql);
	statement.setString(1, Integer.toString(discuss_id));
	rs = statement.executeQuery();
		
}
catch (SQLException e) {
	e.printStackTrace();
}

return rs;
}
public static void deleteComment(int comment_id) {
System.out.println("deleteComment");

if(!dbConnect()) {
	return;
}

try {
	System.out.println("Connected to DB");
	String sql = "DELETE FROM comment WHERE comment_id=?;";
	PreparedStatement statement = dbConn.prepareStatement(sql);
	statement.setString(1, Integer.toString(comment_id));
	statement.executeUpdate();
		
}
catch (SQLException e) {
	e.printStackTrace();
}

return;
}

public static boolean addDiscuss(discuss d) {
	if(!dbConnect()) {
		return false;
	}
	
	try {
		System.out.println("Connected to DB");
		String sql = "INSERT INTO discuss (discuss_name) VALUES(?)";
		PreparedStatement statement = dbConn.prepareStatement(sql);
		statement.setString(1, d.getName());
		System.out.println(statement.toString());
		statement.executeUpdate();
	}
	catch (SQLException e) {
		e.printStackTrace();
		return false;
		
	}
	return true;		
}

public static ResultSet getDiscuss() {
System.out.println("getDiscuss");
ResultSet rs = null;

if(!dbConnect()) {
	return null;
}

try {
	System.out.println("Connected to DB");
	String sql = "SELECT * FROM discuss";
	PreparedStatement statement = dbConn.prepareStatement(sql);
	rs = statement.executeQuery();
		
}
catch (SQLException e) {
	e.printStackTrace();
}

return rs;
}
public static String deleteDiscuss(int discuss_id) {
System.out.println("deleteDiscuss: "+discuss_id);

if(!dbConnect()) {
return null;
}

try {
System.out.println("Connected to DB");
String sql = "DELETE FROM discuss WHERE discuss_id=?;";
PreparedStatement statement = dbConn.prepareStatement(sql);
statement.setInt(1, (discuss_id));
System.out.println(statement);
statement.executeUpdate();
}
catch (SQLException e) {
e.printStackTrace();
}

return "success";
}
	
}
