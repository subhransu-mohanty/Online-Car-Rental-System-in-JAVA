
<%@page import="java.sql.*,java.util.*,java.text.*"%>
<%@page import="java.io.*, java.util.Date, java.util.Enumeration"%>
<%
String Customer_id=(String)session.getAttribute("cid");
out.println(Customer_id);
String Customer_Name=(String)session.getAttribute("cnm");
%>
<h2>Welcom Mr.<%=Customer_Name%></h2>
<%
String src=request.getParameter("src");
out.println(src);
String dstn=request.getParameter("dstn");
out.println(dstn);
String doj=request.getParameter("doj");
out.println(doj);
String km=request.getParameter("km");
out.println(km);
String price=request.getParameter("price");
out.println(price);
String passenger=request.getParameter("sc");
out.println(passenger);
String jt=request.getParameter("jt");
out.println(jt);
String status="booked";
        try {
			SimpleDateFormat d=new SimpleDateFormat("yyyy-MM-dd");
      Date dt=d.parse(doj);          

      java.sql.Date sqlDate = new java.sql.Date(dt.getTime());
	  
Class.forName("oracle.jdbc.driver.OracleDriver");
out.println("");
Connection connection = null;
PreparedStatement stmt=null;
Statement st=null;
ResultSet resultSet = null; 
connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr");
out.println("");
String sql ="insert into booking (BOOKING_ID,CUSTOMER_ID,SOURCE,DESTINATION,DOJ,KM,PRICE,PASSENGER,STATUS,JT) values (booking_id.nextval,?,?,?,?,?,?,?,?,?)";
String sql1="select * from booking where BOOKING_ID=(select max(BOOKING_ID) from booking)";
 stmt = connection.prepareStatement(sql);
 st=connection.createStatement();
stmt.setString(1,Customer_id);
stmt.setString(2, src);
stmt.setString(3,dstn);
stmt.setDate(4,sqlDate);
stmt.setString(5,km);
stmt.setString(6,price);
stmt.setString(7,passenger);
stmt.setString(8,status);
stmt.setString(9,jt);
stmt.executeUpdate();
out.println("");
resultSet = st.executeQuery(sql1);
out.println("");
while(resultSet.next()){
	 resultSet.getInt("BOOKING_ID");
%>
<h2>Your Booking Id :<%=resultSet.getInt("BOOKING_ID")%></h2>
<%
}
		}
		catch(Exception e){
        System.out.print(e);
        e.printStackTrace();
        }
        %>
		<%
		response.sendRedirect("customer.jsp");
		%>
        <h2 align="center"><font><strong>booking registration successfully</strong></font></h2><br>