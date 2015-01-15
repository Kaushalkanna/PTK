<%@page import="Categories.HomePage"%>
<%@ page language="java"  import="Categories.*, java.io.*, java.util.*,
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
</div>

<!-- ============ LEFT COLUMN (MENU) ============== -->
<div id="nav"><br><br><center>
<h2><a href="./index.jsp">Main Page</a></h2><br></center>
</div> 
 


<!-- ============ SECTION COLUMN (CONTENT) ============== -->
<div id="section"><br><br>
<CENTER>
<% 		
try{		
HttpSession ses = request.getSession(true);
		
		String userid = request.getParameter("userid");
		String pass = request.getParameter("password");
		
		ServletContext sc = this.getServletContext();
		String path = sc.getRealPath("/WEB-INF/userInfo.txt");
		List<String> lines = new ArrayList<String>();
		FileReader fr = new FileReader(path);
		BufferedReader bf = new BufferedReader(fr);
		if(fr != null)
		{
			try {
				String aLine;
				while ((aLine = bf.readLine()) != null) {
					if(aLine.contains(userid) && aLine.contains(pass))
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
			if(userid.equals(part[0]) && pass.equals(part[1]))
			{
				ses.setAttribute("userID", userid);
				%>
				<H3>Login Success! </H3>
				click on <a href="./home.jsp">Home Page</a> to continue...
				<%
			
			}
			else
			{
				%> 
				<H3>Sorry entered either wrong Username or Password...</H3>
				click on <a href="./index.jsp">Index</a> to try again...
				<%
			}
		}
		
}catch(FileNotFoundException fio){
	%> 
	<H3>Sorry there are No Users...</H3>
	Please Sign Up , by clicking on the Sign Up option in <a href="./index.jsp">Index Page</a> 
	<%
}
	
%>
</CENTER>

</div>

<!-- ============ FOOTER SECTION ============== -->
<div id = "footer">
PTK project
</div>
</body>
</html>