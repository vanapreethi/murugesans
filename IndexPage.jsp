<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="Images/icon.png">
<title>Computerized Bill for Water Consumed</title>
  <link rel="icon" href="icon.png" type="image/gif">
  <style type="text/css">
  body {
        background-image: url("bluewater.jpg");
    
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
	}input[type=password]
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
    margin-
    border: none;
    color: white;
    padding: 5px 5px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;}
	
.button5 {background-color: #555555;} /* Black */

.button {
    background-color:#555555; /* Green */
    margin-
    border: none;
    color: white;
    padding: 5px 5px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}
</style>
</head>
<body>

<table align="center" border="0">
<tr> <td>
<img src="icon.png" width="100" height="100"></td> 
<td>
<h1>Computerized Bill for Water Consumed</h1> </td> </tr>
<tr align="center"> <td  colspan="2"><h3> Login</h3> </td> </tr>
<form action="IndexPage.jsp" method="post" autocomplete="off">
<tr align="center"> <td colspan="2"><input class="textbox" type="text" name="username" placeholder="username" required/></td> </tr>
<tr align="center"> <td colspan="2"><input class="textbox" type="password" name="password" placeholder=" password " required/></td> </tr>
<tr align="center"> <td colspan="2"><input  type="submit" name="Login" value="Login" />  </form>&nbsp; <button onclick="javascript:nextpage();" class="button button5"> Register</button> </td>  <td>
 </td> </tr>
</table>
<script type="text/javascript"> function nextpage(){
	window.location.href = "Register.jsp";
}</script>
</center>
<%
try {
	Class.forName("com.mysql.jdbc.Driver");		
			java.sql.Connection con=null;
			int r=0,r1=0;
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shinelogics","root","");
			 String username = request.getParameter("username");
			 String password = request.getParameter("password");
			 if(username!=null || password!=null)
			 {
									PreparedStatement st=con.prepareStatement("select * from  overalldetails where username =? and password=? and type='admin'");
									st.setString(1,username);
									st.setString(2,password);
								//	System.out.println("username"+username);
								//	System.out.println("password"+password);
									ResultSet rs=st.executeQuery();
									while(rs.next())
									{
										//System.out.println("sss"+rs.getString("type"));
										r++;
									}

									PreparedStatement st1=con.prepareStatement("select * from overalldetails where username =? and password=? and type='user' ");
									st1.setString(1,username);
									st1.setString(2,password);
									ResultSet rs1=st1.executeQuery();
									while(rs1.next())
									{
										r1++;
									}
									//System.out.println(r1);
									if(r!=0)
										{
										%>
										<script type="text/javascript">
										window.location.href = "AdminPage.jsp";
										</script>
<%
										}else if(r1!=0)
										{	            session.setAttribute("username",username);
												           response.sendRedirect("Userscreen.jsp");
}
												else
										{
										//System.out.println("available");
											%>
											<script type="text/javascript">
											alert("Please enter correct username and password");
								    		window.location.href="IndexPage.jsp"
								</script>
											<% 
													
										}
					}
		      con.close();

}
catch (SQLException e) 
{

System. out.println("SQLException caught:11 " +e.getMessage());
}
					 %>

</body>
</html>