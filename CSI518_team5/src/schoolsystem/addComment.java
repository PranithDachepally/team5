package schoolsystem;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addComment")
public class addComment extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public addComment() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Start adding");
		String discuss_id = (String)request.getParameter("discuss_id");
		String comment_content = (String)request.getParameter("comment_content");
		String iduser = (String)request.getParameter("iduser");
		System.out.println("comment_content: "+comment_content);
		Boolean result = false;
		if(comment_content == null)
		{
			response.getWriter().println("please enter content");
			return;
		}
		comment c = new comment();

		c.setdiscussid(Integer.parseInt(discuss_id)); 
		c.setComment(comment_content); 
		c.setiduser(Integer.parseInt(iduser)); 
		//store info in the database!!
		System.out.println("DatabaseAccess");
		result = DatabaseAccess.addComment(c);
		if(result == null)
			System.out.println("Failed to add new comment.");
		else
			System.out.println("Add comment post successfully!");
		//request.getRequestDispatcher("sendMessage.jsp").forward(request, response);
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}


