
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
<body>
<%
String Driver_id=(String)session.getAttribute("cid");
String Driver_Name=(String)session.getAttribute("cnm");
String Driver_mob=(String)session.getAttribute("cmob");
%>
<h4>Your Email:  <%=Driver_id %></h4>
<h4>Your Mob:  <%=Driver_mob %></h4>
<h2><marquee>  Welcome Mr.<%=Driver_Name %></marquee></h2>
<div class="sidebar">
  <a href="driver.jsp"><i class="fa fa-fw fa-home"></i> Home</a><br><br>
  <a href="DR.jsp"><i class="fa fa-money"></i> Commision</a><br><br>
  <a href="c.jsp"><i class="fa fa-book"></i> Booking</a><br><br>
  <a href="front.html"><i class="fa fa-sign-out"></i> LogOut</a>
</div>

<div class="main">
  <h2>Welcome to Driver..</h2>
  <marquee behavior="scroll" direction="down">
<p>A car rental is a vehicle that can be used temporarily for a period of time with a fee.. After these details are worked out, the individual renting the car must present a valid Identification Card..</p>
  <p> Renting a car assists people to get around even when they do not have access to their own personal vehicle or don't own a vehicle at all..</p>
  <p>The individual who want to rent a car must first contact the car rental company for the desire vehicle. This can be done online. At this point, this person has to supply some information such as; dates of rental, and type of car.</p></marquee>
</div>
     
</body>
</html> 
