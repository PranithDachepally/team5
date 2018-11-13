package schoolsystem;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class course
 */
@WebServlet("/course")
public class course extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public course() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		if(session==null) {
			response.sendRedirect("login.jsp?referrer=course");
		}
		
		PrintWriter out = response.getWriter();
//		response.setContentType("text/plain");
		
		String id = request.getParameter("id");
		String action = request.getParameter("action");
		String instructorid = request.getParameter("instructorid"); 
		if(action==null) {
			action="get";
		}
		if(action.equals("new")) {
			
			Instructor i = new Instructor();
			String courseName = request.getParameter("name");
			String courseCapacitiy = request.getParameter("capacity");
			String inst_id = request.getParameter("instructorid");
			i.setInstructor(instructorid);
			
			if(courseName==null||courseName.equals("")) {
				out.print("Course Name missing");
			}
			else if(courseCapacitiy==null||courseCapacitiy.equals("")) {
				out.print("Capacity missing");
			}
			else if (inst_id==null||inst_id.equals("")) {
				out.print("Instructor missing");
			}
			else {
				if(DatabaseAccess.addCourse(courseName, courseCapacitiy, inst_id)) {
					out.print("Success");
				}
				else {
					out.print("DB Access Error");
				}			
				}
		}
		else if(action.equals("get")) {
			
			if(instructorid!=null) {
				System.out.println("getting intructor!");
				ResultSet rs = DatabaseAccess.getInstructorsbyId();
				if(rs==null) {
					out.print("DB error");
				}
				else {
					response.setContentType("application/json");
					out.print(JSON.getJSONFromRS(rs));
				}	
				return;
			}
/*			
			else if(id==null) {
				// Get all jobs
				ResultSet rs = DBAccess.getInterviews();
				if(rs==null) {
					out.print("DB error");
				}
				else {
					response.setContentType("application/json");
					out.print(JSON.getJSONFromRS(rs));
				}
			}
			else {
				// Get job by ID
				ResultSet rs = DBAccess.getInterview(id);
				if(rs==null) {
					out.print("DB error");
				}
				else {
					response.setContentType("application/json");
					out.print(JSON.getJSONFromRS(rs));
				}	
			}
			*/
		}
		
		else {
			out.print("Unknown form action.");
		}

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
