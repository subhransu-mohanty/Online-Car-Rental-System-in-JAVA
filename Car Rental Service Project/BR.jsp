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
%>
<h4>Your Email:  <%=Admin_id %></h4>
<h4>Welcome Mr.<%=Admin_Name %></h4>
 <head>
  <meta charset="UTF-8">
  <title>Booking Report</title>
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
<div class="column middle">
   <center> <h2>Enter Report Period</h2></center><br><br>
	<table align="center" cellpadding="5" cellspacing="5" border="1">
    <form name="myform" method="post" action="http://localhost:9999/examples/cr/AR.jsp">
<tr bgcolor="#A52A2A"></tr>
<tr><td>Start Date:</td><td><input type="date" name="sdt"><br><br></td></tr>
<tr><td>End Date:</td><td><input type="date" name="edt" ><br><br></td></tr>
<td><input type="submit" value="Retrive"></td>

</form>
</table>
</div>

</body>
</html>
