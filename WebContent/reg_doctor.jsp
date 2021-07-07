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
	String first_name=request.getParameter("first_name"); 
	String last_name=request.getParameter("last_name"); 
	String age=request.getParameter("age");
	String gender=request.getParameter("gender");
	String street_name=request.getParameter("street_name");
	String city=request.getParameter("city_name");
	String state=request.getParameter("state_name");
	String pin=request.getParameter("pin");
	String dept=request.getParameter("department");
	String deg=request.getParameter("highest_degree");
	String fees=request.getParameter("fees");
	String pwd=request.getParameter("password");
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db?characterEncoding=latin1&useConfigs=maxPerformance","root","mypass");
	Statement st = con.createStatement();
	ResultSet rs;
	String q1 = "select * from counter where counter.user='doctor'";
	rs = st.executeQuery(q1);
	rs.next();
	int p = rs.getInt("value");
	int i= st.executeUpdate("insert into doctor values('"+p+"','"+first_name+"','"+last_name+"','"+age+"', '"+gender+"' ,'"+street_name+"','"+city+"','"+state+"','"+pin+"','"+dept+"','"+deg+"','"+fees+"','"+pwd+"') ");
	int y=p+1;
	int j = st.executeUpdate("update counter set counter.value='"+y+"' where counter.user='doctor'");
	System.out.println("Reg complete");
%>
	<center><h1>Your doctor id is <%=p%>. Please keep it saved for future.</h1></center>
	<form action="./index.html" method="get">
        <input type="submit" value="Back to Home" />
    </form> 
</body>
</html>