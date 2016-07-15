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
	String startpoint = request.getParameter("startpoint");	
    String route = request.getParameter("route");
	String shipmethod = request.getParameter("shipmethod");
	
	if(route != null && route.length() > 0){
	     int ID = ((Courier)USER.user).createP( startpoint, route, Integer.parseInt(shipmethod) );
  %><%="Package ID:"+ID+" has created."%><%
	}
	
%>
<form id="form1" name="form1" method="post" action="#" target="_self" >
<table width="400px" border="0" align="center">
  <tr>
    <td width="120">Start Point:</td>
    <td width="180"><label>
      <input type="text" name="startpoint" />
    </label></td>
	<td width="100">&nbsp;</td>
  </tr>
  <tr>
    <td width="120">Route:</td>
    <td width="180"><label>
      <input type="text" name="route" />
    </label></td>
	<td width="100">Example:1,2,3</td>
  </tr>
  
  <tr>
    <td>Ship Method:</td>
    <td><label>
      <input type="text" name="shipmethod" />
    </label></td>
	<td width="100">Example:1</td>
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
