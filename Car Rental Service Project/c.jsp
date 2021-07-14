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
  width: 144px;
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

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.*"%>

<%
String Customer_id=(String)session.getAttribute("cid");
String Customer_Name=(String)session.getAttribute("cnm");
String mob=(String)session.getAttribute("cmob");
String st="confirmed";
%>
<h2> Your MOB :<%=mob%></h2>
<h4> Welcome Mr.<%=Customer_Name%></h4>
<%

try {
Class.forName("oracle.jdbc.driver.OracleDriver");
out.println( "" );
Connection con = null;
PreparedStatement stmt=null;
ResultSet resultSet = null;
%>
<body>
<div class="sidebar">
  <a href="driver.jsp"><i class="fa fa-fw fa-home"></i> Home</a><br><br>
  <a href="DR.jsp"><i class="fa fa-money"></i> Commision</a><br><br>
  <a href="c.jsp"><i class="fa fa-book"></i> Booking</a><br><br>
  <a href="front.html"><i class="fa fa-sign-out"></i> LogOut</a>
</div>

<h2 align="center"><font><strong>-:BOOKING DETAILS:-</strong></font></h2>
<table align="center" cellpadding="1" cellspacing="1" border="0.3">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b> BOOKING_ID</b></td>
<td><b>CUSTOMER_ID</b></td>
<td><b>SOURCE</b></td>
<td><b>DESTINATION</b></td>
<td><b>DOJ</b></td>
<td><b>KM</b></td>
<td><b>PRICE</b></td>
<td><b>PASSENGER</b></td>
<td><b>VEHICLE</b></td>
<td><b>STATUS</b></td>
<td><b>DRNO</b></td>
<td><b>JT</b></td>
<%
con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr","hr");
out.println( "database connected" );
String sql ="SELECT * FROM booking where status=? and (drno IS NULL or drno=?)";
stmt = con.prepareStatement(sql);
stmt.setString(1,st);
stmt.setString(2,mob);
resultSet=stmt.executeQuery();
out.println( "" );
while(resultSet.next()){
  
%>
<form name="myform" method="post" action="http://localhost:9999/examples/cr/d.jsp">
<tr bgcolor="#DEB887">
<td><input type="text" name="Booking_id" value="<%=resultSet.getInt(1)%>" readonly>  </td>
<td><%=resultSet.getString(2) %></td>
<td><%=resultSet.getString(3) %></td>
<td><%=resultSet.getString(4) %></td>
<td><%=resultSet.getDate(5)   %></td>
<td><%=resultSet.getString(6) %></td>
<td><%=resultSet.getString(7) %></td>
<td><%=resultSet.getString(8) %></td>
<td><%=resultSet.getString(9) %></td>

<td><%=resultSet.getString(10) %></td>
<td><%=resultSet.getString(11) %></td>
<td><%=resultSet.getString(12) %></td>
<td><input type="submit" value="Accept"></td>
</tr>
</form>
<% 
}
con.close();

} 
catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<button onclick="myFunction()">Print this page</button>

<script>
function myFunction() {
    window.print();
}
</script>


</body>