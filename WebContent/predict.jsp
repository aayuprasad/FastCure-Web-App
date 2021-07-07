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
    <h1 style="position: absolute; left: 500px; color: rgb(10, 10, 10);"> Patient Record Details and Predicted Diseases</h1>
    <%
    Integer record_id=Integer.parseInt(request.getParameter("record_id"));
    Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db?characterEncoding=latin1&useConfigs=maxPerformance","root","mypass");
	Statement st = con.createStatement();
	Statement st2 = con.createStatement();
	ResultSet rs = st.executeQuery("select * from record where record_id = '"+record_id+"' ");
	ResultSet rs2 = st2.executeQuery("select * from symptom_patient where record_id = '"+record_id+"' ");
	rs.next();		
    %>
    <br><br><br><br>
    <div home style="float: left; width: 75%;">
    <br><br>
    <TABLE class="center"BORDER = "1" style="text-align:center;background-color:#F6F6F6;">
    <TR>
      <TH>Record ID</TH>
      <TH>Patient ID</TH>
      <TH>Doctor ID</TH>
      <TH>Symptom Description</TH>
      <TH>Prescription</TH>
      <TH>Record Date</TH>
      </TR>
      <TR>
       <TD> <%= rs.getString(1) %></td>
       <TD> <%= rs.getString(2) %></TD>
       <TD> <%= rs.getString(3) %></TD>
       <TD> <%= rs.getString(4) %></TD>
       <TD> <%= rs.getString(5) %></TD>
       <TD> <%= rs.getString(6) %></TD>
      </TR>
      </TABLE>
      <br><br>
      <TABLE class="center" BORDER = "1" style="text-align:center;background-color:#F6F6F6;left:300px;"">
      <TR>
      <TH>Record ID</TH>
      <TH>Symptom</TH>
      </TR>
      <% while(rs2.next()){ %>
      <TR>
       <TD> <%= rs2.getString(1) %></td>
       <TD> <%= rs2.getString(2) %></TD>
      </TR>
      <% } %>
      </TABLE>  
    </div>
    <%
      Statement st4 = con.createStatement();
      String q4 = "SELECT d.disease_id, d.disease_name, d.fatality, d.disease_type FROM ( SELECT *  FROM symptom_patient WHERE symptom_patient.record_id = "+record_id+") AS R1, symptom_disease as R2, disease d WHERE R1.symptom = R2.symptom AND d.disease_id = R2.disease_id GROUP BY d.disease_id HAVING count(*) = (SELECT count(*) as CNT FROM (SELECT * FROM symptom_patient WHERE symptom_patient.record_id = "+record_id+" ) AS R1, symptom_disease as R2 WHERE R1.symptom = R2.symptom GROUP BY disease_id ORDER BY CNT desc LIMIT 1)";
      ResultSet rs4 = st4.executeQuery(q4);
    %>
        <br><br><br><br>
        <div home style="float: left; width: 100%;">
        	<br>
		     <TABLE class="center" BORDER = "1" style="text-align:center;background-color:#F6F6F6;left:300px;"">
		      <TR>
		      <TH>ID</TH>
		      <TH>Name</TH>
		      <TH>Fatality</TH>
		      <TH>Type</TH>
		      </TR>
		      <% while(rs4.next()){ %>
		      <TR>
		       <TD> <%= rs4.getString(1) %></td>
		       <TD> <%= rs4.getString(2) %></TD>
		       <TD> <%= rs4.getString(3) %></td>
		       <TD> <%= rs4.getString(4) %></TD>
		      </TR>
		      <% } %>
		      </TABLE> 
		      
      </div>
</body>     
</html>  