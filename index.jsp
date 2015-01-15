<%@ page language="java"  import="java.io.*, java.util.*,
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