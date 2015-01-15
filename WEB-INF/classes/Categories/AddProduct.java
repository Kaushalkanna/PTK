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


public class AddProduct extends  HttpServlet {


	public void doGet(HttpServletRequest request,
             HttpServletResponse response)
			throws ServletException, IOException {
		 
		 Products category = new Products();
		 
		 String item = (String) request.getParameter("item");
			String desc = (String) request.getParameter("desc");
			String type = (String) request.getParameter("type");
			String phoneNo = request.getParameter("number");
			String mail = (String) request.getParameter("mail");
			String img = (String) request.getParameter("img");
			double price = Double.parseDouble( request.getParameter("price"));
			 String userName =  (String) request.getParameter("userName");
				
			Item i = new Item();
			i.setDesc(desc);i.setImgLink(img);i.setMailId(mail);i.setName(item);i.setPhoneNo(phoneNo);i.setPrice(price);i.setType(type);
			i.setUserName(userName);
			
			category.addItem(i);
			
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
				   category.getItemList().addAll(c.getItemList());
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				ErrorHandling.printMessage("Sorry the product was not added, Please try again with a new image",response);
				e.printStackTrace();
			}
			 }
		    //Store the object in file
			FileOutputStream fout = new FileOutputStream(FileToRead);
			ObjectOutputStream outputStream = new ObjectOutputStream(fout);
			System.out.println("Writing the Item");
			outputStream.writeObject(category);
			outputStream.close();
			System.out.println("Item Added");
			
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
			         "<div id='section'>" +
			         "Your Item is successfully added in "+type+" Category<br>"+
			         "<a href='home.jsp'>home </a>"+
			           "</h3></center></div><div id ='footer'>PTK project</div></body></html>");
	 }
	 
}
