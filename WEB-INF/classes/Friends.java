
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Categories.ErrorHandling;

public class Friends extends HttpServlet implements java.io.Serializable {
	public HashMap<String, String> frndshm = new HashMap<String, String>();
	public HashMap<String, String> frndsFilehm = new HashMap<String, String>();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session1 = request.getSession();
		HashMap<String, String> e = null;
		String myname = session1.getAttribute("userID").toString();
		String frndname = session1.getAttribute("frndname").toString();
		session1.removeAttribute(frndname);
		String filename = myname + "friends.ser";
		File f = new File(filename);
		System.out.println(filename);
		System.out.println(frndname);
		if (f.isFile()) {
			try {
				FileInputStream fileIn = new FileInputStream(filename);
				ObjectInputStream infil = new ObjectInputStream(fileIn);
				e = (HashMap<String, String>) infil.readObject();
				infil.close();
				fileIn.close();

			} catch (IOException i) {
				i.printStackTrace();
				return;
			} catch (ClassNotFoundException c) {

				c.printStackTrace();
				return;
			}
			if (e != null) {
				frndshm = e;
			}
			else{
			frndshm = new HashMap<String,String>();
			}
		}
		else{ frndshm = new HashMap<String,String>(); }
		frndshm.put(frndname, frndname);

		try {
			FileOutputStream fileOut = new FileOutputStream(filename);
			ObjectOutputStream outfil = new ObjectOutputStream(fileOut);
			outfil.writeObject(frndshm);
			outfil.close();
			fileOut.close();

		} catch (IOException i) {
			ErrorHandling
					.printMessage(
							"Sorry your operation canot be completed, Please try again",
							response);
			i.printStackTrace();
		}

		//storing the friend name 
		HashMap<String, String> frndlist = null;
		
		File frndfile = new File(frndname + "friends.ser");
		if(frndfile.isFile()){
			try {
				FileInputStream fileIns = new FileInputStream(frndfile);
				ObjectInputStream infilo = new ObjectInputStream(fileIns);
				frndlist = (HashMap<String, String>) infilo.readObject();
				infilo.close();
				fileIns.close();

			} catch (IOException i) {
				i.printStackTrace();
				return;
			} catch (ClassNotFoundException c) {

				c.printStackTrace();
				return;
			}
			if (frndlist != null) {
				frndsFilehm = frndlist;
			}
			else{
			frndsFilehm = new HashMap<String,String>();
			}
			
		}
		else{ frndsFilehm = new HashMap<String,String>(); }
		
		frndsFilehm.put(myname, myname);
		try {
			FileOutputStream fileOut1 = new FileOutputStream(frndfile);
			ObjectOutputStream outfil1 = new ObjectOutputStream(fileOut1);
			outfil1.writeObject(frndsFilehm);
			outfil1.close();
			fileOut1.close();

		} catch (IOException i) {
			ErrorHandling
					.printMessage(
							"Sorry your operation cannot be completed, Please try again",
							response);
			i.printStackTrace();
		}

		
		
		String filename2 = myname + "requests.ser";
		HashMap<String, String> e2 = null;
		try {
			FileInputStream fileIn1 = new FileInputStream(filename2);
			ObjectInputStream infil1 = new ObjectInputStream(fileIn1);
			e2 = (HashMap<String, String>) infil1.readObject();
			infil1.close();
			fileIn1.close();

		} catch (IOException i) {
			i.printStackTrace();
			return;
		} catch (ClassNotFoundException c) {

			c.printStackTrace();
			return;
		}

		e2.remove(frndname);

		try {
			FileOutputStream fileOut1 = new FileOutputStream(filename2);
			ObjectOutputStream outfil1 = new ObjectOutputStream(fileOut1);
			outfil1.writeObject(e2);
			outfil1.close();
			fileOut1.close();

		} catch (IOException i) {
			ErrorHandling
					.printMessage(
							"Sorry your operation canot be completed, Please try again",
							response);
			i.printStackTrace();
		}

		response.sendRedirect("requests.jsp");

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
