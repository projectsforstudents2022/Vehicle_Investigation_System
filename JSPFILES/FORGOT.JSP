<html><title>Forgot password?</title>
<%@ page import="java.sql.*" %>
<%! Connection con; Statement st; ResultSet rs; %>
<%
try{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("jdbc:odbc:vis","vis","disco");
String cmd = "select rno from rvehicles where vno='"+ request.getParameter("vno")+"'";
st=con.createStatement();
rs=st.executeQuery(cmd);
if(rs.next())
{
%>
<h2>Your Register number is : <%= rs.getInt(1) %> </h2>
<br><hr> <%@ include file="home.html" %>
<%
}
else{
%>
<h2>No vehicle registered with this number!</h2>
<h3>Type correct Vehicle number</h3>
<br><hr> <%@ include file="forgot.html" %>
<%
}
}
catch(Exception e)
{
e.printStackTrace();
out.println(e);
}
%>
</body></html>



