<%@page import="java.sql.*,java.util.*,java.text.*"%>
<%@page import="java.io.*, java.util.Date, java.util.Enumeration" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {font-family: "Lato", sans-serif;
background-color: #d7f5f9;
}
.sidebar {
  height: 100%;
  width: 160px;
  position: fixed;
  z-index: 1;
  top: 20%;
  left: 0;
  background-color: #434343;
  overflow-x: hidden;
  padding-top: 30px;
}

.sidebar a {
  padding: 6px 8px 6px 14px;
  text-decoration: none;
  font-size: 21px;
  color: #818181;
  display: block;
}

.sidebar a:hover {
  color: #f1f1f1;
}

.main {
  margin-left: 160px; /* Same as the width of the sidenav */
  padding: 0px 10px;
}

@media screen and (max-height: 450px) {
  .sidebar {padding-top: 15px;}
  .sidebar a {font-size: 18px;}
}
</style>
</head>
<body background="drivr.jpg">
<%
String Driver_id=(String)session.getAttribute("cid");
String Driver_Name=(String)session.getAttribute("cnm");
String Driver_mob=(String)session.getAttribute("cmob");
String sd=request.getParameter("sdt");
out.print(sd);
String ed=request.getParameter("edt");
out.print(ed);

      SimpleDateFormat d=new SimpleDateFormat("yyyy-MM-dd");
      Date sdt=d.parse(sd);          
      java.sql.Date sdt1 = new java.sql.Date(sdt.getTime());


      SimpleDateFormat e=new SimpleDateFormat("yyyy-MM-dd");
      Date edt=e.parse(ed);          
      java.sql.Date edt1 = new java.sql.Date(edt.getTime());
%>
<h4> Welcome Mr.<%=Driver_Name %></h4>
<h4>Your Email:  <%=Driver_id %></h4>
 <div class="sidebar">
  <a href="driver.jsp"><i class="fa fa-fw fa-home"></i> Home</a><br><br>
  <a href="DR.jsp"><i class="fa fa-money"></i> Commision</a><br><br>
  <a href="c.jsp"><i class="fa fa-book"></i> Booking</a><br><br>
  <a href="front.html"><i class="fa fa-sign-out"></i> LogOut</a>
</div>
 <center>
<%
try {
Class.forName("oracle.jdbc.driver.OracleDriver");
out.println( "DriverLoaded" );
Connection con = null;
PreparedStatement stmt=null;
ResultSet resultSet = null;
con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr","hr");
out.println( "Connected" );
String sql ="select count(BOOKING_ID) NoOfBookings, sum(PRICE) TotalFare, sum(price)*0.3 DriverComm from booking where DRNO=? AND DOJ between ? AND ?";
stmt = con.prepareStatement(sql);
stmt.setString(1,Driver_mob);
stmt.setDate(2,sdt1);
stmt.setDate(3,edt1);

resultSet=stmt.executeQuery();
out.println("Retrived " );
%>
<div class="column middle">
    <table align="center" cellpadding="5" cellspacing="5" border="1">
<tr bgcolor="#A52A2A">
<tr><th colspan="4">Report</th><tr>
<td><b>NoOfBookings</b></td>
<td><b>TotalFare</b></td>
<td><b>YourComm</b></td>
<%
while(resultSet.next()){
	
%>
<tr bgcolor="#DEB887">
<td><%=resultSet.getInt(1)%></td>
<td><%=resultSet.getInt(2) %></td>
<td><%=resultSet.getInt(3) %></td>
</tr>
</form>
<% 
}
con.close();
 } 
catch (Exception e1) {
e1.printStackTrace();
}
%>
</div>
</body>
</html>
