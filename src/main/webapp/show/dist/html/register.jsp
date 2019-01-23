<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="entity.IUser" %>
<%
	IUser user = (IUser)session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>领税教育网</title>
		<link rel="icon" href="../assets/img/logo.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="../assets/css/amazeui.css"/>
    <link rel="stylesheet" href="../assets/css/common.min.css"/>
    <link rel="stylesheet" href="../assets/css/other.min.css"/>
    <link rel="stylesheet" href="../assets/css/myStyle.css"/>
    <style>
        .register-name {
            color: #14426a;
        }
        input{
        	border-radius:10px!important;
        }
        #getCode:hover{
        	color:#1E9FFF;
        }
        #getCode{
        	width:37%;
        	margin-left:2%;
        	height:37px;
        	border-radius:5px;
        	border:1px solid #ccc;
        	background:#fafafa;
        }
    </style>
</head>
<body class="register-container">
<div class="layout">
    <!--===========layout-header================-->
    <div class="layout-header am-hide-sm-only">
        <!--topbar start-->
        <div class="topbar" style="background: #FFFFFF;">
            <div class="container" style="width: auto!important;">
                <div class="am-g">
                    <div class="am-u-md-8">
                        <div class="topbar-left">
                            <!--<i class="am-icon-globe"></i>-->
                            <div class="am-dropdown" data-am-dropdown
                                 style="height: 35px;line-height: 35px;color: #000000;">
                                联系电话+86-010-83951120 / 83951097
                            </div>
                        </div>
                    </div>
                    <div class="am-u-md-4">
                        <div class="topbar-right am-text-right am-fr">
                          <% if(user != null&&"1".equals(user.getIsadmin())) {%><a style="color: #000000;">欢迎 &nbsp;&nbsp; <%=user.getUser_name()%>&nbsp;</ a>
										<a href ="/admin/pages/wise/adminPage/noticeAnnouncement" style="color:#000000;">个人中心</ a>
										<a href="<%=request.getContextPath()%>/Logout" style="color: #000000;">注销</ a>
									<%}else if(user != null&&"0".equals(user.getIsadmin())){ %>
										<a style="color: #000000;">欢迎 &nbsp;&nbsp; <%=user.getUser_name()%>&nbsp;</ a>
										<a href ="<%=request.getContextPath()%>/admin/pages/wise/memberPage/memberMessage" style="color:#000000;">个人中心</ a>
										<a href="<%=request.getContextPath()%>/Logout" style="color: #000000;">注销</ a>
									<%} %>
									<% if(user == null) {%><a href="<%=request.getContextPath()%>/show/dist/html/login.jsp" style="color: #000000;">登录</ a>
										<a href ="<%=request.getContextPath()%>/admin/login.jsp" style="color:#000000;">个人中心</ a>
									<%}; %>
										<a href="<%=request.getContextPath()%>/show/dist/html/register.jsp" style="color: #000000;">注册</ a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--topbar end-->

        <div class="header-box" data-am-sticky style="box-shadow: rgb(136, 136, 136) 0px 1px 5px;z-index: 999999;">
            <!--header start-->
            <div class="container" style="width: auto!important;">
                <div class="header">
                    <div class="am-g">
                        <div class="am-u-lg-2 am-u-md-12 am-u-sm-12">
                            <div class="logo">
                                <a href="<%=request.getContextPath() %>/"><img src="../assets/img/index/logo_top.png" alt=""
                                                             style="width: auto;"/></a>
                            </div>
                        </div>
                        <div class="am-u-lg-8 am-u-md-12">
                            <div class="header-right am-fr">
                                <div class="header-contact">
                                    <div class="nav-contain" style="border: none;box-shadow: none;">
                                        <div class="nav-inner">
                                            <ul class="am-nav am-nav-pills am-nav-justify">
                                                <li class="" style="min-width:90px;">
                                                    <a href="<%=request.getContextPath() %>/">首页</a>
                                                </li>
                                                <li style="min-width:90px;">
                                                    <a href="cultureSystem.jsp" >项目概况</a>
                                                    <!-- sub-menu start-->
                                                    <ul class="sub-menu">
                                                        <li class="menu-item">
                                                            <a href="cultureSystem.jsp"
                                                               >培养体系</a>
                                                        </li>
                                                        <li class="menu-item">
                                                            <a href="solution.jsp" >特色项目</a>
                                                        </li>
                                                        <li class="menu-item">
                                                            <a href="teachingMaterialSystem.jsp">往期回顾</a>
                                                        </li>
                                                        <!-- <li class="menu-item">
                                                            <a href="taxCollectionFund.jsp">领税基金</a>
                                                        </li>
                                                        <li class="menu-item">
                                                            <a href="expertTeam.jsp">专家团队</a>
                                                        </li> -->
                                                    </ul>
                                                    <!-- sub-menu end-->
                                                </li>
                                                <li style="min-width:90px;">
                                                    <a href="regulationsClasses.jsp">自主报名</a>
                                                </li>
                                                <li style="min-width:90px;">
                                                    <a href="customizedClasses.jsp">定制班次</a>
                                                </li>
                                                <li style="min-width:90px;">
                                                    <a href="onlineClasses.jsp">拼班</a>
                                                </li>
                                                <li style="min-width:90px;">
                                                    <a href="incumbencyStudent.jsp">在职研</a>
                                                    <!-- sub-menu start-->
                                                    <ul class="sub-menu">
                                                        <li class="menu-item">
                                                            <a href="incumbencyStudent.jsp">招生简章</a>
                                                        </li>
                                                        <li class="menu-item">
                                                            <a href="onlineApplication.jsp">在线报名</a>
                                                        </li>
                                                    </ul>
                                                    <!-- sub-menu end-->
                                                </li>
                                                <li style="min-width:90px;">
                                                    <a href="newsNotice.jsp">新闻公告</a>
                                                    <!-- sub-menu start-->
                                                    <ul class="sub-menu">
                                                        <li class="menu-item">
                                                            <a href="newsNotice.jsp">通知公告</a>
                                                        </li>
                                                        <li class="menu-item">
                                                            <a href="newsTrain.jsp">培训新闻</a>
                                                        </li>
                                                    </ul>
                                                    <!-- sub-menu end-->
                                                </li>
                                                <li style="min-width:90px;">
                                                    <a href="centerOverview.jsp">下载中心</a>
															<!-- sub-menu start-->
															<!-- <ul class="am-menu-sub am-collapse">
																<li class="menu-item">
																	<a href="centerOverview.jsp">概况</a>
																</li>
																<li class="menu-item">
																	<a href="organization.jsp">师资招聘</a>
																</li> -->
																<!-- <li class="menu-item">
																	<a href="aboutSchool.jsp">学校介绍</a>
																</li> -->
                                                    <!-- sub-menu end-->
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--header end-->
        </div>

    </div>
    <!--mobile header start-->
    <div class="m-header">
				<div class="am-g am-show-sm-only">
					<div class="am-u-sm-2">
						<div class="menu-bars">
							<a href="#doc-oc-demo1" data-am-offcanvas="{effect: 'push'}"><i class="am-menu-toggle-icon am-icon-bars"></i></a>
							<!-- 侧边栏内容 -->
							<nav data-am-widget="menu" class="am-menu  am-menu-offcanvas1" data-am-menu-offcanvas>
								<a href="javascript: void(0)" class="am-menu-toggle"></a>

								<div class="am-offcanvas">
									<div class="am-offcanvas-bar">


										<ul class="am-menu-nav am-avg-sm-1">
											<li>
												<a href="<%=request.getContextPath() %>/">首页</a>
											</li>
											<li class="am-parent">
												<a href="cultureSystem.jsp"  >项目概况</a>
												<ul class="am-menu-sub am-collapse ">
													<li class="">
														<a href="cultureSystem.jsp" >培养体系</a>
													</li>
													<li class="">
														<a href="solution.jsp" >特色项目</a>
													</li>
													<li class="">
														<a href="teachingMaterialSystem.jsp" class="">往期回顾</a>
													</li>
													<!-- <li class="">
														<a href="taxCollectionFund.jsp" class="">领税基金</a>
													</li>
													<li class="">
														<a href="expertTeam.jsp" class="">专家团队</a>
													</li> -->
												</ul>
											</li>
											<li class="">
												<a href="regulationsClasses.jsp" >自主报名</a>
											</li>
											<li class="">
												<a href="customizedClasses.jsp">定制班次</a>
											</li>
											<li class="">
												<a href="onlineClasses.jsp">拼班</a>
											</li>

											<li class="am-parent">
												<a href="incumbencyStudent.jsp">在职研</a>
												<ul class="am-menu-sub am-collapse  ">
													<li class="menu-item">
														<a href="incumbencyStudent.jsp">招生简章</a>
													</li>
													<li class="menu-item">
														<a href="onlineApplication.jsp">在线报名</a>
													</li>
												</ul>
											</li>
											<li class="am-parent">
												<a href="newsNotice.jsp">新闻公告</a>
												<ul class="am-menu-sub am-collapse  ">
													<li class="menu-item">
														<a href="newsNotice.jsp">通知公告</a>
													</li>
													<li class="menu-item">
														<a href="newsTrain.jsp">培训新闻</a>
													</li>
												</ul>
											</li>
											<li class="am-parent">
												<a href="centerOverview.jsp">下载中心</a>
															<!-- sub-menu start-->
															<!-- <ul class="sub-menu">
																<li class="menu-item">
																	<a href="centerOverview.jsp">概况</a>
																</li>
																<li class="menu-item">
																	<a href="organization.jsp">师资招聘</a>
																</li>
																<li class="menu-item">
																	<a href="aboutSchool.jsp">学校介绍</a>
																</li>
															</ul> -->
											</li>
											<li class="">
												<% if(user != null&&"1".equals(user.getIsadmin())) {%><a style="color: #FFF;">欢迎 &nbsp;&nbsp; <%=user.getUser_name()%>&nbsp;</ a>
													<a href ="/admin/pages/wise/adminPage/noticeAnnouncement" style="color:#FFF;">个人中心</ a>
													<a href="<%=request.getContextPath()%>/Logout" style="color: #FFF;">注销</ a>
												<%}else if(user != null&&"0".equals(user.getIsadmin())){ %>
													<a style="color: #FFF;">欢迎 &nbsp;&nbsp; <%=user.getUser_name()%>&nbsp;</ a>
													<a href ="<%=request.getContextPath()%>/admin/pages/wise/memberPage/memberMessage" style="color:#FFF;">个人中心</ a>
													<a href="<%=request.getContextPath()%>/Logout" style="color: #FFF;">注销</ a>
												<%} %>
												<% if(user == null) {%><a href="login.jsp" style="color: #FFF;">登录</ a>
													<a href ="<%=request.getContextPath()%>/admin/login.jsp" style="color:#FFFFFF;">个人中心</ a>
												<%}; %>
											</li>
											<li class="">
												<a href="register.jsp" class="">注册</a>
											</li>
										</ul>

									</div>
								</div>
							</nav>

						</div>
					</div>
					<div class="am-u-sm-5 am-u-end">
						<div class="m-logo">
							<a href=""><img src="../assets/img/index/logo_top.png" alt="" style="width: auto;"></a>
						</div>
					</div>
				</div>
				<!--mobile header end-->
			</div>


    <!--===========layout-container================-->
   <div class="register-box" style="width: 550px;margin: 40px auto 0;">
        <div class="am-form" data-am-validator>
            <fieldset>
                <legend style="color: #14426a;font-size: 24px;font-weight: 600;">注册用户</legend>

                <div class="am-form-group">
                    <div class="am-g">
                        <div class="am-u-md-2 am-padding-0 am-text-right">
                            <label for="register_phone" class="register-name register_loginName"><span style="color:red;">*</span>登录名称</label>
                        </div>
                        <div class="am-u-md-10">
                            <input type="text" id="register_phone" minlength="11" maxlength="11"
                                   placeholder="请输入您的手机号" required/>
                        </div>
                    </div>
                </div>
                <div class="am-form-group">
                    <div class="am-g">
                        <div class="am-u-md-2 am-padding-0 am-text-right">
                            <label for="register_userName" class="register-name register_userName"><span style="color:red;">*</span>联系人姓名</label>
                        </div>
                        <div class="am-u-md-10">
                            <input type="text" id="register_userName" minlength="1"
                                   placeholder="请输入您的真实姓名" required/>
                        </div>
                    </div>
                </div>
                <div class="am-form-group">
                    <div class="am-g">
                        <div class="am-u-md-2 am-padding-0 am-text-right">
                            <label for="register_tel" class="register-name register_tel"><span style="color:red;">*</span>办公电话</label>
                        </div>
                        <div class="am-u-md-10">
                            <input type="text" id="register_tel" minlength="12" maxlength="12"
                                   placeholder="请输入您的（区号+座机号码），如010-34567890" required/>
                        </div>
                    </div>
                </div>
                <div class="am-form-group">
                    <div class="am-g">
                        <div class="am-u-md-2 am-padding-0 am-text-right">
                            <label for="register_email" class="register-name register_email">联系邮箱</label>
                        </div>
                        <div class="am-u-md-10">
                            <input type="text" id="register_email" minlength="1"
                                   placeholder="请输入您的邮箱，如23456789@qq.com" required/>
                        </div>
                    </div>
                </div>

                <div class="am-form-group">
                    <div class="am-g">
                        <div class="am-u-md-2 am-padding-0 am-text-right">
                            <label for="register_company" class="register-name register_company"><span style="color:red;">*</span>工作单位</label>
                        </div>
                        <div class="am-u-md-10">
                            <input type="text" id="register_company" minlength="1"
                                   placeholder="请输入您当前所在单位的名称" required/>
                        </div>
                    </div>
                </div>
                <div class="am-form-group">
                    <div class="am-g">
                        <div class="am-u-md-2 am-padding-0 am-text-right">
                            <label for="register_department" class="register-name register_department"><span style="color:red;">*</span>工作部门</label>
                        </div>
                        <div class="am-u-md-10">
                            <input type="text" id="register_department" minlength="1"
                                   placeholder="请输入您所在的部门" required/>
                        </div>
                    </div>
                </div>
                <!-- <div class="am-form-group">
                    <div class="am-g">
                        <div class="am-u-md-2 am-padding-0 am-text-right">
                            <label for="register_job" class="register-name register_job">任职岗位</label>
                        </div>
                        <div class="am-u-md-10">
                            <input type="text" id="register_job" minlength="1"
                                   placeholder="请输入您当前任职岗位" required/>
                        </div>
                    </div>
                </div> -->
                <div class="am-form-group">
                    <div class="am-g">
                        <div class="am-u-md-2 am-padding-0 am-text-right">
                            <label for="register_post" class="register-name register_post"><span style="color:red;">*</span>工作职务</label>
                        </div>
                        <div class="am-u-md-10">
                            <input type="text" id="register_post" minlength="1"
                                   placeholder="请输入您当前的职务" required/>
                        </div>
                    </div>
                </div>

                <div class="am-form-group">
                    <div class="am-g">
                        <div class="am-u-md-2 am-padding-0 am-text-right">
                            <label for="doc-vld-pwd-1" class="register-name register-pwd"><span style="color:red;">*</span>输入密码</label>
                        </div>
                        <div class="am-u-md-10">
                            <input type="password" id="doc-vld-pwd-1" minlength="6" maxlength="6" placeholder="请设置您的密码" pattern="^\d{6}$"
                                   required/>
                        </div>
                    </div>
                </div>

                <div class="am-form-group">
                    <div class="am-g">
                        <div class="am-u-md-2 am-padding-0 am-text-right">
                            <label for="doc-vld-pwd-2" class="register-name"><span style="color:red;">*</span>确认密码</label>
                        </div>
                        <div class="am-u-md-10">
                            <input type="password" id="doc-vld-pwd-2" minlength="6" maxlength="6" placeholder="请再次输入您的密码"
                                   data-equal-to="#doc-vld-pwd-1" required/>
                        </div>
                    </div>
                </div>

                <div class="am-g">
                    <div class="am-u-md-12" style="display: flex;justify-content: center;align-items: center;">
                        <button class="am-btn am-btn-secondary am-btn-primary"
                                type="submit" style="margin: 0;background: #1E9FFF;border-color: #1E9FFF;" onclick="submitRegister();">注册
                        </button>
                    </div>
                </div>

                <div id="alertShow">

                </div>
                <!--<div class="am-modal am-modal-alert" tabindex="-1" id="my-alert" style="display: none;">
                    <div class="am-modal-dialog">
                        <div class="am-modal-bd">
                            注册成功！
                        </div>
                        <div class="am-modal-footer">
                            <span class=""><a href="login.html">登录</a></span>
                            <span class="am-modal-btn">取消</span>
                        </div>
                    </div>
                </div>-->

            </fieldset>
        </div>
    </div>

</div>


<script src="../assets/js/jquery-2.1.0.js" charset="utf-8"></script>
<!--[if (gte IE 9)|!(IE)]><!-->
<script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
<!--<![endif]-->

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
<script src="../assets/js/amazeui.js" charset="utf-8"></script>
<script>
    function submitRegister() {
        var register_phone = $('#register_phone').val();
        var register_userName = $('#register_userName').val();
        var register_tel = $("#register_tel").val();
        var register_email = $("#register_email").val();
        var register_company = $("#register_company").val();
        var register_department = $("#register_department").val();
      //  var register_post = $("#register_post").val();
        var register_post = $("#register_post").val();
        var register_password1 = $("#doc-vld-pwd-1").val();
        var register_password2 = $("#doc-vld-pwd-2").val();
        var testPhone = /^1\d{10}$/;
        var testEmail = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
        var testTel = /^0\d{2,3}-?\d{7,8}$/;
        if(register_phone==""){
            alert("请输入登录名称！");
            return;
        }else if(testPhone.test(register_phone)==false){
            alert("请输入正确的登录名称（手机号）！");
            return;
        }
        if(register_userName==""){
            alert("请输入您的姓名！");
            return;
        }
	if(register_tel==""){
		alert("请输入办公电话！");
		return;
	}else if(testTel.test(register_tel)==false){
		alert("请输入有效的办公电话！");
		return;
	}
        if(register_email!="" && testEmail.test(register_email)==false){
            alert("请输入正确的邮箱！");
            return;
        }
        if(register_company==""){
            alert("请输入您的单位名称！");
            return;
        }
        if(register_department==""){
            alert("请输入您所在部门！");
            return;
        }
       /*  if(register_post==""){
            alert("请输入您的任职岗位！");
            return;
        } */
        if(register_post==""){
            alert("请输入您的担任职务！");
            return;
        }
        if(register_password1==""){
            alert("请输入您的密码！");
            return;
        }
        if(register_password2==""){
            alert("请输入确认密码！");
            return;
        }else if(register_password1.length<6){
            alert("请输入长度为6位的密码！");
            return;
        }
        if(register_password1!=register_password2){
            alert("两次密码输入不相同，请输入相同的密码！");
            return;
        }

       /* var successRegister = '<div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">' +
            '                    <div class="am-modal-dialog">' +
            '                        <div class="am-modal-bd">' +
            '                            注册成功！' +
            '                        </div>' +
            '                        <div class="am-modal-footer">' +
            '                            <span class=""><a href="login.html">登录</a></span>' +
            '                            <span class="am-modal-btn">取消</span>' +
            '                        </div>' +
            '                    </div>' +
            '                </div>';

        var errorRegister = '<div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">' +
            '                    <div class="am-modal-dialog">' +
            '                        <div class="am-modal-bd">' +
            '                            注册失败！' +
            '                        </div>' +
            '                        <div class="am-modal-footer">' +
            '                            <span class="am-modal-btn">确定</span>' +
            '                        </div>' +
            '                    </div>' +
            '                </div>';*/

        $.ajax({
            url:'<%=request.getContextPath()%>/IUser/regist',
            data:{
                "User_loginname":register_phone,
                "User_name":register_userName,
                "User_phone":register_tel,
                "User_mail":register_email,
                "User_companyname":register_company,
                "User_department":register_department,
                "User_job":"",
                "User_hold":register_post,
                "User_password":register_password1
            },
            dateType:"json",
            type:"post",
            async:false, 
            success:function (data) {
                if(data.success == true){
                   var r = confirm("注册成功！是否登录？");
                    if(r==true){
                    	/* window.open('','_self','');
                    	window.close(); */
                    	javascript:location.href='<%=request.getContextPath()%>/show/dist/html/login.jsp';
                    }else{
                        return;
                    }
                }
                else{
                    if(data.msg == "1"){
                        alert("登录名存在!");
                        return;
                    }
                    else{
                        alert("参数错误!");
                        return;
                    }
                }
            },error:function(e){
                alert("注册失败!");
               // $("#alertShow").innerHTML= errorRegister;
                //error
            }

        })

    }
</script>
</body>

</html>
