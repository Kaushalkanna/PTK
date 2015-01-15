package Categories;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteProduct  extends  HttpServlet {


	public void doGet(HttpServletRequest request,
             HttpServletResponse response)
			throws ServletException, IOException {
		Boolean isremoved = false;
		Products category = new Products();
		 
		 String itemName = (String) request.getParameter("itemName");
			String userName = (String) request.getParameter("userName");
		
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
				Item item = c.getItemFromList(itemName);
				int index = c.getItemIndexFromList(itemName);
				if(item.getUserName().equals(userName)){
					c.deleteItem(index);
					FileOutputStream fout = new FileOutputStream(FileToRead);
					ObjectOutputStream outputStream = new ObjectOutputStream(fout);
					System.out.println("Writing the Item");
					outputStream.writeObject(c);
					outputStream.close();
					isremoved= true;
				}
			}catch(Exception e){
				ErrorHandling.printMessage("Sorry the product was not be deleted, Please try again ", response);
				
				e.printStackTrace();}
			}
			
			String message;
			if(isremoved){
				message = "Your Item is successfully removed <br>";
			}else{
				message = "Sorry....<br>Item cannot be removed as you are not hte owner of thois post.<br>";
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
			          "<div id='nav'><br><center><h3><a href ='home.jsp'>Home</a><br><a href =''>Message</a><br><a href ='profile.jsp'>Profile</a><br><a href ='requests.jsp'>Friend Requests</a><br><hr>"+
"<I>Categories</I> <br><table> <td><tr><a href ='General.jsp'>General Items</a></tr></td><br> <td><tr><a href ='Sale.jsp'>Sale</a></tr></td><br>"+
"<td><tr><a href ='Accomodation.jsp'>Accomodation</a></tr></td></table><hr><a href ='./logout.jsp'>Logout</a><br></h3></center></div>"+
			         "<div id='section'>"+ 	message+
					         "<a href='home.jsp'>home </a>"+
			           "</h3></center></div><div id ='footer'>PTK project</div></body></html>");
			
	}
}
