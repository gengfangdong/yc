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
					height:80px;
				}
				.screeningConditions button{
					margin-left:40%;
				}
				#hostDate{
					width:100%!important;
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
			.layui-table-cell{
				text-align:center;
			}
			.layui-table-cell.laytable-cell-1-handle a{
				color:#0e90d2;
				cursor:pointer;
			}
			.layui-table-cell.laytable-cell-2-handle a{
				color:#0e90d2;
				cursor:pointer;
			}
			#testList{
				float:right;
				height:28px;
				line-height:28px;
				margin-left:10px;
				margin-right:10px;
				font-size:12px;
			}
			#togetherClassesCompany,#maxClassesNumber,#togetherClassesStartDate,#togetherClassesEndDate,#classesEndDate{
				border:none;
				border-radius:5px;
				border:1px solid #a9a9a9;
				height:23px;
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
									<div class="am-dropdown" data-am-dropdown style="height: 35px;line-height: 35px;color: #000000;">
										联系电话+86-010-83951120 / 83951097
									</div>
								</div>
							</div>
							<div class="am-u-md-4">
								<div class="topbar-right am-text-right am-fr">
									<% if(user != null) {%><a style="color: #000000;">欢迎 &nbsp;&nbsp; <%=user.getUser_name()%>&nbsp;</a>
										<a href="<%=request.getContextPath()%>/Logout" style="color: #000000;">注销</a>
									<%}; %>
									<% if(user == null) {%><a href="html/login.jsp" style="color: #000000;">登录</a><%}; %>
									<a href="html/register.jsp" style="color: #000000;">注册</a>
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
															<a href="customizedClasses.jsp" style="color: #FF2F2F;">定制班次</a>
														</li>
														<li>
															<a href="onlineClasses.jsp">拼班</a>
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
															<a href="about.jsp">关于我们</a>
															<!-- sub-menu start-->
															<ul class="sub-menu">
																<li class="menu-item">
																	<a href="centerOverview.jsp">中心概况</a>
																</li>
																<li class="menu-item">
																	<a href="organization.jsp">组织结构</a>
																</li>
																<li class="menu-item">
																	<a href="aboutSchool.jsp">学校介绍</a>
																</li>
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
												<a href="cultureSystem.jsp">项目概况</a>
												<ul class="am-menu-sub am-collapse ">
													<li class="">
														<a href="cultureSystem.jsp">培养体系</a>
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
												<a href="customizedClasses.jsp"  style="color: #FF2F2F;">定制班次</a>
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
												<a href="about.jsp">关于我们</a>
												<ul class="am-menu-sub am-collapse  ">
													<li class="menu-item">
														<a href="centerOverview.jsp">中心概况</a>
													</li>
													<li class="menu-item">
														<a href="organization.jsp">组织结构</a>
													</li>
													<li class="menu-item">
														<a href="aboutSchool.jsp">学校介绍</a>
													</li>
												</ul>
											</li>
											<li class="">
												<% if(user != null) {%><a >欢迎 &nbsp;&nbsp; <%=user.getUser_name()%>&nbsp;</a>
													<a href="<%=request.getContextPath()%>/Logout">注销</a>
												<%}; %>
												<% if(user == null) {%><a href="login.jsp" >登录</a><%}; %>
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
							<a href=""><img src="assets/img/index/logo_top.png" alt="" style="width: auto;"></a>
						</div>
					</div>
				</div>
				<!--mobile header end-->
			</div>

			<!--===========layout-container================-->
			<div class="layout-container">
				<div class="page-header regulations_bannerbg"  style="background:url('../assets/img/banner/dingzhi.jpg');background-size:100% 100%;">
				</div>

				<div class="am-g am-g-fixed myFixedSiderbar">
					<!--正文-->
					<div class="am-u-md-9 am-u-md-push-3 mainBody" style="padding-right: 100px;">
						<div class="breadcrumb-box">
							<div class="am-container">
								<ol class="am-breadcrumb">
									<li>
										<a href="../index.jsp">首页</a>
									</li>
									<li class="am-active">定制班次</li>
								</ol>
							</div>
						</div>
						<div class="am-g">
							<div data-am-widget="tabs" class="am-tabs am-tabs-d2">
								<ul class="am-tabs-nav am-cf">
									<li class="am-active">
										<a href="[data-tab-panel-0]">方案定制</a>
									</li>
									<li class="">
										<a href="[data-tab-panel-1]">课程定制</a>
									</li>
									<li class="">
										<a href="[data-tab-panel-2]">自由定制</a>
									</li>
								</ul>
								<div class="am-tabs-bd">
									<div data-tab-panel-0 class="am-tab-panel am-active" style="min-height:230px;overflow-y:scroll;">
										<div class="am-u-sm-11 am-u-sm-centered">
											<div class="am-cf am-article tableTextAlign">
												<div style="text-align:left;margin-top:10px;">
													<label >注：方案定制仅能选择一种方案</label>
												</div>
												<div class="table-responsive table-responsive_vis" id="sample-table-2" style="padding-left: 10px;padding-right: 10px;margin-top:-10px;">
													<table id="LAY_table_user2" lay-filter="user2"  class="am-table am-table-compact am-table-centered littleFontSize example1_x" style="margin-top: 20px!important;">
														<thead>
															
														</thead>
														<tbody>
															
														</tbody>
													</table>
													
												</div>

												
												<!--<button type="button" class="am-btn am-btn-primary am-round subBtn" style="margin-top: 20px;">提交</button>-->
											</div>
										</div>
									</div> 
									<div data-tab-panel-1 class="am-tab-panel" style="min-height:230px;overflow-y:scroll;">
										<div class="am-u-sm-11 am-u-sm-centered">
											<div class="screeningConditions">
												<div class="form-group">
													 <div class="form-group" style="margin-top: 5px;height: 32px;line-height: 32px;margin-bottom: 0;">
														<div class="col-sm-10" style="height: 32px;line-height: 32px;">
															 <div class="layui-inline selectObj">
															    <label for="" class="control-label" style="float: left;">一级目录：</label>
																<select id="firstObj" class="select" onclick="firstSelect(this);" style="min-width: 150px;border-radius: 5px;border: 1px solid #cccccc;">
															        <option value="全部">全部</option>
															   </select>
															  </div>
															  <div class="layui-inline selectObj">
															    <label for="" class="control-label" style="float: left;">二级目录：</label>
																<select id="secondObj" class="select" onclick="secondSelect(this);"  style="min-width: 150px;border-radius: 5px;border: 1px solid #cccccc;">
															        <option value="全部">全部</option>
															   </select>
															  </div>
															<button class="layui-btn selectBtn" data-type="reload" style="height:23px;line-height:15px;background-color:#0e90d2;border-radius:3px;">搜索</button>
														</div>
													</div>	
												</div>
											</div>
											<div class="am-cf am-article tableTextAlign">
												<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 10px;padding-right: 10px;">
													<table id="LAY_table_user" lay-filter="user" class="table am-table am-table-compact am-table-centered littleFontSize table-bordered  table-hover example1_x" style="margin-top: 20px!important;">
														<thead>
														</thead>
														<tbody>
														</tbody>
													</table>
													
												</div>
											</div>
										</div>
									</div>

									<div data-tab-panel-2 class="am-tab-panel" style="min-height:230px;overflow-y:scroll;">
										<div class="am-u-sm-11 am-u-sm-centered">
											<div class="am-cf am-article tableTextAlign">
												
												<table class="am-table am-table-bordered am-table-radius onlineTable littleFontSize">
													<tbody>
														<tr>
															<td class="tableLeftTd3">举办天数:</td>
															<td class="tableRightTd3">
																<input type="text" id="hostingDay" style="width:100%;border:none;border-radius:5px;border:1px solid #a9a9a9;height:23px;" />
															</td>
														</tr>
														<tr>
															<td class="tableLeftTd3">备注：</td>
															<td class="tableRightTd3">
																<textarea placeholder="请输入您的学习方向、学习时间等信息" style="width: 100%;height: 150px;border-radius:5px;"></textarea>
																<!--<input class="onlineInput" type="text" placeholder="请输入您的学习方向、学习时间等信息" />-->
																<!-- <td>2012-10-01</td> -->
														</tr>
													</tbody>
												</table>
												
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div style="margin:10px;">
								<table class="am-table am-table-bordered am-table-radius onlineTable littleFontSize">
									<tbody>
										<tr>
											<td class="tableLeftTd3">班级名称:</td>
											<td class="tableRightTd3">
												<input type="text" id="classesName" style="width: 100%;border:none;border-radius:5px;border:1px solid #a9a9a9;height:23px;" />
											</td>
										</tr>
										<tr>
											<td class="tableLeftTd3">预计举办日期:</td>
											<td class="tableRightTd3">
												<input id="hostDate" name="newsDate" placeholder="YYYY-MM-DD" type="text" class="" style="height: 23px;width:252px;cursor:pointer;border:none;border-radius:5px;border:1px solid #a9a9a9;height:23px;" />
											</td>
										</tr>
										<tr>
											<td class="tableLeftTd3">计划参加人数:</td>
											<td class="tableRightTd3">
												<input type="text" id="planNumOfEntries" onBlur="judgesNumber(this);" placeholder="请选择人数大于50人，低于50人，将发布到拼班项目" style="width: 100%;border:none;border-radius:5px;border:1px solid #a9a9a9;height:23px;" />
											</td>
										</tr>
										
										<tr>
											<td class="tableLeftTd3">预计举办地点:</td>
											<td class="tableRightTd3">
												<input type="text" id="planHostAddress" placeholder="请精确到所在市区县，如：北京市海淀区" style="width: 100%;border:none;border-radius:5px;border:1px solid #a9a9a9;height:23px;" />
											</td>
										</tr>
										<tr>
											<td class="tableLeftTd3">联系人员:</td>
											<td class="tableRightTd3">
											<input type="text" id="contactPersonnel" style="width: 100%;border:none;border-radius:5px;border:1px solid #a9a9a9;height:23px;" />
											</td>
										</tr>
										<tr>
											<td class="tableLeftTd3">联系电话:</td>
											<td class="tableRightTd3">
												<input type="text" id="contactNumber" style="width: 100%;border:none;border-radius:5px;border:1px solid #a9a9a9;height:23px;" />
											</td>
										</tr>
										<tr>
											<td class="tableLeftTd3">相关资料:</td>
											<td class="tableRightTd3" >
												<div class="layui-upload-list">
												    <table class="layui-table">
												      <thead>
												        <tr><th>文件名</th>
												        <th>大小</th>
												        <th>操作</th>
												      </tr></thead>
												      <tbody id="demoList"></tbody>
												    </table>
												 </div>
												 <button type="button" class="layui-btn layui-btn-normal" id="testList" >选择多文件</button>
											</td>
										</tr>
									</tbody>
								</table>
								<div class="table-responsive table-responsive_vis" id="sample-table-00" style="display:none;">
									<table id="branchTable2" class="am-table am-table-bordered am-table-radius onlineTable littleFontSize">
										<tbody>
											<tr>
												<td class="tableLeftTd3">拼班发起单位:</td>
												<td class="tableRightTd3" colspan="2">
													<input type="text" value="" id="togetherClassesCompany" style="width: 100%;" />
												</td>
	
											</tr>
											<tr>
												<td class="tableLeftTd3">班级容纳人数:</td>
												<td class="tableRightTd3" colspan="2">
													<input type="text" value="" id="maxClassesNumber" style="width: 100%;" />
												</td>
											</tr>
											<tr>
												<td class="tableLeftTd3">报名开始日期:</td>
												<td class="tableRightTd3" colspan="2">
													<input value="" id="togetherClassesStartDate" name="togetherClassesStartDate"  autocomplete="off"  placeholder="YYYY-MM-DD" type="text" class="" style="height: 23px;width:252px;cursor:pointer;" />
												</td>
	
											</tr>
											<tr>
												<td class="tableLeftTd3">报名截止日期:</td>
												<td class="tableRightTd3" colspan="2">
													<input value="" id="togetherClassesEndDate" name="togetherClassesEndDate"  autocomplete="off"  placeholder="YYYY-MM-DD" type="text" class="" style="height: 23px;width:252px;cursor:pointer;" />
												</td>
	
											</tr>
											
											<tr>
												<td class="tableLeftTd3">预计结课日期:</td>
												<td class="tableRightTd3" colspan="2">
													<input value="" id="classesEndDate" name="classesEndDate"  autocomplete="off"  placeholder="YYYY-MM-DD" type="text" class="" style="height: 23px;width:252px;cursor:pointer;" />
												</td>
											</tr>
										</tbody>
									</table>
								</div>
						
								<button type="button" class="am-btn am-btn-primary am-round subBtn" style="margin-top: 20px;line-height:10px;height:25px;font-size:14px;width:64px;border-radius:3px;margin-left:50%;" onclick="branchSub();">提交</button>
							</div>

						</div>

					</div>
					<!--侧边栏-->
					<div class="am-u-md-3 am-u-md-pull-9 my-sidebar mySiderbar">
						<div class="am-offcanvas" id="sidebar">
							<div class="am-offcanvas-bar">
								<ul class="am-nav">
									<li class="sidebar_contactUs" style="border-bottom: 1px solid #001A35;">■联系我们</li>
									<li class="promo_detailed--list_item sidebarListLi" style="padding-top: 20px;">
										<dl>
											<dd><i class="am-icon-phone"></i> 010-83951097、83951120、83951104、13260122245
											</dd>
										</dl>
									</li>
									<li class="promo_detailed--list_item sidebarListLi">
										<dl>
											<dd><i class="am-icon-map-marker"></i> 北京市丰台区樊羊路33号首都经济贸易大学华侨学院1层C104/C105办公室
											</dd>
										</dl>
									</li>
									<li class="promo_detailed--list_item sidebarListLi">
										<dl>
											<dd><i class="am-icon-envelope-o"></i> pxjd@cueb.edu.cn
											</dd>
										</dl>
									</li>
									<li class="promo_detailed--list_item sidebarListLi">
										<img src="../assets/img/index/wx_code.png" style="max-width: 170px;padding-left: 20px;" />
									</li>
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
			var firstObj="";
			var secondObj="";
			function firstSelect(obj){
				firstObj = obj.value;
				
				if(firstObj=="全部"){
					firstObj="";
				}
				$.ajax({
					url:"<%=request.getContextPath()%>/Course/getSecond",
					type:"post",
					data:{
						First_course:firstObj,
						Second_course:secondObj
					},
					success:function(data){
						if(data.success==true){
							document.getElementById("secondObj").innerHTML = '';
							document.getElementById("secondObj").innerHTML = '<option value="全部">全部</option>';
							for(var i=0;i<data.data.length;i++){
								document.getElementById("secondObj").innerHTML += '<option value='+data.data[i]+'>'+data.data[i]+'</option>';
							}
							var len = $('#firstObj').children().length;
							for(var j=0;j<len;j++){
								if($($('#firstObj').children()[j]).selected==true){
									$($('#firstObj').children()[j]).attr('selected','');
								}
							}
							for(var i=0;i<len;i++){
								if($($('#firstObj').children()[i]).val()==firstObj){
									$($('#firstObj').children()[i]).attr('selected','selected');
									break;
								}
							}
							secondObj = $("#secondObj").val();
							if(secondObj=="全部"){
								secondObj="";
							}
						}else{
							alert("没有数据！");
						}
					},
					error:function(error){
						alert("接口错误"+error);
					}
				});
				
				
			}
			
			function secondSelect(obj){

				secondObj = obj.value;
				if(secondObj=="全部"){
					secondObj="";
				}
				for(var i=0;i<$('#firstObj').length;i++){
					if($($('#firstObj').children()[i]).selected==true){
						var First_course = $($('#firstObj').children()[i]).val()
					}
				}
				
				$.ajax({
					url:"<%=request.getContextPath()%>/Course/getSecond",
					type:"post",
					data:{
						First_course:firstObj,
						Second_course:secondObj
					},
					success:function(data){
						if(data.success==true){
							document.getElementById("secondObj").innerHTML = '<option value="全部">全部</option>';
							for(var i=0;i<data.data.length;i++){
								document.getElementById("secondObj").innerHTML += '<option value='+data.data[i]+'>'+data.data[i]+'</option>';
							}
							var len = $('#secondObj').children().length;
							for(var j=0;j<len;j++){
								if($($('#secondObj').children()[i]).selected==true){
									$($('#secondObj').children()[i]).attr('selected','');
								}
							}
							for(var i=0;i<len;i++){
								if($($('#secondObj').children()[i]).val()==secondObj){
									$($('#secondObj').children()[i]).attr('selected','selected');		
								}
							}
							
							/* $("#secondObj").children(); */
						}else{
							alert("没有数据！");
						}
					},
					error:function(error){
						alert("接口错误"+error);
					}
				})
			}
		</script>
			<script type="text/javascript">
			layui.use('element', function() {
				var element = layui.element;

				//一些事件监听
				element.on('tab(demo)', function(data) {
					console.log(data);
				});
			});
			layui.use('laydate', function(){
			  	var laydate = layui.laydate;
			  
			  //执行一个laydate实例
			  	laydate.render({
			    	elem: '#hostDate' //指定元素
			  	});
			  
			  	laydate.render({
			    	elem: '#togetherClassesStartDate' //指定元素
			  	});
			  	
			  	laydate.render({
			    	elem: '#togetherClassesEndDate' //指定元素
			  	});
			  	
			  	laydate.render({
			    	elem: '#classesEndDate' //指定元素
			  	});
			});
			
			layui.use('table', function(){
				var table = layui.table;
			  
			  //方法级渲染
			  table.render({
			    elem: '#LAY_table_user',
			    url: '<%=request.getContextPath()%>/Course/getlistLaynp',
			    cols: [[
			      {type:'checkbox'},
				  {type:'numbers',title:"序号",minWidth:90},
			     /*  {field:'course_id', title: 'ID',style:'display:none;'}, */
			      {field:'first_course', title: '一级目录',minWidth:120},
			      {field:'second_course', title: '二级目录',minWidth:120},
			      {field:'third_course', title: '三级目录',minWidth:120},
			      {field:'course_id', title: '操作',toolbar: '#barDemo',minWidth:90}
			    ]],
			    id: 'testReload',
			    page: false
			  });
			  
			//监听工具条
			 table.on('tool(user)', function(obj){
			    var data = obj.data;
			    if(obj.event === 'show'){
			    	layer.open({
						type: 2, //此处以iframe举例
						title: '查看',
						area: ['70%', '530px'],
						shade: 0,
						maxmin: true,
						offset: ['10%', '15%'],
						content: 'openPage/showCourseCatalogue.jsp?course_id='+data.course_id,
						zIndex: layer.zIndex, //重点1
						success: function(layero) {
							layer.setTop(layero); //重点2
						}
					});
			     }  
			  });
			  
			  var $ = layui.$, active = {
			    reload: function(){
			      var demoReload = $('#demoReload');
			      
			      //执行重载
			      table.reload('testReload', {
			        page: {
			          curr: 1 //重新从第 1 页开始
			        },
			        method:'post',
			        where: {
			        	    First_course:firstObj,
							Second_course:secondObj
			        }
			      });
			    }
			  };
			  
			  //方案定制
			  table.render({
				    elem: '#LAY_table_user2',
				    url: '<%=request.getContextPath()%>/ClassPlan/getlistnopage',
				    cols: [[
					  /* {field:'radio', title: '选择',toolbar: '#radio2'}, */
					  {type:'checkbox'},
					  {type:'numbers',title:"序号"},
				      {field:'classplan_id', title: 'ID',style:'display:none;'},
				      {field:'classplan_name', title: '方案名称',minWidth:120},
				      {field:'classplan_date', title: '选择天数',toolbar: '#selected',minWidth:120},
				      {field:'handle', title: '操作',toolbar: '#barDemo2',minWidht:90}
				    ]],
				    id: 'testReload2',
				    page: false
				  });
			  
			//监听工具条
				 table.on('tool(user2)', function(obj){
				    var data = obj.data;
				    if(obj.event === 'show2'){
				    	layer.open({
							type: 2, //此处以iframe举例
							title: '查看',
							area: ['70%', '530px'],
							shade: 0,
							maxmin: true,
							offset: ['10%', '15%'],
							content: 'openPage/showClassesPlan.jsp?ClassPlan_id='+data.classplan_id,
							zIndex: layer.zIndex, //重点1
							success: function(layero) {
								layer.setTop(layero); //重点2
							}
						});
				     }  
				  });
			
				 
			  
			  $('.demoTable .layui-btn').on('click', function(){
			    var type = $(this).data('type');
			    active[type] ? active[type].call(this) : '';
			    $('table.layui-table thead tr th:eq(2)').addClass('layui-hide');
			  });
			  $('table.layui-table thead tr th:eq(2)').addClass('layui-hide');
			});
		</script>
		<script>
		var filelist = [];
		layui.use('upload', function() {
			var upload = layui.upload;

			//多文件列表示例
		  var demoListView = $('#demoList')
		    ,uploadListIns = upload.render({
		    elem: '#testList'
		    ,url: '/upload/'
		    ,accept: 'file'
		    ,multiple: true
		    ,auto: false
		    ,bindAction: '#testListAction'
		    ,choose: function(obj){   
		      var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
		      //读取本地文件
		      obj.preview(function(index, file, result){
		      	filelist.push(file);
		        var tr = $(['<tr id="upload-'+ index +'">'
		          ,'<td>'+ file.name +'</td>'
		          ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
		          ,'<td>'
		            ,'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
		            ,'<button class="layui-btn layui-btn-xs demo-delete" style="background:#1e9fff;">删除</button>'
		          ,'</td>'
		        ,'</tr>'].join(''));
		        
		        //单个重传
		        tr.find('.demo-reload').on('click', function(){
		          obj.upload(index, file);
		        });
		        
		        //删除
		        tr.find('.demo-delete').on('click', function(){
		        	
		          var temp = files[index];
		          for(var t=0;t<filelist.length;t++){
		          	if(filelist[t] == temp){
		          		delete filelist[t];
		          		break;
		          	}
		          }
		          delete files[index]; //删除对应的文件
		          tr.remove();

		          uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
		        });
		        
		        demoListView.append(tr);
		      });
		    }
		    ,done: function(res, index, upload){
		      if(res.code == 0){ //上传成功
		        var tr = demoListView.find('tr#upload-'+ index)
		        ,tds = tr.children();
		        tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
		        tds.eq(3).html(''); //清空操作
		        return delete this.files[index]; //删除文件队列已经上传成功的文件
		      }
		      this.error(index, upload);
		    }
		    ,error: function(index, upload){
		      var tr = demoListView.find('tr#upload-'+ index)
		      ,tds = tr.children();
		      tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
		      tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
		    }
		  });
		});
		</script>
		<script>
			function judgesNumber(obj){
				if(obj.value<50){
					alert("参加人数少于50人时会自动进行拼班！");
					$("#sample-table-00").css('display','block');
				}else{
					$("#sample-table-00").css('display','none');
				}
			}
		</script>
		<script>
			function branchSub(){
				var classesName = $("#classesName").val();
				var hostDate = $("#hostDate").val();
				var planNumOfEntries = $("#planNumOfEntries").val();
				var planHostAddress = $("#planHostAddress").val();
				var contactPersonnel = $("#contactPersonnel").val();
				var contactNumber = $("#contactNumber").val();
				var type = $(".am-tabs .am-active a")[0].innerHTML;
				var selectList = new Array;
				var reg=/^[1-9]\d*$|^0$/; // 注意：故意限制了 0321 这种格式，如不需要，直接reg=/^\d+$/;
				var testTel = /([0-9]{3,4}-)?[0-9]{7,8}$/;//办公电话
				var testPhone = /^1\d{10}$/;//手机
				if(type=="方案定制"){
					type=0;
					if($('.layui-form-checked').length==1){
						selectList[0] = $('.layui-form-checked')[0].parentNode.parentNode.parentNode.children[2].children[0].innerHTML;
						selectList[1] = $('.layui-form-checked')[0].parentNode.parentNode.parentNode.children[4].children[0].children[0].value
					}else if($("#sample-table-2 th .layui-form-checkbox").is(".layui-form-checked")&&$('.layui-form-checked').length==2){
						selectList[0] = $('.layui-form-checked')[1].parentNode.parentNode.parentNode.children[2].children[0].innerHTML;
						selectList[1] = $('.layui-form-checked')[1].parentNode.parentNode.parentNode.children[4].children[0].children[0].value;
					}else if($('.layui-form-checked').length==0){
						alert("请选择一个方案！");
						return;
					}else{
						alert("只能选择一个方案进行定制！");
						return;
					}
					
				}else if(type=="课程定制"){
					type=1;
					if($("#sample-table-2 th .layui-form-checkbox").is(".layui-form-checked")){
						for(var i=1,j=0;i<$('.layui-form-checked').length;i++,j++){
							selectList[j] = $('.layui-form-checked')[i].parentNode.parentNode.parentNode.children[5].children[0].children[0].id;
						}
					}else if($('.layui-form-checked').length==0){
						alert("请选择课程！");
						return;
					}else{
						for(var i=0;i<$('.layui-form-checked').length;i++){
							selectList[i] = $('.layui-form-checked')[i].parentNode.parentNode.parentNode.children[5].children[0].children[0].id;
						}
					}
					
				}else if(type=="自由定制"){
					type=2;
					var value = $("#hostingDay").val();
					if(reg.test(value)==true){
						if($('#hostingDay').val()<0){
							selectList[0] = $("#hostingDay").val()*(-1);
						}else if($("#hostingDay").val()==0){
							alert("请输入大于0的天数!");
							return;
						}else{
							selectList[0] = $("#hostingDay").val();
						}
					}else{
						alert("请输入纯数字的天数!");
						return false;
					}
					selectList[1] = $("textarea")[0].value;
					
				}
				if(classesName==""){
					alert("请填写班级名称！");
					return;
				}
				if(hostDate==""){
					alert("请选择预计举办日期！");
					return;
				}
				if(planNumOfEntries==""){
					alert("请填写计划参加人数！");
					return;
				}
				if(planHostAddress==""){
					alert("请填写预计举办地点！");
					return;
				}
				if(contactPersonnel==""){
					alert("请填写联系人员！");
					return;
				}
				if(contactNumber==""){
					alert("请填写联系电话！");
					return;
				}else if(testPhone.test(contactNumber)==false && testTel.test(contactNumber)==false){
					alert("请输入有效的联系电话！");
					return;
				}
				
				if(planNumOfEntries<50){
					var togetherClassesStartDate = $("#togetherClassesStartDate").val();
					var togetherClassesEndDate = $("#togetherClassesEndDate").val(); 
					var classesEndDate = $("#classesEndDate").val();
					var togetherClassesCompany = $("#togetherClassesCompany").val();
					var maxClassesNumber = $("#maxClassesNumber").val();
					var nowDate = new Date();
					var nowYear = nowDate.getFullYear();
					var nowMonth = nowDate.getMonth()+1;
					var nowDay = nowDate.getDate();
					if (nowMonth >= 1 && nowMonth <= 9) {
						nowMonth = "0" + nowMonth;
			        }
			        if (nowDay >= 0 && nowDay <= 9) {
			            nowDay = "0" + nowDay;
			        }
					var nowDate = nowYear + '-' + nowMonth + '-' + nowDay;
					if(togetherClassesCompany==""){
						alert("请填写拼班发起单位！");
						return;
					}
					if(maxClassesNumber==""){
						alert("请填写班级容纳人数！");
						return;
					}
					if(togetherClassesStartDate==""){
						alert("请选择报名开始日期！");
						return;
					}else if(togetherClassesStartDate<nowDate){
						alert("报名开始日期应在当前日期之后！");
						return;
					}
					if(togetherClassesEndDate==""){
						alert("请选择报名截止日期！");
						return;
					}
					if(togetherClassesStartDate>togetherClassesEndDate){
						alert("报名开始日期应在报名结束日期之后！");
						return;
					}
					if(classesEndDate==""){
						alert("请选择预计结课日期！");
						return;
					}
					if(togetherClassesEndDate>hostDate){
						alert("开课日期应在报名结束日期之后！");
						return;
					}
					if(classesEndDate<hostDate){
						alert("开课日期应在结课日期之后！");
						return;
					}
					
					
					var fd = new FormData();
					for(var i=0;i<filelist.length;i++){
						fd.append('file',filelist[i]);
					}
					fd.append('figClass_name',classesName);
					fd.append('figClass_deparment',togetherClassesCompany);
					fd.append('figClass_address',planHostAddress);
					fd.append('figClass_start_date',togetherClassesStartDate);
					fd.append('figClass_end_date',togetherClassesEndDate);
					fd.append('figClass_class_start',hostDate);
					fd.append('figClass_class_end',classesEndDate);
					fd.append('figClass_pernum',maxClassesNumber);
					fd.append('figClass_person',contactPersonnel);
					fd.append('figClass_phone',contactNumber);
					fd.append('figClass_caogery',type);
					fd.append('figClass_outline',selectList);
					
					$.ajax({
						url:'<%=request.getContextPath()%>/FigClass/addFig',
						type:'post',
						encType: 'multipart/form-data', //表明上传类型为文件
						processData: false,  //tell jQuery not to process the data
	        			contentType: false,  //tell jQuery not to set contentType
						data:fd,
						success:function(data){
							if(data.success == true){
								if(data.message == "1"){
									layer.confirm('保存成功!', { title:'提示'}, function(index){
										  
										window.parent.location.reload();
										var index1 = parent.layer.getFrameIndex(window.name);
										parent.layer.close(index1);
									});
								}
							}else{
								alert("保存失败！");
							}
						},
						error:function(error){
							console.log('error'+error);
							layer.confirm('未选择文件！', { title:'提示'}, function(index){
								  
								window.parent.location.reload();
								var index1 = parent.layer.getFrameIndex(window.name);
								parent.layer.close(index1);
								console.log(error);
							});
						}
					})
				}else{
					var fd = new FormData();
					for(var j = 0;j<filelist.length;j++){
						fd.append('file', filelist[j]);
					}
	    			fd.append('Constom_name', classesName);
	    			fd.append('Constom_data', hostDate);
	    			if(type == '2'){
	    				if(selectList.length>1){
	        				fd.append('Constom_datanum', selectList[0]);
	        			}
	    			}
	    			fd.append('Constom_pernum', planNumOfEntries);
	    			fd.append('Constom_address', planHostAddress);
	    			fd.append('Constom_person', contactPersonnel);
	    			fd.append('Constom_phone', contactNumber);
	    			fd.append('Constom_outline', selectList);
	    			fd.append('Constom_gaoery', type);
					$.ajax({
						url:'<%=request.getContextPath()%>/Constom/addConstom',
						type:'post',
						encType: 'multipart/form-data', //表明上传类型为文件
						processData: false,  //tell jQuery not to process the data
	        			contentType: false,  //tell jQuery not to set contentType
						data:fd,
						success:function(data){
							if(data.success == true){
								if(data.message == "4"){
									layer.confirm('保存成功!', { title:'提示'}, function(index){
										  
										window.parent.location.reload();
										var index1 = parent.layer.getFrameIndex(window.name);
										parent.layer.close(index1);
									});
								}
							}else{
								alert("保存失败！");
							}
						},
						error:function(error){
							layer.confirm('未选择文件！', { title:'提示'}, function(index){
								  
								window.parent.location.reload();
								var index1 = parent.layer.getFrameIndex(window.name);
								parent.layer.close(index1);
								console.log(error);
							});
						}
					})
				}
				
			}
		</script>
		<script type="text/html" id="barDemo">
  			<a class="" id="{{d.crouse_id}}" lay-event="show" style="color:#0e90d2;cursor:pointer;">查看</a>
		</script>
		<script type="text/html" id="barDemo2">
  			<a class="" lay-event="show2" >查看</a>
		</script>
		
		<script type="text/html" id="selected">
			<select lay-ignore>
  				<option value="0.5">0.5天</option>
				<option value="1">1天</option>
				<option value="1.5">1.5天</option>
				<option value="2">2天</option>
				<option value="2.5">2.5天</option>
				<option value="3">3天</option>
				<option value="3.5">3.5天</option>
				<option value="4">4天</option>
			</select>
		</script>	
			
	</body>

</html>