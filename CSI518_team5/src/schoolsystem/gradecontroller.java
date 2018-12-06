package schoolsystem;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
@WebServlet("/gradeServlet")
public class gradecontroller extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
     
    // database connection settings
	// database connection settings
	
	private String dbURL = "jdbc:mysql://localhost:3306/csi518_school_sys";
    private String dbUser = "team5";
    private String dbPass = "icsi518";
    
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
    	String iduser = request.getParameter("student_id");
    	String grade = request.getParameter("grade");
    	String attendance = request.getParameter("attendance");
    	String message =" ";
    	try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
 
            // constructs SQL statement
            String sql = "INSERT INTO grade (iduser, grade, attendance) values ( ?, ? , ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, iduser);
            statement.setString(2, grade);
            statement.setString(3, attendance);
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "File uploaded and saved into database";
    	}} catch(SQLException ex){
    		message = "ERROR: " + ex.getMessage();
    		ex.printStackTrace();
    	}
    }       
}