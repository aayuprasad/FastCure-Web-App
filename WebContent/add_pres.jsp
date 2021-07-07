<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import = "java.sql.*"%>
<%@page import = "javax.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html>   
<head>  
<meta name="viewport" content="width=device-width, initial-scale=1">  
<title> Add Pres </title> 
<style>
    input, button, select{
    width: 200px;
    padding: 10px 10px;
    margin: 5px 0;
    position: relative;
    left: -50px;
    top: 10px;
    border-radius: 5px;
}
    select
    {
        width: 225px;
    }
</style>
</head>    
<body style="background-color: yellow; background-image: url('./bg.jpg'); background-size: 65% 100%; background-repeat: no-repeat; background-attachment: fixed;">    
   <%
   String pres = request.getParameter("pres");
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db?characterEncoding=latin1&useConfigs=maxPerformance","root","mypass");
    Statement st = con.createStatement();
    int i= st.executeUpdate("update record set prescription = '"+pres+"' where record_id = " +session.getAttribute("recordid"));
    
    %>
    <h1 style="position: absolute; left: 450px; color: white;"> Prescription Added Successfully! </h1>
    <div home style="float: right; width: 25%;"> 
    <form action="./appointments.jsp"> 
         <button type="submit">Back to Appointments</button>  
    </form>     
    </div>
</body>     
</html>  