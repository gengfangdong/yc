<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="entity.IUser" %>
<%
	IUser user = (IUser)session.getAttribute("user");
	String str[] = request.getParameter("param").split(",");
	String id=str[0];
	String project_name=str[1];
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<title>中央财经大学</title>
		<link rel="icon" href="../assets/img/logo.ico" type="image/x-icon"/>
		<link rel="stylesheet" href="../../../admin/css/bootstrap.min.css" />
		<link rel="stylesheet" href="../../../admin/layui-v2.3.0/layui/css/layui.css" />
		<link rel="stylesheet" href="../../../admin/layui-v2.3.0/layui/css/modules/layer/default/layer.css" />
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
			.tableLeftTd,.tableRightTd{
				font-size:14px;
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
												<a href="regulationsClasses.jsp"  >规定班次</a>
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
				<div class="page-header news_bannerBg" style="background:url('../assets/img/banner/zaizhi.jpg');background-size:100% 100%;margin-top:0;">
				</div>

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
								<li class="am-active">在职研</li>
								<li class="am-active">在线报名</li>
								<li class="am-active">个人报名</li>
							</ol>
						</div>
					</div>
					<div class="am-g">
						<div class="am-u-sm-11 am-u-sm-centered">
							<div class="screeningConditions">
								<!--<table class="am-table am-table-bordered am-table-striped am-table-hover">
                                    <thead>
                                        <tr>
                                            <th>网站名称</th>
                                            <th>网址</th>
                                            <th>创建时间</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="am-active">
                                            <td>Amaze UI(Active)</td>
                                            <td>http://amazeui.org</td>
                                            <td>2012-10-01</td>
                                        </tr>
                                    </tbody>
                                </table>-->
								<!--<div class="conditionYear">
									<ul class="conditionYearUl">
										<li class="conditionYearLi">开课年度：</li>
										<li>
											<a  onclick="changeStyleColor1(this);">2019</a>
										</li>
										<li>
											<a  onclick="changeStyleColor1(this);">2018</a>
										</li>
										<li>
											<a  onclick="changeStyleColor1(this);">2017</a>
										</li>
									</ul>
								</div>-->
							</div>
						</div>
					</div>
					<div class="am-g">
						<div class="am-u-sm-11 am-u-sm-centered">
							<div class="am-cf am-article tableTextAlign">
								<table class="am-table am-table-bordered am-table-radius onlineTable">
									<!--<thead>
										<tr>
											<th>网站名称</th>
											<th>网址</th>
											<th>创建时间</th>
										</tr>
									</thead>-->
									<tbody>
										<tr>
											<td class="tableLeftTd">报名项目</td>
											<td class="tableRightTd">
												<input class="onlineInput" id="entryProjectName" type="text" value="<%=project_name%>" placeholder="<%=project_name%>" disabled="disabled" style="height:23px;border-radius: 5px;background:#ffffff;border: 1px solid #a9a9a9;cursor:not-allowed;" />
											</td>
										</tr>
										<tr>
											<td class="tableLeftTd">报名类别</td>
											<td class="tableRightTd">
												<input  class="onlineInput" id="entryCategory" type="text" value="单位" disabled="disabled" style="height:23px;border-radius: 5px;background:#ffffff;border: 1px solid #a9a9a9;cursor:not-allowed;" />
											</td>
										</tr>
										<tr class="">
											<td class="tableLeftTd">报名日期</td>
											<td class="tableRightTd">
												<!-- <input class="onlineDate" type="date"/> -->
<!-- 												<input id="entryDate" type="text"  value=""  class="am-form-field am-datepicker-add-on onlineInput" style="height:23px;border-radius: 5px;background-color:#fff;height: 27px;line-height: 27px;border: 1px solid #a9a9a9;" readonly /> -->
												<input type="text" value=""  readonly  id="entryDate" disabled="disabled"   class="am-form-field am-datepicker-add-on onlineInput" style="height:23px;border-radius: 5px;background-color:#fff;height: 27px;line-height: 27px;border: 1px solid #a9a9a9;"/>

											</td>
										</tr>
										<tr>
											<td class="tableLeftTd">报名人数</td>
											<td class="tableRightTd"><input style="height:23px;border-radius: 5px;background:#ffffff;border: 1px solid #a9a9a9;" class="onlineInput" id="entryByCompanyEntryPersonNum" type="text" maxlength="5" placeholder="请输入您的报名人数" /></td>
										</tr>
										<tr>
										<tr>
											<td class="tableLeftTd">报名单位</td>
											<td class="tableRightTd"><input style="height:23px;border-radius: 5px;background:#ffffff;border: 1px solid #a9a9a9;" class="onlineInput" id="entryCompany" type="text" maxlength="16" placeholder="请输入您的单位名称" /></td>
										</tr>
										<tr>
											<td class="tableLeftTd">联系人</td>
											<td class="tableRightTd">
												<input style="height:23px;border-radius: 5px;background:#ffffff;border: 1px solid #a9a9a9;" class="onlineInput" type="text" id="contactPersonnel" value="" placeholder="请输入您的联系人姓名" />
											</td>
										</tr>
										<tr>
											<td class="tableLeftTd">联系人电话</td>
											<td class="tableRightTd"><input style="height:23px;border-radius: 5px;background:#ffffff;border: 1px solid #a9a9a9;" class="onlineInput" type="text" id="contactTel" maxlength="11" placeholder="请输入您真实的手机号码" /></td>
										</tr>
										<tr>
											<td class="tableLeftTd">联系人办公电话</td>
											<td class="tableRightTd"><input style="height:23px;border-radius: 5px;background:#ffffff;border: 1px solid #a9a9a9;" class="onlineInput" type="text" id="contactTelCode" maxlength="15" placeholder="请输入您真实的手机号码" /></td>
										</tr>
										<tr>
											<td class="tableLeftTd">联系人邮箱</td>
											<td class="tableRightTd"><input style="height:23px;border-radius: 5px;background:#ffffff;border: 1px solid #a9a9a9;" class="onlineInput" type="text" id="contactEmail" placeholder="请输入您真实的邮箱" /></td>
										</tr>
										<tr>
											<td class="tableLeftTd">报名名单模板</td>
											<td class="tableRightTd">
												<button type="button" class="layui-btn lay_btn" style="height: 25px;line-height: 10px;background-color: #0e90d2;border-radius: 1000px;" >
												  <i class="layui-icon">&#xe67c;</i><a href="../doc/1218.xlsx" style="color: #FFFFFF;">下载</a>
												</button>
												<button type="button" class="layui-btn lay_btn" id="test11"  style="height: 25px;line-height: 10px;background-color: #0e90d2;border-radius: 1000px;">
												  <i class="layui-icon">&#xe67c;</i>上传
												</button>
												
<!-- 												<input type="text"  disabled="disabled"  id="isupload" ></input> -->
												<input type="text" id="test1Input" disabled="disabled" value="" style="width:70%;background: #fff;border: none;" />

											</td>
										</tr>
									</tbody>
								</table>
								<button type="button" class="am-btn am-btn-primary am-round subBtn" id="subBtn" onclick="byCompanySubmit();" style="line-height:10px;hiehgt:25px;width:64px;border-radius:5px;font-size:14px;">提交</button>
							</div>
							<hr />
						</div>
					</div>
					<!-- <div class="am-popup" id="my-popup">
						<div class="am-popup-inner">
							<div class="am-popup-hd">
								<h4 class="am-popup-title">基础学习</h4>
								<span data-am-modal-close class="am-close">&times;</span>
							</div>
							<div class="am-popup-bd">
								<h4>1．大纲适用对象</h4>
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
								<p>根据课程的性质和特点，本大纲对基本知识和基本理论的教学要求分为了解和理解两个层次，对基本方法和技能的教学要求分为了解和掌握两个层次。</p>
							</div>
						</div>
					</div> -->
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
				<a href="#sidebar" class="am-btn am-btn-sm am-btn-success am-icon-bars am-show-sm-only my-button" data-am-offcanvas><span class="am-sr-only">侧栏导航</span></a>
			</div>

			<!--===========layout-footer================-->
			<div class="layout-footer">
				<div class="footer">
					<div style="background-color:#054371" class="footer--bg"></div>
					<div class="footer--inner">
						<div class="container">
							<div class="footer_main">
								<div class="am-g">
									<div class="am-u-md-3 ">
										<div class="footer_main--column">
											<strong class="footer_main--column_title">友情链接</strong>
											<ul class="footer_navigation">
												<li class="footer_navigation--item">
													<a href="http://www.cufe.edu.cn/" class="footer_navigation--link">中央财经大学</a>
												</li>
												<li class="footer_navigation--item">
													<a href="http://spft.cufe.edu.cn/index.htm" class="footer_navigation--link">中央财经大学财政税务学院</a>
												</li>
												<li class="footer_navigation--item">
													<a href="http://www.cscse.edu.cn/publish/portal0/" class="footer_navigation--link">中国(教育部)留学服务中心</a>
												</li>
												<li class="footer_navigation--item">
													<a href="http://www.moe.gov.cn/" class="footer_navigation--link">中华人民共和国教育部</a>
												</li>
												<li class="footer_navigation--item">
													<a href="https://cn.accaglobal.com" class="footer_navigation--link">ACCA（特许公认会计师工会）</a>
												</li>
											</ul>
										</div>
									</div>

									<div class="am-u-md-9 ">
										<div class="footer_main--column am-u-md-8">
											<strong class="footer_main--column_title">联系详情</strong>
											<ul class="footer_contact_info">
												<li class="footer_contact_info--item"><i class="am-icon-phone"></i><span>服务专线：400 069 0309</span></li>
												<li class="footer_contact_info--item"><i class="am-icon-envelope-o"></i><span>yunshipei.com</span></li>
												<li class="footer_contact_info--item"><i class="am-icon-map-marker"></i><span>北京市海淀区海淀大街27号天使大厦（原亿景大厦）三层</span></li>
												<li class="footer_contact_info--item"><i class="am-icon-clock-o"></i><span>Monday - Friday, 9am - 6 pm; </span></li>
											</ul>
										</div>
										<div class="am-u-md-4 " style="margin-top: 20px;">
											<div class="footer_main--column">
												<ul class="footer_navigation">
													<div class="article-img">
														<img src="../assets/img/index/wx_code.png" style="width: 150px;" />
													</div>
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
		<script src="../../../admin/bootstrap/js/bootstrap.min.js" charset="UTF-8"></script>
		<script src="../../../admin/layui-v2.3.0/layui/layui.all.js" charset="utf-8"></script>
		<script src="../assets/js/amazeui.js" charset="utf-8"></script>
		
		<script>
			window.onload = function(){
				<%
				if(user == null){
					%> window.open("login.jsp",'_self');<% 
				}
				%>
				$(".regulations_bannerbg").height($(".regulations_bannerbg").width()*400/1581-172);//banner图高度
			}
			$(window).resize(function(){
				$(".regulations_bannerbg").height($(".regulations_bannerbg").width()*400/1581-172);//banner图高度
			});
		</script>
		<%-- <script>
			layui.use('upload', function() {
				var upload = layui.upload;
				var uploadInst = upload.render({
					elem: '#test11', //绑定元素
					url: '<%=request.getContextPath()%>/ApplyUnit/apply', //上传接口
					accept: 'file', //普通文件
// 				    exts: 'zip|rar|7z|txt|doc|docx', 
// 				    acceptMime: 'image/*',//规定打开文件选择框时，筛选出的文件类型，只显示图片文件
				    auto: false, //选择文件后不自动上传
				    bindAction: '#subBtn', //指向一个按钮触发上传
				    choose:function(obj){
				    	  obj.preview(function(index, file, result){
				    	document.getElementById('test1Input').value = file.name;
				    	  });
				    },
				    before:function(obj){
				    	layer.load(); //上传loading
				    	this.data={
				    	"applyunit_name": document.getElementById("entryProjectName").value,
				    	"applyunit_phone":document.getElementById("contactTel").value,
				    	"phone_code":document.getElementById("contactTelCode").value,
						"applyunit_mail":document.getElementById("contactEmail").value,
						"applyunit_date":document.getElementById("entryDate").value,
						"applyunit_person":document.getElementById("contactPersonnel").value,
						"project_id":'<%=id%>'
				    	}//携带额外的数据
// 					    obj.preview(function(index, file, result){
// 					        $('#demo1').attr('src', result); //图片链接（base64）
// 					    });
				    },
				    done: function(res){
					      //如果上传失败
					      if(res.msg == 3){
					        return layer.msg('没有选择文件!');
					      }
					      else if(res.msg == 1){
					        return layer.msg('上传失败!');
					      }
					      //上传成功
					      else if(res.msg == 2){
						     	layer.confirm('报名成功!', { title:'提示'}, function(index){
									  
									window.parent.location.reload();
									var index1 = parent.layer.getFrameIndex(window.name);
									parent.layer.close(index1);
								});
					   	}
					      layer.closeAll('loading'); //关闭loading
					    },
					error: function() {
						//请求异常回调
						 layer.closeAll('loading'); //关闭loading
					}
				});
			});
		</script> --%>
		<script>
					$(function() {
				var myDate = new Date();
				var year = myDate.getFullYear();
				var month = myDate.getMonth() + 1;
				var day = myDate.getDate();
				if(day < 10) {
					day = "0" + day;
				}
				var newDay = year + '-' + month + '-' + day;
				$("#entryDate").val(newDay);
			})
			</script>
			<script type="text/javascript"> 
			//提交
			function byCompanySubmit() {
				var names = $('#entryProjectName').val();
				var category = $("#entryCategory").val();
				var entryDate = $("#entryDate").val();
				var company = $("#entryCompany").val();
				var PersonNum = $("#entryByCompanyEntryPersonNum").val();
				var personnel = $("#contactPersonnel").val();
				var phone = $("#contactTel").val();
				var phoneCode = $("#contactTelCode").val();
				var email = $("#contactEmail").val();
// 				var file = $("#isupload").val();
// 				var submitFile = $("#test1Input").val();
				
				var testPhone = /^1\d{10}$/;
				var testPhone1 = /^\+?[1-9][0-9]*$/;
				var testPhoneCode = /0\d{2,3}-\d{7,8}/;
				var testEmail = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;

				if(names == "") {
					alert('项目不能为空！');
					return;
				}
				if(category == "") {
					alert("报名类型不能为空！");
					return;
				}
				if(entryDate == "") {
					alert("报名日期不能为空！");
					return;
				}
				if(PersonNum == "") {
					alert("请输入报名人数！");
					return;
				}else if(testPhone1.test(PersonNum) == false) {
					alert("请输入有效的报名人数！");
					return;
				}
				if(company == "") {
					alert("请输入报名单位！");
					return;
				}
				if(company == "") {
					alert("请输入联系人！");
					return;
				}
				if(phone == "") {
					alert("请输入您的手机号码！");
					return;
				} else if(testPhone.test(phone) == false) {
					alert("请输入有效的手机号码！");
					return;
				}
				if(phoneCode == "") {
					alert("请输入您的办公电话！");
					return;
				} else if(testPhoneCode.test(phoneCode) == false) {
					alert("请输入有效的办公电话！");
					return;
				}
				if(email == "") {
					alert("请输入您的电子邮箱！");
					return;
				} else if(testEmail.test(email) == false) {
					alert("请输入有效的邮箱！");
					return;
				} 
// 				if(submitFile == "") {
// 					alert("请上传报名名单！");
// 					return;
// 				}									 ApplyUnit/apply'

				var fd = new FormData();
				fd.append('project_id','<%=id%>');
    			fd.append('applyunit_name', document.getElementById("entryProjectName").value);
//     			fd.append('file', '');
				fd.append('applyunit_phone',document.getElementById("contactTel").value);
				fd.append('person_number',document.getElementById("entryByCompanyEntryPersonNum").value);
				
				fd.append('phone_code',document.getElementById("contactTelCode").value);	
				fd.append('applyunit_mail',document.getElementById("contactEmail").value);
				fd.append('applyunit_date',document.getElementById("entryDate").value);
				fd.append('applyunit_person',document.getElementById("contactPersonnel").value);
				$.ajax({
					url:'<%=request.getContextPath()%>/ApplyUnit/apply' ,
					data:fd,
// 					{
// 						"applyunit_name": document.getElementById("entryProjectName").value,
// 				    	"applyunit_phone":document.getElementById("contactTel").value,
// 				    	"person_number":document.getElementById("entryByCompanyEntryPersonNum").value,
// 				    	"phone_code":document.getElementById("contactTelCode").value,
// 						"applyunit_mail":document.getElementById("contactEmail").value,
// 						"applyunit_date":document.getElementById("entryDate").value,
// 						"applyunit_person":document.getElementById("contactPersonnel").value,
<%-- 						"project_id":'<%=id%>' --%>
// 					},
// 					dataType: "json",
					type: "post",
					encType: 'multipart/form-data', //表明上传类型为文件
					processData: false,  //tell jQuery not to process the data
        			contentType: false,  //tell jQuery not to set contentType
					success: function(data) {
				     	layer.confirm('报名成功!', { title:'提示'}, function(index){
							  
							window.parent.location.reload();
							var index1 = parent.layer.getFrameIndex(window.name);
							parent.layer.close(index1);
						});
						//success
					},
					error: function(error) {
							alert("报名失败！");
							return;
						//error
					}

				})

			}
		</script>
	</body>

</html>