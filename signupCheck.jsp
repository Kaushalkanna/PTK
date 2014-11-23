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
</div>

<!-- ============ LEFT COLUMN (MENU) ============== -->
<div id="nav"><br><br><center>
<h2><a href ="./index.jsp">Index</a></h2><br></center>
</div>

<!-- ============ SECTION COLUMN (CONTENT) ============== -->
	<div id="section">
<BR>
<CENTER>
<%   	
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
		<a href="./signup.jsp">SignUp Page</a>
	 <%
	 
	 }

        ServletContext sc = this.getServletContext();
        String path = sc.getRealPath("/WEB-INF/userInfo.txt");

		File file = new File(path);
		BufferedReader br = new BufferedReader(new FileReader(path));
		boolean found = false;	
		String line = null;
		while ((line = br.readLine()) != null) {
        
			if (line.contains(UserId)){
			found= true;
				%>
				<BR><BR>
				<H3>User Already exist, Please try different user<BR>
				<STRONG>(<%= UserId%>)</STRONG></H3>
				<a href="./signup.jsp">SignUp Page</a>
				<%
				break;
			}
			
		}
		if(found == false){
			PrintWriter outt = new PrintWriter(
				new FileWriter(file, true));
			outt.println(UserId + "," + Password1 + "," 
			+ Fname + "," + Lname + "," + Email + "," + Desc +
			"," + phone + "," + address + "\n");        
			outt.close();
			%>
			<H3>You Have successfully registered.<BR>
			Go to main page to login</H3>
			<a href="./index.jsp">main Page</a>
			<%
		}
%></CENTER>

</div>
  <!-- ============ FOOTER SECTION ============== -->
<div id = "footer">
PTK project
</div>
</body>
</html>