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
		<title>中央财经大学</title>
		<link rel="icon" href="../assets/img/logo.ico" type="image/x-icon"/>
		<link rel="stylesheet" href="../assets/css/amazeui.css" />
		<link rel="stylesheet" href="../assets/css/common.min.css" />
		<link rel="stylesheet" href="../assets/css/contact.min.css" />
		<link rel="stylesheet" href="../assets/css/myStyle.css" />
		<!-- <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css"> -->
		<link rel="stylesheet" href="../assets/layui-v2.3.0/layui/css/layui.css">
		<!-- <link rel="stylesheet" href="../assets/bootstrap/css/style.css"> -->
		<link rel="stylesheet" href="../assets/layui-v2.3.0/layui/css/modules/layer/default/layer.css">
		<style>
			@media only screen and (min-width: 641px) {
				.am-offcanvas {
					display: block;
					position: static;
					background: none;
				}
				.am-offcanvas-bar {
					position: static;
					width: auto;
					background: none;
					-webkit-transform: translate3d(0, 0, 0);
					-ms-transform: translate3d(0, 0, 0);
					transform: translate3d(0, 0, 0);
				}
				.am-offcanvas-bar:after {
					content: none;
				}
			}
			
			@media only screen and (max-width: 640px) {
				.am-offcanvas-bar .am-nav>li>a {
					color: #ccc;
					border-radius: 0;
					border-top: 1px solid rgba(0, 0, 0, .3);
					box-shadow: inset 0 1px 0 rgba(255, 255, 255, .05)
				}
				.am-offcanvas-bar .am-nav>li>a:hover {
					background: #404040;
					color: #fff
				}
				.am-offcanvas-bar .am-nav>li.am-nav-header {
					color: #777;
					background: #404040;
					box-shadow: inset 0 1px 0 rgba(255, 255, 255, .05);
					text-shadow: 0 1px 0 rgba(0, 0, 0, .5);
					border-top: 1px solid rgba(0, 0, 0, .3);
					font-weight: 400;
					font-size: 75%
				}
				.am-offcanvas-bar .am-nav>li.am-active>a {
					background: #1a1a1a;
					color: #fff;
					box-shadow: inset 0 1px 3px rgba(0, 0, 0, .3)
				}
				.am-offcanvas-bar .am-nav>li+li {
					margin-top: 0;
				}
				.screeningConditions{
					height:95px;
				}
				.screeningConditions button{
					margin-left:40%;
					
				}
				.screeningConditions label{
					min-width:84px;
				}
			}
			
			.my-head {
				margin-top: 40px;
				text-align: center;
			}
			
			.my-button {
				position: fixed;
				top: 0;
				right: 0;
				border-radius: 0;
			}
			
			.my-sidebar {
				padding-right: 0;
				border-right: 1px solid #eeeeee;
			}
			
			.my-footer {
				border-top: 1px solid #eeeeee;
				padding: 10px 0;
				margin-top: 10px;
				text-align: center;
			}
			.layui-table-cell.laytable-cell-1-figClass_id a{
				color:#0e90d2;
				cursor:pointer;
			}
			.layui-laypage-em{
			background-color:#1e9fff!important;
			}
			.layui-table-cell{
				text-align:center;
			}
		</style>
	</head>

	<body>
		<div class="layout">
			<!--===========layout-header================-->
			<div class="layout-header am-hide-sm-only">
				<!--topbar start-->
				<div class="topbar" style="background: #FFFFFF;">
					<div class="container" style="background: #FFFFFF;width: auto!important;">
						<div class="am-g">
							<div class="am-u-md-8">
								<div class="topbar-left">
									<!--<i class="am-icon-globe"></i>-->
									<jsp:include   page="topbarLeft.jsp" flush="true"/>
								</div>
							</div>
							<div class="am-u-md-4">
								<div class="topbar-right am-text-right am-fr">
									<% if(user != null&&"1".equals(user.getIsadmin())) {%><a style="color: #000000;">欢迎 &nbsp;&nbsp; <%=user.getUser_name()%>&nbsp;</ a>
										<a href ="/admin/pages/wise/adminPage/noticeAnnouncement" style="color:#000000;">后台登录</ a>
										<a href="<%=request.getContextPath()%>/Logout" style="color: #000000;">注销</ a>
									<%}else if(user != null&&"0".equals(user.getIsadmin())){ %>
										<a style="color: #000000;">欢迎 &nbsp;&nbsp; <%=user.getUser_name()%>&nbsp;</ a>
										<a href ="<%=request.getContextPath()%>/admin/pages/wise/memberPage/memberMessage" style="color:#000000;">后台登录</ a>
										<a href="<%=request.getContextPath()%>/Logout" style="color: #000000;">注销</ a>
									<%} %>
									<% if(user == null) {%><a href="<%=request.getContextPath()%>/show/dist/html/login.jsp" style="color: #000000;">登录</ a>
										<a href ="<%=request.getContextPath()%>/admin/login.jsp" style="color:#000000;">后台登录</ a>
									<%}; %>
										<a href="<%=request.getContextPath()%>/show/dist/html/register.jsp" style="color: #000000;">注册</ a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--topbar end-->

				<div class="header-box" data-am-sticky style="box-shadow: rgb(136, 136, 136) 0px 1px 5px;">
					<!--header start-->
					<div class="container" style="width: auto!important;">
						<div class="header">
							<div class="am-g">
								<div class="am-u-lg-2 am-u-md-12 am-u-sm-12">
									<div class="logo">
										<a href="../index.jsp"><img src="../assets/img/index/logo_top.png" alt="" style="width: auto;" /></a>
									</div>
								</div>
								<div class="am-u-lg-8 am-u-md-12">
									<div class="header-right am-fr">
										<div class="header-contact">
											<div class="nav-contain" style="border: none;box-shadow: none;">
												<div class="nav-inner">
													<ul class="am-nav am-nav-pills am-nav-justify">
														<li class="">
															<a href="../index.jsp">首页</a>
														</li>
														<li>
															<a href="cultureSystem.jsp">项目概况</a>
															<!-- sub-menu start-->
															<ul class="sub-menu">
																<li class="menu-item">
																	<a href="cultureSystem.jsp">培养体系</a>
																</li>
																<li class="menu-item">
																	<a href="solution.jsp">解决方案</a>
																</li>
																<li class="menu-item">
																	<a href="teachingMaterialSystem.jsp">教材体系</a>
																</li>
																<li class="menu-item">
																	<a href="taxCollectionFund.jsp">领税基金</a>
																</li>
																<li class="menu-item">
																	<a href="expertTeam.jsp">专家团队</a>
																</li>
															</ul>
															<!-- sub-menu end-->
														</li>
														<li>
															<a href="regulationsClasses.jsp">规定班次</a>
														</li>
														<li>
															<a href="customizedClasses.jsp">定制班次</a>
														</li>
														<li>
															<a href="onlineClasses.jsp" style="color: #FF2F2F;">拼班</a>
														</li>
														<li>
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
														<li>
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
														<li>
															<a href="centerOverview.jsp">关于我们</a>
															<!-- sub-menu start-->
															<ul class="sub-menu">
																<li class="menu-item">
																	<a href="centerOverview.jsp">概况</a>
																</li>
																<li class="menu-item">
																	<a href="organization.jsp">师资招聘</a>
																</li>
																<!-- <li class="menu-item">
																	<a href="aboutSchool.jsp">学校介绍</a>
																</li> -->
															</ul>
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
												<a href="../index.jsp">首页</a>
											</li>
											<li class="am-parent">
												<a href="cultureSystem.jsp" >项目概况</a>
												<ul class="am-menu-sub am-collapse ">
													<li class="">
														<a href="cultureSystem.jsp" >培养体系</a>
													</li>
													<li class="">
														<a href="solution.jsp">解决方案</a>
													</li>
													<li class="">
														<a href="teachingMaterialSystem.jsp" class="">教材体系</a>
													</li>
													<li class="">
														<a href="taxCollectionFund.jsp" class="">领税基金</a>
													</li>
													<li class="">
														<a href="expertTeam.jsp" class="">专家团队</a>
													</li>
												</ul>
											</li>
											<li class="">
												<a href="regulationsClasses.jsp">规定班次</a>
											</li>
											<li class="">
												<a href="customizedClasses.jsp">定制班次</a>
											</li>
											<li class="">
												<a href="onlineClasses.jsp" style="color: #FF2F2F;">拼班</a>
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
												<a href="centerOverview.jsp">关于我们</a>
													<!-- sub-menu start-->
													<ul class="am-menu-sub am-collapse">
														<li class="menu-item">
															<a href="centerOverview.jsp" >概况</a>
														</li>
														<li class="menu-item">
															<a href="organization.jsp">师资招聘</a>
														</li>
														<!-- <li class="menu-item">
															<a href="aboutSchool.jsp">学校介绍</a>
														</li> -->
													</ul>
											</li>
											<li class="">
												<% if(user != null&&"1".equals(user.getIsadmin())) {%><a style="color: #FFF;">欢迎 &nbsp;&nbsp; <%=user.getUser_name()%>&nbsp;</ a>
													<a href ="/admin/pages/wise/adminPage/noticeAnnouncement" style="color:#FFF;">后台登录</ a>
													<a href="<%=request.getContextPath()%>/Logout" style="color: #FFF;">注销</ a>
												<%}else if(user != null&&"0".equals(user.getIsadmin())){ %>
													<a style="color: #FFF;">欢迎 &nbsp;&nbsp; <%=user.getUser_name()%>&nbsp;</ a>
													<a href ="<%=request.getContextPath()%>/admin/pages/wise/memberPage/memberMessage" style="color:#FFF;">后台登录</ a>
													<a href="<%=request.getContextPath()%>/Logout" style="color: #FFF;">注销</ a>
												<%} %>
												<% if(user == null) {%><a href="login.jsp" style="color: #FFF;">登录</ a>
													<a href ="<%=request.getContextPath()%>/admin/login.jsp" style="color:#FFFFFF;">后台登录</ a>
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
			<div class="layout-container">
				<div class="page-header regulations_bannerbg" style="background:url('../assets/img/banner/pinban.jpg');background-size:100% 100%;">
				</div>

				<div class="am-g am-g-fixed myFixedSiderbar">
					<!--正文-->
					<div class="am-u-md-9 am-u-md-push-3 mainBody" style="padding-right: 5%;">
						<div class="breadcrumb-box">
							<div class="am-container">
								<ol class="am-breadcrumb">
									<li>
										<a href="../index.jsp">首页</a>
									</li>
									<li class="am-active">在线拼班</li>
								</ol>
							</div>
						</div>
						<div class="am-g">
							<div class="am-u-sm-11 am-u-sm-centered">
								<div class="screeningConditions">
									<div class="form-group" style="margin-top: 5px;height: 32px;line-height: 32px;">
										<div class="demoTable">
										  <!-- 搜索ID： -->
										  <div class="layui-inline selectObj">
										   <!--  <input class="layui-input" name="id" id="demoReload" autocomplete="off"> -->
										    <label for="" class="control-label" style="float: left;">班次状态：</label>
											<select id="firstObj" class="select"  style="min-width: 150px;border-radius: 5px;border: 1px solid #cccccc;">
										        <option value="全部">全部</option>
										        <option value="待审核">待审核</option>
										        <option value="审核未通过">审核未通过</option>
										        <option value="审核通过">审核通过</option>
										        <option value="报名未开始">报名未开始</option>
										        <option value="报名进行中">报名进行中</option>
										        <option value="待开课">待开课</option>
										        <option value="开课中">开课中</option>
										        <option value="已结课">已结课</option>
										   </select>
										  </div>
										  <div class="layui-inline selectObj">
										    <label for="" class="control-label" style="float: left;">是否已报名：</label>
											<select id="secondObj" class="select" style="min-width: 150px;border-radius: 5px;border: 1px solid #cccccc;">
										        <option value="全部">全部</option>
										        <option value="已报名">已报名</option>
										        <option value="未报名">未报名</option>
										   </select>
										  </div>
										  <button class="layui-btn selectBtn" data-type="reload" style="border-radius:5px;height:23px;line-height:15px;background-color:#1e9fff;">搜索</button>
										</div>
									</div>
									<div class="form-group" style="margin-top: 5px;height: 32px;line-height: 32px;">
										<div class="demoTable">
										  <div class="layui-inline selectObj">
										    <label for="" class="control-label" style="float: left;">注：用户可在后台管理页面创建自己的拼班</label>
										  </div>
										</div>
									</div>
								</div>
								<div class="am-cf am-article tableTextAlign">
									<table id="LAY_table_user"  lay-filter="user" class="am-table am-table-compact am-table-centered littleFontSize">
										<thead>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
							</div>
						</div>

					</div>
					<!--侧边栏-->
					<div class="am-u-md-3 am-u-md-pull-9 my-sidebar mySiderbar">
						<div class="am-offcanvas" id="sidebar">
							<div class="am-offcanvas-bar">
								<ul class="am-nav">
									<jsp:include   page="mainBodyRight.jsp" flush="true"/>
								</ul>
							</div>
						</div>
					</div>
					<a href="#sidebar" class="am-btn am-btn-sm am-btn-success am-icon-bars am-show-sm-only my-button" data-am-offcanvas><span class="am-sr-only">侧栏导航</span></a>
				</div>

				<!--===========layout-footer================-->
				<div class="layout-footer">
					<jsp:include   page="footer.jsp" flush="true"/>
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
			<script src="../assets/js/common.js" charset="utf-8"></script>
			<!-- Bootstrap 3.3.5 -->
			<script src="../assets/bootstrap/js/bootstrap.min.js"></script>
			<!-- layui 2.3.0 -->
			<script src="../assets/layui-v2.3.0/layui/layui.js"></script>
			
			<script>
		layui.use('table', function(){
			var table = layui.table;
		  	<% if(user == null){%>
			//方法级渲染
			  table.render({
			    elem: '#LAY_table_user',
			    url: '<%=request.getContextPath()%>/Show/LayFigad',
			    cols: [[
				  {type:'numbers',title:"序号",minWidth:90},
			      {field:'figClass_name', title: '班级名称',minWidth:140},
			      {field:'figClass_start', title: '报名开始时间',minWidth:160},
			      {field:'figClass_end', title: '报名截止时间',minWidth:160},
			      {field:'figClass_class_start', title: '开课日期',minWidth:120},
			      {field:'figClass_class_end', title: '结课日期',minWidth:120},
			      {field:'figClass_pernum', title: '班级容纳人数',minWidth:160},
			      {field:'figClass_number', title: '可拼人数',minWidth:120},
			      {field:'figClass_status', title: '班次状态',templet:'#typestatus',minWidth:120},
			      {field:'user_status', title: '是否已报名',templet:'#typeuserstatus',minWidth:120},
			      {field:'figClass_id', title: '操作',toolbar: '#barDemo',minWidth:200}
			    ]],
			    id: 'testReload',
			    page: true
			  });
		  <%} else{%>
		//方法级渲染
		  table.render({
		    elem: '#LAY_table_user',
		    url: '<%=request.getContextPath()%>/FigClass/LayFig',
		    cols: [[
			  {type:'numbers',title:"序号",minWidth:90},
		      {field:'figClass_name', title: '班级名称',minWidth:140},
		      {field:'figClass_start', title: '报名开始时间',minWidth:160},
		      {field:'figClass_end', title: '报名截止时间',minWidth:160},
		      {field:'figClass_class_start', title: '开课日期',minWidth:120},
		      {field:'figClass_class_end', title: '结课日期',minWidth:120},
		      {field:'figClass_pernum', title: '班级容纳人数',minWidth:160},
		      {field:'figClass_number', title: '可拼人数',minWidth:120},
		      {field:'figClass_status', title: '班次状态',templet:'#typestatus',minWidth:120},
		      {field:'user_status', title: '是否已报名',templet:'#typeuserstatus',minWidth:120},
		      {field:'figClass_id', title: '操作',toolbar: '#barDemo',minWidth:200}
		    ]],
		    id: 'testReload',
		    page: true
		  });
		  <%}%>
		//监听工具条
		  table.on('tool(user)', function(obj){
		    var data = obj.data;
		    if(obj.event === 'show'){
		    	layer.open({
					type: 2, //此处以iframe举例
					title: '查看',
					area: ['1063px', '530px'],
					shade: 0,
					maxmin: true,
					offset: [100, 200],
					content: 'openPage/showOnlieClasses.jsp?figClass_id='+data.figClass_id,
					zIndex: layer.zIndex, //重点1
					success: function(layero) {
						layer.setTop(layero); //重点2
					}
				});
		    } else if(obj.event === 'cancel'){
		      	layer.confirm('确认取消报名?', function(index){
		      		$.ajax({
						url : '<%=request.getContextPath()%>/FigClass/cancel',
						type : 'post',
						dataType:"json",
						data:{
							Figclass_id:data.figClass_id
						},
						success : function(data) {
							if(data.message == "0"){
								layer.confirm('参数错误!', { title:'提示'}, function(index){
									  
									window.parent.location.reload();
									var index1 = parent.layer.getFrameIndex(window.name);
									parent.layer.close(index1);
									console.log(error);
								});
							}
							else if(data.message == "1"){
								
								layer.confirm('获取班次名称失败!', { title:'提示'}, function(index){
									  
									window.parent.location.reload();
									var index1 = parent.layer.getFrameIndex(window.name);
									parent.layer.close(index1);
									console.log(error);
								});
							}
							else if(data.message == "2"){
								
								layer.confirm('取消成功!', { title:'提示'}, function(index){
									  
									window.parent.location.reload();
									var index1 = parent.layer.getFrameIndex(window.name);
									parent.layer.close(index1);
									console.log(error);
								});
							}
						},
						error : function(error) {
							console.log('接口不通' + error);
						}
					});	
		        layer.close(index);
		      });
		    }else if(obj.event === 'delete'){
		      	layer.confirm('确认取消拼班?', function(index){
		      		$.ajax({
						url : '<%=request.getContextPath()%>/FigClass/deleteFig/'+data.figClass_id,
						type : 'post',
						dataType:"json",
						success : function(data) {
							if(data.message == "0"){
								layer.confirm('参数错误!', { title:'提示'}, function(index){
									  
									window.parent.location.reload();
									var index1 = parent.layer.getFrameIndex(window.name);
									parent.layer.close(index1);
								});
							}
							else if(data.message == "1"){
								
								layer.confirm('获取班次名称失败!', { title:'提示'}, function(index){
									  
									window.parent.location.reload();
									var index1 = parent.layer.getFrameIndex(window.name);
									parent.layer.close(index1);
								});
							}
							else if(data.message == "2"){
								
								layer.confirm('取消成功!', { title:'提示'}, function(index){
									  
									window.parent.location.reload();
									var index1 = parent.layer.getFrameIndex(window.name);
									parent.layer.close(index1);
								});
							}
						},
						error : function(error) {
							console.log('接口不通' + error);
						}
					});	
		        layer.close(index);
		      });
		    }else if(obj.event === 'edit'){
		    	layer.open({
					type: 2, //此处以iframe举例
					title: '修改',
					area: ['1063px', '530px'],
					shade: 0,
					maxmin: true,
					offset: [100, 200],
					content: 'openPage/editOnlieClasses.jsp?figClass_id='+data.figClass_id,
					zIndex: layer.zIndex, //重点1
					success: function(layero) {
						layer.setTop(layero); //重点2
					}
				});
		    }else if(obj.event === 'update'){
		    	layer.open({
					type: 2, //此处以iframe举例
					title: '上传名单',
					area: ['1063px', '530px'],
					shade: 0,
					maxmin: true,
					offset: [100, 200],
					content: 'openPage/updateOnlieClassesNameList.jsp',
					zIndex: layer.zIndex, //重点1
					success: function(layero) {
						layer.setTop(layero); //重点2
					}
				});
		    }else if(obj.event === 'Userupload'){
			    layui.layer.open({
		            title: "文件上传",
		            content: $('#upload_file_dialog').html(),
		            area: ['500px', '300px'],
		            btn: ['发送', '取消'],
		            yes: function (index, layero) {//发送
		                var f = document.getElementById("Userfile").files;
		                if(f.length<=0){
		                	layui.layer.alert("请选择文件!");
		                	return;
		                }
		                var fd = new FormData();
						fd.append("file",f[0]);
						fd.append("figClass_id",data.figClass_id);
						$.ajax({
							url:'<%=request.getContextPath()%>/FigClass/importUser',
							type:'post',
							encType: 'multipart/form-data', //表明上传类型为文件
							processData: false,  //tell jQuery not to process the data
		        			contentType: false,  //tell jQuery not to set contentType
							data:fd,
							success:function(data){
								if(data.success == true){
									if(data.message == "5"){
										layer.alert("上传成功!");
									}
								}
								else if(data.message == "4"){
									layer.alert("excel存在身份证重复!");
								}else if(data.message == "2"){
									layer.alert(" execl无数据!");
								}
							},
							error:function(data){

							}
						})
		            },
		            btn2:function(index, layero) {//取消
		                
		            }
	       		});

		        //文件上传change事件
		        $("input[name=uploadfile][type=file]").on("change", function (e) {
		            var filePath = $(this).val();
		            filePath = filePath.substring(filePath.lastIndexOf("\\")+1);
		            $("#uploadFileName").text(filePath);
		        });
		}
		    
		  });
		  var $ = layui.$, active = {
		    reload: function(){
		    var demoReload = $('#demoReload');
		    var status = $("#firstObj").val();
			var isEntry = $("#secondObj").val();
			if(status == '待审核'){
				status = '0';
			}else if(status == '审核未通过'){
				status = '2';
			}else if(status == '审核通过'){
				status = '1';
			}else if(status == '报名未开始'){
				status = '3';
			}else if(status == '报名进行中'){
				status = '4';
			}else if(status == '待开课'){
				status = '5';
			}else if(status == '开课中'){
				status = '6';
			}else if(status == '已结课'){
				status = '7';
			}else if(status == '全部'){
				status = "";
			}
	        if(isEntry=="全部"){
				isEntry = "";
			}else if(isEntry=="未报名"){
				isEntry = '0';
			}else if(isEntry=="已报名"){
				isEntry = '1';
			}
		      //执行重载
		      table.reload('testReload', {
		        page: {
		          	curr: 1 //重新从第 1 页开始
		        },
		        method:'post',
		        where: {
	        	    status:status,
					isbm:isEntry
		        }
		      });
		    }
		  };
		  
		  $('.demoTable .layui-btn').on('click', function(){
		    var type = $(this).data('type');
		    active[type] ? active[type].call(this) : '';
		  });
		});
		
		</script>
		<script>
			window.onload = function(){
				$(".regulations_bannerbg").height($(".regulations_bannerbg").width()*400/1581-172);//banner图高度
				$($(".screeningConditions .form-group")[0]).height($($(".demoTable")[0]).height());//下拉框DIV高度
				$(".screeningConditions").height($($(".demoTable")[0]).height()+$($(".demoTable")[1]).height());//注释
			}
			$(window).resize(function(){
				$(".regulations_bannerbg").height($(".regulations_bannerbg").width()*400/1581-172);//banner图高度
				$($(".screeningConditions .form-group")[0]).height($($(".demoTable")[0]).height());//下拉框DIV高度
				$(".screeningConditions").height($($(".demoTable")[0]).height()+$($(".demoTable")[1]).height());//注释
			});
		</script>
		
		<script type="text/html" id="barDemo">
		<%
			if(user == null){
		%>
			<a class="" lay-event="show" style="margin-right:10px; cursor: pointer;">查看</a>
		<%
			}else{
		%>
			{{#  if(d.figClass_status == '0'){ }}
		        <a class="" lay-event="show" style="margin-right:10px; cursor: pointer;">查看</a>
				{{#  if(d.isdelete == '1'){ }}
					<a class="" lay-event="edit" style="margin-right:10px; cursor: pointer;">修改</a>
					<a class="" lay-event="delete" style="margin-right:10px; cursor: pointer;">取消拼班</a>
				{{#  } }}
			{{#  } else if(d.figClass_status == "2"){ }}
				<a class="" lay-event="show" style="margin-right:10px; cursor: pointer;">查看</a>
				{{#  if(d.isdelete == '1'){ }}
					<a class="" lay-event="delete" style="margin-right:10px; cursor: pointer;">删除</a>
				{{#  } }}
	        {{#  } else if(d.figClass_status == "1"){ }}
				<a class="" lay-event="show" style="margin-right:10px; cursor: pointer;">查看</a>
			{{#  } else if(d.figClass_status == "3"){ }}
				<a class="" lay-event="show" style="margin-right:10px; cursor: pointer;">查看</a>
			{{#  } else if(d.figClass_status == "4"){ }}
				{{#  if(d.user_status == '0'){ }}
			        <a class="" lay-event="show" style="margin-right:10px; cursor: pointer;">查看</a>
					<a class="" lay-event="Userupload" style="margin-right:10px; cursor: pointer;">报名</a>
	        	{{#  } else if(d.user_status == "1"){ }}
					<a class="" lay-event="show" style="margin-right:10px; cursor: pointer;">查看</a>
					<a class="" lay-event="download" style="margin-right:10px; cursor: pointer;" href="<%=request.getContextPath()%>/FigClass/exportUser/{{d.figClass_id}}">下载名单</a>
					<a class="" lay-event="cancel" style="margin-right:10px; cursor: pointer;">取消报名</a>
				{{#  } }}
			{{#  } else if(d.figClass_status == "5"){ }}
				<a class="" lay-event="show" style="margin-right:10px; cursor: pointer;">查看</a>
				{{#  if(d.user_status == "1"){ }}
					<a class="" lay-event="show" style="margin-right:10px; cursor: pointer;">查看</a>
					<a class="" lay-event="download" style="margin-right:10px; cursor: pointer;" href="<%=request.getContextPath()%>/FigClass/exportUser/{{d.figClass_id}}">下载名单</a>
				{{#  } }}
			{{#  } else if(d.figClass_status == "6"){ }}
				<a class="" lay-event="show" style="margin-right:10px; cursor: pointer;">查看</a>
				{{#  if(d.user_status == "1"){ }}
					<a class="" lay-event="show" style="margin-right:10px; cursor: pointer;">查看</a>
					<a class="" lay-event="download" style="margin-right:10px; cursor: pointer;" href="<%=request.getContextPath()%>/FigClass/exportUser/{{d.figClass_id}}">下载名单</a>
				{{#  } }}
			{{#  } else if(d.figClass_status == "7"){ }}
				<a class="" lay-event="show" style="margin-right:10px; cursor: pointer;">查看</a>
				{{#  if(d.user_status == "1"){ }}
					<a class="" lay-event="download" style="margin-right:10px; cursor: pointer;" href="<%=request.getContextPath()%>/FigClass/exportUser/{{d.figClass_id}}">下载名单</a>
				{{#  } }}
				{{#  if(d.isdelete == '1'){ }}
					<a class="" lay-event="delete" style="margin-right:10px; cursor: pointer;">删除</a>
				{{#  } }}
			{{#  } }}
		<%}%>
		</script>

		<script type="text/html" id="typestatus">
	     {{#  if(d.figClass_status == "0"){ }}
	                            未审核
	     {{#  }else if(d.figClass_status=="1"){ }}
	     	审核通过
	     {{#  }else if(d.figClass_status=="2"){ }}
	     	审核未通过
	     {{#  }else if(d.figClass_status=="3"){ }}
	     	报名未开始
	     {{#  }else if(d.figClass_status=="4"){ }}
	     	报名中
		 {{#  }else if(d.figClass_status=="5"){ }}
	     	未开课
		 {{#  }else if(d.figClass_status=="6"){ }}
	     	开课中
		 {{#  }else if(d.figClass_status=="7"){ }}
	     	已结课
	     {{# } }}
	     </script>
	     <script type="text/html" id="typeuserstatus">
	     {{#  if(d.user_status == "0"){ }}
	        未报名
	     {{#  }else if(d.figClass_status=="1"){ }}
	     	已报名
	     {{# } }}
	     </script>
	     <script id="upload_file_dialog" type="text/html">
		    <div class="layui-form-item">
		        <label class="layui-form-label">文件上传</label>
		        <div class="layui-input-block">
		            <button type="button" class="layui-btn" onclick="$('input[name=uploadfile]').click();">
		                <i class="layui-icon">&#xe67c;</i>上传文件
		            </button>
		            <input type="file" name="uploadfile" style="display: none;" id="Userfile"/>
		        </div>
		        <label class="layui-form-label" style="width: 100%; text-align: left; padding-left: 110px;color:red;"
		            id="uploadFileName">
		            文件上传</label>
		    </div>
		</script>
	</body>

</html>