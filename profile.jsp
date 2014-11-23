<%@ page language="java"  import="java.io.*,
 java.util.*, java.text.*, javax.servlet.http.*" %>

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
	height:78%;
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
			String uss= session1.getAttribute("userID").toString();
			if(uss != null){
			 %>
			welcome, <%= session1.getAttribute("userID") %>
			<%	
			}
			else{
			pageContext.forward("index.jsp");
			}
%>
</div>

<!-- ============ LEFT COLUMN (MENU) ============== -->
<div id = "nav"><br><center><h3>
<a href ="home.jsp">Home</a><br>
<a href ="">Message</a><br>
<a href ="profile.jsp">Profile</a><br>
<hr>
<a href ="">Category</a><br>
<ul>
  <li><a href ="General.jsp">General Items</a></li>
  <li><a href ="Sale.jsp">Sale</a></li>
  <li><a href ="Accomodation.jsp">Accomodation</a></li>
</ul>
<br>
<hr>
<a href ="./logout.jsp">Logout</a><br>
</h3>
</center>
</div>


<!-- ============ SECTION COLUMN (CONTENT) ============== -->
	<div id="section">

<CENTER>
<%
		ServletContext sc = this.getServletContext();
		String path = sc.getRealPath("/WEB-INF/userInfo.txt");
		List<String> lines = new ArrayList<String>();
		FileReader fr = new FileReader(path);
		BufferedReader bf = new BufferedReader(fr);
		try {
			String aLine;
			while ((aLine = bf.readLine()) != null) {
				if(aLine.contains(uss))
				{
				lines.add(aLine);
				}				
			}
		} finally 
		{
			bf.close();
		}
		//System.out.println("Lines:" + lines + "\n");
		StringBuilder comma = new StringBuilder();
		for ( int i = 0; i< lines.size(); i++){
			comma.append(lines.get(i));

			if ( i != lines.size()-1){

			comma.append(",");

			}
		}
		//System.out.println(comma.toString());	
		String input = comma.toString();
		String part[] = input.split(",");
		//System.out.println(part[0]);
%>
<%
if(request.getParameter("Supdate") !=null)
{
    String UserId = request.getParameter("userid");
	String Password1 = request.getParameter("password1");
    String Password2 = request.getParameter("password2");
	String Fname = request.getParameter("fname");
	String Lname= request.getParameter("lname");       
	String Email= request.getParameter("email");
	String Desc= request.getParameter("Desc");
	String phone= request.getParameter("phone");
	String address= request.getParameter("address");
	
	if(Password1!= null && Password2!= null && !Password2.equals(Password1))
	 {
	 %>
	  	<H3>Password does not match, Please Try again</H3>
	 <%
	 
	 }
	else
	{
		//try{
		// get a relative file name
		ServletContext s = this.getServletContext();
		String pa = s.getRealPath("/WEB-INF/userInfo.txt");

		File file = new File(pa);

		File tempFile = new File(file.getAbsolutePath() + ".tmp");

		BufferedReader brr = new BufferedReader(new FileReader(pa));
		PrintWriter pw = new PrintWriter(new FileWriter(tempFile));

		String lin = null;
		while ((lin = brr.readLine()) != null) 
		{
			
			if (!lin.contains(UserId)) 
			{
				pw.println(lin +"\n");
				
			}
		}
			pw.println(UserId + "," + Password1 + "," 
				+ Fname + "," + Lname + "," + Email + "," + Desc +
				"," + phone + "," + address + "\n");
			pw.flush();
			pw.close();
			brr.close();
		  %>
		   <H3 ALIGN="CENTER">your information is updated...</H3> 
		   <%
		  //Delete the original file
		  if (!file.delete()) 
		  {
			%><H3 ALIGN="CENTER">Could not delete file</H3>
			<%
			return;
		  }

		  //Rename the new file to the filename the original file had.
		  if (!tempFile.renameTo(file)){
			%>
			<H3 ALIGN="CENTER">Could not rename the file</H3>
			<%
			}
			
		//} catch (IOException e) {
		//	System.err.println("Caught IOException: " + e.getMessage());
		//}
	}
}
%>
<H3>Edit Profile</H3>

<form>
Username: <input type="text" name="userid" value="<%= part[0] %>" REQUIRED READONLY>
<br><br>
Password: <input type="password" name="password1" value="<%= part[1] %>" REQUIRED><br><br>
Verify Password: <input type="password" name="password2" value="<%= part[1] %>"  REQUIRED><br><br>
first name: <input type="text" name="fname" value="<%= part[2] %>" REQUIRED><br><br>
Last name: <input type="text" name="lname" value="<%= part[3] %>" REQUIRED><br><br>
Email: <input type="text" name="email" value="<%= part[4] %>" REQUIRED><br><br>
Description: <input type="text" name="Desc" value="<%= part[5] %>" REQUIRED><br><br>
Phone Number: <input type="number" name="phone" value="<%= part[6] %>" min="0" REQUIRED><br><br>
Address: <input type="text" name="address" value="<%= part[7] %>" REQUIRED><br><br>
<input type="submit" value="Done" name="Supdate" align="center">
</form>
</CENTER>

</div>

  <!-- ============ FOOTER SECTION ============== -->
<div id = "footer">
PTK project
</div>
</body>
</html>
