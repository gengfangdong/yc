<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>中央财经大学</title>
  <link rel="stylesheet" href="../assets/css/amazeui.css" />
  <link rel="stylesheet" href="../assets/css/other.min.css" />
  <link rel="stylesheet" href="../assets/css/myStyle.css" />
  <script src="../assets/js/jquery-2.1.0.js"></script>
</head>
<body class="login-container">
  <div class="login-box">
    <div class="logo-img">
      <img src="../assets/img/logo.png" alt="" />
    </div>
    <form action="" class="am-form" data-am-validator>
      <div class="am-form-group" style="border-bottom: 2px #1E9FFF solid;">
        <label for="register_loginName"><i class="am-icon-user" style="color: #1E9FFF;"></i></label>
        <input type="text" id="register_loginName" minlength="11" maxlength="11" placeholder="输入登录名称" required/>
      </div>

      <div class="am-form-group" style="border-bottom: 2px #1E9FFF solid;">
        <label for="doc-vld-pwd-1"><i class="am-icon-key" style="color: #1E9FFF;"></i></label>
        <input type="password" id="doc-vld-pwd-1" placeholder="输入密码" required/>
      </div>
      <button class="am-btn am-btn-secondary"  onclick="login();"  style="background: #1E9FFF;border-color: #1E9FFF;">登录</button>
    </form>
  </div>

  <script>
  function login(){
    var username = document.getElementById("register_loginName").value;
    var password = document.getElementById("doc-vld-pwd-1").value;
	  $.ajax({
			url : '<%=request.getContextPath()%>/IUser/login',
			type : 'post',
			data:{
				"username":username,
        		"password":password
			},
			async:false,
      		dataType:'json',
			success : function(data) {
				if(data.success == true){
					 window.open('<%=request.getContextPath()%>/show/dist/','_blank');
				}
				
			},
			error : function(error) {
				console.log('接口不通' + error);
			}
		});
  }
  
  </script>
</body>
</html>
