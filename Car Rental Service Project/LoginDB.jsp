<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%
String user=request.getParameter("id1");
out.println(user);
String pass=request.getParameter("pass1");
out.println(pass);

try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
out.println( "" );
PreparedStatement stmt=null;
ResultSet resultSet = null;  
String ut= null; 
String csid=null;
String cname=null;
String mob=null;
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr","hr");
out.println( "Database Connected" );
String sql ="select * from user12 where email=? and password=?";
 stmt = con.prepareStatement(sql);

stmt.setString(1,user);
stmt.setString(2,pass);


resultSet=stmt.executeQuery();
out.println( "Statemnt Executed" );
while(resultSet.next()){
	
    
	  ut = resultSet.getString("USERTYPE");
	  csid=resultSet.getString("EMAIL");
	  cname=resultSet.getString("NAME");
	  mob=resultSet.getString("MOBILE");

	out.println(ut);
}
session.setAttribute("cid",csid);
session.setAttribute("cnm",cname);
session.setAttribute("cmob",mob);
if(ut.equals("admin"))
  response.sendRedirect("admin.jsp");
else if(ut.equals("driver"))
	response.sendRedirect("driver.jsp");
else if(ut.equals("customer"))
	response.sendRedirect("customer.jsp");
else
	out.println("Check your id and Password");
		}
catch(Exception e){
       System.out.print(e);
        e.printStackTrace();
        }
%>
