<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="entity.IUser" %>
<%
	IUser user = (IUser)session.getAttribute("user");
	String param=request.getParameter("param");
	
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
			#byOneName,#birthday,#byOneIDNum,#byOnePhone,#byOnePhoneCode,#byOneEmail,#byOneDepartment,#byOnePost,#byOneJob,#byOneAddress,#byOneOthers{
				border:none;
				border:1px solid #ccc;
				border-radius:5px;
				height:23px;
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
											<td class="tableLeftTd">您的姓名</td>
											<td class="tableRightTd">
												<input class="onlineInput" type="text" placeholder="请输入您的真实姓名" id="byOneName" />
											</td>
											<!-- <td>2012-10-01</td> -->
										</tr>
										<tr>
											<td class="tableLeftTd">您的性别</td>
											<td class="tableRightTd">
												<input class="onlineRadio byOneSex" type="radio" name="sex" value="man" />男
												<input class="onlineRadio byOneSex" type="radio" name="sex" value="woman" />女
											</td>
											<!-- <td>2012-10-01</td> -->
										</tr>
										<tr class="">
											<td class="tableLeftTd">出生日期</td>
											<td class="tableRightTd">
												<!-- <input class="onlineDate" type="date"/> -->
												<input value="" id="birthday" name="classesEndDate"  autocomplete="off"  placeholder="YYYY-MM-DD" type="text" class="" style="height: 23px;width:252px;cursor:pointer;" />
												<!--<div class="am-input-group am-datepicker-date date" data-am-datepicker="{format: 'yyyy-mm-dd'}">
													 <input id="date" name="entity.date" type="text" class="am-form-field am-datepicker-add-on" style="background-color:#fff;height: 27px;line-height: 27px;" readonly>
													<span class="am-input-group-label" id="form_dateClear" style="background-color:#fff;height: 25px;line-height: 25px;" onclick="dateClear();"><i class="am-icon-close"></i></span>
													<span class="am-input-group-label am-datepicker-add-on" style="background-color:#fff;height: 25px;line-height: 25px;"><i class="am-icon-calendar"></i></span> 
												</div> -->

											</td>
											<!-- <td>2012-10-01</td> -->
										</tr>
										<tr>
											<td class="tableLeftTd">身份证号</td>
											<td class="tableRightTd"><input class="onlineInput" id="byOneIDNum" type="text" maxlength="18" placeholder="请输入您的18位身份证号码" /></td>
											<!-- <td>2012-10-01</td> -->
										</tr>
										<tr>
											<td class="tableLeftTd">政治面貌</td>
											<td class="tableRightTd">
												<input class="onlineRadio byOnePoliticalStatus" type="radio" name="politicalStatus" value="partyMember" />党员
												<input class="onlineRadio byOnePoliticalStatus" type="radio" name="politicalStatus" value="masses" />群众
												<input class="onlineRadio byOnePoliticalStatus" type="radio" name="politicalStatus" value="democraticParties" />民主党派
											</td>
											<!-- <td>2012-10-01</td> -->
										</tr>
										<tr>
											<td class="tableLeftTd">手机号码</td>
											<td class="tableRightTd"><input class="onlineInput" id="byOnePhone" type="text" maxlength="11" placeholder="请输入您真实的手机号码" /></td>
											<!-- <td>2012-10-01</td> -->
										</tr>
										<tr>
											<td class="tableLeftTd">办公电话</td>
											<td class="tableRightTd"><input class="onlineInput" id="byOnePhoneCode" type="text" maxlength="15" placeholder="请输入您真实的办公电话" /></td>
											<!-- <td>2012-10-01</td> -->
										</tr>
										<tr>
											<td class="tableLeftTd">电子邮箱</td>
											<td class="tableRightTd"><input class="onlineInput" id="byOneEmail" type="text" placeholder="请输入您真实的邮箱" /></td>
											<!-- <td>2012-10-01</td> -->
										</tr>
										<tr>
											<td class="tableLeftTd">所在部门</td>
											<td class="tableRightTd"><input class="onlineInput" id="byOneDepartment" type="text" placeholder="请填写您所在部门" /></td>
											<!-- <td>2012-10-01</td> -->
										</tr>
										<!-- <tr>
											<td class="tableLeftTd">任职岗位</td>
											<td class="tableRightTd"><input class="onlineInput" id="byOnePost" type="text" placeholder="请填写您任职的岗位" /></td>
											<td>2012-10-01</td>
										</tr> -->
										<tr>
											<td class="tableLeftTd">任职职务</td>
											<td class="tableRightTd"><input class="onlineInput" id="byOneJob" type="text" placeholder="请填写您担任的职务" /></td>
											<!-- <td>2012-10-01</td> -->
										</tr>
										<tr>
											<td class="tableLeftTd">通讯地址</td>
											<td class="tableRightTd"><input class="onlineInput" id="byOneAddress" type="text" placeholder="请填写您详细的通讯地址，以便收发快递" /></td>
											<!-- <td>2012-10-01</td> -->
										</tr>
										<tr>
											<td class="tableLeftTd">其他信息</td>
											<td class="tableRightTd">
												<!--<textarea placeholder="请输入您的学习方向、学习时间等信息"></textarea>-->
												<input class="onlineInput" id="byOneOthers" type="text" placeholder="请输入您的学习方向、学习时间等信息" />
												<!-- <td>2012-10-01</td> -->
										</tr>
									</tbody>
								</table>
								<button type="button" class="am-btn am-btn-primary am-round subBtn" onclick="byOneSubmit();" style="height:25px;line-height:10px;font-size:14px;width:65px;border-radius:5px;">提交</button>
							</div>
							<hr />
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
									<a href="incumbencyStudent.jsp" style="color: #000000;font-size:16px;">招生简章</a>
								</li>
								<li class="promo_detailed--list_item sidebarListLi" style="border-bottom: 1px solid #001A35;text-align: center;padding: 5px 0 10px 0;">
									<a href="onlineApplication.jsp" style="font-weight: 600;color: #FF2F2F;font-size:16px;">在线报名</a>
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
		<script src="../assets/js/amazeui.js" charset="utf-8"></script>
			<!-- Bootstrap 3.3.5 -->
			<script src="../assets/bootstrap/js/bootstrap.min.js"></script>
<!-- 			layui 2.3.0 -->
<!-- 			<script src="../assets/layui-v2.3.0/layui/layui.js"></script> -->
			<script src="../../../admin/layui-v2.4.5/layui/layui.js"></script>
			<script src="../../../admin/layui-v2.4.5/layui/lay/modules/layer.js"></script>
		<script>
			/* function dateClear() {
				$('#date').attr("value", "");
			} */
			
			/* 日期控件，执行多个laydate实例 begin */
			layui.use('laydate', function(){
			  	var laydate = layui.laydate;
			  
			  //执行一个laydate实例
			  	laydate.render({
			    	elem: '#birthday' //指定元素
			  	});
			});
			
		</script>
		<script>
		 window.onload = function(){
				<%
				if(user == null){
					%> window.open("login.jsp",'_self');<% 
				}
				%>
				$(".regulations_bannerbg").height($(".regulations_bannerbg").width()*400/1581-172);//banner图高度
		 };
		 $(window).resize(function(){
			$(".regulations_bannerbg").height($(".regulations_bannerbg").width()*400/1581-172);//banner图高度
		});
		
			function byOneSubmit() {
				<%
				if(user == null){
					%> window.open("login.jsp",'_self');<% 
				}
				%>
				var names = $('#byOneName').val();
				var birthday = $("#birthday").val();
				var IDNum = $("#byOneIDNum").val();
				var phone = $("#byOnePhone").val();
				var phoneCode = $("#byOnePhoneCode").val();
				var email = $("#byOneEmail").val();
				var department = $("#byOneDepartment").val();
				//var post = $("#byOnePost").val();
				var job = $("#byOneJob").val();
				var address = $("#byOneAddress").val();
				var others = $("#byOneOthers").val();

				var testPhone = /^1\d{10}$/;
				var testPhoneCode = /0\d{2,3}-\d{7,8}/;
				var testEmail = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;

				if(names == "") {
					alert('请输入您的姓名！');
					return;
				}
				var sexes = $(".byOneSex");
				if(sexes[0].checked == true) {
					var sex = "0";
				} else if(sexes[1].checked == true) {
					var sex = "1";
				} else {
					alert("请选择您的性别！");
					return;
				}
				if(birthday == "") {
					alert("请选择您的出生日期！");
					return;
				}
				if(IDNum == "") {
					alert("请输入您的身份证号！");
					return;
				} else if(IDNum.length < 18) {
					alert("请输入18位的身份证号！");
					return;
				}
				var politicalStatuses = $(".byOnePoliticalStatus");
				if(politicalStatuses[0].checked == true) {
// 					var politicalStatus = $(politicalStatuses[0]).val();
					var politicalStatus = 0;
				} else if(politicalStatuses[1].checked == true) {
					var politicalStatus = 1;
				} else if(politicalStatuses[2].checked == true) {
					var politicalStatus = 2;
				} else {
					alert("请选择您的政治面貌！");
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
				if(department == "") {
					alert("请输入您的所在部门！");
					return;
				}
				/* if(post == "") {
					alert("请输入您的任职岗位！");
					return;
				} */
				if(job == "") {
					alert("请输入您的任职职务！");
					return;
				}
				if(address == "") {
					alert("请输入您的通讯地址！");
					return;
				}
				if(others == "") {
					alert("请输入您的学习方向、学习时间等信息！");
					return;
				}

				$.ajax({
					url:'<%=request.getContextPath()%>/Apply/apply' ,
					data: {
						"name": names,
						"sex": sex,
						"brithday": birthday,
						"indentity_number": IDNum,
						"political_status": politicalStatus,
						"phone_number": phone,
						"phone_code": phoneCode,
						"mail": email,
						"department": department,
						"position": '1',
						"job": job,
						"address": address,
						"other": others,
						"project_id":'<%=param%>'
					},
					dataType: "json",
					type: "post",
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