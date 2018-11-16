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
			String sql = "select * from user where role = 2";
//			String sql = "SELECT DISTINCT user.iduser, user.firstname, user.lastname FROM user INNER JOIN applications ON user.iduser = instructor.user";
			PreparedStatement statement = dbConn.prepareStatement(sql);
			rs = statement.executeQuery();
			System.out.print("Successfully executed query for all applicants");
				
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rs;
	}
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
	
	
}
