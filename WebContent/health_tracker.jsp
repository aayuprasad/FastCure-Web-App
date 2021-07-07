<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import = "java.sql.*"%>
<%@page import = "javax.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">   
<html>   
<head>  
<meta name="viewport" content="width=device-width, initial-scale=1">  
<title> Patient Health Tracker </title>  
<style>
    input, button{
    width: 200px;
    padding: 10px 10px;
    margin: 20px 0;
    position: relative;
    left: -50px;
    top: 100px;
    border-radius: 5px;
}
h2 {
	text-align: center;
}
table.center {
margin-left:auto;
margin-right:auto;
}
</style> 
</head>    
<body style="background-color: yellow; background-image: url('./bg.jpg'); background-size: 100% 100%; background-repeat: no-repeat; background-attachment: fixed;">     
    <h1 style="position: absolute; left: 450px; color: rgb(255, 255, 255);"> Patient Health Tracker </h1>
    <div style="position:absolute; left:1000px; top:-100px;">
    <form action="./logout.jsp" method="get">
            <input type="submit" value="Logout" />
    </form> 
    </div>
    <div style="position:absolute; left:1300px; top:-100px;">
    <form action="./patient_home.jsp" method="get">
            <input type="submit" class="bigg" value="Your Home" />
    </form> 
    </div>
    <%
    Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db?characterEncoding=latin1&useConfigs=maxPerformance","root","mypass");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from patient_health_tracker where patient_id = '"+session.getAttribute("uname")+"'order by time_stamp desc ");
	
    %>
    <br>,<br><br><br>
    <TABLE class="center"BORDER = "1" style="text-align:center;background-color:#F6F6F6;">
      <TR>
      <TH>Patient ID</TH>
      <TH>Timestamp</TH>
      <TH>Blood Pressure</TH>
      <TH>Oxygen Saturation Level</TH>
      <TH>Weight</TH>
      <TH>Height</TH>
      </TR>
      <% while(rs.next()){ %>
      <TR>
       <TD> <%= rs.getString(1) %></td>
       <TD> <%= rs.getString(2) %></TD>
       <TD> <%= rs.getString(3) %></TD>
       <TD> <%= rs.getString(4) %></TD>
       <TD> <%= rs.getString(5) %></TD>
       <TD> <%= rs.getString(6) %></TD>
      </TR>
      <% } %>
    <div home style="float: right; width: 25%;">
        <form action="./add_health_tracker.html" method="get">
            <input type="submit" value="Add Health Tracker" />
        </form> 
    </div> 
</body>     
</html>  