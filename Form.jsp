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
			} 
%>
Add more items in the Category..
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
	<div id="section"><br><br><CENTER>
	<H1 ALIGN= CENTER  > Upload </H1>
			<FORM ACTION= "AddProduct" Method = "GET" >
			<table align = "center">
				<tr>
					<td>Item name:</td>
					<td><input type='text' name='item' REQUIRED><br></td>
				</tr>
				<tr>
					<td>Description</td>
					<td><input type='text' name='desc' REQUIRED><br></td>
				</tr>
				<tr>
					<td>Type</td>
					<td><input type="radio" name="type" value="General" REQUIRED>General
						<input type="radio" name="type" value="Sale" REQUIRED>Sale
						<input type="radio" name="type" value="Accomodation" REQUIRED>Accomodation
					<br></td>
				</tr>
				<tr>
					<td>Your Number:</td>
					<td><input type='text' name='number' REQUIRED><br></td>
				</tr>
				<tr>
					<td>Your emailID:</td>
					<td><input type='text' name='mail' REQUIRED><br></td>
				</tr>
				<tr>
					<td>Image URL</td>
					<td><input type='text' name='img' REQUIRED><br></td>
				</tr>
				<tr>
					<td>Price:</td>
					<td><input type='number' name='price' REQUIRED><br></td>
				</tr>
				<%
				HttpSession ses = request.getSession(true);
				
				String userName = (String) ses.getAttribute("userID");
				%>
				<INPUT TYPE="HIDDEN" NAME="userName" VALUE = <%=userName %>  >
			</table>
			<br>
			<center>
			<input type='submit' value='Submit'> 
			<!-- <input type='button' onclick='history.back();' value='Go To Shopping Cart'> -->
					</center>	
		</FORM>
	</CENTER>
	</div>
	<!-- ============ FOOTER SECTION ============== -->
<div id = "footer">
PTK project
</div>
	</body>
	</html>