<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import = "java.sql.*"%>
<%@page import = "javax.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">   
<html>   
<head>  
<meta name="viewport" content="width=device-width, initial-scale=1">  
<title> Patient Home Page </title>  
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
    <h1 style="position: absolute; left: 600px; color: rgb(10, 10, 10);"> Patient Home Page</h1>
    <%
    Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db?characterEncoding=latin1&useConfigs=maxPerformance","root","mypass");
	Statement st = con.createStatement();
	Statement st2=  con.createStatement();
	ResultSet rs = st.executeQuery("select * from patient where patient_id = '"+session.getAttribute("uname")+"' ");
	ResultSet rs2 = st2.executeQuery("select * from patient_pno where patient_id = '"+session.getAttribute("uname")+"' ");
	rs.next();
    %>
    <div style="position: absolute; left:550px; top:400px;">
    <br><br><br><br>
    <TABLE class="center" BORDER = "1" cellpadding="10" style="text-align:center;background-color:#feffcf;">
    
    <tr>
    <td><h2>Name </h2></td><td><h2>Age </h2> </td><td><h2>Gender </h2> </td><td><h2>Street</h2></td><td><h2>City </h2> </td><td><h2>State </h2></td><td><h2>Pin </h2> </td>
    </tr>
    
    <tr>
    <td><%=rs.getString(2)%>&nbsp<%=rs.getString(3)%></td>
    <td><%=rs.getString(4)%></td>
    <td><%=rs.getString(5)%></td>
    <td><%=rs.getString(6)%></td>
    <td><%=rs.getString(7)%></td>
    <td><%=rs.getString(8)%></td>
    <td><%=rs.getString(9)%></td>
    </tr>
    </TABLE>
    </div>
    
    <div style="position: absolute; left:1300px; top:400px;">
		<br><br>
      <TABLE class="center" BORDER = "1" cellpadding="10" style="text-align:center;background-color:#feffcf;">
      <TR>
      <TH>Patient ID</TH>
      <TH>Phone Number</TH>
      </TR>
      <% while(rs2.next()){ %>
      <TR>
       <TD> <%= rs2.getString(1) %></td>
       <TD> <%= rs2.getString(2) %></TD>
      </TR>
      <% } %>
      </TABLE>   	
    </div>
    
    <div style="position:absolute; left:1000px; top:-100px;">
    <form action="./logout.jsp" method="get">
            <input type="submit" value="Logout" />
    </form> 
    </div>
    
    <div home style="position: relative; top:350px; left:200px; width: 25%;">
     
        <form action="./patient_records.jsp" method="get">
            <input type="submit" value="View Patient Records" />
        </form>   
        <form action="./health_tracker.jsp" method="get">
            <input type="submit" value="View Patient Health Tracker" />
        </form>      
        <form action="./add_patient_pno.html" method="get">
            <input type="submit" value="Add Patient Phone Number" />
        </form>  
    </div> 
</body>     
</html>  