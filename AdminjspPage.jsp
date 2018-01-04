<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Updated</title>
</head>
<body>

 <%
 try {
	 Class.forName("com.mysql.jdbc.Driver");			
	 java.sql.Connection con=null;
		//con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
					con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shinelogics","root","");

          int rt=0;
          String initialreading=request.getParameter("initialReading");
          //System.out.println(initialreading);
          String endreading=request.getParameter("endReading");
           String housenumber=request.getParameter("housenumber");
           int cost=0;
          if(initialreading!=null && housenumber!=null && endreading!=null )
		    {
		      	//PreparedStatement st3=con.prepareStatement("");
				//rt=st3.executeUpdate(); 
				
				PreparedStatement st3=con.prepareStatement("select * from litre where type='A'");
				ResultSet rs1=st3.executeQuery(); 
				while(rs1.next())
				{
					cost=rs1.getInt(1);
				}
				int totalamt=Math.abs((Integer.parseInt(initialreading)-(Integer.parseInt(endreading)))*cost);
				int totalreadings=Math.abs(Integer.parseInt(initialreading)+Integer.parseInt(endreading));
		      	PreparedStatement st1=con.prepareStatement("UPDATE overalldetails SET  initialreading = ? , endreading = ? ,amount = ? , totalreadings = ? WHERE housenumber = ? and type='user'");
      			st1.setInt(1,Integer.valueOf(initialreading));
				st1.setInt(2,Integer.valueOf(endreading));
				st1.setInt(3,totalamt);
				st1.setInt(4,totalreadings);
				st1.setString(5,housenumber);
		rt=st1.executeUpdate(); 
      
		if(rt!=0 ){
		%>
			<script type="text/javascript">
					alert("updated sucessfully");
    		window.location="AdminPage.jsp"
</script>
<%	}	else
			{%>
			<script type="text/javascript">
			alert("Please enter availabe house number");
    		window.location="AdminPage.jsp"
</script> <%
			} 
		}
         
          con.close();
}catch (SQLException e) 
{
	
   System. out.println("SQLException caught: " +e.getMessage());
}
%>
</body>
</html>