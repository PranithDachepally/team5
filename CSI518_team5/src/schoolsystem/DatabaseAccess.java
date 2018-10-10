package schoolsystem;

import java.sql.Connection;
import java.sql.DriverManager;
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
	
}
