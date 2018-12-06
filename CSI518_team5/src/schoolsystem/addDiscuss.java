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

@WebServlet("/addDiscuss")
public class addDiscuss extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public addDiscuss() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Start adding");
		String name = (String)request.getParameter("name");
		System.out.println("name: "+name);
		Boolean result = false;
		if(name == null)
		{
			response.getWriter().println("please enter name");
			return;
		}
		discuss d = new discuss();

		d.setName(name); 
		//store info in the database!!
		System.out.println("DatabaseAccess");
		result = DatabaseAccess.addDiscuss(d);
		if(result == null)
			System.out.println("Failed to add new discuss post.");
		else
			System.out.println("Add discuss post successfully!");
		//request.getRequestDispatcher("sendMessage.jsp").forward(request, response);
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}


