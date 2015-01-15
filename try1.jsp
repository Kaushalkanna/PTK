<%@ page language="java"  import=" java.io.*, java.util.*, java.text.*" %>
<html>
<body>
<H3>Friend Request Sent to : <%= request.getParameter("name")%></H3>
<%
String con = request.getParameter("name");
%>
<H3>Friend Request Sent to : <%= con%></H3>
<p>Go back to <a href="home.jsp" class="link">application home</a>.</p>
</body>
</html>