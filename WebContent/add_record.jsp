<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import = "java.sql.*"%>
<%@page import = "javax.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html>   
<head>  
<meta name="viewport" content="width=device-width, initial-scale=1">  
<title> Add Record </title> 
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
    Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db?characterEncoding=latin1&useConfigs=maxPerformance","root","mypass");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select distinct symptom from symptom_disease");
    %>
    <h1 style="position: absolute; left: 450px; color: white;"> Enter Symptoms </h1>
    <div home style="float: right; width: 25%;"> 
    <form action="./add_patient_record.jsp" method="post"> 
            <input type="text" placeholder="Enter Symptom Description" name="symptom_descr">  <br> <br> <br>
            <div style="position:absolute; left:1000px;"><h3>Select one or more symptoms by pressing and holding Ctrl key</h3></div> <br> <br> <br>
            <select class="multiple" name="symptoms" multiple="multiple">
                <%  while(rs.next()){ %>
		            <option><%= rs.getString(1)%></option>
		        <% } %>
            </select>
            <br>
            <button type="submit">Submit</button>  
    </form>     
    </div>
</body>     
</html>  