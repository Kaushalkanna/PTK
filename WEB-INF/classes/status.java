

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import Categories.ErrorHandling;

import java.util.*;
import java.text.*;
import java.util.Date;



public class status extends HttpServlet implements java.io.Serializable{
	public HashMap<String , String[]> statushm = new HashMap<String , String[]>();
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
      throws ServletException, IOException {


HashMap<String , String[]> e = null;
File f = new File("statusfile.ser");
if(f.isFile()) { 
      try
      {
         FileInputStream fileIn = new FileInputStream("statusfile.ser");
         ObjectInputStream infil = new ObjectInputStream(fileIn);
         e = (HashMap<String , String[]>) infil.readObject();
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
statushm = e;
	  }
}
String name = request.getParameter("name");
Date date = new Date();
String dates = " -at " + date;
String all = date + "!" +name;
String status = request.getParameter("status");
String[] data = { name, status, dates};
 statushm.put(all,data);
 
 

 try
      {
         FileOutputStream fileOut = new FileOutputStream("statusfile.ser");
         ObjectOutputStream outfil = new ObjectOutputStream(fileOut);
         outfil.writeObject(statushm);
         outfil.close();
         fileOut.close();
       
      }catch(IOException i)
      {
    	  ErrorHandling.printMessage("Sorry your operation canot be completed, Please try again",response);
          i.printStackTrace();
      }

	response.sendRedirect("home.jsp");


  } 





  public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }
}
