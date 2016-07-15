<%@ page contentType="text/html; charset=gb2312" language="java" import="acount.*,shipment.*" errorPage="" %>
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
		
    shipment.Package[] packages= ((Courier)USER.user).showAllP();
	
%>

<table width="600" border="1" align="center">
  <tr>
    <td >ID</td>
    <td >Start Point </td>
    <td >Addres</td>
    <td >Remaintime</td>
    <td>Courier</td>
  </tr>
<%
   for(int i=0;i<packages.length;i++){
%>
  <tr>
    <td ><%=packages[i].ID%></td>
    <td ><%=packages[i].startPoint%></td>
    <td ><%=packages[i].address%></td>
    <td ><%=packages[i].remainTime%></td>
    <td ><%=packages[i].location > 0 ? (packages[i].location==99 ? "Complete" : packages[i].route[packages[i].location-1].username) : "Not start"%></td>
  </tr>
<%
   }
%>
</table>

<%

	
	 }catch(Exception e){
	 e.printStackTrace();
	
%>
   <%=e.getMessage()%>
  <%
   }
%>
</body>
</html>
