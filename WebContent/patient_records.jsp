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
     input.bigg {
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
input.small{
width=100px;
}
table.center {
margin-left:auto;
margin-right:auto;
}
</style> 
</head>    
<body style="background-color: yellow; background-image: url('./bg.jpg'); background-size: 100% 100%; background-repeat: no-repeat; background-attachment: fixed;">     
    <div style="position:absolute; left:1000px; top:-100px;">
    <form action="./logout.jsp" method="get">
            <input type="submit" class="bigg" value="Logout" />
    </form> 
    </div>
    <div style="position:absolute; left:1300px; top:-100px;">
    <form action="./patient_home.jsp" method="get">
            <input type="submit" class="bigg" value="Your Home" />
    </form> 
    </div>
    <h1 style="position: absolute; left: 450px; color: rgb(255, 255, 255);"> Patient Records </h1>
    <%
    Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db?characterEncoding=latin1&useConfigs=maxPerformance","root","mypass");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from record where patient_id = '"+session.getAttribute("uname")+"' order by rec_date desc");
    %>
    <br><br><br><br>
    <div home style="float: left; width: 75%;">
    <TABLE class="center" BORDER = "1" style="text-align:center;background-color:#F6F6F6;left:300px;"">
      <TR>
      <TH>Record ID</TH>
      <TH>Patient ID</TH>
      <TH>Doctor ID</TH>
      <TH>Symptom Description</TH>
      <TH>Prescription</TH>
      <TH>Record Date</TH>
      <TH>View Record Details</TH>
      </TR>
      <% while(rs.next()){ %>
      <TR>
       <TD> <%= rs.getString(1) %></td>
       <TD> <%= rs.getString(2) %></TD>
       <TD> <%= rs.getString(3) %></TD>
       <TD> <%= rs.getString(4) %></TD>
       <TD> <%= rs.getString(5) %></TD>
       <TD> <%= rs.getString(6) %></TD>
	   <TD> 
	   <form action="./record_details.jsp"> 
	   <input type="hidden"name="record_id"value=<%= rs.getString(1)%>>		
	   <button type="submit">View Record Details</button>  
	   </form> 
	   </TD>
      </TR>
      <% } %>
      </TABLE>
      </div>
    <div home style="float: right; width: 25%;">
        <form action="./prereq_add_health_tracker.html" method="get">
            <input type="submit" value="Book Appointment" class="bigg" />
        </form> 
    </div> 
</body>     
</html>  