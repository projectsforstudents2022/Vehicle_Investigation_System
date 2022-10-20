<html> <Title> Checking Second-hand vehicle status </title>
<%@ page import ="java.sql.*" %>
<%! Connection con; ResultSet rs; Statement st; %>
<%
try{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("jdbc:odbc:vis","vis","disco");
String cmd="select rno from stolenlist where vno='"+ request.getParameter("vno")+"'";
st=con.createStatement();
rs=st.executeQuery(cmd);
if(rs.next())
{
int i=rs.getInt(1);
cmd = "insert into foundlist values("+i+",'"+
request.getParameter("vno")+"',"+
request.getParameter("wheels")+",'"+
request.getParameter("model")+"','"+
request.getParameter("oname")+"','"+
request.getParameter("addr")+"','"+
request.getParameter("email")+"',"+
request.getParameter("phone")+",'"+
request.getParameter("uname")+"','"+
request.getParameter("uaddr")+"','"+
request.getParameter("uemail")+"',"+
request.getParameter("uphone")+",SYSDATE)";
st.execute(cmd);
out.println("<font size=4 color=red><center>");
out.println("Vehicle found in 'stolen vehicles' list! ");
out.println("Do not purchase this vehicle</font>");
out.println("<hr>");
%>
<%@ include file="home.html" %>
<%
}
else
{
out.println("<center><font size=4 color=Magenta>");
out.println("No complaint against the vehicle is registered!");
out.println("<br>Vehicle may be purchased");
out.println("<br>To avail benefits of this site ");
out.println("register the vehicle after purchase ");
out.println("</font></center>");
%>
<%@ include file="home.html" %>
<%
}
}catch(Exception e)
{
e.printStackTrace();
out.println(e);

}
%>
</body>
</html>