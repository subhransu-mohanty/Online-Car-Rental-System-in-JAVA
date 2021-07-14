
<%@page import="java.sql.*,java.util.*,java.text.*"%>
<%@page import="java.io.*, java.util.Date, java.util.Enumeration"%>
<%
String Admin_id=(String)session.getAttribute("cid");
String Admin_Name=(String)session.getAttribute("cnm");
%>
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
<h4>Your Email:  <%=Admin_id %></h4>
<h4>  Welcome Mr.<%=Admin_Name %></h4>
  <head>
  <meta charset="UTF-8">
  <title>succesfully add</title>
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
            <li><a href="ASS_Vch.jsp"><i class="fas fa-id-card"></i>Assign Vehicle to New Booking</a></li>
            <li><a href="BR.jsp"><i class="fas fa-book"></i>Booking Report</a></li>
            <li><a href="Cotact_Us.jsp"><i class="fas fa-address-book"></i>Manage Contact us Query</a></li>
             <li><a href="front.html"><i class="fa fa-sign-out"></i>Log Out</a></li>
        </ul>
      </div>
    </div>
<%
String rc=request.getParameter("rc");
String model=request.getParameter("model");
int sc=Integer.parseInt(request.getParameter("sc"));
String status="Available";
 try
 { 
Class.forName("oracle.jdbc.driver.OracleDriver");
out.println("Driver loaded");
Connection connection = null;
PreparedStatement stmt=null;
connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr");
out.println("connected");
String sql ="insert into vehicle (name,rc,capacity,status) values(?,?,?,?)";
 stmt = connection.prepareStatement(sql);
 stmt.setString(2,rc);
stmt.setString(1, model);
stmt.setInt(3,sc);
stmt.setString(4,status);
stmt.executeUpdate();
out.println("");
}
		catch(Exception e){
        System.out.print(e);
        e.printStackTrace();
        }
        %>
        <div class="column middle">
    <center><h4>Car Added Succesfully</h4></center>
  </div>
  </body>
  </html>