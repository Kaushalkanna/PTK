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
<h2><a href ="./index.jsp">Index</a></h2><br></center>
</div>

 
<!-- ============ SECTION COLUMN (CONTENT) ============== -->
	<div id="section">
<br><CENTER>
<H3>Sign up Form:</H3>
<form type="" ACTION="./signupCheck.jsp">
Username: <input type="text" name="userid" REQUIRED><br><p></p>
Password: <input type="password" name="password1" REQUIRED><br><p></p>
Verify Password: <input type="password" name="password2"REQUIRED><br><p></p>

first name: <input type="text" name="fname" REQUIRED><br><p></p>
Last name: <input type="text" name="lname" REQUIRED><br><p></p>
Email: <input type="text" name="email" REQUIRED><br><p></p>
Description: <input type="text" name="Desc" REQUIRED><br><p></p>
Phone Number: <input type="number" name="phone" min="0" REQUIRED><br><p></p>
Address: <input type="text" name="address" REQUIRED><br><p></p>
<br><input type="submit" value="Sign up" align="center">
</form>

</CENTER>

</div>
  <!-- ============ FOOTER SECTION ============== -->
<div id = "footer">
PTK project
</div>
</body>
</html>