package Categories;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetInfo extends  HttpServlet {

	//private static final long serialVersionUID = 1L;
	 Item item = null;
	public void doGet(HttpServletRequest request,
            HttpServletResponse response)
			throws ServletException, IOException {
		 
		 String itemName = (String) request.getParameter("itemName");
			/*String desc = (String) request.getParameter("desc");
			String phoneNo =(String) request.getParameter("phoneNo");
			String mail = (String) request.getParameter("mail");
			double price = Double.parseDouble( request.getParameter("price"));
			
	  	*/	 
		 String filePath = new File("items.txt").getAbsolutePath();
		 File FileToRead = new File(filePath);
		 if(FileToRead.exists()){
		 System.out.println("Reading File");
		 FileInputStream fis = new FileInputStream(FileToRead);
		 System.out.println("Reading FileInputStream");
		 
	    ObjectInputStream  in = new ObjectInputStream(fis);
	    Products c;
	   
		try {
			c = (Products) in.readObject();
			 item =   c.getItemFromList(itemName);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			ErrorHandling.printMessage("Sorry your operation canot be compleated, Please try again",response);
			
			e.printStackTrace();
		}
		 
		 response.setContentType("text/html");
			PrintWriter out = response.getWriter();
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
			          "<div id='nav'><br><center><h3><a href ='home.jsp'>Home</a><br><a href ='messages.jsp'>Message</a><br><a href ='profile.jsp'>Profile</a><br><a href ='requests.jsp'>Friend Requests</a><br><hr>"+
"<I>Categories</I> <br><table> <td><tr><a href ='General.jsp'>General Items</a></tr></td><br> <td><tr><a href ='Sale.jsp'>Sale</a></tr></td><br>"+
  "<td><tr><a href ='Accomodation.jsp'>Accomodation</a></tr></td></table><hr><a href ='./logout.jsp'>Logout</a><br></h3></center></div>"+
			         "<div id='section'><center><h3>   Name : "+itemName+"<br>"+
		   "Descripton : "+item.getDesc()+"<br>"+
		   "Price = "+item.getPrice()+  "<br>"+
		   "Contact mail ID : "+item.getMailId()+"<br>"+ 
		   "Contact Phone Number:"+item.getPhoneNo()+"<br>"+
		   "<br> <input type='button' onclick='history.back();' value='Check More options'/>"+
		   "<form action ='DeleteProduct' method='get' >" +
		   "<INPUT TYPE='HIDDEN' NAME='userName' VALUE = "+item.getUserName()+" >"+
		   "<INPUT TYPE='HIDDEN' NAME='itemName' VALUE = "+itemName+" >"+
		   		"<button> Delete </button></form>"+
			           "</h3></center></div><div id ='footer'>PTK project</div></body></html>");
		 }}
	 }


