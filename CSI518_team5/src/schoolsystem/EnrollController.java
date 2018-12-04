package schoolsystem;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class EditRole
 */
@WebServlet("/EnrollController")
public class EnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.print("Enroll doGet function working");
		PrintWriter out = response.getWriter();
		String user = request.getParameter("user");
		String id_of_course=request.getParameter("id_of_course");
		String result="";
		int userId=0;
		if(user!=null) {
			 //result = DatabaseAccess.UpdateUserRole(Integer.parseInt(id_of_course), Integer.parseInt(user));
			userId = DatabaseAccess.getUserIdByName(user);
			if(userId>0) {
				if(DatabaseAccess.CheckEnrollment(Integer.parseInt(id_of_course), userId)) {
					result = DatabaseAccess.EnrollClass(Integer.parseInt(id_of_course), userId);//insert record to the table 
				}else {
					out.println("Already enrolled!");
				}
				
			}else {
				System.out.print("Error occured in get userid by username");
			}
				
		}
		else {
			System.out.print("User not found");
		}
		
		if(result.equalsIgnoreCase("success")) {
			
			out.print("success");
			System.out.print("insert enrollment successfully for userid = ");
			System.out.print(userId);
			//request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
		else{
			out.print("Failed to enroll!");
			System.out.print("enroll class error for userid = ");
			System.out.print(userId);
			//request.getRequestDispatcher("/editRole.jsp").forward(request, response);
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
