package schoolsystem;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/searchMessage")
public class searchMessage extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public searchMessage() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	@SuppressWarnings("unchecked")
	protected void service(HttpServletRequest request, HttpServletResponse response) //
			throws ServletException, IOException {
		List<Map> list =new ArrayList<Map>();
		
		String username = request.getParameter("username");
		System.out.println(username);
		//DatabaseAccess.getMessage(username);
		ResultSet rs=DatabaseAccess.getMessage(username);
		try {
			
			System.out.println("getdata");
			while (rs.next()) {
				String from = rs.getString("from");
				String to = rs.getString("name");
				String content = rs.getString("content");
				
				
				Map map = new HashMap<>(); 
				map.put("from", from);			
				map.put("name", to);		
				map.put("content", content);
				
				System.out.println(map);
				list.add(map);
				
				for (@SuppressWarnings("rawtypes") Map map_1 :list) {
					System.out.println(map_1);
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
 
		System.out.println("Redirect....");
		request.setAttribute("key_list",list);
		request.getRequestDispatcher("/getmessage.jsp").forward(request, response);
		
	}


	
	
}
