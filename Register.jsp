<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="Images/icon.png">
     <link rel="stylesheet" href="Design.css">
<style type="text/css">
  body {
        background-image: url("4.jpg");
    
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
	 input[type=submit]
 {
 background-color:#555555; /* Green */
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    }</style>
<title>Registration Page</title>
 
</head>
<body>
<center><h1>Registration</h1></center>
<center><form action="Register.jsp" method="post" autocomplete="off" >
<input class="textbox" type="text" name="HouseNumber" placeholder="HouseNumber " required /><br>
<input class="textbox" type="text" name="HouseOwnerName" placeholder="HouseOwnerName " required/><br>
<input class="textbox" type="text" name="username" placeholder="username "required/><br>
<input class="textbox" type="text" name="streetname" placeholder=" streetname "required/><br>
<input class="textbox" type="password" name="password" placeholder=" password "required/><br>
<input class="textbox" type="submit" name="finish" value="finish" /><br>
</form>
</center>
<%		int r=0;
		try {
			//Class.forName("oracle.jdbc.driver.OracleDriver");	
					Class.forName("com.mysql.jdbc.Driver");		

			java.sql.Connection con=null;
			//con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
								con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shinelogics","root","");

		    String HouseNumber = request.getParameter("HouseNumber");
		    String HouseOwnerName = request.getParameter("HouseOwnerName");
		    String username = request.getParameter("username");
		    String streetname = request.getParameter("streetname");
		    String password = request.getParameter("password");
		    int count=0;
		    if(HouseNumber!=null || HouseOwnerName!=null|| username!=null || password!=null)
		    {	
		    	
		    	PreparedStatement st1=con.prepareStatement("select * from overalldetails where housenumber=? and username=? and streetname=?" );
				st1.setString(1,HouseNumber);
				st1.setString(2,username);
				st1.setString(3,streetname);
		    	ResultSet r1=st1.executeQuery();
				while(r1.next())
				{
					count++;
				}
				if(count!=0)
					{
						%> <script type="text/javascript">
		    			alert("housenumber or username is already exists please try another name");
					window.location.href='Register.jsp';

				</script><%
				}
				else if(count==0)
				{
				    	PreparedStatement st=con.prepareStatement("insert into overalldetails (housenumber,ownername,username,password,type,streetname) values(?,?,?,?,?,?)");
						st.setString(1,HouseNumber);
						st.setString(2,HouseOwnerName);
						st.setString(3,username);
						st.setString(4,password);
						st.setString(5,"user");
						st.setString(6,streetname);
						r=st.executeUpdate();
						if(r!=0)
							{ %>
							<script type="text/javascript">
							alert("Register Successfully");
							window.location.href='IndexPage.jsp';
							</script>
							}else{
					<% 
				%><script type="text/javascript">
					alert("Error occur.. try another data");
					window.location.href='IndexPage.jsp';
					</script><%
					}
					//System.out.println("failure");
			   con.close();
   			}
		}
		}
		catch (SQLException e) 
		{
		
		   
			   System.out.println("Error ::" + e.getMessage());
		}
			   %>
			   
			 
			  
		
 
</body>
</html>