package Categories;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class ErrorHandling {
public static void printMessage(String m, HttpServletResponse response){
	 response.setContentType("text/html");
		PrintWriter out;
		try {
			out = response.getWriter();
			String docType =
					"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 " +
					"Transitional//EN\">\n";
					out.println(docType +
					          "<HTML>\n" +
					          "<HEAD>"+
					          "<style>" + HomePage.GetCSSStyle() +
					          "</style>"+"</HEAD>\n" +
					          "<BODY>\n" +
					          "<div id='header'><h1>PTK Social Media</h1></div>"+
					          "<div id='nav'><br><center><h3><a href ='home.jsp'>Home</a><br><a href =''>Message</a><br><a href ='profile.jsp'>Profile</a><br><a href ='requests.jsp'>Friend Requests</a><br><hr>"+
			"<I>Categories</I> <br><table> <td><tr><a href ='General.jsp'>General Items</a></tr></td><br> <td><tr><a href ='Sale.jsp'>Sale</a></tr></td><br>"+
			"<td><tr><a href ='Accomodation.jsp'>Accomodation</a></tr></td></table><hr><a href ='./logout.jsp'>Logout</a><br></h3></center></div>"+
					         "<div id='section'><center><h3> "+m+
					           "</h3></center></div><div id ='footer'>PTK project</div></body></html>");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
