<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Screen</title><link rel="shortcut icon" href="Images/icon.png">
<style type="text/css">
table, td, th {    
    border: 1px solid #ddd;
    text-align: left;
}

table {
    border-collapse: collapse;
    width: 50%;
}

th, td {
    padding: 15px;
}
  body {
        background-image: url("4.jpg");
    
}
.button5 {background-color: #555555;} /* Black */

.button {
    background-color:#555555; /* Green */
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}
.textbox { 
    outline:0; 
    height:25px; 
    width: 200px; 
  }
   
  input[type=text]
{   
	width:"100%";
	padding :12px 20px;
	border-radius:10px;
	box-sizing: border-box;
	display: inline-block;
	margin: 8px 0;
	}
</style>
</head>
<body>
<h1>Computerized Bill for Your House </h1>

<script>
function logout(){
	window.location.href = "Logout.jsp";
}
function save(){
	window.print();
}
</script>
<%           
String a=session.getAttribute("username").toString();
%>


<h2> Welcome <%=a %>
 </h2>
 <%try {
		//Class.forName("oracle.jdbc.driver.OracleDriver");		
							Class.forName("com.mysql.jdbc.Driver");		

		java.sql.Connection con=null;
	//	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
						con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shinelogics","root","");

		PreparedStatement st=con.prepareStatement("select housenumber,ownername,initialreading,endreading,totalreadings, amount from overalldetails where username=?");
		st.setString(1,a);
		ResultSet rs=st.executeQuery();
		while(rs.next())
		{
		%>
 <center>
 <div>
<table border="1" width="50%" >
<tr><th>House number</th><td> <%=rs.getString(1)%></td></tr>
<tr><th> Ownername </th><td>  <%=rs.getString(2)%></td></tr>
<tr><th> Inital Readings </th><td>  <%=rs.getInt(3)%></td></tr>
<tr><th> End Readings </th><td>  <%=rs.getInt(4)%></td></tr>
<tr><th> Total Readings</th><td>  <%=rs.getInt(5)%></td></tr>
<tr><th> Total Charge </th><td>  <%=rs.getInt(6)%></td></tr>
</center>
<% }
	      con.close();
}
 catch (SQLException e) 
{

System. out.println("SQLException caught: //" +e.getMessage());
}
 %>
<tr><th> Cost per litre </th> 
  <% try {
	//Class.forName("oracle.jdbc.driver.OracleDriver");	
						Class.forName("com.mysql.jdbc.Driver");		

	java.sql.Connection con=null;
	//con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
									con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shinelogics","root","");

	PreparedStatement st=con.prepareStatement("select cost,duedate from litre where type='A'");
	ResultSet rs=st.executeQuery();
	while(rs.next())
	{	
       %> <td> <%=rs.getInt(1)%></td> </tr> </div>
       <tr> <td>Due Date </td>
       <td> <h3><%=rs.getString(2)%></h3> </td> </tr><%

	}
  }
  catch(SQLException e )
  {
	  System.out.println("Syst:"+e.getMessage());
  }
	%></table>
	<button  onclick="javascript:logout();" class="button button5">logout</button>
	<button  onclick="javascript:save();" class="button button5">Print</button>
	
</center>
</body>
</html>