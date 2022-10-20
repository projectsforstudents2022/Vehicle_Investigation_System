<html>
<body>
<%@ page import = "java.sql.*" %>
<%! Connection con; Statement st; ResultSet rs,rs1; %>
<%
int i=0; String d="";
  try{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("jdbc:odbc:vis","vis","disco");
String cmd= "select RNO from rvehicles where VNO='"+
             request.getParameter("vno")+"'";

st=con.createStatement();
rs=st.executeQuery(cmd);
if(!rs.next())
{

cmd="select rnoseq.nextval from dual";
rs1=st.executeQuery(cmd);
if(rs1.next())
 i =  rs1.getInt(1) ; 
String thisvno = request.getParameter("vno");
int thiswh = Integer.parseInt( request.getParameter("wheels") );
String thismodel = request.getParameter("model");
String thisrtono =request.getParameter("rtono");
String thisoname=request.getParameter("oname");
String thisemail=request.getParameter("email");
int  thisphone=Integer.parseInt( request.getParameter("phone"));
String thisaddr=request.getParameter("addr");
cmd = "insert into rvehicles(rno,vno,wheels,vtype,rtono,oname,"
            + "email,phone,ownadd,regdate)  values(" +i+",'"+                    thisvno+"',"+thiswh+
            ",'"+thismodel+"','"+thisrtono+"','"+thisoname+
            "','"+thisemail+"',"+thisphone+",'"+thisaddr+
              " ',SYSDATE)" ;
st.execute(cmd);
%>
<h3> Registration Successful </h3>
<h4> Remember the following registration number for future 
reference </h4> <font size=5 color=red> 
<%=  i %>
<p><hr>
<%@ include file="home.html"  %> 
<%
}else
{
String s=rs.getString(1); %>
<h2> The vehicle is already registered with the number
<%= s %> .</h2>
<font size=5 color=red> Enter correct vehicle number.
<%@ include file="newreg.html" %>
<% 
}
}catch(Exception e)
{
e.printStackTrace(); 
out.println(" "+e);

} %>


</body>
</html>