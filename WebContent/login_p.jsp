<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<%@page import = "javax.sql.*"%>
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Validate</title>
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
	String uname=request.getParameter("patient_id"); 
	String pass=request.getParameter("password"); 
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db?characterEncoding=latin1&useConfigs=maxPerformance","root","mypass");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery(" select * from patient where patient_id = '"+uname+"' ");
	if(rs.next())
	{
		if( rs.getString(10).equals(pass) ) 
		{ 
			session.setAttribute("uname",uname);
			response.sendRedirect("./patient_home.jsp"); %> 
			<!-- <center><h1>Success</h1></center>
			<form action="./patient_home.html" method="get">
		        <input type="submit" value="Patient Home" />
		    </form>  -->
		<%}
		else 
		{%>
			<center><h1>Wrong password</h1></center>
			<div style="position: absolute; left: -150px; top:100px;">
			<form action="./login_patient.html" method="get">
		        <input type="submit" value="Retry Login" />
		    </form> 
		    </div>
		<%}
	}
	else 
	{%>
		<center><h1>Error</h1></center>
	<div style="position: absolute; left: 0px; top:100px;">
		<form action="./index.html" method="get">
        <input type="submit" value="Back to Home" />
    	</form>
    </div>
	<% }
%>

</body>
</html>