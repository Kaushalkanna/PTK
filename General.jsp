<%@ page language="java"  import="Categories.*, java.io.*, java.util.*" %>
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
   height:76%;
    BACKGROUND: white;	 
    overflow: auto;	 
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
</div>

<!-- ============ LEFT COLUMN (MENU) ============== -->
<div id="nav"><br><center><h3>
<a href ="home.jsp">Home</a><br>
<a href ="">Message</a><br>
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
 
<!-- ============ SECTION COLUMN (CONTENT) ============== -->
	<div id="section">
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
    		  if( items.get(i).getType().equals("General")){
    			  isEmpty = false;
  	  		  String itemName= items.get(i).getName();
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
			  <h3><center>It Seems Empty here...</center></h3>
			  <% }
		  
  %>
 </div>
  
  

  <!-- ============ FOOTER SECTION ============== -->
<div id = "footer">
PTK project
</div>
</body>
</html>