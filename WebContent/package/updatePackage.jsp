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
	String pack = request.getParameter("package");	
    String addres = request.getParameter("addres");
	
	if(pack != null && pack.length() > 0){
	      ((Courier)USER.user).updateP(  Integer.parseInt(pack), addres );
	}
	
%>
<form id="form1" name="form1" method="post" action="#" target="_self" >
<table width="400px" border="0" align="center">
  <tr>
    <td width="120">Package ID:</td>
    <td width="280"><label>
      <input type="text" name="package" />
    </label></td>
	
  </tr>
  <tr>
    <td width="120">Addres:</td>
    <td width="280"><label>
      <input type="text" name="addres" />
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
