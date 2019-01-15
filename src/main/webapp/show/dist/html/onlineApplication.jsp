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
		<!-- DataTables -->
		<link rel="stylesheet" href="../../../admin/plugins/DataTables-1.10.15/media/css/jquery.dataTables.min.css">
		<link rel="stylesheet" href="../../../admin/plugins/DataTables-1.10.15/media/css/dataTables.bootstrap.min.css">
			<link rel="stylesheet" href="../../../admin/layui-v2.4.5/layui/css/layui.css">
		<link rel="stylesheet" href="../../../admin/layui-v2.4.5/layui/css/modules/layer/default/layer.css">
		<!-- <link rel="stylesheet" href="../../../admin/bootstrap/css/style.css" /> -->
		<link rel="stylesheet" href="../assets/css/amazeui.css" />
		<link rel="stylesheet" href="../assets/css/common.min.css" />
		<link rel="stylesheet" href="../assets/css/contact.min.css" />
		<link rel="stylesheet" href="../assets/css/myStyle.css" />
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
			.pagination{
				height: 31px;
				border: 1px solid #ccc;
				border-radius: 5px;
				font-size: 14px;
				padding-left: 0;
				line-height: 14px;
			}
			.pagination li{
				list-style:none;
				float:left;
				padding:10px;
			}
			.paginata_button{
				background:#fafafa!important;
			}
			.paginata_button a:hover{
				border:1px solid #9a9a9a;
				/*background:#fafafa!important;*/
			}
			.pagination .active{
				background:#1e9fff!important;
			}
			.previous a,.next a{
				color:#666!important;
			}
			.previous a:hover,.next a:hover{
				color:#333!important;
			}
			#zaizhiyantable{
				border-bottom:1px solid #ccc;
			}
			#zaizhiyantable tr{
				height:30px;
			}
			
			.paginate_button.active a{
				color:#fff;
			}
			.paginate_button a{
				color:#1e9fff;
			}
			.dataTables_wrapper .dataTables_paginate .paginate_button:hover{
				background:#fff!important;
				border-top:1px solid #fff;
				border-left:1px solid #fff;
				border-right:1px solid #fff;
				border-bottom:1px solid #ccc;
			}
			.dataTables_wrapper .dataTables_paginate .paginate_button:active{
				background:#fff!important;
				border-top:1px solid #fff;
				border-left:1px solid #fff;
				border-right:1px solid #fff;
				border-bottom:1px solid #fff;
			}
			.dataTables_wrapper .dataTables_paginate .paginate_button:focus{
				background:#fff!important;
				border-top:1px solid #fff;
				border-left:1px solid #fff;
				border-right:1px solid #fff;
				border-bottom:1px solid #fff;
			}
			.dataTables_wrapper .dataTables_paginate .paginate_button.active:hover{
				background:#1e9fff!important;
				border:1px solid #1e9fff;
			}
			#zaizhiyantable_previous a,#zaizhiyantable_next a{
				color:#666;
			}
			#zaizhiyantable_previous:hover,#zaizhiyantable_next:hover{
				border-bottom:1px solid #ccc;
			}
			.am-popup-inner{
				background:#f8f8f8;
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
										<a href ="<%=request.getContextPath()%>/admin/pages/wise/adminPage/noticeAnnouncement" style="color:#000000;">后台登录</ a>
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
															<a href="<%=request.getContextPath() %>/">首页</a>
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
															<a href="regulationsClasses.jsp">自主报名</a>
														</li>
														<li>
															<a href="customizedClasses.jsp">定制班次</a>
														</li>
														<li>
															<a href="onlineClasses.jsp">拼班</a>
														</li>
														<li>
															<a href="incumbencyStudent.jsp" style="color: #FF2F2F;">在职研</a>
															<!-- sub-menu start-->
															<ul class="sub-menu">
																<li class="menu-item">
																	<a href="incumbencyStudent.jsp">招生简章</a>
																</li>
																<li class="menu-item">
																	<a href="onlineApplication.jsp" style="color: #FF2F2F;">在线报名</a>
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
															<ul class="am-menu-sub am-collapse">
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
												<a href="<%=request.getContextPath() %>/">首页</a>
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
												<a href="regulationsClasses.jsp" >自主报名</a>
											</li>
											<li class="">
												<a href="customizedClasses.jsp">定制班次</a>
											</li>
											<li class="">
												<a href="onlineClasses.jsp">拼班</a>
											</li>

											<li class="am-parent">
												<a href="incumbencyStudent.jsp" style="color: #FF2F2F;">在职研</a>
												<ul class="am-menu-sub am-collapse  ">
													<li class="menu-item">
														<a href="incumbencyStudent.jsp">招生简章</a>
													</li>
													<li class="menu-item">
														<a href="onlineApplication.jsp" style="color: #FF2F2F;">在线报名</a>
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
												<a href="centerOverview.jsp" >关于我们</a>
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
				<div class="page-header news_bannerBg" style="background:url('../assets/img/banner/zaizhi.jpg');background-size:100% 100%;">
				</div>

			</div>

			<div class="am-g am-g-fixed myFixedSiderbar">
				<!--正文-->
				<div class="am-u-md-9 am-u-md-push-3 mainBody" style="padding-right: 5%;">
					<div class="breadcrumb-box">
						<div class="am-container">
							<ol class="am-breadcrumb">
								<li>
									<a href="<%=request.getContextPath() %>/">首页</a>
								</li>
								<li class="am-active">在职研</li>
								<li class="am-active">在线报名</li>
							</ol>
						</div>
					</div>
					<div class="am-g">
						<div class="am-u-sm-11 am-u-sm-centered">
							<div class="am-cf am-article tableTextAlign">
								<table id="zaizhiyantable"  class="am-table am-table-bordered am-table-radius am-table-compact am-table-centered littleFontSize">
									<thead>
									<tr>
										<th>序号</th>
										<th>招生项目</th>
										<th>报名</th>
									</tr>
									</thead>
								<!-- 	<tbody>			
									<tr>
										<td>1</td>
										<td data-am-modal="{target: '#my-popup'}"><a title="点击查看详情">第五期国税系统税务稽查专业骨干中级培训班</a></td>
										<td>
											<a href="#">单位报名</a>
											<a href="onlineApplicationByOne.jsp">个人报名</a>
										</td>
									</tr>
									<tr>
										<td>2</td>
										<td data-am-modal="{target: '#my-popup'}"><a  title="点击查看详情">第四期国税系统税务稽查专业骨干中级培训班</a></td>
										<td>
											<a href="#">单位报名</a>
											<a href="onlineApplicationByOne.jsp">个人报名</a>
										</td>
									</tr>
									<tr>
										<td>3</td>
										<td data-am-modal="{target: '#my-popup'}"><a title="点击查看详情">第三期国税系统税务稽查专业骨干中级培训班</a></td>
										<td>
											<a href="#">单位报名</a>
											<a href="onlineApplicationByOne.jsp">个人报名</a>
										</td>
									</tr>
									<tr>
										<td>4</td>
										<td data-am-modal="{target: '#my-popup'}"><a title="点击查看详情">第二期国税系统税务稽查专业骨干中级培训班</a></td>
										<td>
											<a href="onlineApplicationByCompany.jsp">单位报名</a>
											<a href="onlineApplicationByOne.jsp">个人报名</a>
										</td>
									</tr>
									<tr>
										<td>5</td>
										<td data-am-modal="{target: '#my-popup'}"><a title="点击查看详情">第一期国税系统税务稽查专业骨干中级培训班</a></td>
										<td>
											<a href="#">单位报名</a>
											<a href="onlineApplicationByOne.jsp">个人报名</a>
										</td>
									</tr>
									</tbody> -->
								</table>
								<div style="height: 40px; display:none;">
									<ul data-am-widget="pagination" class="am-pagination am-pagination-default" style="text-align: center;">
										<li class="am-pagination-first ">
											<a href="#" class="">首页</a>
										</li>

										<li class="am-pagination-prev ">
											<a href="#" class="">上一页</a>
										</li>

										<li class="am-active">
											<a href="#" class="am-active">1</a>
										</li>
										<li class="">
											<a href="#" class="">2</a>
										</li>
										<li class="">
											<a href="#" class="">3</a>
										</li>
										<li class="">
											<a href="#" class="">4</a>
										</li>
										<li class="">
											<a href="#" class="">5</a>
										</li>

										<li class="am-pagination-next ">
											<a href="#" class="">下一页</a>
										</li>

										<li class="am-pagination-last ">
											<a href="#" class="">尾页</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
						<div class="am-popup" id="my-popup">
							<div class="am-popup-inner">
								<div class="am-popup-hd">
									<h4 class="am-popup-title"  id="my-popup2">基础学习</h4>
									<span data-am-modal-close class="am-close">&times;</span>
								</div>
								<div class="am-popup-bd" id="my-popup1">
									<!-- <h4>1．大纲适用对象</h4>
									<p>本大纲适用于高职高专会计专业所开设纳税基础与实务课程。</p>
									<h4>2．课程的性质和任务</h4>
									<p>纳税基础与实务课程是开放教育专科与高职高专会计学专业的一门专业基础课，是开放教育专科与高职高专会计学专业知识结构中的主体部分。本课程的任务是以我国现行税收制度为依据，结合企业的一般经济业务，阐释各税种的基本理论和实务，培养学生从事企业财务会计工作应具备的各税种的基本知识和操作能力。</p>
									<h4>3．与相关课程的衔接</h4>
									<p>学习本课程应先修政治经济学、基础会计等课程，中级财务会计课程最好与本课程同时学习或在本课程稍后学习。</p>
									<h4>4．课程教学基本要求</h4>
									<p>通过运用多种教学媒体和形式组织教学，学生能够掌握税收法律基本理论与实务知识，具备实际操作能力，以及在今后的工作中熟练应用。</p>
									<h4>5．教学方法和教学形式建议</h4>
									<p>本课程是一门实践性和技能性较强的课程，需要运用多种教学媒体、采用多种教学形式组织教学。除文字教材应力求通俗易懂、便于自学以外，IP课件、网上辅导文本应对重点、难点问题进行讲解和说明。辅导教师除督促学生阅读教材和使用IP课件、网上辅导文本外，应特别注意对作业的批改和讲评，有条件的还应安排实训。</p>
									<h4>6．课程教学要求的层次</h4>
									<p>根据课程的性质和特点，本大纲对基本知识和基本理论的教学要求分为了解和理解两个层次，对基本方法和技能的教学要求分为了解和掌握两个层次。</p> -->
								</div>
							</div>
						</div>
				</div>

				<!--侧边栏-->
				<div class="am-u-md-3 am-u-md-pull-9 my-sidebar mySiderbar">
					<div class="am-offcanvas" id="sidebar">
						<div class="am-offcanvas-bar">
							<ul class="am-nav">
								<li class="sidebar_contactUs">■在职研</li>
								<li class="promo_detailed--list_item sidebarListLi" style="border-top:1px solid #001A35;text-align: center;padding: 10px 0 0 0;">
									<a href="incumbencyStudent.jsp" style="color: #000000;">招生简章</a>
								</li>
								<li class="promo_detailed--list_item sidebarListLi" style="border-bottom: 1px solid #001A35;text-align: center;padding: 5px 0 10px 0;">
									<a href="onlineApplication.jsp" style="font-weight: 600;color: #FF2F2F;">在线报名</a>
								</li>
							</ul>
							<ul class="am-nav">
								<jsp:include   page="mainBodyRight.jsp" flush="true"/>
							</ul>
						</div>
					</div>
				</div>
				<a href="#sidebar" class="am-btn am-btn-sm am-btn-success am-icon-bars am-show-sm-only my-button" data-am-offcanvas><span
					 class="am-sr-only">侧栏导航</span></a>
			</div>

			<!--===========layout-footer================-->
			<div class="layout-footer">
				<jsp:include   page="footer.jsp" flush="true"/>
			</div>
		</div>

		<input type="hidden" id="project_id"  value="">

		<script src="../assets/js/jquery-2.1.0.js" charset="utf-8"></script>
		<!--[if (gte IE 9)|!(IE)]><!-->
		<script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
		<!--<![endif]-->

		<!--[if lt IE 9]>
		<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
		<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
		<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
		<![endif]-->
					<script src="../../../admin/layui-v2.4.5/layui/layui.js"></script>
			<script src="../../../admin/layui-v2.4.5/layui/lay/modules/layer.js"></script>
		<script src="../assets/js/amazeui.js" charset="utf-8"></script>
		<!-- DataTables -->
		<script src="../../../admin/plugins/DataTables-1.10.15/media/js/jquery.dataTables.min.js"></script>
		<script src="../../../admin/plugins/DataTables-1.10.15/media/js/dataTables.bootstrap.min.js"></script>


		<script>
			window.onload = function(){
				$(".regulations_bannerbg").height($(".regulations_bannerbg").width()*400/1581-172);//banner图高度
			}
			$(window).resize(function(){
				$(".regulations_bannerbg").height($(".regulations_bannerbg").width()*400/1581-172);//banner图高度
			});
		</script>
			<script>
			$(document).ready(function() {
				<%
					if(user == null){
						%> <% 
						}
				%>
			});
		</script>
		<script>
			function updatediv(id){
				$.ajax({
					url : '<%=request.getContextPath()%>/Show/getProjectdetailByid',
					type : 'GET',
					dataType:"json",
					data:{
						Project_id:id
					},
	                success:function(data){
	                	if(data.success == true){
	                		var project_context = data.data.project_context;
		 					 document.getElementById('my-popup1').innerHTML=project_context;
		 					 document.getElementById('my-popup2').innerHTML=data.data.project_name;
	                	}
	                },
	                error:function(error){
	                	console.log('接口不通' + error);
	                }
	            })
	            
	            
			}
		 	
			
		 	function dateClear(){
				$('#date').attr("value","");
			}
		 	
			
		 	var dataTableLang = {
					"sProcessing": "处理中...",
					"sLengthMenu": "显示 _MENU_ 项结果",
					"sZeroRecords": "没有匹配结果",
					"sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
					"sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
					"sInfoFiltered": "(由 _MAX_ 项结果过滤)",
					"sInfoPostFix": "",
					"sSearch": "搜索:",
					"sUrl": "",
					"sEmptyTable": "表中数据为空",
					"sLoadingRecords": "载入中...",
					"sInfoThousands": ",",
					"oPaginate": {
						"sFirst": "首页",
						"sPrevious": "上页",
						"sNext": "下页",
						"sLast": "末页"
					},
					"oAria": {
						"sSortAscending": ": 以升序排列此列",
						"sSortDescending": ": 以降序排列此列"
					}
				};
		 	
		 	
			
		 	var zaizhiyantable = $('#zaizhiyantable').DataTable({
				"language" : dataTableLang,
				"paging": true,
				"info": false,
				"aLengthMenu": [15],
				"lengthChange": false,
				"searching": false,
				"ordering": false,
				"autoWidth": false,
				ajax: {
	                url: "<%=request.getContextPath()%>/Show/getlistProject1"
	            },
	            serverSide: true,
	            columns: [
	                
	                {"data": "project_id",
	                 "render":function(data,type,row,meta){
// 	                	 if(row.status=='5'){
// 	                		 window.open("login.jsp",'_self');
// 	                	 }
	                	           var startIndex = meta.settings._iDisplayStart;
	                	     return startIndex+meta.row+1;
	                }
	                },
	                {"data": "project_name"},
	                {"data": null}
	            ],
	            "aoColumnDefs":[
	                        	{
	        					    "targets":-2,
	        					    "bSortable": false,
	        					    render: function(data, type, row) {
	        					        var html ='<a id=\"show\" data-am-modal=\"{target: \'#my-popup\'}\"  title=\"点击查看详情\"    href=\"javascript:updatediv(\''+row.project_id+'\')\">'+row.project_name+'</a>';
	        					        return html;
	        					    }},
    					 			{		
                        "targets":-1,
                        "bSortable": false,
                        render: function(data, type, row) {
                        	if(data.project_status=='0'){
	                            var html ='<a id=\"show\" href=\"#\" onclick=\"addBranch(this,\''+row.project_id+'\',\''+row.project_name+'\');\">单位报名</a>&nbsp;&nbsp;&nbsp;&nbsp;<a id=\"edit\" href=\"#\" onclick=\"addBranch(this,\''+row.project_id+'\',\''+row.project_name+'\');\">个人报名</a>';
	                            return html;
                        	}
//                         	else{
//                         		var html='<a hrer="">查看报名信息</a>';
//                         		return html;
//                         	}
                        	else if(data.project_status=='1'){
                        		 var html ='<a id=\"show\" href=\"#\" onclick=\"showone(\''+row.apply_id+'\');\">查看报名信息</a>';
 	                            return html;
                      			  
                      	}
	                      	else if(data.project_status=='2'){
	                   		 var html ='<a id=\"show\" href=\"#\" onclick=\"showcom(\''+row.applyunit_id+'\',\''+row.project_name+'\');\">查看报名信息</a>';
	                            return html;
	                      	}
                        }
                    }], 
				
			});
			
		</script>
		<script type="text/javascript"> 
		
// 			function forwa(){
// 				 window.open("login.jsp",'_self');
// 			}
			function showcom(applyUnit_id,name){
				layer.open({
					type: 2, //此处以iframe举例
					title: '查看报名信息',
					area: ['1063px', '530px'],
					shade: 0,
					maxmin: true,
					offset: [100, 200],
					content:encodeURI('openPage/showIncumbencyByCompany.jsp?applyUnit_id='+applyUnit_id+"&project_name="+name),
					zIndex: layer.zIndex, //重点1
					success: function(layero) {
						layer.setTop(layero); //重点2
					}
				});
				
			}
			function showone(apply_id){
		    	layer.open({
					type: 2, //此处以iframe举例
					title: '查看项目',
					area: ['1063px', '530px'],
					shade: 0,
					maxmin: true,
					offset: [100, 200],
					content: 'openPage/showIncumbencyByOne.jsp?apply_id='+apply_id,
					zIndex: layer.zIndex, //重点1
					success: function(layero) {
						layer.setTop(layero); //重点2
					}
				});
			}
		
		</script>
		<script type="text/javascript"> 
			function addBranch(obj,id,name){
				var sText = obj.innerHTML;
				<%
					if(user == null){
						%> alert("您未登录,请登录后报名!");<% 
					}else if(user != null){
							%>
							if(sText=='个人报名'){
								window.open("onlineApplicationByOne.jsp?param="+id,'_blank');
							}<%	
							%>else if(sText == '单位报名'){
								window.open(encodeURI("onlineApplicationByCompany.jsp?param="+id+","+name),'_blank');
							}<%
						}
				%>
			}
		</script>

	</body>

</html>
