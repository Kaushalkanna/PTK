import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import Categories.ErrorHandling;

import java.util.*;
import java.text.*;
import java.util.Date;



public class Decline extends HttpServlet implements java.io.Serializable{
	public HashMap<String , String> frndshm = new HashMap<String , String>();
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
      throws ServletException, IOException {

HttpSession session1 = request.getSession();
HashMap<String , String> e = null;
String myname = session1.getAttribute("userID").toString();
String frndname = session1.getAttribute("frndname").toString();
session1.removeAttribute("frndname");
String filename2 = myname + "requests.ser";
HashMap<String , String> e2 = null;
try
      {
         FileInputStream fileIn1 = new FileInputStream(filename2);
         ObjectInputStream infil1 = new ObjectInputStream(fileIn1);
         e2 = (HashMap<String , String>) infil1.readObject();
         infil1.close();
         fileIn1.close();
		
      }catch(IOException i)
      {
         i.printStackTrace();
         return;
      }catch(ClassNotFoundException c)
      {
       
         c.printStackTrace();
         return;
      }



 e2.remove(frndname);
 
 

 try
      {
         FileOutputStream fileOut1 = new FileOutputStream(filename2);
         ObjectOutputStream outfil1 = new ObjectOutputStream(fileOut1);
         outfil1.writeObject(e2);
         outfil1.close();
         fileOut1.close();
       
      }catch(IOException i)
      {
    	  ErrorHandling.printMessage("Sorry your operation canot be completed, Please try again",response);
          i.printStackTrace();
      }







	response.sendRedirect("requests.jsp");


  } 





  public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }
}
