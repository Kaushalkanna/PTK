

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import Categories.HomePage;

import java.util.*;
import java.text.*;
import java.util.Date;



public class FriendRequest extends HttpServlet implements java.io.Serializable{
	public HashMap<String , String> requests1 = new HashMap<String , String>();

  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
      throws ServletException, IOException {


	  String name = request.getParameter("toname");  
	  String username = request.getParameter("username"); 

    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    String docType =
      "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 " +
      "Transitional//EN\">\n";
    String title = "FriendRequest";
    out.println(docType +
	          "<HTML>\n" +
	          "<HEAD>"+
	          " <title>PTK</title>"+
	           "<link rel='stylesheet' type='text/css' href='stylesheet.css'>"+
	             
	          "</head>"+
	          "<BODY>\n" +
	          "<div id='header'><h1>PTK Social Media</h1><form name='autofillform' action='autocomplete' >"+

				"<div style='float:left'>Welcome, "+username +"</div>"+
				
"Notifies you about your Pending Friend Requests"+

"<a href ='./logout.jsp' style='color:white;float:right;'>Logout</a>"+         
"</form></div>"+
	          "<div id='nav'><br><center><h3><a href ='home.jsp'>Home</a><br><a href =''>Message</a><br><a href ='profile.jsp'>Profile</a><br><a href ='requests.jsp'>Friend Requests</a><br><hr>"+
"<I>Categories</I> <br><table> <td><tr><a href ='General.jsp'>General Items</a></tr></td><br> <td><tr><a href ='Sale.jsp'>Sale</a></tr></td><br>"+
"<td><tr><a href ='Accomodation.jsp'>Accomodation</a></tr></td></table><hr><a href ='./logout.jsp'>Logout</a><br></h3></center></div>"+
	         "<div id='section'>" +
	         "<center><H3>Request Sent to :" + name + "</h3></center>"+
	         
	           "</h3></center></div><div id ='footer'>PTK project</div></body></html>");
    
    
    
String filename = name + "requests.ser";
 
 
HashMap<String , String> e = null;
File f = new File(filename);
if(f.isFile()) { 
      try
      {
         FileInputStream fileIn = new FileInputStream(filename);
         ObjectInputStream infil = new ObjectInputStream(fileIn);
         e = (HashMap<String , String>) infil.readObject();
         infil.close();
         fileIn.close();
		
      }catch(IOException i)
      {
         i.printStackTrace();
         return;
      }catch(ClassNotFoundException c)
      {
         c.printStackTrace();
         return;
      }
if(e != null)
	  {
requests1 = e;
	  }


}

 requests1.put(username,username);
 

 try
      {
         FileOutputStream fileOut =
         new FileOutputStream(filename);
         ObjectOutputStream outfil = new ObjectOutputStream(fileOut);
         outfil.writeObject(requests1);
         outfil.close();
         fileOut.close();
       
      }catch(IOException i)
      {
          i.printStackTrace();
      }
 out.println("</br>");
  out.println("</br>");
String homeURL =
          response.encodeURL("home.jsp");
        
        out.println
          ("</TABLE>\n" +
           "<FORM ACTION=\"" + homeURL + "\">\n" +
           "<BIG><CENTER>\n" +
           "<INPUT TYPE=\"SUBMIT\"\n" +
           "       VALUE=\"Back to HOME\">\n" +
           "</CENTER></BIG></FORM>");



 out.println("</BODY></HTML>");

  } 





  public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }
}
