<html><Title> CARD project </title> 
 <body>
<%@ page import = "java.sql.*" %>
<%! Connection con; Statement st; ResultSet rs,rs1; %>
<%
try{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con = DriverManager.getConnection("jdbc:odbc:vis","vis","disco");
String cmd = "select vno,email from rvehicles where rno='"+
             Integer.parseInt( request.getParameter("rno")) +"'";
st=con.createStatement();
rs=st.executeQuery(cmd);
if(!rs.next())
{%>
<h2> Wrong Registraton Number. Retype <h2>
<%@ include file="stolen.html" %>
<%
} else
{
String myvno = rs.getString(1); 
String mymail = rs.getString(2);
String[] mon={"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC" };
String monval=mon[Integer.parseInt(request.getParameter("month"))-1];

String dst = "'"+request.getParameter("day")
             +"-"+monval+
                "-"+request.getParameter("year")+"'";


cmd = "insert into stolenlist values("+request.getParameter("rno")+",'"
         +myvno+"',"+dst+")";
st.execute(cmd); 
%>
<font size=5 color=red>
Your vehicle registered in 'stolen vehicles' database. When information about it is available we will inform you to the following email address <br><Center><u> <%= mymail %> </center></u>
You can also check the whereabouts from  <a href="trace.html"> here</a><hr>
<%@ include file="home.html" %>
<% 
 }
}catch(Exception e)
{
e.printStackTrace();
out.println(e);
}
       %>
</html>

