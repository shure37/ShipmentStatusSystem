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
		
    String username = request.getParameter("username");
	String password = request.getParameter("password");
	
	if(username != null && username.length() > 0){
	     ((Admin)USER.user).createAcc(username,password);
	}
	
%>
<form id="form1" name="form1" method="post" action="#" target="_self" >
<table width="400px" border="0" align="center">
  <tr>
    <td width="88">Username:</td>
    <td width="302"><label>
      <input type="text" name="username" />
    </label></td>
  </tr>
  <tr>
    <td>Password:</td>
    <td><label>
      <input type="text" name="password" />
    </label></td>
  </tr>
  <tr>
    <td colspan="2"><div align="center">
      <label>
      <input type="submit" name="Submit" value="提交" />
      </label>
    </div></td>
  </tr>
</table>
</form>
<%

	
	 }catch(Exception e){
	
%>
   <%=e.getMessage()%>
  <%
   }
%>
</body>
</html>
