<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
	String figClass_id = request.getParameter("figclass_id");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>领税教育网</title>
  <link rel="icon" href="../assets/img/logo.ico" type="image/x-icon"/>
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
    <div class="am-form" data-am-validator>
      <div class="am-form-group" style="border-bottom: 2px #1E9FFF solid;">
        <label for="register_loginName"><i class="am-icon-user" style="color: #1E9FFF;"></i></label>
        <input type="text" id="register_loginName" minlength="11" maxlength="11" placeholder="输入登录名称" required/>
      </div>

      <div class="am-form-group" style="border-bottom: 2px #1E9FFF solid;">
        <label for="doc-vld-pwd-1"><i class="am-icon-key" style="color: #1E9FFF;"></i></label>
        <input type="password" id="doc-vld-pwd-1" placeholder="输入密码" required/>
      </div>
      <button class="am-btn am-btn-secondary"  onclick="login();"  style="background: #1E9FFF;border-color: #1E9FFF;">登录</button>
      <button class="am-btn am-btn-secondary"  onclick="register();"  style="background: #1E9FFF;border-color: #1E9FFF;margin:10px auto 0;">注册</button>
    </div>
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
					<%-- javascript:location.href='<%=request.getContextPath()%>/show/dist/';
					return false; --%>
						<% if(figClass_id!=null){%>
								javascript:location.href='<%=request.getContextPath()%>/show/dist/html/openPage/showOnlieClasses.jsp?figClass_id=<%=figClass_id%>';
							<%}else{%>
								javascript:location.href='<%=request.getContextPath()%>/';
						<%}%>
               		
				}else
					alert("登录失败!");
					
				
			},
			error : function(error) {
				console.log('接口不通' + error);
			}
		});
  }
  function register(){
	  javascript:location.href='<%=request.getContextPath()%>/show/dist/html/register.jsp';
  }
  
  </script>
</body>
</html>
