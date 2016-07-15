<%@ page contentType="text/html; charset=gb2312" language="java" import="acount.*" errorPage="" %>
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
		
    User users[] = ((Admin)USER.user).showAllAcc();
	
%>

<table width="400px" border="1" align="center">
  <tr>
    <td width="88">Username</td>
    <td width="302">Password</td>
  </tr>
<%
   for(int i=0;i<users.length;i++){
%>
  <tr>
    <td width="88"><%=users[i].username%></td>
    <td width="302"><%=users[i].password%></td>
  </tr>
<%
   }
%>
</table>

<%

	
	 }catch(Exception e){
	
%>
   <%=e.getMessage()%>
  <%
   }
%>
</body>
</html>
