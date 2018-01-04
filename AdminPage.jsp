<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><%@ page import="java.util.*, java.sql.*,java.lang.*" %>
<title>Admin Page</title>
  <link rel="shortcut icon" href="Images/icon.png">
     <link rel="stylesheet" href="Design.css">
     <style type="text/css"> .button5 {background-color: #555555;} /* Black */
body {
    background-image: url("4.jpg");
}
.button {
    background-color:#555555; /* Green */
    margin-
    border: none;
    color: white;
    padding: 5px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}
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
</style>
   
</head>
  <body>
  <button onclick="javascript:logout();" class="button button5"> Logout</button> 
<script>
function logout(){
	window.location.href = "Logout.jsp";
}
</script>
         <h4 id="grid2Label">
  </h4>
  <table border="1">
  <tr>
  <td>
  <form action="Litre.jsp" method="post"><div>
  <input type="text"  name="litre" placeholder="cost per litre" required/>
  <input type="submit" name="submit" value="Change"> </div>
  </form>
  </td>
  <td>
  <form action="DueDate.jsp" method="post"><div>
  <input type="text"  name="duedate" placeholder="Change DueDate" required/>
  <input type="submit" name="submit" value="Change"> </div>
  </form>
  </td>
  </tr>
  <tr><td>  Current cost per litre is :</td>
  <% try {
	//Class.forName("oracle.jdbc.driver.OracleDriver");		
		Class.forName("com.mysql.jdbc.Driver");		

	java.sql.Connection con=null;
	//con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shinelogics","root","");

	PreparedStatement st=con.prepareStatement("select cost from litre where type='A'");
	ResultSet rs=st.executeQuery();
	while(rs.next())
	{	
       %>  <td> <%=rs.getInt(1) %>  </td><%} %>
       <td> Last Updation :</td>
       <%
       PreparedStatement st3=con.prepareStatement("select lucost from litre where type='A'");
   	ResultSet rs3=st3.executeQuery();
   	while(rs3.next())
   	{	
       %>
     <td><%=rs3.getString(1) %> </td> <%} %> </tr>   <tr> <td> Due Date :</td> <%
	
	PreparedStatement st1=con.prepareStatement("select duedate from litre where type='A'");
	ResultSet rs1=st1.executeQuery();
	while(rs1.next())
	{	
       %>  <td> <%=rs1.getString(1)%>  </td>  <%}%>
       <td> Last Updation :</td>
       <%
       PreparedStatement st4=con.prepareStatement("select luduedate from litre where type='A'");
   	ResultSet rs4=st4.executeQuery();
   	while(rs4.next())
   	{	
       %>
     <td><%=rs4.getString(1) %> </td> <%} %> </tr>	</table>  
     <%
  }
  catch(SQLException e )
  {
	  System.out.println("rr"+e.getMessage());
  }
	%>
   <table role="grid"
       aria-labelledby="grid2Label"
       class="data">
    <tbody>
      <tr>
      
        <th tabindex="-1">
        House number &nbsp &nbsp &nbsp
        </th>
        <th tabindex="-1">
          OwnerName &nbsp&nbsp&nbsp
        </th>
        <th tabindex="-1">
          StreetName &nbsp&nbsp&nbsp&nbsp
        </th>
        <th tabindex="-1">
        Username &nbsp&nbsp&nbsp
        </th>
       <th tabindex="-1">
        Initial Readings(in Litre) &nbsp&nbsp&nbsp
        </th>
        <th tabindex="-1">
        End Readings(in Litre) &nbsp&nbsp&nbsp
        </th>
        <th tabindex="-1">
        Total Consumption(Month) &nbsp&nbsp&nbsp
        </th>
      </tr>
    
<%
try {
	//Class.forName("oracle.jdbc.driver.OracleDriver");	
			Class.forName("com.mysql.jdbc.Driver");		

	java.sql.Connection con=null;
	//con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
						con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shinelogics","root","");

	PreparedStatement st=con.prepareStatement("select housenumber,ownername,streetname,username,initialreading,endreading,amount from overalldetails where type='user'");
	ResultSet rs=st.executeQuery();
	while(rs.next())
	{	
	%>
	   <tr>
	   <td>
          <%=rs.getString(1)%>
        </td>
        <td>
          <%=rs.getString(2)%>
        </td>
        <td>
          <%=rs.getString(3)%>
        </td>
        <td>
          <%=rs.getString(4)%>
        </td>
        <td>
          <%=rs.getInt(5)%>
        </td>
        <td>
          <%=rs.getInt(6)%>
        </td>
        <td>
          <%=rs.getInt(7)%>
        </td>
         </tr>
         <%          
         }
	%>
      
        
          <%
	}catch (SQLException e) 
{
	
   System. out.println("SQLException caught:" +e.getMessage());
}
%>
     <form action="AdminjspPage.jsp" method="post" >
        <h3>For Edit give Details:</h3>        	
             <input class="textbox" type="text" name="housenumber" placeholder="housenumber" value="" required/>
             
        		 <input class="textbox" type="text" name="initialReading" placeholder="InitialReading" value="" required/>
        		 <input class="textbox" type="text" name="endReading" placeholder="EndReading" value="" required/>  
        	     <div> <input class="textbox" type="submit" name="Save" value="Update"/>
        	     
        	       	</div>
               	
         </form>
  </body>
</html>