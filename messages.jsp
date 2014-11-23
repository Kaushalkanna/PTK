<%@ page language="java"  import="java.io.*, java.util.*,
 java.text.*, javax.servlet.http.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>PTK</title>
</head>
<style>
#body{
 font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
 }
#header {
    background:#142f75;
    color:white;
    text-align:center;
    padding:5px;
    font-style: italic;
}
#nav {
    line-height:30px;
    background:#657dba;
    height:80%;
    width:20%;
    float:left;
}
#section {
    padding:10px;
    BACKGROUND: white;	 	 
}
#right{
	
    background:#657dba;
    height:80%;
    width:20%;
    float:right;
    

}   
#footer {
    background:#AE790C;
    height:5%;
    width:100%
    color:white;
    clear:both;
    text-align:center;
   padding:5px;	 	 
}

</style>
<body>

<!-- ============ HEADER SECTION ============== -->
<div id="header">
<h1>PTK Social Media</h1>


<%
			HttpSession session1 = request.getSession();
			//String uss= session1.getAttribute("userID").toString();
			try{
			
				if(session1.getAttribute("userID") != null){
				 %>
				<div style="float:left">welcome, <%= session1.getAttribute("userID") %></div>
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
Search Users : <input type="text" value = "Enter name" />
</div>

<!-- ============ LEFT COLUMN (MENU) ============== -->
<div id="nav"><br><center><h3>
<a href ="home.jsp">Home</a><br>
<a href ="messages.jsp">Message</a><br>
<a href ="profile.jsp">Profile</a><br>
<hr>
<I>Categories</I> <br>
<table>
  <td><tr><a href ="General.jsp">General Items</a></tr></td><br>
  <td><tr><a href ="Sale.jsp">Sale</a></tr></td><br>
  <td><tr><a href ="Accomodation.jsp">Accomodation</a></tr></td>
</table>
<hr>
<a href ="./logout.jsp">Logout</a><br>
</h3></center>
</div>

<!-- End of Navigation -->

 
<!-- ============ SECTION COLUMN (CONTENT) ============== -->
<center>
<% 
String name = session1.getAttribute("userID").toString();%>

<form action="/PTK-master/ChatServlet" >

<input type="hidden" name="fromname" value="<%= session1.getAttribute("userID") %>">
<br />
</br>
TO : <input type="text" name="toname">
<br/>
</br>
Message : <textarea name="message" rows="4" cols="50"></textarea>
</br>
</br>
<input type="submit" value="SEND" />
</form>
<h2> Your Messages </h2>
</center>	
<%
String filename= name + ".ser";
%>

<%
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
			
          <div style="background-image: url(/status/bg1.png); height: 80px; width: 800px; border: 4px color:#3399FF; color:#3399FF; margin:10px; padding:10px;" align="center">
<%= value[1] %>
</br>
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-by "<%= value[0]%>" <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= value[2] %>
</div>

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
<!-- ============ FOOTER SECTION ============== -->
<div id = "footer">
PTK project
</div>
</body>
</html>