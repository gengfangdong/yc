<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="entity.IUser" %>
<%
	IUser user = (IUser)session.getAttribute("user");
String caogery = (String)session.getAttribute("isad");
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>中央财经大学</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
		<link rel="stylesheet" href="../../../bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="../../../layui-v2.3.0/layui/css/layui.css">
		<!-- DataTables -->
		<!-- <link rel="stylesheet" href="../../plugins/DataTables-1.10.15/media/css/jquery.dataTables.min.css"> -->
		<link rel="stylesheet" href="../../../plugins/DataTables-1.10.15/media/css/dataTables.bootstrap.min.css">
		<!-- zTree -->
		<link rel="stylesheet" href="../../../zTree_v3/css/zTreeStyle/zTreeStyle.css">

		<!-- Font Awesome -->
		<link rel="stylesheet" href="../../../css/font-awesome-4.7.0/css/font-awesome.min.css">
		<!-- Ionicons -->
		<link rel="stylesheet" href="../../../css/ionicons-2.0.1/css/ionicons.min.css">
		<!-- jvectormap -->
		<link rel="stylesheet" href="../../../plugins/jvectormap/jquery-jvectormap-1.2.2.css">
		<!-- Theme style -->
		<link rel="stylesheet" href="../../../dist/css/AdminLTE.css">
		<!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
		<link rel="stylesheet" href="../../../dist/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="../../../bootstrap/css/style.css">
		<link rel="stylesheet" href="../../../layui-v2.3.0/layui/css/modules/layer/default/layer.css">
		<link rel="stylesheet" href="../../../css/myStyle.css">

		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    	<![endif]-->
		<style type="text/css">
			.fzy-border {
				background: #fff url(../../../image/datePicker.png) no-repeat right;
				/* background-color: #FCFCFC; */
			}

			option {
				color: black;
			}
		</style>
	</head>

	<body class="hold-transition skin-blue sidebar-mini">
		<div class="wrapper">
			<header class="main-header" style="background-color: #2a3b4c;height: 50px;position: fixed;width: 100%;">
				<!-- Logo -->
				<a href="#" class="logo" style="background-color: #2a3b4c;height: 50px;width: 500px;z-index: 1000000;">
					<!-- mini logo for sidebar mini 50x50 pixels -->
					<span class="logo-mini"><img src="" width="40"></span>
					<!-- logo for regular state and mobile devices -->
					<span class="logo-lg"><img src="../../../image/logo_text2.png" style="width: 240px;height: auto;"></span>
				</a>
				<!-- Header Navbar: style can be found in header.less -->
				<nav class="navbar navbar-static-top" role="navigation">
					<!-- Sidebar toggle button-->
					<div class="navbar-custom-menu">
						<ul class="nav navbar-nav">
							<!-- User Account: style can be found in dropdown.less -->
							<li class="dropdown user user-menu">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									<img src="../../../dist/img/1.png" class="user-image" alt="User Image">
									<% if(user != null) {%><span class="hidden-xs"><%=user.getUser_name()%>&nbsp;</span>
										
									<%}; %>
									<% if(user == null) {%><span class="hidden-xs">未登录</span><%}; %>
								</a>
								<ul class="dropdown-menu">
									<!-- User image -->
									<li class="user-header">
										<img src="../../../dist/img/1.png" class="img-circle" alt="User Image">
										<p>
											<% if(user != null) {%><span class="hidden-xs"><%=user.getUser_name()%>&nbsp;</span>
																				
											<%}; %>
											<% if(user == null) {%><span class="hidden-xs">未登录</span><%}; %>
										</p>
									</li>

									<!-- Menu Footer-->
									<li class="user-footer">
										<div class="pull-left">
										</div>
										<div class="pull-right">
											<a href="<%=request.getContextPath()%>/admin/login" class="btn btn-default btn-flat">安全退出</a>
										</div>
									</li>
								</ul>
							</li>
							<!-- Control Sidebar Toggle Button -->
							<li>
								<a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
							</li>
						</ul>
					</div>
				</nav>
			</header>
			<!-- Left side column. contains the logo and sidebar -->
			<aside class="main-sidebar" style="position: fixed;">
				<!-- sidebar: style can be found in sidebar.less -->
				<section class="sidebar">
					<!-- Sidebar user panel -->
					<div class="user-panel">
						<div class="pull-left image">
							<img src="../../../dist/img/1.png" class="img-circle" alt="User Image">
						</div>
						<div class="pull-left info">
							<% if(user != null) {%>
							<p><%=user.getUser_loginname()%></p>
							<a href="#">
								<i class="fa fa-circle text-success"></i> 
								<%=user.getUser_name()%>&nbsp;
							</a>
										
							<%}; %>
							<% if(user == null) {%><span class="hidden-xs">未登录</span><%}; %>
							</a>
						</div>
					</div>

					<!-- sidebar menu: : style can be found in sidebar.less -->
					<ul class="sidebar-menu">

						<li class="treeview active">
							<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button" onclick="hiddenLi(this);">
								<i class="fa menu-iconss" style="width: 15px;"></i> <span>管理控制台</span>
							</a>
							<ul class="treeview-menu treeUl">
								<li>
									<a href="#"><i class="fa fa-circle-o"></i> 基本设置<i class="fa fa-angle-left pull-right"></i></a>
									<ul class="treeview-menu menu_tree">
										<li>
											<a href="memberMessage.jsp" style="color: #FFFFFF;"><i class="fa fa-square-o"></i> 我的信息</a>
										</li>
										<li>
											<a href="memberPersonList.jsp"><i class="fa fa-square-o"></i> 人员列表</a>
										</li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="fa fa-circle-o"></i> 我的项目<i class="fa fa-angle-left pull-right"></i></a>
									<ul class="treeview-menu menu_tree">
										<li>
											<a href="memberCustomProject.jsp"><i class="fa fa-square-o"></i> 定制项目</a>
										</li>
										<li>
											<a href="memberRegulationClasses.jsp"><i class="fa fa-square-o"></i> 规定班次</a>
										</li>
										<li>
											<a href="memberOnlineClasses.jsp"><i class="fa fa-square-o"></i> 在线拼班</a>
										</li>
										<li>
											<a href="memberIncumbencyStudent.jsp"><i class="fa fa-square-o"></i> 在职研</a>
										</li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="fa fa-circle-o"></i> 项目管理<i class="fa fa-angle-left pull-right"></i></a>
									<ul class="treeview-menu menu_tree">
										<li>
											<a href="memberProjectList.jsp"><i class="fa fa-square-o"></i> 项目列表</a>
										</li>
									</ul>
								</li>
							</ul>
						</li>
					</ul>
				</section>
				<!-- /.sidebar -->
			</aside>

			<!-- Content Wrapper. Contains page content -->
			<div class="content-wrapper">
				<section class="content-header">
					<h1>基本设置 <small>我的信息</small></h1>
					<ol class="breadcrumb">
						<li><i class="fa fa-dashboard"></i> 首页</li>
						<li> 基本设置</li>
						<li class="active">我的信息</li>
					</ol>
				</section>

				<section class="content">
					<div class="row">
						<div class="col-xs-12">
							<div class="box" style="margin-bottom: 0;padding-bottom: 20px;">
								<div class="box-body" style="padding: 0px;">
									<div class="row">
										<div class="col-sm-12">

											<div class="row">
												<div class="col-sm-12 col-md-12">
													<div id="myTabContent" class="tab-content common-inline" style="padding-top: 0;">
														<div class="tab-pane fade in active" id="taxpayerAnalysis">
															<div class="row">
																<div class="col-sm-12 col-md-12">
																	<!--<div class="form-group" style="width: 100%;margin-top: 5px;height: 32px;line-height: 32px;margin-bottom: 0;">
																		<div class="col-sm-10" style="height: 32px;line-height: 32px;">
																			<ul class="f-sort-ul">
																				<li><button href="#" class="add" onclick="addBranch(this);">新增</button></li>
																			</ul>
																		</div>
																	</div>-->
																	<div class="row">
																		<div class="col-sm-12 col-md-12">
																			<div class="row" style="height: 30px;line-height: 30px;">
																				<div class="col-sm-9 col-md-9">
																					<label style="font-size: 14px; padding-left: 10px;">
																						<img src="../../../image/square.png" style="margin-top: -1px;width: 12px;">
																						基本信息
																					</label>
																				</div>
																			</div>
																			<input type="hidden" class="form-control searchInput1" id="userId" placeholder="" style="height: 30px;font-size: 12px;background:#fff;width:100%;" value="" hidden="hidden" />
																			<div class="" id="" style="padding-left: 10px;padding-right: 10px;border-top: 1px solid #F4F4F4;">
																				<div class="form-group" style="padding-top: 5px;height: 30px;margin-top: 5px;">
																					<label for="" class="control-label" id="userIdLabel" style="float: left;margin-left: 5px;height: 30px;line-height: 30px;">登录账号：</label>
																					<div class="col-sm-4">
																					<% if(user != null) {%>
																					<input type="text" class="form-control searchInput1" id="useraId" placeholder="" style="height: 30px;font-size: 12px;background:#fff;width:100%;" disabled="disabled" value='<%=user.getUser_loginname()%>'/>
																					<%}; %>
																					<% if(user == null) {%>
																					<input type="text" class="form-control searchInput1" id="useraId" placeholder="" style="height: 30px;font-size: 12px;background:#fff;width:100%;" disabled="disabled" value=''/>
																					<%}; %>
																					</a>
																					</div>
																				</div>
																				<div class="form-group" style="padding-top: 5px;height: 30px;margin-top: 5px;">
																					<label for="" class="control-label" style="float: left;margin-left: 5px;height: 30px;line-height: 30px;"><span style="color:red;float:left;">*</span>联系人员：</label>
																					<div class="col-sm-4">
																						<input type="text" class="form-control searchInput1" id="username" placeholder="" style="height: 30px;font-size: 12px;width:100%;" />
																					</div>
																				</div>
																				<div class="form-group" style="padding-top: 5px;height: 30px;margin-top: 5px;">
																					<label for="" class="control-label" style="float: left;margin-left: 5px;height: 30px;line-height: 30px;"><span style="color:red;float:left;">*</span>联系电话：</label>
																					<div class="col-sm-4">
																						<input type="text" class="form-control searchInput1" id="userphone" placeholder="" style="height: 30px;font-size: 12px;width:100%;" maxLength="11" />
																					</div>
																				</div>
																				<div class="form-group" style="padding-top: 5px;height: 30px;margin-top: 5px;">
																					<label for="" class="control-label" style="float: left;margin-left: 5px;height: 30px;line-height: 30px;"><span style="color:red;float:left;">*</span>办公电话：</label>
																					<div class="col-sm-4">
																						<input type="text" class="form-control searchInput1" id="user_phone" placeholder="" style="height: 30px;font-size: 12px;width:100%;" maxLength="11" />
																					</div>
																				</div>
																				<div class="form-group" style="padding-top: 5px;height: 30px;margin-top: 5px;">
																					<label for="" class="control-label" id="emailLabel" style="float: left;margin-left: 5px;height: 30px;line-height: 30px;">联系邮箱：</label>
																					<div class="col-sm-4">
																						<input type="text" class="form-control searchInput1" id="email" placeholder="" style="height: 30px;font-size: 12px;width:100%;" />
																					</div>
																				</div>
																				<div class="form-group" style="padding-top: 5px;height: 30px;margin-top: 5px;">
																					<label for="" class="control-label" id="companyLabel" style="float: left;margin-left: 5px;height: 30px;line-height: 30px;"><span style="color:red;float:left;">*</span>工作单位：</label>
																					<div class="col-sm-4">
																						<input type="text" class="form-control searchInput1" id="company" placeholder="" style="height: 30px;font-size: 12px;width:100%;" />
																					</div>
																				</div>
																				<div class="form-group" style="padding-top: 5px;height: 30px;margin-top: 5px;">
																					<label for="" class="control-label" style="float: left;margin-left: 5px;height: 30px;line-height: 30px;"><span style="color:red;float:left;">*</span>工作部门：</label>
																					<div class="col-sm-4">
																						<input type="text" class="form-control searchInput1" id="department" placeholder="" style="height: 30px;font-size: 12px;width:100%;" />
																					</div>
																				</div>
																				<div class="form-group" style="padding-top: 5px;height: 30px;margin-top: 5px;">
																					<label for="" class="control-label" style="float: left;margin-left: 5px;height: 30px;line-height: 30px;"><span style="color:red;float:left;">*</span>工作职务：</label>
																					<div class="col-sm-4">
																						<input type="text" class="form-control searchInput1" id="post" placeholder="" style="height: 30px;font-size: 12px;width:100%;" />
																					</div>
																				</div>
																				<!--<div class="form-group">
																					<div class="col-sm-6" style="text-align: right;">
																						<button type="submit" class="btn btn-default" style="font-size: 12px;padding: 5px 12px;background-color: #1e9fff;color: #fff;border-color: #1E9FFF;">搜索</button>
																					</div>
																				</div>-->
																				<div class="form-group" style="width: 100%;margin-top: 5px;height: 32px;line-height: 32px;margin-bottom: 0;">
																					<div class="col-sm-10" style="height: 32px;line-height: 32px;">
																						<ul class="f-sort-ul" style="padding-left: 15%;">
																							<!-- <li><button href="#" class="add changeMessage">修改</button></li> -->
																							<li><button href="#" class="add saveMessage" onclick="informationSave();">保存</button></li>
																						</ul>
																					</div>
																				</div>
																			</div>

																			<div class="row" style="height: 30px;line-height: 30px;">
																				<div class="col-sm-9 col-md-9">
																					<label style="font-size: 14px; padding-left: 10px;">
																						<img src="../../../image/square.png" style="margin-top: -1px;width: 12px;">
																						模板管理
																					</label>
																				</div>
																			</div>
																			<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 10px;padding-right: 10px;border-top: 1px solid #F4F4F4;">
																				<div class="form-group" style="padding-top: 5px;height: 30px;margin-top: 5px;">
																					<label for="" class="control-label" style="float: left;margin-left: 5px;height: 30px;line-height: 30px;">会员名单模板：</label>
																					<div class="col-sm-10">
																						<button href="../../../../show/dist/doc/学员名单上传1218.xlsx" class="add saveMessage" style="margin-top: 5px;"><a href="../../../../show/dist/doc/1218.xlsx" style="font-size: 12px;line-height: 24px;color: #FFFFFF;">下载</a></button>
																						<span style="font-size: 12px;padding-left: 20px;">注：本模板用于在“人员列表”模块中导入本单位培训人员名单</span>
																					</div>
																				</div>
																				
																				<!-- <table id="" class="example1_x moreSelected" style="margin-top: 6px!important;">

																					<tbody>
																						<tr>
																							<td class="firstTd">会员名单模板</td>
																							<td class="otherTd expenditureContribution1" onclick="riskIndexed7(this);">
																								<a href="../../../../前台/dist/doc/报名表格.zip">下载</a>
																							</td>
																						</tr>
																					</tbody>
																				</table> -->
																			</div>
																			<div class="row" style="height: 30px;line-height: 30px;">
																				<div class="col-sm-9 col-md-9">
																					<label style="font-size: 14px; padding-left: 10px;">
																						<img src="../../../image/square.png" style="margin-top: -1px;width: 12px;">
																						密码设置
																					</label>
																				</div>
																			</div>
																			<div class="" id="" style="padding-left: 10px;padding-right: 10px;border-top: 1px solid #F4F4F4;">
																				<div class="form-group" style="padding-top: 5px;height: 30px;margin-top: 5px;">
																					<label for="" class="control-label" id="oldPasswordLabel" style="float: left;margin-left: 5px;height: 30px;line-height: 30px;"><span style="color:red;float:left;">*</span>原密码：</label>
																					<div class="col-sm-4">
																						<input type="password" class="form-control searchInput1" id="oldPassword" placeholder="请输入原密码" style="height: 30px;font-size: 12px;" maxLength="6" />
																					</div>
																				</div>
																				<div class="form-group" style="padding-top: 5px;height: 30px;margin-top: 5px;">
																					<label for="" class="control-label" id="newPasswordLabel" style="float: left;margin-left: 5px;height: 30px;line-height: 30px;"><span style="color:red;float:left;">*</span>新密码：</label>
																					<div class="col-sm-4">
																						<input type="password" class="form-control searchInput1" id="newPassword" placeholder="请输入新密码" style="height: 30px;font-size: 12px;" maxLength="6" />
																					</div>
																				</div>
																				<div class="form-group" style="padding-top: 5px;height: 30px;margin-top: 5px;">
																					<label for="" class="control-label" id="confirmPasswordLabel" style="float: left;margin-left: 5px;height: 30px;line-height: 30px;"><span style="color:red;float:left;">*</span>确认密码：</label>
																					<div class="col-sm-4">
																						<input type="password" class="form-control searchInput1" id="confirmPassword" placeholder="请再次输入新密码" style="height: 30px;font-size: 12px;" maxLength="6" />
																					</div>
																				</div>
																				<div class="form-group" style="width: 100%;margin-top: 5px;height: 32px;line-height: 32px;margin-bottom: 0;">
																					<div class="col-sm-10" style="height: 32px;line-height: 32px;">
																						<ul class="f-sort-ul" style="padding-left: 15%;">
																							<!-- <li><button href="#" class="add changePassword">修改</button></li> -->
																							<li><button href="#" class="add savePassword" onclick="passwordSave();">保存</button></li>
																						</ul>
																					</div>
																				</div>
																			</div>

																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /.box -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</section>
			</div>
			<!-- /.content-wrapper -->
			<!--<footer class="main-footer">
				<strong>版权© 2016-2025<a href="">北京大唐神州技术有限公司</a></strong> 保留所有权利。
			</footer>-->

			<!-- Control Sidebar -->
			<aside class="control-sidebar control-sidebar-dark">
				<div class="tab-content">
					<div class="tab-pane" id="control-sidebar-home-tab">
					</div>
				</div>
			</aside>
			<!-- /.control-sidebar -->
			<!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
			<div class="control-sidebar-bg"></div>
		</div>
		<!-- ./wrapper -->

		<!-- jQuery 2.1.4 -->
		<script src="../../../plugins/jQuery/jQuery-2.1.4.min.js"></script>
		<!-- Bootstrap 3.3.5 -->
		<script src="../../../bootstrap/js/bootstrap.min.js"></script>
		<!-- layui 2.3.0 -->
		<script src="../../../layui-v2.3.0/layui/layui.js"></script>
		<!-- DataTables -->
		<script src="../../../plugins/DataTables-1.10.15/media/js/jquery.dataTables.min.js"></script>
		<script src="../../../plugins/DataTables-1.10.15/media/js/dataTables.bootstrap.min.js"></script>
		<!-- zTree -->
		<script src="../../../zTree_v3/js/jquery.ztree.core.js"></script>
		<script src="../../../zTree_v3/js/jquery.ztree.excheck.js"></script>

		<!-- Slimscroll -->
		<script src="../../../plugins/slimScroll/jquery.slimscroll.min.js"></script>
		<!-- FastClick -->
		<script src="../../../plugins/fastclick/fastclick.min.js"></script>
		<!-- AdminLTE App -->
		<script src="../../../dist/js/app.min.js"></script>
		<!-- AdminLTE for demo purposes -->
		<script src="../../../dist/js/demo.js"></script>
		<!-- <script type="text/javascript" src="../../My97DatePicker/WdatePicker.js"></script> -->
		<!--切换选中样式-->
		<script type="text/javascript" src="../../../js/changeSelectStyle.js"></script>
		<script>
		//基本信息修改保存
			function informationSave(){
				var userId = $("#userId").val();
				var contactPersonName = $("#username").val();
				var contactPhone = $("#userphone").val();
				var workTel = $("#user_phone").val();
				var email = $("#email").val();
				var company = $("#company").val();
				var department = $("#department").val();
				var post = $("#post").val();
		        var testPhone = /^1\d{10}$/;
		        var testEmail = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
		        var testTel = /^0\d{2,3}-?\d{7,8}$/;
				
				if(contactPersonName==""){
					alert("请输入联系人员！");
					return;
				}
				if(contactPhone==""){
					alert("请输入联系电话!");
					return;
				}else if(contactPhone.length<11){
					alert("请输入有效的电话号码！");
					return
				}else if(contactPhone.length>11){
					alert("请输入有效的电话号码！");
					return;
				}else if(testPhone.test(contactPhone)==false){
					alert("请输入有效的电话号码！");
					return;
				}
				if(workTel!="" && workTel.length<12){
					alert("请输入有效的办公电话!");
					return;
				}else if(workTel!="" && workTel>12){
					alert("请输入有效的办公电话！");
					return;
				}else if(testTel.test(workTel)==false){
					alert("请输入有效的办公电话！");
					return;
				}
				if(email!=""&&testEmail.test(email)==false){
					alert("请输入有效的邮箱！");
					return;
				}
				if(company==""){
					alert("请输入工作单位!");
					return;
				}
				if(department==""){
					alert("请输入工作部门!");
					return;
				}
				if(post==""){
					alert("请输入工作职务!");
					return;
				}
				
				$.ajax({
					url:'<%=request.getContextPath()%>/IUser/updateShowIUser',
					type:"post",
					data:{
						User_id:userId,
						User_name:contactPersonName,
						User_ydphone:contactPhone,
						User_phone:workTel,
						User_mail:email,
						User_companyname:company,
						User_department:department,
						User_hold:post
					},
					success:function(data){
						if(data.success == true){
							alert("保存成功！");
						}else if(data.success == false){
							if(data.message == "1"){
								alert("人员获取失败！");
							}
							else
								alert("保存失败！");
						}
					},
					error:function(error){
						alert("接口不通！");
						console.log('接口不通' + error);
					}
				})
				
			}
			//密码设置修改保存
			function passwordSave(){
				var oldPassword = $("#oldPassword").val();
				var newPassword = $("#newPassword").val();
				var confirmPassword = $("#confirmPassword").val();
				
				if(oldPassword==""){
					alert("请输入原密码！");
					return;
				}else if(oldPassword.length<6){
					alert("请输入正确的原密码！");
					return;
				}
				if(newPassword==""){
					alert("请输入新密码！");
					return;
				}else if(newPassword.length<6){
					alert("请输入6位新密码！");
				}
				if(confirmPassword==""){
					alert("请再次输入新密码！");
					return;
				}else if(confirmPassword<6){
					alert("请输入6位新密码！");
					return;
				}else if(confirmPassword != newPassword){
					alert("请输入相同的新密码！");
					return;
				}
				
				$.ajax({
					url:"<%=request.getContextPath()%>/IUser/updatePassword",
					type:"post",
					data:{
						oldpassword:oldPassword,
						newpassword:newPassword
					},
					success:function(data){
						if(data.success == true){
							alert("密码修改成功！");
						}else if(data.success == false){
							if(data.message == "0"){
								alert("未登录！");
							}else if(data.message == "1"){
								alert("旧密码不对！");
							}else if(data.message == "2"){
								alert("密码修改失败！");
							}
							
						}
					},
					error:function(error){
						alert("接口不通！");
						console.log('接口不通' + error);
					}
				})
			}
		</script>
		<script>
			window.onload = function() {
				 <% if(user == null||!"0".equals(caogery)){%>
					
					window.open('<%=request.getContextPath()%>/admin/login.jsp','_self');				
				<%}%>
				//左侧列表树
				var treeUls = document.getElementsByClassName('menu_tree');
				treeUls[0].setAttribute('style', 'display: block;');
				treeUls[1].setAttribute('style', 'display: block;');
				treeUls[2].setAttribute('style', 'display: block;');
				
				//输入项样式
				var labelWidth = $("#confirmPasswordLabel").css("width");
				$("#oldPasswordLabel").css("width",labelWidth);
				$("#newPasswordLabel").css("width",labelWidth);
				var labelWidth2 = $("#companyLabel").css("width");
				$("#userIdLabel").css("width",labelWidth2);
				$("#userIdLabel").css("text-align","right");
				$("#emailLabel").css("width",labelWidth2);
				$("#emailLabel").css("text-align","right");
				
				//回显
				var id = document.getElementById("userId");
				var name = document.getElementById("username");
        		var phone = document.getElementById("userphone");
        		var workPhone = document.getElementById("user_phone");
        		var email = document.getElementById("email");
        		var company = document.getElementById("company");
        		var department = document.getElementById("department");
        		var post = document.getElementById("post");
        		$.ajax({
				url : '<%=request.getContextPath()%>/IUser/getdetailShow',
				type : 'GET',
				success:function(data){
					id.value = data.data.user_id,
					name.value=data.data.user_name;
					phone.value = data.data.user_ydphone;
					workPhone.value = data.data.user_phone;
					email.value = data.data.user_mail;
					company.value = data.data.user_companyname;
					department.value = data.data.user_department;
					post.value = data.data.user_hold;

				},error:function(data){

				}
			});
				
			};
		</script>
	</body>

</html>
