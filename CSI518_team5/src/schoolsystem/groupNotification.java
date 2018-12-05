package schoolsystem;

import java.io.IOException;
import java.sql.ResultSet;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/main1")
public class groupNotification extends HttpServlet{
	public groupNotification() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
		//content of message
		String content = (String)request.getParameter("content");
		System.out.println("content: "+content);
		//result
		Boolean result = false;
		
		ResultSet rs=DatabaseAccess.getInstructorname();
		try {
			
			System.out.println("getdata");
			while (rs.next()) {
				Message msg = new Message();
				String from = "admin";
				String to = rs.getString("username");
				System.out.println("Instructor name: "+to);
				msg.setFrom(from);
				msg.setTo(to);
				msg.setContent(content);
				
				//store info in the database!!
				result = DatabaseAccess.addMessage(msg);
				if(result == null)
					System.out.println("Failed to add messgae.");
				else
					System.out.println("Add message successfully!");
				
				}
				
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//response.sendRedirect("index.jsp");
		request.getRequestDispatcher("groupnoc.jsp").forward(request, response);
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
