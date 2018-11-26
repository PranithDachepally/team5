package schoolsystem;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class sAppointment
 */
@WebServlet("/Appointment")
public class sAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sAppointment() {
        super();
        // TODO Auto-generated constructor stub
    }
    String rfirstname;
    String rlastname;
    int senderid;
    String sfirstname;
    String slastname;
    String time;
    String date;
    int receiverid;
    boolean existed = false;
    Appointment apt= new Appointment();
    
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		receiverid = Integer.parseInt(request.getParameter("teachername"));
		System.out.println("~~~userid: "+ receiverid);
		String time = request.getParameter("time");
		System.out.println("~~~time: "+time);
		String date = request.getParameter("date");
		System.out.println("~~~date: "+date);
		
		
		//find receiver information
		ResultSet rs = DatabaseAccess.getUserById(receiverid);
		if(rs==null) {
    		System.out.println("User not found or DB connection failed.");
    	}

    	try {
    		if(rs.next()) {
    			//int db_userid = rs.getInt("iduser");
    			 rfirstname = rs.getString("firstname");
    			 rlastname = rs.getString("lastname");
    			 //time = rs.getString("time");
    			 System.out.println("receiver name: "+ rfirstname+" "+rlastname);
    			 //System.out.println("apt time: "+apt.getTime());
    		}	
	    }
	    catch (SQLException e) {
	    	e.printStackTrace();
	    }
    	
    	
    	//get sender information
    	HttpSession session = request.getSession(false);
    	
    	String senderusername = (String)session.getAttribute("user");
    	
    	System.out.println("username of Sender: "+ senderusername);
    	
    	ResultSet RS = DatabaseAccess.getUser(senderusername);
    	if(RS==null) {
    		System.out.println("User not found or DB connection failed.");
    	}

    	try {
    		if(RS.next()) {
    			//int db_userid = rs.getInt("iduser");
    			 senderid = RS.getInt("iduser"); 
    			 sfirstname = RS.getString("firstname");
    			 slastname = RS.getString("lastname");
    		}	
	    }
	    catch (SQLException e) {
	    	e.printStackTrace();
	    }
    	
    	
    	ResultSet dulapt = DatabaseAccess.duplicateAppointment();
    	if(dulapt==null) {
    		System.out.println("User not found or DB connection failed.");
    	}

    	try {
    		if(dulapt.next()) {
    			//int db_userid = rs.getInt("iduser");
    			System.out.println("inside dulapt!!!ß");
    			int dulreceiverid=dulapt.getInt("receiverid");
    			int dulsenderid=dulapt.getInt("senderid");
    			String dultime=dulapt.getString("time");
    			String duldate=dulapt.getString("date");
    			System.out.println("ouput: " + dulreceiverid + " "+ dulsenderid + " "+ dultime+" "+duldate);
    			System.out.println("input: " + receiverid + " "+ senderid + " "+ time+" "+date);
    			if(dulreceiverid==receiverid && dulsenderid==senderid && dultime.equals(time) && duldate.equals(date)) {
    				existed = true;
    				System.out.println("Existed has been set to true!!");
    			}else
    				System.out.println("Appointment doesnot exist");
    		}	
	    }
	    catch (SQLException e) {
	    	e.printStackTrace();
	    }
    	if(existed==true)
    		System.out.println("Appointment existed in Database!!");
    	else {
    		//set a appointment
        	apt.setReceiverid(receiverid);
        	apt.setRfirstname(rfirstname);
        	apt.setRlastname(rlastname);
        	apt.setSenderid(senderid);
        	apt.setSfirstname(sfirstname);
        	apt.setSlastname(slastname);
        	apt.setTime(time);
        	apt.setDate(date);
        	
        	//succcess or fail to addAppointment 
        	if(DatabaseAccess.addAppointment(apt)==false)
        		System.out.println("AddAppoinment filed!");
        	else
        		System.out.println("AddAppointment success!");
    	}
    	
    	
		request.getRequestDispatcher("sAppointment.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
