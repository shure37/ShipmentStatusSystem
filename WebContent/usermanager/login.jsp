<%@ page contentType="text/html; charset=gb2312" language="java" import="acount.*,database.*" errorPage="" %>
<jsp:useBean id="USER"   scope="session" class="acount.User" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Shipment Delivery Status System</title>
</head>
 

<body>
<%
  try{
		
    String username = request.getParameter("username");
	String password = request.getParameter("password");
	%>
	jjjjjjjjjj
	<%=username %><%=password %>
	 <%
	 
	 String sql = "select authority from account WHERE username= '"+username+"' and password='"+password+"'"; 
     String res[][] = new DBConnection().executeQuery(sql);
	 
	USER.login(username,password);
	if(USER.user instanceof Admin){
       response.sendRedirect("admin.jsp");
	}else{
	   response.sendRedirect("../package/courier.jsp");
	}
    
%>
<%

	
	 }catch(Exception e){
	
%>
   <%=e.getMessage()%>
  <%
   }
%>
</body>
</html>
