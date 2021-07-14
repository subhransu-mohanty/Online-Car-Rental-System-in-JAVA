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
<div class="header">
<%
String Admin_id=(String)session.getAttribute("cid");
String Admin_Name=(String)session.getAttribute("cnm");
String st="pending";
%>
<h4>Your Email:  <%=Admin_id %></h4>
<h4>  Welcome Mr.<%=Admin_Name %></h4>
<head>
  <meta charset="UTF-8">
  <title>contact query</title>
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
  <br><br><br><br>
  <center>
  	<h4> CONTACT QUERY</h4><br><br>
<%
try {
Class.forName("oracle.jdbc.driver.OracleDriver");
out.println( "" );
Connection con = null;
PreparedStatement stmt=null;
ResultSet resultSet = null;
con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr","hr");
out.println( "" );
String sql ="SELECT * FROM CusQuery where status=?";
stmt = con.prepareStatement(sql);

stmt.setString(1,st);

resultSet=stmt.executeQuery();
out.println("" );
%>
<div class="column middle">
    <table align="center" cellpadding="5" cellspacing="5" border="1">
<tr bgcolor="#A52A2A">
<td><b>CUSTOMER_ID</b></td>
<td><b>Subject</b></td>
<td><b>Description</b></td>
<td><b>Feedback</b></td>
<%
while(resultSet.next()){
	
%>
<form name="myform" method="post" action="http://localhost:9999/examples/cr/cus_fbrply.jsp">
<tr bgcolor="#DEB887">
<td><input type="text" name="cid" value="<%=resultSet.getString(1)%>" readonly></td>
<td><%=resultSet.getString(2) %></td>
<td><%=resultSet.getString(3) %></td>
<td><input type="text" name="fb"></td>
<td><input type="submit" value="Reply"></td>
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

</body>
</html>
