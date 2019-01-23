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

<input id="text" type="text" value="http://www.taxlead.cn/show/dist/html/openPage/showOnlieClasses.jsp?figClass_id=<%=figClass_id %>" style="height:23px;line-height:23px;width:100%;border-radius:5px;border:1px solid #ccc;background:#fff;" disabled="disabled" /><br />
<div>
	<p>提交成功！</p>
	<p>您可以使用微信扫描此二维码，发送到您的工作群或朋友圈，请相关单位参与拼班</p>
	<p>平台上同时将您的拼班信息发布在“拼班”模块</p>
	<p>其他用户登录平台也可以在上述模块参与您发起的拼班</p>
</div>
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