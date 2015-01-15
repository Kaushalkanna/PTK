<%@ page language="java"  import="Categories.*, java.util.*,
 java.text.*, javax.servlet.http.* ,java.io.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<head>
<title>PTK</title>
 <link rel="stylesheet" type="text/css" href="stylesheet.css">
    <script type="text/javascript" src="javascript.js"></script>
   
</head>
<style>

</style>
<body onload="init()">

<!-- ============ HEADER SECTION ============== -->
<div id="header">
<h1>PTK Social Media</h1>
<%
			HttpSession session1 = request.getSession();
			//String uss= session1.getAttribute("userID").toString();
			try{
			
				if(session1.getAttribute("userID") != null){
				 %>
				<div style="float:left">Welcome, <%= session1.getAttribute("userID") %></div>
				<%
					
				}
				else{
				pageContext.forward("index.jsp");
				}
			}catch (Exception e) {
				System.err.println("IndexOutOfBoundsException: " + e.getMessage());
			} 
%>
<!-- Search Users :<input type="text"  size="40"  id="complete-field" onkeyup="doCompletion()" /></td>
               <center> <table id="complete-table" class="popupBox"></table></center>
 --> 
 Feel freee to send messages to anyone in the pr
  <a href ="./logout.jsp" style="color:white;float:right;">Logout</a>
 
</div>

<!-- ============ LEFT COLUMN (MENU) ============== -->
<div id="nav"><br><center><h3>
<a href ="home.jsp">Home</a><br>
<a href ="messages.jsp">Message</a><br>
<a href ="profile.jsp">Profile</a><br>
<a href ="requests.jsp">Friend Requests</a><br>
<hr>
<I>Categories</I> <br>
<table>
  <td><tr><a href ="General.jsp">General Items</a></tr></td><br>
  <td><tr><a href ="Sale.jsp">Sale</a></tr></td><br>
  <td><tr><a href ="Accomodation.jsp">Accomodation</a></tr></td><br>
  <td><tr><a href ="Form.jsp">Add item</a></tr></td>
</table>
<hr>
</h3></center>
</div>

<!-- End of Navigation -->

 
<!-- ============ SECTION COLUMN (CONTENT) ============== -->

<% 
String name = session1.getAttribute("userID").toString();%>

<form action="ChatServlet" >

<input type="hidden" name="fromname" value="<%= session1.getAttribute("userID") %>">
<br />
</br>
<center>
<div class= "modal">
TO : <select name = "toname" >
<%
System.out.println(name);
String friendsFilename = name +"friends.ser";
HashMap<String , String> friends = null;
File f = new File(friendsFilename);
//if(f.isFile()) { 
      try
      {
         FileInputStream fileIn = new FileInputStream(friendsFilename);
         ObjectInputStream infil = new ObjectInputStream(fileIn);
         friends = (HashMap<String , String>) infil.readObject();
         infil.close();
         fileIn.close();
		
      }catch(IOException i)
      {
    	  ErrorHandling.printMessage("Please Add Some Friends to Send them messages",response);
         i.printStackTrace();
         return;
      }
      System.out.println(friends.values().toString());
      for (Map.Entry<String, String> entry : friends.entrySet())     {
          String key = entry.getKey(); 
    	    String friendname = entry.getValue();
    	    System.out.println(friendname);
    	    %>
    	    <option value = <%=friendname %>><%=friendname %></option>
    	    <%
      }
	/*}else
	{  ErrorHandling.printMessage("Please Add Some Friends to Send them messages",response);
    }*/
%>
</select>

<br/>
</br>
Message : <textarea name="message" rows="3" cols="50"></textarea>
</br>
</br>
<input type="submit" value="SEND" />

</div>
</center>
</form>

	
<%
String filename= name + ".ser";
%>
<center>
<h2> Your Messages </h2>
<div style=" overflow : scroll; height: 190px; width: 75%; color:#3399FF;" >
<%
HashMap<String , String[]> e = null;
String filePath = new File(filename).getAbsolutePath();
File FileToRead = new File(filePath);
if(FileToRead.exists()){
	 try
     {
System.out.println("Reading File");
FileInputStream fis = new FileInputStream(FileToRead);
System.out.println("Reading FileInputStream");
ObjectInputStream  in = new ObjectInputStream(fis);


     
        
         e = (HashMap<String , String[]>) in.readObject();
         in.close();
         fis.close();
		
      }catch(IOException i)
      {
         i.printStackTrace();
         return;
      }catch(ClassNotFoundException c)
      {
       
         c.printStackTrace();
         return;
      }

TreeMap<String, String[]> tMap = new TreeMap<String,String[]>(e);
NavigableMap<String, String[]> nmap=tMap.descendingMap();
   for (Map.Entry<String, String[]> entry : nmap.entrySet())

{
    String key = entry.getKey(); 
	String[] value = entry.getValue();
			%>
<br>			
          
<h3><%= value[1] %></h3>

-by "<%= value[0]%>" <br><%= value[2] %>
<br>

<%

} 
e = null;
}
else
	  {
%>
<H3>NO Messages</h3>
<%
	  }
%>
</div></center>
<!-- ============ FOOTER SECTION ============== -->
<div id = "footer">
PTK project
</div>
</body>
</html>