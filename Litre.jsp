<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
     <%@ page import="java.text.SimpleDateFormat"%>
<%@ page import=" java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<%
String cost=request.getParameter("litre");
SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	Date date = new Date();
	String currentdate=formatter.format(date);
int r=0;
try {
	if(cost!=null)
	{
	//Class.forName("oracle.jdbc.driver.OracleDriver");		
			Class.forName("com.mysql.jdbc.Driver");		

	java.sql.Connection con=null;
	//con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
					con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shinelogics","root","");

PreparedStatement st=con.prepareStatement("UPDATE litre SET cost = ? , lucost=? where type ='A'");
//System.out.println(Integer.valueOf(cost));
st.setInt(1,Integer.valueOf(cost));
st.setString(2,currentdate);
r=st.executeUpdate(); 
//System.out.println(r);
if(r!=0)
{%>
<script type="text/javascript">
alert("updated sucessfully");
window.location="AdminPage.jsp"
</script>
<%	
	
}
else
{%>
<script type="text/javascript">
alert("Error");
window.location="AdminPage.jsp"
</script> <%
	
}
con.close();}
}
catch(SQLException e)
{
	System.out.println(e.getMessage());
}%>
</body>
</html>