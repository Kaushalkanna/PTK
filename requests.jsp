<%@page import="Categories.ErrorHandling"%>
<%@ page language="java"  import="java.io.*, java.util.*, java.text.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
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

<form name="autofillform" action="autocomplete" >

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
			}catch (IndexOutOfBoundsException e) {
				System.err.println("IndexOutOfBoundsException: " + e.getMessage());
			} catch (IOException e) {
				System.err.println("Caught IOException: " + e.getMessage());
			}
%>
Search Users :<input type="text"  size="40"  id="complete-field" onkeyup="doCompletion()" /></td>
               <center> <table id="complete-table" class="popupBox"></table></center>
   <a href ="./logout.jsp" style="color:white;float:right;">Logout</a>         
</form>
</div>

<!-- ============ LEFT COLUMN (MENU) ============== -->
<div id="nav"><br><center><h3>
<a href ="home.jsp">Home</a><br>
<a href ="messages.jsp">Message</a><br>
<a href ="profile.jsp">Profile</a><br>
<a href ="requests.jsp">Friend Requests</a><br>
<hr>
<I>Categories</I> <br>
<table >
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
<div id="section"><br><br>
<%
			String filename = (String)session1.getAttribute("userID");
			String filename1 = filename + "requests.ser";
			
			HashMap<String , String> e = null;
File f = new File(filename1);
if(f.isFile()) { 
      try
      {
         FileInputStream fileIn = new FileInputStream(filename1);
         ObjectInputStream infil = new ObjectInputStream(fileIn);
         e = (HashMap<String , String>) infil.readObject();
         infil.close();
         fileIn.close();
		
      }catch(IOException i)
      {
        ErrorHandling.printMessage("Sorry unable to send Friend Request", response);
    	  i.printStackTrace();
         return;
      }catch(ClassNotFoundException c)
      {
       
         c.printStackTrace();
         return;
      }
TreeMap<String, String> tMap = new TreeMap<String,String>(e);
NavigableMap<String, String> nmap=tMap.descendingMap();
if(nmap.size()>0){ 
	for (Map.Entry<String, String> entry : nmap.entrySet()){
    String key = entry.getKey(); 
	String value = entry.getValue();
	session1.setAttribute("frndname",value);
			%>         
<center><h3><i> Friend Request From :  <%= value %></i></h3><form action="./friends">
<input type="hidden" id="frndsname" value="<%= value %>">
<input type="submit" value="Accept"></form>
<form action="./decline">
<input type="hidden" id="frndsname" value="<%= value %>">
<input type="submit" value="Decline">
</form>
</center>

</br>
</br>
<%

}}else{ %>
<center><h3><i>No Friend Requests!!</h3></i></center>			
<%} 
  
}
else
	  {
%>
<center><h3><i>No Friend Requests!!</h3></i></center>			
<%
	  }

String file3 = filename + "friends.ser";

HashMap<String , String> e1 = null;
File f1 = new File(file3);
if(f1.isFile()) { 
      try
      {
         FileInputStream fileIn = new FileInputStream(file3);
         ObjectInputStream infil = new ObjectInputStream(fileIn);
         e1 = (HashMap<String , String>) infil.readObject();
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


			
TreeMap<String, String> tMap = new TreeMap<String,String>(e1);
NavigableMap<String, String> nmap=tMap.descendingMap();
%><br><br><div style ="overflow:scroll;width:100%;height:70%;"><center><h3><i>Friends List </h3></i></center><%
   for (Map.Entry<String, String> entry : nmap.entrySet())

{
    String key = entry.getKey(); 
	String value1 = entry.getValue();
			%>
			
 
<center><h3><i><%= value1 %></h3></i></center>

<%

}%></div><% 
}
else
	  {
%>
<center><h3><i>No Friends</h3></i></center>
<%
	  }
%>
</div>

<!-- ============ FOOTER SECTION ============== -->
<div id = "footer">
PTK project
</div>
</body>
</html>

</body>
</html>