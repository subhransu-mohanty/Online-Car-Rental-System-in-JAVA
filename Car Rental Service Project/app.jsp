<%@page import="java.sql.*,java.util.*,java.text.*"%>
<%@page import="java.io.*, java.util.Date, java.util.Enumeration" %>
<%
int Booking_id=Integer.parseInt(request.getParameter("Booking_id"));
out.print(Booking_id);
String st="cancle";
        
        try {
			
			 
	  
Class.forName("oracle.jdbc.driver.OracleDriver");
out.println( "Driverloaded" );
Connection connection = null;
PreparedStatement stmt=null;
connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr","hr");
out.println( "Database Connected" );
String sql ="update booking set STATUS=? where BOOKING_ID=?";
 stmt = connection.prepareStatement(sql);

stmt.setString(1,st);
stmt.setInt(2,Booking_id);
stmt.executeUpdate();
out.println( "status updated" );
}
	catch(Exception e){
        System.out.print(e);
        e.printStackTrace();
        }
        %>
		<body bgcolor="#76b852">
		
			<%
		response.sendRedirect("b.jsp");
		%>