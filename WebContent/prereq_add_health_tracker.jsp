<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import = "java.sql.*"%>
<%@page import = "javax.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registered</title>
<style>
    input{
    width: 200px;
    padding: 10px 10px;
    margin: 20px 0;
    position: relative;
    left: 850px;
    top: 100px; 
    border-radius: 5px;
}
    marquee
    {
        width: 60%;
        position: relative;
        top: 500px;
        font-size: 60px;
        font-weight: bolder;
    }
</style> 
</head>
<body bgcolor="yellow">
<% 
	String bp=request.getParameter("bp"); 
	String osl=request.getParameter("osl"); 
	String height=request.getParameter("height");
	String weight=request.getParameter("weight");
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db?characterEncoding=latin1&useConfigs=maxPerformance","root","mypass");
	Statement st = con.createStatement();
	int i = st.executeUpdate("insert into patient_health_tracker(patient_id,time_stamp,bp,oxygen_saturation_level,weight,height) values('"+session.getAttribute("uname")+"',NOW(),'"+bp+"','"+osl+"','"+weight+"','"+height+"') ");
	System.out.println("Hello!");
%>
	<center><h1>Patient Health Tracker Info Added! Continue to Appointment Booking!</h1></center>
	<div style="position: absolute; left: -150px; top:100px;">
	<form action="./add_record.jsp" method="get">
        <input type="submit" value="Add Symptoms" />
    </form> 
    </div>
</body>
</html>