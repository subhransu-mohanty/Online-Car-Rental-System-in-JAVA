<%@page import="java.sql.*,java.util.*,java.text.*"%>
<%@page import="java.io.*, java.util.Date, java.util.Enumeration" %>
<%
String cid=request.getParameter("cid");
out.print(cid);
String fb=request.getParameter("fb");
out.print(fb);
String st="replied";
        
        try {
			
			 
	  
Class.forName("oracle.jdbc.driver.OracleDriver");
out.println("Driverloaded" );
Connection connection = null;
PreparedStatement stmt=null;
connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr","hr");
out.println( "Database Connected" );
String sql ="update CusQuery set FEEDBAK=? , STATUS=? where CID=?";
 stmt = connection.prepareStatement(sql);

stmt.setString(1,fb);
stmt.setString(2,st);
stmt.setString(3,cid);
stmt.executeUpdate();
out.println( "Replied");
}
	catch(Exception e){
        System.out.print(e);
        e.printStackTrace();
        }
        %>
		<%
		response.sendRedirect("admin.jsp");
		%>
		