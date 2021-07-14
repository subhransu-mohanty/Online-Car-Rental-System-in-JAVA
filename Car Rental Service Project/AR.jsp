<%@page import="java.sql.*,java.util.*,java.text.*"%>
<%@page import="java.io.*, java.util.Date, java.util.Enumeration" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.*"%>
<!DOCTYPE html>
<html lang="en">
<style>
  @import url('https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap');

*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  list-style: none;
  text-decoration: none;
  font-family: 'Josefin Sans', sans-serif;
}

body{
   background-color: #f3f5f9;
}

.wrapper{
  display: flex;
  position: relative;
}

.wrapper .sidebar{
  width: 180px;
  height: 100%;
  background: #4b4276;
  padding: 30px 0px;
  position: fixed;
}

.wrapper .sidebar h2{
  color: #fff;
  text-transform: uppercase;
  text-align: center;
  margin-bottom: 30px;
}

.wrapper .sidebar ul li{
  padding: 15px;
  border-bottom: 1px solid #bdb8d7;
  border-bottom: 1px solid rgba(0,0,0,0.05);
  border-top: 1px solid rgba(255,255,255,0.05);
}    

.wrapper .sidebar ul li a{
  color: #bdb8d7;
  display: block;
}

.wrapper .sidebar ul li a .fas{
  width: 25px;
}

.wrapper .sidebar ul li:hover{
  background-color: #594f8d;
}
    
.wrapper .sidebar ul li:hover a{
  color: #fff;
}
 
.wrapper .sidebar .social_media{
  position: absolute;
  bottom: 0;
  left: 50%;
  transform: translateX(-50%);
  display: flex;
}

.wrapper .sidebar .social_media a{
  display: block;
  width: 40px;
  background: #594f8d;
  height: 40px;
  line-height: 45px;
  text-align: center;
  margin: 0 5px;
  color: #bdb8d7;
  border-top-left-radius: 5px;
  border-top-right-radius: 5px;
}

.wrapper .main_content{
  width: 100%;
  margin-left: 200px;
}

.wrapper .main_content .header{
  padding: 20px;
  background: #fff;
  color: #717171;
  border-bottom: 1px solid #e0e4e8;
}

.wrapper .main_content .info{
  margin: 20px;
  color: #717171;
  line-height: 25px;
}

.wrapper .main_content .info div{
  margin-bottom: 20px;
}
</style>
</head>
<body background="admn.jpg">
<%
String Admin_id=(String)session.getAttribute("cid");
String Admin_Name=(String)session.getAttribute("cnm");
String sd=request.getParameter("sdt");
String ed=request.getParameter("edt");


      SimpleDateFormat d=new SimpleDateFormat("yyyy-MM-dd");
      Date sdt=d.parse(sd);          
      java.sql.Date sdt1 = new java.sql.Date(sdt.getTime());


      SimpleDateFormat e=new SimpleDateFormat("yyyy-MM-dd");
      Date edt=e.parse(ed);          
      java.sql.Date edt1 = new java.sql.Date(edt.getTime());
%>
<h4>Your Email:  <%=Admin_id %></h4>
<h4>  Welcome Mr.<%=Admin_Name %></h4>
 <head>
  <meta charset="UTF-8">
  <title>Report</title>
  <link rel="stylesheet" href="styles.css">
  <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
</head>
<body>

<div class="wrapper">
    <div class="sidebar">
        <h2>Welcome To Admin</h2>
        <ul>
            <li><a href="admin.jsp"><i class="fas fa-home"></i>Home</a></li>
            <li><a href="ADD_Vch.jsp"><i class="fas fa-taxi"></i>Add vehicle</a></li>
            <li><a href="ASS_Vch.jsp"><i class="fas fa-id-card"></i>Assign Vechile to New Booking</a></li>
            <li><a href="BR.jsp"><i class="fas fa-book"></i>Booking Report</a></li>
            <li><a href="Cotact_Us.jsp"><i class="fas fa-address-book"></i>Manage Contact us Query</a></li>
             <li><a href="front.html"><i class="fa fa-sign-out"></i>Log Out</a></li>
        </ul>
    </div>
  </div>
</body>
<br><br>
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
String sql ="select count(BOOKING_ID) NoOfBookings, sum(PRICE) TotalFare, sum(price)*0.6 Profit, sum(price)*0.3 DriverComm,  (sum(price)*0.6-sum(price)*0.3) NetProfit from booking where DOJ between ? AND ?";
stmt = con.prepareStatement(sql);

stmt.setDate(1,sdt1);
stmt.setDate(2,edt1);

resultSet=stmt.executeQuery();
out.println(" " );
%>
<div class="column middle">
    <table align="center" cellpadding="5" cellspacing="5" border="1">
<tr bgcolor="#A52A2A">
<tr><th colspan="4">Report</th><tr>
<td><b>NoOfBookings</b></td>
<td><b>TotalFare</b></td>
<td><b>DriverComm</b></td>
<td><b>NetProfit</b></td>
<%
while(resultSet.next()){
	
%>
<tr bgcolor="#DEB887">
<td><%=resultSet.getInt(1)%></td>
<td><%=resultSet.getInt(2) %></td>
<td><%=resultSet.getInt(3) %></td>
<td><%=resultSet.getInt(4)%></td>

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

</body>
</html>
