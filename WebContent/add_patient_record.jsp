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
   	String symptom_descr=request.getParameter("symptom_descr");
	String[] symptoms=request.getParameterValues("symptoms");
	
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db?characterEncoding=latin1&useConfigs=maxPerformance","root","mypass");
	Statement st = con.createStatement();
	ResultSet rs;
	
	Statement st2 = con.createStatement();
	ResultSet rs2;
	
	
	String q1 = "select * from counter where counter.user='record'";
	rs = st.executeQuery(q1);
	rs.next();
	int p = rs.getInt("value");
	
	
	
	int i= st.executeUpdate("insert into record(record_id,patient_id,symptom_descr) values('"+p+"','"+session.getAttribute("uname")+"','"+symptom_descr+"') ");
	int y=p+1;
	int j = st.executeUpdate("update counter set counter.value='"+y+"' where counter.user='record'");
	for(String symptom: symptoms) {
		int s= st.executeUpdate("insert into symptom_patient(record_id,symptom) values('"+p+"','"+symptom+"') ");
	}
	
	String q2 = "SELECT R1.doctor_id as doctor_id, count(R2.record_id) as CNT FROM ( SELECT * FROM doctor WHERE doctor.department_id IN ( SELECT DISTINCT d.department_id FROM DISEASE d WHERE d.disease_id in ( SELECT disease_id FROM ( SELECT *  FROM symptom_patient WHERE symptom_patient.record_id ='"+p+"') AS R1, symptom_disease as R2 WHERE R1.symptom = R2.symptom GROUP BY disease_id HAVING count(*) = (SELECT count(*) as CNT FROM (SELECT * FROM symptom_patient WHERE symptom_patient.record_id ='"+p+"') AS R1, symptom_disease as R2 WHERE R1.symptom = R2.symptom GROUP BY disease_id ORDER BY CNT desc LIMIT 1)))) as R1 LEFT JOIN record as R2 on R1.doctor_id = R2.doctor_id GROUP BY R1.doctor_id ORDER BY CNT asc LIMIT 1"; 
	rs2 = st2.executeQuery(q2);
	if(rs2.next()) {
		int doctor_id = rs2.getInt("doctor_id");
		int add_doc = st2.executeUpdate("update record set record.doctor_id = '"+doctor_id+"' where record.record_id = '"+p+"'");
		%>
	    <h1 style="position: absolute; left: 450px; color: white;"> Appointment Booked Successfully!</h1>
	    <% 
	}
	else { %>
		<%
			Statement st3 = con.createStatement();
			Statement st4 = con.createStatement();
			String q3 = "delete from symptom_patient where record_id="+p;
			int i3 = st.executeUpdate(q3);
			
			String q4 = "delete from record where record_id="+p;
			int i4 = st.executeUpdate(q4);
			Statement st5 = con.createStatement();
			String q5 = "update counter set value="+p+" where user='record'";
			int i5 = st.executeUpdate(q5);
			%>
		<h1 style="position: absolute; left: 500px; color: white;">No available doctor!</h1>
		<div home style="float: right; width: 25%;"> 
	    <form action="./patient_home.jsp"> 
	       <button type="submit">Back to Patient Home</button>  
	    </form>
	    </div> <% 
	}
    %>
    <div home style="position:absolute;float: right;left:1150px; width: 25%;top:100px;"> 
    <form action="./patient_records.jsp"> 
       <button type="submit">View Patient Records</button>  
    </form>
    </div>
</body>     
</html>  