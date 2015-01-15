

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import Categories.ErrorHandling;

import java.util.*;
import java.text.*;
import java.util.Date;



public class ChatServlet extends HttpServlet{
	public HashMap<String , String[]> statushm = new HashMap<String , String[]>();
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
      throws ServletException, IOException {
String fromname = request.getParameter("fromname");
Date date = new Date();
String dates = " -at " + date;
String all = date + "!" +fromname;
String toname = request.getParameter("toname");
String filename = toname + ".ser";
String message = request.getParameter("message");
String[] data = { fromname, message, dates};

HashMap<String , String[]> e = null;
File f = new File(filename);
if(f.isFile()) { 
      try
      {
         FileInputStream fileIn = new FileInputStream(filename);
         ObjectInputStream infil = new ObjectInputStream(fileIn);
         e = (HashMap<String , String[]>) infil.readObject();
         infil.close();
         fileIn.close();
		
      }catch(IOException i)
      {
    	  ErrorHandling.printMessage("Sorry your operation canot be compleated, Please try again",response);
         i.printStackTrace();
         return;
      }catch(ClassNotFoundException c)
      {
    	  ErrorHandling.printMessage("Sorry your operation canot be compleated, Please try again",response);
         c.printStackTrace();
         return;
      }
if(e != null)
	  {
statushm = e;
	  }
}

 statushm.put(all,data);
 

 try
      {
         FileOutputStream fileOut = new FileOutputStream(filename);
         ObjectOutputStream outfil = new ObjectOutputStream(fileOut);
         outfil.writeObject(statushm);
         outfil.close();
         fileOut.close();
       
      }catch(IOException i)
      {
    	  ErrorHandling.printMessage("Sorry your operation canot be compleated, Please try again",response);
          i.printStackTrace();
      }
	response.sendRedirect("messages.jsp?name=" + fromname);


  } 





  public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }
}
