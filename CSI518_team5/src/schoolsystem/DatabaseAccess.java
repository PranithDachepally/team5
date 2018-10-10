package schoolsystem;

import java.sql.*;
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
	// Add user
	public static boolean addUser(User user) {
		if(!dbConnect()) {
			return false;
		}
		
		try {
			System.out.println("Connected to DB");
			String sql = "INSERT INTO users (username,firstname,lastname,email,password,role) VALUES(?,?,?,?,?,3)";
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
	// Get single user
	public static ResultSet getUser(String username) {
		ResultSet rs = null;
		
		if(!dbConnect()) {
			return null;
		}
		
		try {
			System.out.println("Connected to DB");
			String sql = "SELECT * FROM users WHERE username=?";
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

	
}
