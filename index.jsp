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
<div id="nav">
</div>

<!-- End of Navigation -->

<!-- ============ SECTION COLUMN (CONTENT) ============== -->
<div id="section"><br><br>
<center>
 Please login or sign up
<form action="./checkLogin.jsp" type="POST"><h1>
Username</h1> <input type="text" name="userid" REQUIRED><br>
<h1>Password</h1> <input type="password" name="password" REQUIRED>
<br><br><input type="submit" value="Login" align="center" name="submitbtn" id="submitbtn">
</form>
<a href="./forgetPass.jsp" name="forgetPass">Forget Password</a><br>
<a href="./signup.jsp" name="signUp">Sign up</a>
</center>
</div>


<!-- ============ FOOTER SECTION ============== -->
<div id = "footer">
PTK project
</div>
</body>
</html>