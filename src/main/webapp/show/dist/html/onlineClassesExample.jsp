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
												<a href="onlineClasses.jsp"style="color: #FF2F2F;">拼班</a>
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
												<a href="centerOverview.jsp" >关于我们</a>
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
				<div class="page-header news_bannerBg">
					<div class="am-container">
						<h1 class="page-header-title">在线拼班</h1>
					</div>
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
								<li class="am-active">在线拼班</li>
								<li class="am-active">查看</li>
							</ol>
						</div>
					</div>
					<div class="am-g">
						<div class="am-u-sm-11 am-u-sm-centered">
							<div class="am-cf am-article tableTextAlign">
								<table class="am-table am-table-bordered am-table-radius onlineTable" style="font-size: 14px;">
									<!--<thead>
										<tr>
											<th>网站名称</th>
											<th>网址</th>
											<th>创建时间</th>
										</tr>
									</thead>-->
									<tbody>
										<tr>
											<td class="tableLeftTd2">本期培训名称:</td>
											<td class="tableRightTd2" colspan="2" style="text-align: center;">
												第四期国税系统税务稽查专业骨干中级培训班
											</td>
											<!-- <td>2012-10-01</td> -->
										</tr>
										<tr>
											<td class="tableLeftTd2">培训开课地点:</td>
											<td class="tableRightTd2" colspan="2">
												中央财经大学
											</td>
											<!-- <td>2012-10-01</td> -->
										</tr>
										<tr class="">
											<td class="tableLeftTd2">报名开始日期:</td>
											<td class="tableRightTd2" colspan="2">
												2018-11-11

											</td>
											<!-- <td>2012-10-01</td> -->
										</tr>
										<tr>
											<td class="tableLeftTd2">拼班截止日期:</td>
											<td class="tableRightTd2" colspan="2">2018-12-10</td>
											<!-- <td>2012-10-01</td> -->
										</tr>
										<tr>
											<td class="tableLeftTd2">预计开课日期:</td>
											<td class="tableRightTd2" colspan="2">
												2018-12-11
											</td>
											<!-- <td>2012-10-01</td> -->
										</tr>
										<tr>
											<td class="tableLeftTd2">预计结课日期:</td>
											<td class="tableRightTd2" colspan="2">2018-12-29</td>
											<!-- <td>2012-10-01</td> -->
										</tr>
										<tr>
											<td class="tableLeftTd2">班级容纳人数:</td>
											<td class="tableRightTd2" colspan="2">40</td>
											<!-- <td>2012-10-01</td> -->
										</tr>
										<tr>
											<td class="tableLeftTd2">已经报名人数:</td>
											<td class="tableRightTd2" colspan="2">34</td>
											<!-- <td>2012-10-01</td> -->
										</tr>
										<tr>
											<td class="tableLeftTd2">拼班联系电话:</td>
											<td class="tableRightTd2" colspan="2">010-34567890</td>
											<!-- <td>2012-10-01</td> -->
										</tr>
										<tr>
											<td class="tableLeftTd2">拼班联系人员:</td>
											<td class="tableRightTd2" colspan="2">王老师</td>
											<!-- <td>2012-10-01</td> -->
										</tr>
										<tr>
											<td class="tableLeftTd2">拼班相关资料:</td>
											<td class="tableRightTd2">详情请下载附件</td>
											<td class="tableRightTd2">
												<a href="../doc/培训通知.zip">附件下载</a>
											</td>
											<!-- <td>2012-10-01</td> -->
										</tr>
										
										<tr>
											<td class="tableLeftTd2" style="vertical-align: middle;">其他相关信息:</td>
											<td class="tableRightTd2" colspan="2">
												<!--<textarea>
													为确保培训组织工作的顺利实施，自函到之日起开始接受报名，报名截止时间为每期培训班报到日前10天，额满为止。报名工作以县局以上税务机关为单位统一组织，同时请各报名单位通知参训学员登陆中共国家税务总局党校网站招生招聘——招生信息栏下载本函电子稿,以便注册登记参训名单及接站信息。
													报名时请报名单位登陆中共国家税务总局党校门户网站http://www.tax-edu.net，进入招生招聘——培训报名入口，直接注册报名。报名成功后并请填写《国家税务总局税务干部进修学院2019年培训项目报名表》（见附件3）盖章后传真至0514-87806661 。
													欢迎各税务机关开展全年培训项目一揽子报名，在年初将拟参加各项目培训的人数、班期一次性发送我院。如不能做到全年培训项目一揽子报名，请按《2019年专业化培训项目总体安排表》分批组织报名。
													参训学员名册上传方式：报名成功的单位在报到日前10天，请登陆中共国家税务总局党校门户网站http://www.tax-edu.net，进入招生招聘——名册上传入口，上传参训学员名册。
													五、培训费用
													（一）落地培训费用按每人每天550元的标准（含师资费、食宿费、场地费、资料费等）收取。培训学员住宿为双人标准间，用餐为标准自助餐，上课全部在多媒体教室。培训费用可通过银行汇款或由学员自带。
													（二）远程同步课堂培训费用：每个教学单元半天培训费2000元。
													（三）银行汇款账号如下：
													单位名称：国家税务总局税务干部进修学院
													账号：32001744336051149933
													开户银行：建设银行扬州市百合园支行
													六、联系地址、电话
													联系地址：江苏省扬州市扬子江北路515号；邮编：225007
													联系单位：国家税务总局税务干部进修学院教务处
													报名联系人：陈老师、舒老师；联系电话：0514-87806663、87701292；传真：0514-87806661；电子信箱: yzsyjwc@126.com。
												</textarea>-->
												<p>
													为确保培训组织工作的顺利实施，自函到之日起开始接受报名，报名截止时间为每期培训班报到日前10天，额满为止。
												</p>
												<p>
													报名工作以县局以上税务机关为单位统一组织，同时请各报名单位通知参训学员登陆中共国家税务总局党校网站招生招聘——招生信息栏下载本函电子稿,以便注册登记参训名单及接站信息。
												</p>
												<p> 报名时请报名单位登陆中共国家税务总局党校门户网站http://www.tax-edu.net，进入招生招聘——培训报名入口，直接注册报名。报名成功后并请填写《国家税务总局税务干部进修学院2019年培训项目报名表》（见附件3）盖章后传真至0514-87806661 。
												</p>
												<p>欢迎各税务机关开展全年培训项目一揽子报名，在年初将拟参加各项目培训的人数、班期一次性发送我院。如不能做到全年培训项目一揽子报名，请按《2019年专业化培训项目总体安排表》分批组织报名。
												</p>
												<p>参训学员名册上传方式：报名成功的单位在报到日前10天，请登陆中共国家税务总局党校门户网站http://www.tax-edu.net，进入招生招聘——名册上传入口，上传参训学员名册。
												</p>
												<h4>五、培训费用</h4>
												<p>（一）落地培训费用按每人每天550元的标准（含师资费、食宿费、场地费、资料费等）收取。培训学员住宿为双人标准间，用餐为标准自助餐，上课全部在多媒体教室。 培训费用可通过银行汇款或由学员自带。
												</p>
												<p>（二）远程同步课堂培训费用：每个教学单元半天培训费2000元。</p>
												<p>（三）银行汇款账号如下： 单位名称：国家税务总局税务干部进修学院 账号：32001744336051149933 开户银行：建设银行扬州市百合园支行</p>
												<h4>六、联系地址、电话</h4>
												<p>联系地址：江苏省扬州市扬子江北路515号；</p>
												<p> 邮编：225007</p>
												<p>联系单位：国家税务总局税务干部进修学院教务处 </p>
												<p>报名联系人：陈老师、舒老师；</p>
												<p>联系电话：0514-87806663、87701292；</p>
												<p>传真：0514-87806661；</p>
												<p>电子信箱: yzsyjwc@126.com。</p>
												<p style="text-align: center;">国家税务总局税务干部进修学院</p>
												<p style="text-align: center;">2018年10月27日</p>
										</tr>
									</tbody>
								</table>
								<button type="button" class="am-btn am-btn-primary am-round subBtn">
									<a href="" style="color: #FFFFFF;">在线拼班</a>
								</button>
							</div>
							<hr />
						</div>
					</div>
				</div>
				<!--侧边栏-->
				<div class="am-u-md-3 am-u-md-pull-9 my-sidebar mySiderbar">
					<div class="am-offcanvas" id="sidebar">
						<div class="am-offcanvas-bar">
							<!--<ul class="am-nav">
								<li class="sidebar_contactUs">■在职研</li>
								<li class="promo_detailed--list_item sidebarListLi" style="border-top:1px solid #001A35;text-align: center;padding: 10px 0 0 0;">
									<a href="incumbencyStudent.jsp" style="color: #000000;">招生简章</a>
								</li>
								<li class="promo_detailed--list_item sidebarListLi" style="border-bottom: 1px solid #001A35;text-align: center;padding: 5px 0 10px 0;">
									<a href="onlineApplication.jsp" style="font-weight: 600;color: #FF2F2F;">在线报名</a>
								</li>
							</ul>-->
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
		<script>
			function dateClear() {
				$('#date').attr("value", "");
			}
		</script>
		<script>
			window.onload = function(){
				$(".regulations_bannerbg").height($(".regulations_bannerbg").width()*400/1581-172);//banner图高度
			}
			$(window).resize(function(){
				$(".regulations_bannerbg").height($(".regulations_bannerbg").width()*400/1581-172);//banner图高度
			});
		</script>
	</body>

</html>