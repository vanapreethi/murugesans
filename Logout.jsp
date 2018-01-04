<%@page contentType="text/html" pageEncoding="UTF-8"%> <html> <head> <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>LogOut Page</title> </head> 
 <body> <% 
 session.removeAttribute("username"); 
 session.removeAttribute("password"); 
 session.invalidate(); %> 
 <script type="text/javascript">
	alert("logout successfully");
				window.location="IndexPage.jsp"
								</script></body> </html>

