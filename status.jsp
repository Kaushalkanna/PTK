<html>
<body>
<%@ page language="java"  import="java.io.*, java.util.*, java.text.*" %>
<META http-equiv="REFRESH" content="15">
<form action="/status/status" >
<input type="hidden" name="name" value="PTK">
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


			//SortedSet<String> keys = new TreeSet<String>(e.keySet());
            //for (String key : keys) { 
            //String[] value = e.get(key);
TreeMap<String, String[]> tMap = new TreeMap<String,String[]>(e);
NavigableMap<String, String[]> nmap=tMap.descendingMap();
   for (Map.Entry<String, String[]> entry : nmap.entrySet())
// for(K key: map.keySet()) 
{
    String key = entry.getKey(); 
	String[] value = entry.getValue();
			%>
			
          <div style="background-color:black; color:white; margin:10px; padding:10px;">
<%= value[1] %>
</br>
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-by "<%= value[0]%>" <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= value[2] %>
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