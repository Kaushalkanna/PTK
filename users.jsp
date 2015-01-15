<%@ page language="java"  import="Categories.*,java.io.*, java.util.*,
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
   <a href ="./logout.jsp" style="color:white;float:right;">Logout</a><br>           
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

    <table>
      <tr>
        <th colspan="2">User Information</th>
      </tr>
      <tr>
        <td>Name: </td>
        <td>${requestScope.users.name}</td>
      </tr>
      <tr>
        <td>Last Name: </td>
        <td>${requestScope.users.address}</td>
      </tr>
      <tr>
        <td>phone No: </td>
        <td>${requestScope.users.phoneNo}</td>
      </tr>
      <tr>
        <td>email: </td>
        <td>${requestScope.users.email}</td>
      </tr> 
      <tr>
        <td>Description: </td>
        <td>${requestScope.users.desc}</td>
      </tr> 
           <tr>
        <%
        String currentFriends = session1.getAttribute("userID")+"friends.ser";
        HashMap<String , String> friendsList = null;
        File friendsFile = new File(currentFriends);
        if(friendsFile.isFile()){
        	try
            {
               FileInputStream friendsFilein = new FileInputStream(friendsFile);
               ObjectInputStream friendsFileinobj = new ObjectInputStream(friendsFilein);
               friendsList = (HashMap<String , String>) friendsFileinobj.readObject();
               friendsFilein.close();
               friendsFileinobj.close();
        		
            }catch(IOException i)
            {
          	  ErrorHandling.printMessage("Sorry Request can not be sent", response);
               i.printStackTrace();
               return;
            }
        	
        
        User friend = (User) request.getAttribute("users");
        if(friendsList.containsKey(friend.getUname())){
        	%>
        	<td>Already Your Friend!!</td>
        	<%
        }
        else{
        %>
        <td>
        <form action='./FriendRequest'>
		
 <input type='hidden' name='toname' value='${requestScope.users.uname}'>
 <input type='hidden' name='username' value=<%=session1.getAttribute("userID") %>>
<input type='submit' value='Send Friend Request'>
</form></td>
<%}}else { %>
<td>
        <form action='./FriendRequest'>
		
 <input type='hidden' name='toname' value='${requestScope.users.uname}'>
 <input type='hidden' name='username' value=<%=session1.getAttribute("userID") %>>
<input type='submit' value='Send Friend Request'>
</form></td>
<%} %>
      </tr> 
    </table>
<br>
<br>

  </h2>
  </CENTER>
  </div>
  <!-- ============ FOOTER SECTION ============== -->
<div id = "footer">
PTK project
</div>
</body>
</html>

