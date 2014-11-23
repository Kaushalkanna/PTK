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
	<H1 ALIGN= CENTER  > Upload </H1>
			<FORM ACTION= "AddProduct" Method = "GET" >
			<table align = "center">
				<tr>
					<td>Item name:</td>
					<td><input type='text' name='item'><br></td>
				</tr>
				<tr>
					<td>Description</td>
					<td><input type='text' name='desc'><br></td>
				</tr>
				<tr>
					<td>Type</td>
					<td><input type="radio" name="type" value="General">General
						<input type="radio" name="type" value="Sale">Sale
						<input type="radio" name="type" value="Accomodation">Accomodation
					<br></td>
				</tr>
				<tr>
					<td>Contact Number:</td>
					<td><input type='text' name='number'><br></td>
				</tr>
				<tr>
					<td>Contact emailID:</td>
					<td><input type='text' name='mail'><br></td>
				</tr>
				<tr>
					<td>Photo</td>
					<td><input type='text' name='img'><br></td>
				</tr>
				<tr>
					<td>Price:</td>
					<td><input type='number' name='price'><br></td>
				</tr>
				
				
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