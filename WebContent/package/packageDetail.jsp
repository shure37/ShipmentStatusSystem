<%@ page contentType="text/html; charset=gb2312" language="java" import="shipment.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Shipment Delivery Status System</title>
<link href="../css/basic.css" rel="stylesheet" type="text/css" />
</head>
<body>
 <%
 try{
		
 
    String packageID = request.getParameter("package");
	
    if(packageID != null && packageID.length() > 0){
	   shipment.Package pack = new shipment.Package();
       pack.search(Integer.parseInt(packageID));
%>


<table  border="0">
  <tr>
    <td>ID</td>
    <td><%=pack.ID%></td>
  </tr>
  <tr>
    <td>ʣ��ʱ��</td>
    <td><%=pack.remainTime%></td>
  </tr>
  <tr>
    <td>��ʼ�ص㣺</td>
    <td><%=pack.startPoint%></td>
  </tr>
  <tr>
    <td>��ǰ�ص㣺</td>
    <td><%=pack.address%></td>
  </tr>
  <tr>
    <td>���ͷ�ʽ��</td>
    <td><%=pack.shipmethod%></td>
  </tr>
  <tr>
    <td colspan="2"><table width="100%" border="0">
<%
for(int i=0;i<pack.route.length;i++){
%>
        <tr>
          <td colspan="2">���·��<%=i+1%>��</td>
        </tr>
        <tr>
          <td>���:</td>
          <td><%=pack.route[i].location%></td>
		</tr>
		<tr>
		  <td>�յ�:</td>
          <td><%=pack.route[i].destation%></td>
		</tr>

		<tr>
		  <td>���Ա:</td>
          <td><%=pack.route[i].username%></td>
		 </tr>
		 <tr>
		  <td>����:</td>
          <td><%=pack.route[i].distance%></td>
		 </tr>
	
<%
  
 }
%>
      </table></td>
  </tr>

</table>
<%
}
	
	 }catch(Exception e){
	
%>
   <%=e.getMessage()%>
  <%
   }
%>
</body>
</html>
