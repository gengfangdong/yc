<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
	String figClass_id=request.getParameter("figClass_id");
%>
<title>Cross-Browser QRCode generator for Javascript</title>
		<link rel="icon" href="../../../../image/logo.ico" type="image/x-icon"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
<script type="text/javascript" src="../../../../qrcodejs-master/jquery.min.js"></script>
<script type="text/javascript" src="../../../../qrcodejs-master/qrcode.js"></script>
</head>
<body>
<input id="text" type="text" value="http://39.96.70.152/show/dist/html/openPage/showOnlieClasses.jsp?figClass_id=<%=figClass_id %>" style="height:23px;line-height:23px;width:100%;border-radius:5px;border:1px solid #ccc;background:#fff;" disabled="disabled" /><br />
<div id="qrcode" style=" margin-top:15px;margin-left:35%;"></div>

<script type="text/javascript">
var qrcode = new QRCode(document.getElementById("qrcode"), {
	width : 300,
	height : 300
});

function makeCode () {		
	var elText = document.getElementById("text");
	
	if (!elText.value) {
		alert("Input a text");
		elText.focus();
		return;
	}
	
	qrcode.makeCode(elText.value);
}

makeCode();

$("#text").
	on("blur", function () {
		makeCode();
	}).
	on("keydown", function (e) {
		if (e.keyCode == 13) {
			makeCode();
		}
	});
</script>
</body>