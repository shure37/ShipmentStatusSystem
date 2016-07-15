<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:useBean id="USER"   scope="session" class="acount.User" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Shipment Delivery Status System</title>
<link href="../css/basic.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" language="javascript" src="../script/jquery-1.3.2.min.js"></script>
<script language="javascript">
<!--
var oplist = new Array('createp','showp','updatep');

$(document).ready(function() {
	$('#nav').find("a").click(function() {
	
		$.each(oplist, function(i, n) {
			$('#'+n).attr('class', 'inactive');
		});
		$(this).parents("li").attr('class', 'active');
	  
		
	});
	resetMenuPosition();
});
function resetMenuPosition(){
	 var bodyWidth = parseInt(document.body.clientWidth);
	
	 var logoWidth = parseInt($('#top_logo').css('width'));
	
	 var menuWidth = parseInt($('#menu_cnt').css('width'));

	 if(logoWidth+menuWidth > bodyWidth )
	     $('#menu_cnt').css('left',bodyWidth-menuWidth);
	 else
	 	   $('#menu_cnt').css('left',logoWidth);
}


function createP(){
   var frm = (document.getElementById('ifrObj'));
 
   frm.src = "createPackage.jsp";
	
}
function updateP(){
   var frm = (document.getElementById('ifrObj'));
 
   frm.src = "updatePackage.jsp";
	
}
function showAllP(){
   var frm = (document.getElementById('ifrObj'));
 
   frm.src = "showAllPackage.jsp";
	
}


-->
</script>
</head>

<body onResize="resetMenuPosition()">
<div>
<div id="top">
<div id="top_logo">
</div>
<div id="menu_cnt">
        <div id="menu_left"></div>
	    <div id="nav" >
	    <ul> 
	 	
        <li class="active" id="createp">  <a title="Create" style="cursor:hand" href="#" onClick="createP();">Create Package</a></li>
        <li class="inactive" id="updatep">  <a title="Create" style="cursor:hand" href="#" onClick="updateP();">Update Package</a></li>
		<li class="inactive" id="showp">  <a title="Create" style="cursor:hand" href="#" onClick="showAllP();">Show Package</a></li>		
		
	    </ul>
	    </div>	    <div id="menu_right"></div>

</div>

</div> 
  <div id="main">
   <ul>
   
  <li>
  <iframe id="ifrObj" src="createPackage.jsp" frameborder="0" width="100%" height="400px"></iframe>
  </li>
  </ul>
</div>
 
</body>

</html>
