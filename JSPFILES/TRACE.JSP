<html><title>Tracing stolen vehicle</title>
<%@ page import = "java.sql.*" %>
<%! Connection con; ResultSet rs; Statement st;  %>
<%
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("jdbc:odbc:vis","vis","disco");
String cmd = "select * from foundlist where rno="+ request.getParameter("rno");
st=con.createStatement();
rs=st.executeQuery(cmd);
if(rs.next())
{
out.println("<font color=red size=4><center>");
out.println("Whereabouts of the vehicle can be");
out.println("obtained from the following addresses :<br>");
out.println("<u>First Address</u> : <br>");
out.println("<br>Name : "+rs.getString(5));
out.println("<br>Address:"+rs.getString(6));
out.println("<br>E-mail:"+ rs.getString(7));
out.println("<br>Phone:"+rs.getString(8));
out.println("<br><u>Second address</u>: <br>");
out.println("<br>Name:"+rs.getString(9));
out.println("<br>Address:"+rs.getString(10));
out.println("<br>E-mail:"+rs.getString(11));
out.println("<br>Phone:"+rs.getString(12));
out.println("</font></center><hr>");
%> <%@ include file="home.html" %> <%

}
else
{
out.println("<font size=4 color=Magenta><center>");
out.println("Vehicle still not traced.<br></center> <hr>");
%>
<%@ include file="home.html" %>
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