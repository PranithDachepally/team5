package schoolsystem;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/main")
public class AddMessage extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public AddMessage() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	//For getting username
	private String getUsername(String email) {
    	
    	//Message msg = new Message();
    	ResultSet rs = DatabaseAccess.getUsername2(email);
    	
    	if(rs==null) {
    		System.out.println("User not found or DB connection failed.");
    		return null;
    	}

    	try {
    		if(rs.next()) {
    			//int db_userid = rs.getInt("iduser");
    			String db_usernameofreceiver = rs.getString("username");
    			
	    		return db_usernameofreceiver;
    		}	
	    }
	    catch (SQLException e) {
	    	e.printStackTrace();
	    }
    	
    	return null;
    	
    }
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("");
		System.out.println("Email.java  doGet");
		//teacher's name
		String from = (String)request.getParameter("from");
		System.out.println("from: "+from);
		//parent's email
		String to = (String)request.getParameter("to");
		System.out.println("to: "+to);
		//content of message
		String content = (String)request.getParameter("content");
		System.out.println("content: "+content);
		//result
		Boolean result = false;
		if(from == null || to==null)
		{
			response.getWriter().println("please enter info");
			return;
		}
		Message msg = new Message();
		String temp=getUsername(to);
		System.out.println("to: "+temp);
		msg.setTo(temp); 
		System.out.println("after function getusername");
		//msg.setTo(to);
		msg.setFrom(from);
		System.out.println("after setfrom");
		msg.setContent(content);
		System.out.println("after setcontent");
		
		//store info in the database!!
		result = DatabaseAccess.addMessage(msg);
		if(result == null)
			System.out.println("Failed to add messgae.");
		else
			System.out.println("Add message successfully!");
		//response.sendRedirect("index.jsp");
		request.getRequestDispatcher("sendMessage.jsp").forward(request, response);
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
