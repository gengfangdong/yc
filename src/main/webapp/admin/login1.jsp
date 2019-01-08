<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>登录</title>
		<link href="css/style.css" type="text/css" rel="stylesheet"/>
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/login.js" ></script>
	</head>
	<body>
		<div class="inp">
			<div class="imgs_u12">
				<img src="image/u12.png" />
			</div>
			<div>
				<form method="post">
					<div class="username">
						<input type="text" name="username" value="账号" id="username" onFocus="if(value==defaultValue){value='';this.style.color='#000000'}" onBlur="if(!value){value=defaultValue;this.style.color='#999999'}"/>
					</div>
					<div class="password">
						<input type="password" name="password" id="login_passPwd" />
						<input type="text" name="password" value="密码" id="login_showPwd" />
					</div>
					<!--
					<div class="password">
						<input type="password" name="password" id="pwdtext" onblur="changePwd(this)"  />
							<span style="white-space: pre;"></span>
							<input type="text" id="pwdshow" value="密码" onfocus="changePwd(this);" />
					</div>
					-->
					<div class="login">
						<input type="button" value="登          录" onclick="login();" onmouseover="this.style.backgroundColor='#FFFFFF';this.style.color='#166399'" onmouseout="this.style.backgroundColor='#166399';this.style.color='#FFFFFF'"/>
					</div>
				</form>
			</div>
		</div>
		<script>
		$(window).resize(function () {
			var screen_height=window.screen.availHeight;//屏幕可用高度
			var outer_height = window.outerHeight;//浏览器高度
			if(screen_height == outer_height){
				$("body").css('overflow-y','hidden');
			}else{
				$("body").css('overfloe-y','scroll');
			}
		});
		function login(){
			var username = document.getElementById("username").value;
		    var password = document.getElementById("login_passPwd").value;
			$.ajax({
				url : '<%=request.getContextPath()%>/IUser/loginadmin',
				type : 'post',
				data:{
					"username":username,
		        	"password":password
				},
				async:false,
		      	dataType:'json',
				success : function(data) {
					if(data.success == true){
						if(data.msg == "1"){
							 //window.open('<%=request.getContextPath()%>/admin/pages/wise/memberPage','_blank');
							 javascript:location.href='<%=request.getContextPath()%>/admin/pages/wise/memberPage';
						}else if(data.msg == "2"){
							javascript:location.href='<%=request.getContextPath()%>/admin/pages/wise/adminPage';
						}
						
					}else if(data.success == false){
						if(data.msg == "0"){
							alert("登录失败,请检查用户名和密码是否正确!");
						}
						else if(data.msg == "1"){
							alert("登录失败,用户已被锁定!");
						}
					}
						
						
				},
				error : function(error) {
					console.log('接口不通' + error);
				}
			});
			//window.open('pages/wise/newsManagement.html', '_blank', 'height='+window.screen.height+', width='+window.screen.width+', top=0, left=0, toolbar=yes, menubar=yes, scrollbars=yes, resizable=yes, location=yes, status=yes');
		}
	</script>
	</body>
</html>