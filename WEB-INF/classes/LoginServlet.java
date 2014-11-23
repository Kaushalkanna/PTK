/*
 * LoginServlet.java
 *
 */
 

import java.util.*;
import java.io.*;
import java.util.Map;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoginServlet extends HttpServlet {
   
 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, java.io.IOException {
		
		HttpSession session = request.getSession(true);
		
		String userid = request.getParameter("userid");
		String pass = request.getParameter("password");
		
		ServletContext sc = this.getServletContext();
		String path = sc.getRealPath("/WEB-INF/userInfo.txt");

		File file = new File(path);
		BufferedReader br = new BufferedReader(new FileReader(path));
		boolean found = false;
		String line;
		while((line = br.readLine())!= null)
		{
			int split = line.indexOf("||");
			String username = line.substring(0, split);
			String password = line.substring(split + 1);
			if (line.contains(userid)){
				if(line.contains(pass)){
				found=true;
				//showPage(response, "Login Success!");
				session.setAttribute("userID", userid);
				RequestDispatcher requestDispatcher; 
				requestDispatcher = request.getRequestDispatcher("./home.jsp");
				requestDispatcher.forward(request, response);
				break;
				}
				else
				{
				showPage(response, "Sorry wrong Password");
				break;
				}
			}
			if(found == false)
			{	
				showPage(response, "Sorry, you either not register or you forget the username...");
				
			}
		}
		
    }
    /**
     * Actually shows the <code>HTML</code> result page
     */
    protected void showPage(HttpServletResponse response, String message)
    throws ServletException, java.io.IOException {
        response.setContentType("text/html");
        java.io.PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Login Servlet Result</title>");  
        out.println("</head>");
        out.println("<body>");
        out.println("<h2>" + message + "</h2>");
        out.println("</body>");
        out.println("</html>");
        out.close();
 
    }
    

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, java.io.IOException {
        processRequest(request, response);
    } 


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, java.io.IOException {
        processRequest(request, response);
    }
}
