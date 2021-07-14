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
  width: 200px;
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
<body background="">
<div class="header">
<%
String Admin_id=(String)session.getAttribute("cid");
String Admin_Name=(String)session.getAttribute("cnm");
String st="pending";
%>
<h4>Your Email:  <%=Admin_id %></h4>
<h4><marquee>  Welcome Mr.<%=Admin_Name %></marquee></h4>
<head>
  <meta charset="UTF-8">
  <title>Admin Home</title>
  <link rel="stylesheet" href="styles.css">
  <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
</head>
<body>

<div class="wrapper">
    <div class="sidebar">
        <h2>Welcome To Admin</h2>
        <ul>
            <li><a href="admin.jsp"><i class="fas fa-home"></i>Home</a></li>
            <li><a href="ADD_Vch.jsp"><i class="fas fa-car"></i>Add vehicle</a></li>
            <li><a href="ASS_Vch.jsp"><i class="fas fa-id-card"></i>Assign Vechile to New Booking</a></li>
            <li><a href="BR.jsp"><i class="fas fa-book"></i>Booking Report</a></li>
            <li><a href="Cotact_Us.jsp"><i class="fas fa-address-book"></i>Manage Contact us Query</a></li>
             <li><a href="front.html"><i class="fas fa-sign-out"></i>Log Out</a></li>
        </ul>
    </div>
<div class="main_content">
        <div class="header">Welcome!! Online Car rental</div>  
        <div class="info">
          <div>This project is designed to aid the car rental system to enable renting of cars through an online system. It helps the users to search for available cars view profile and book the cars for the time period. It has a user-friendly interface which helps the user to check for cars and rent them for the period specified. They could also make payment online. Th rental cars shall be categorized into economy, premium etc. Based on the type of car required by the customer, the user shall be able to make bookings. The use of internet technology has made it easy for the customers to rent a car any time. This system makes the bookings easy. It saves time and labour.The tool shall ask the user for information such as the date and time of journey, type of car etc. Also, it will need an identification number. Using these details, the tool shall help the customer to book a car for the journey.!</div>
</p>
</a>
</h4>
</p>
</a>
</h4>
</div>
</body>
</html>