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
</div>

<!-- ============ LEFT COLUMN (MENU) ============== -->
<div id="nav"><br><br><center>
<h2><a href ="index.jsp">Index</a></h2><br></center>
</div> 
 
 
<!-- ============ SECTION COLUMN (CONTENT) ============== -->
<div id="section"><br><br><CENTER>
<%
if(request.getParameter("Spass") !=null)
{
    String UserId = request.getParameter("userid");
	String Lname= request.getParameter("lname");       
	String Email= request.getParameter("email");

	ServletContext sc = this.getServletContext();
	String path = sc.getRealPath("/WEB-INF/userInfo.txt");
	List<String> lines = new ArrayList<String>();
	FileReader fr = new FileReader(path);
	BufferedReader bf = new BufferedReader(fr);
	try {
		String aLine;
		while ((aLine = bf.readLine()) != null) {
			if(aLine.contains(UserId) && aLine.contains(Lname) && aLine.contains(Email))
			{
				lines.add(aLine);
			}
		}
	
	} finally 
	{
		bf.close();
	}		
	StringBuilder comma = new StringBuilder();
	for ( int i = 0; i< lines.size(); i++){
		comma.append(lines.get(i));
		if ( i != lines.size()-1){
		comma.append(",");
		}
	}
	String input = comma.toString();
	String part[] = input.split(",");
	if(part[0].equals(UserId) && part[3].equals(Lname) && part[4].equals(Email))
	{
		%>
		Your password is<STRONG><font color="red"><p><%= part[1] %></p>
		</font></STRONG>
		<%
	}
	else
	{
	%>
		<STRONG><font color="red"><p>Sorry one of the inputs is incorrect please 
			make sure about them</p></font></STRONG>
		<%
	}
}
%>

<p>Here is a form where you can get your password. 
For your security please change the password as soon as you login.</p>
<form>
Username: <input type="text" name="userid" REQUIRED >
<br><p></p>
Last name: <input type="text" name="lname" REQUIRED><br><p></p>
Email: <input type="text" name="email" REQUIRED><br><p></p>
<input type="submit" value="Show Password" name="Spass" align="center"><br><p></p>
</form>
</CENTER>

</div>
<!-- ============ FOOTER SECTION ============== -->
<div id = "footer">
PTK project
</div>
</body>
</html>