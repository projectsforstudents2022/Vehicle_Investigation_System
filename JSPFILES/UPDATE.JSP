<html><title> Updation in progress...</title>

<%@ page import = "java.sql.*" %>
<%! Connection con; Statement st; ResultSet rs; %>

<%
try{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con= DriverManager.getConnection("jdbc:odbc:vis","vis","disco");
String s1=request.getParameter("oname");
String s2=request.getParameter("email");
String s3=request.getParameter("phone");
String s4=request.getParameter("addr");
String s5=request.getParameter("myrno");

String cmd = "update rvehicles set oname='"+s1+"',email='"+
 s2+"',phone="+ s3 +",ownadd='"+ s4 +"' where rno="+s5;
%>


<%
 st=con.createStatement();
 st.execute(cmd);

 out.println("<center> <font color=red size=6>Record updated</font></center>");
 out.println("<hr>");
%>
<%@include file="home.html" %>

<%
}
catch(Exception e)
{
out.println(e);
e.printStackTrace();
}
%>
</body>
</html>

     
