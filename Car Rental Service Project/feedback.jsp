<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.*"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<style>
  body{
  margin: 0;
  padding: 0;
  background-color:  #f3f5f9;
  box-sizing: border-box;
  list-style: none;
  text-decoration: none;
  font-family: 'Josefin Sans', sans-serif;
}

header{
  position: fixed;
  background: #22242A;
  padding: 10px;
  width: 100%;
  height: 30px;
}

.left_area h3{
  color: #fff;
  margin: 0;
  text-transform: uppercase;
  font-size: 22px;
  font-weight: 900;
}

.left_area span{
  color: #19B3D3;
}

.logout_btn{
  padding: 5px;
  background: #19B3D3;
  text-decoration: none;
  float: right;
  margin-top: -30px;
  margin-right: 40px;
  border-radius: 2px;
  font-size: 15px;
  font-weight: 600;
  color: #fff;
  transition: 0.5s;
  transition-property: background;
}

.logout_btn:hover{
  background: #0B87A6;
}

.sidebar {
  background: #2f323a;
  margin-top: 50px;
  padding-top: 30px;
  position: fixed;
  left: 0;
  width: 250px;
  height: 100%;
  transition: 0.5s;
  transition-property: left;
}

.sidebar .profile_image{
  width: 90px;
  height: 90px;
  border-radius: 100px;
  margin-bottom: 10px;
}

.sidebar h4{
  color: #ccc;
  margin-top: 0;
  margin-bottom: 20px;
}

.sidebar a{
  color: #fff;
  display: block;
  width: 100%;
  line-height: 50px;
  text-decoration: none;
  padding-left: 40px;
  box-sizing: border-box;
  transition: 0.5s;
  transition-property: background;
}

.sidebar a:hover{
  background: #19B3D3;
}

.sidebar i{
  padding-right: 10px;
}

label #sidebar_btn{
  z-index: 1;
  color: #fff;
  position: fixed;
  cursor: pointer;
  left: 300px;
  font-size: 20px;
  margin: 5px 0;
  transition: 0.5s;
  transition-property: color;
}

label #sidebar_btn:hover{
  color: #19B3D3;
}

#check:checked ~ .sidebar{
  left: -190px;
}

#check:checked ~ .sidebar a span{
  display: none;
}

#check:checked ~ .sidebar a{
  font-size: 20px;
  margin-left: 170px;
  width: 80px;
}

.content{
  margin-left: 250px;
  background: url(background.png) no-repeat;
  background-position: center;
  background-size: cover;
  height: 100vh;
  transition: 0.5s;
}

#check:checked ~ .content{
  margin-left: 60px;
}

#check{
  display: none;
}
</style>
<body background="cus.jpg">
<%
String Customer_id=(String)session.getAttribute("cid");
String Customer_Name=(String)session.getAttribute("cnm");
%>
<h2>Welcome Mr/Mrs.<%=Customer_Name %></h2>
<head>
    <meta charset="utf-8">
    <title>query report</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  </head>
  <body>

    <input type="checkbox" id="check">
    <!--header area start-->
    <header>
      <label for="check">
        <i class="fas fa-bars" id="sidebar_btn"></i>
      </label>
      <div class="left_area">
        <h3>Welcome<span> Customer</span></h3>
      </div>
      <div class="right_area">
        <a href="front.html" class="logout_btn">Logout</a>
      </div>
    </header>
    <!--header area end-->
    <!--sidebar start-->
    <div class="sidebar">
      <center>
        <img src="profile.png" class="profile_image" alt="">
      </center>
      <a href="customer.jsp"><i class="fas fa-home"></i><span>Home</span></a>
      <a href="cs.html"><i class="fas fa-envelope"></i><span>Contact</span></a>
      <a href="Booking.jsp"><i class="fas fa-taxi"></i><span>Plan My Journey</span></a>
      <a href="b.jsp"><i class="fas fa-book"></i><span>Booking</span></a>
      <a href="feedback.jsp"><i class="fas fa-comments"></i><span>Query Report</span></a>
    </div>
  </body>
  <br><br><br><br><br>
  <center><h4>Query Report</h4></center> 
<center>
<%
try {
Class.forName("oracle.jdbc.driver.OracleDriver");
out.println( "" );
Connection con = null;
PreparedStatement stmt=null;
ResultSet resultSet = null;
con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr","hr");
out.println( "" );
String sql ="SELECT * FROM CusQuery where CID=?";
stmt = con.prepareStatement(sql);

stmt.setString(1,Customer_id);

resultSet=stmt.executeQuery();
out.println(" " );
%>
<div class="column middle">
    <table align="center" cellpadding="5" cellspacing="5" border="1">
<tr bgcolor="#A52A2A">
<td><b>CUSTOMER_ID</b></td>
<td><b>Subject</b></td>
<td><b>Description</b></td>
<td><b>Feedback</b></td>
</tr>
<%
while(resultSet.next()){
	
%>
<tr bgcolor="#DEB887">
<td><%=resultSet.getString(1)%></td>
<td><%=resultSet.getString(2) %></td>
<td><%=resultSet.getString(3) %></td>
<td><%=resultSet.getString(4) %></td>
</tr>
<% 
}
con.close();
 } 
catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>

