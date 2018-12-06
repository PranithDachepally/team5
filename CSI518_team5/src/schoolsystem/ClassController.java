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
@WebServlet("/classes")
public class ClassController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ClassController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		if (session == null) {
			response.sendRedirect("login.jsp?referrer=course");
		}

		PrintWriter out = response.getWriter();
		response.setContentType("text/plain");

		String course_id = request.getParameter("id");
		String action = request.getParameter("action");
		// String instructorName = request.getParameter("instructorName");
		if (action == null) {
			action = "get";
		}
		if (action.equals("get")) {

			if (course_id == null) {
				// Get all courses
				ResultSet rs = DatabaseAccess.getAllClass();
				if (rs == null) {
					out.print("no class record");
				} else {
					response.setContentType("application/json");
					out.print(JSON.getJSONFromRS(rs));
				}
			} else {
				// Get Course by ID
				System.out.print("id has vaaaaa doGet function working");

				ResultSet rs = DatabaseAccess.getClassList(Integer.parseInt(course_id));
				if (rs == null) {
					out.print("No class record for course id =");
					System.out.println(course_id);
				} else {
					response.setContentType("application/json");
					out.print(JSON.getJSONFromRS(rs));
				}
			}

		}

		else {
			out.print("Unknown form action.");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
