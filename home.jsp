<%@ page language="java"  import="java.io.*, java.util.*,
 java.text.*, javax.servlet.http.*" %>

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
<CENTER>
<h2>
<form action="./status" >
<input type="hidden" name="name" value="<%= session1.getAttribute("userID") %>">
<br />
Status : <input type="text" name="status" />
<input type="submit" value="POST" />
</form>
	
<%

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


			//SortedSet<String> keys = new TreeSet<String>(e.keySet());
            //for (String key : keys) { 
            //String[] value = e.get(key);
TreeMap<String, String[]> tMap = new TreeMap<String,String[]>(e);
NavigableMap<String, String[]> nmap=tMap.descendingMap();
   for (Map.Entry<String, String[]> entry : nmap.entrySet())
// for(K key: map.keySet()) 
{
    String key = entry.getKey(); 
	String[] value = entry.getValue();
			%>
			
          <div style="background-color:#E0ECF8; margin:7px; padding:7px;">
<%= value[1] %>
</br>
<br>-by "<%= value[0]%>" <br><%= value[2] %>
</div>
<%

} 
}
else
	  {
%>
<H3>Be the first person to update status</h3>
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