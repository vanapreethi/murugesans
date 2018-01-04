<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    <%@ page import="java.text.SimpleDateFormat"%>
<%@ page import=" java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%	
try {
	//Class.forName("oracle.jdbc.driver.OracleDriver");	
		Class.forName("com.mysql.jdbc.Driver");		

	java.sql.Connection con=null;
	//con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
					con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shinelogics","root","");

      int r=0;
      String duedate=request.getParameter("duedate");
      SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
  		Date date = new Date();
  		String currentdate=formatter.format(date);

      if(duedate !=null)
      {
      PreparedStatement st=con.prepareStatement("UPDATE litre SET  duedate = ? , luduedate = ? where type='A'");
			st.setString(1,duedate);
			st.setString(2,currentdate);
          r=st.executeUpdate();       
		if(r!=0 ){
				%>
					<script type="text/javascript">
						alert("updated sucessfully");
    					window.location="AdminPage.jsp"
					</script>
<%			}	
		else
			{
				%>
			<script type="text/javascript">
			alert("Please enter availabe house number");
    		window.location="AdminPage.jsp"
</script> <%
			} 
         
          con.close();
      }}catch (SQLException e) 
{
	
   System. out.println("SQLException caught: 5" +e.getMessage());
}%>
</body>
</html>