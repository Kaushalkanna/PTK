<html>
<body>
<%@ page language="java"  import="java.io.*, java.util.*, java.text.*" %>

<form action="/status/status" >
Name : <input type="text" name="name">
<br />
Status : <input type="text" name="status" />
<input type="submit" value="POST" />
</form>





      
	 
	
<%

HashMap<String , String[]> e = null;
File f = new File("statusfile.ser");
if(f.isFile()) { 
      try
      {
         FileInputStream fileIn = new FileInputStream("statusfile.ser");
         ObjectInputStream infil = new ObjectInputStream(fileIn);
         e = (HashMap<String , String[]>) infil.readObject();
         infil.close();
         fileIn.close();
		
      }catch(IOException i)
      {
         i.printStackTrace();
         return;
      }catch(ClassNotFoundException c)
      {
       
         c.printStackTrace();
         return;
      }

/* for (String name: e.keySet()){

            String key =name.toString();
            String[] value = e.get(name); */


			SortedSet<String> keys = new TreeSet<String>(e.keySet());
for (String key : keys) { 
   String[] value = e.get(key);
   

			%>
			
          <div style="background-color:black; color:white; margin:10px; padding:10px;">
<%= value[1] %>
<br>-by "<%= value[0]%>" <br><%= value[2] %>
</div>
<%

} 




}
else
	  {
%>
<H3>Be the first person to update status</h3>
<%
	  }


%>

	





</body>
</html>