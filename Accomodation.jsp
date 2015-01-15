<%@ page language="java"  import="Categories.*, java.io.*, java.util.*" %>
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
You can now look for apartments or post available accomodations on the social media.
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
 
 
<!-- ============ SECTION COLUMN (CONTENT) ============== -->
	<div id="section" style = "height:	80%;
   overflow:scroll; ">
  <%
  	Products c = null;
          try
          {
             FileInputStream fileIn = new FileInputStream("items.txt");
             ObjectInputStream in = new ObjectInputStream(fileIn);
             c = (Products) in.readObject();
             in.close();
             fileIn.close();
          }catch(IOException i)
          {
             i.printStackTrace();
            %> <h3><center>It Seems Empty here...Add an Item by clicking Add Item option.</center></h3>
 			 <%
             return;
          }catch(ClassNotFoundException cnf)
          {
             
             cnf.printStackTrace();
             return;
          }
         
    	  int i;
    	   
    	  ArrayList<Item> items= c.getItemList();
    		Boolean isEmpty = true;
    	  for(i=0;i<items.size();i++)
    	  {
    		  if( items.get(i).getType().equals("Accomodation")){
    			  isEmpty = false;
  	  		  String itemName= items.get(i).getName();
  	  		  System.out.println(itemName);
  	  		  String desc = items.get(i).getDesc();
  	  		 double price  =items.get(i).getPrice();
  	  		 String image = items.get(i).getImgLink();
  	  		 
  	  		 
  	  		 String mail = items.get(i).getMailId();
  	  		 String phoneNo = items.get(i).getPhoneNo();
  %>
	  	
		<center>
      <form action="GetInfo" Method = "GET">
      
      <h2><%= itemName %> ($<%= price%>)</h2>
		  <INPUT TYPE="HIDDEN" NAME="itemName" VALUE = <%=itemName %>  >
	   
      <input type="image" src=<%=image %> width="400" height="250">
     
      </form>
      </center><br>
	  		 <%
  		  }
    		     			  
  	  }

     	 if(isEmpty){  %>
 			  <h3><center>It Seems Empty here...Add an Item by clicking Add Item option.</center></h3>
 			  <% }
 		  
  %>
 </div>
  
  

  <!-- ============ FOOTER SECTION ============== -->
<div id = "footer">
PTK project
</div>
</body>
</html>