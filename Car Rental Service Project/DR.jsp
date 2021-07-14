
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
%>
<h4>Your Email:  <%=Driver_id %></h4>
<h4>Your Mob:  <%=Driver_mob %></h4>
<h4>  Welcome Mr.<%=Driver_Name %></h4>
<div class="sidebar">
  <a href="driver.jsp"><i class="fa fa-fw fa-home"></i> Home</a><br><br>
  <a href="DR.jsp"><i class="fa fa-money"></i> Commision</a><br><br>
  <a href="c.jsp"><i class="fa fa-book"></i> Booking</a><br><br>
  <a href="front.html"><i class="fa fa-sign-out"></i> LogOut</a>
</div>
<div class="column middle">
    <center><h2>-:Enter Report Period:-</h2></center><br><br>
	<table align="center" cellpadding="5" cellspacing="5" border="1">
    <form name="myform" method="post" action="http://localhost:9999/examples/cr/DR_DB.jsp">
<tr bgcolor="#A52A2A"></tr>
<tr><td>Start Date:</td><td><input type="date" name="sdt" ><br><br></td></tr>
<tr><td>End Date:</td><td><input type="date" name="edt" ><br><br></td></tr>
<td><input type="submit" value="Retrive"></td>

</form>
</table>
</div>

</body>
</html>
