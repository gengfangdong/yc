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
		<link rel="stylesheet" href="../assets/css/index.min.css" />
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
															<a href="newsNotice.jsp" >新闻公告</a>
															<!-- sub-menu start-->
															<ul class="sub-menu">
																<li class="menu-item">
																	<a href="newsNotice.jsp"  >通知公告</a>
																</li>
																<li class="menu-item">
																	<a href="newsTrain.jsp">培训新闻</a>
																</li>
															</ul>
															<!-- sub-menu end-->
														</li>
														<li>
															<a href="centerOverview.jsp" style="color: #FF2F2F;">关于我们</a>
															<!-- sub-menu start-->
															<ul class="sub-menu">
																<li class="menu-item">
																	<a href="centerOverview.jsp" style="color: #FF2F2F;">概况</a>
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
												<a href="regulationsClasses.jsp">自主报名</a>
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
												<a href="centerOverview.jsp" style="color: #FF2F2F;">关于我们</a>
													<!-- sub-menu start-->
													<ul class="am-menu-sub am-collapse">
														<li class="menu-item">
															<a href="centerOverview.jsp" style="color: #FF2F2F;">概况</a>
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
				<div class="page-header news_bannerBg" style="background:url('../assets/img/banner/aboutus.jpg');background-size:100% 100%;">
				</div>

			</div>

			<div class="am-g am-g-fixed myFixedSiderbar">
				<!--正文-->
				<div class="am-u-md-9 am-u-md-push-3" style="padding-right: 5%;">
					<div class="breadcrumb-box">
						<div class="am-container">
							<ol class="am-breadcrumb">
								<li>
									<a href="<%=request.getContextPath() %>/">首页</a>
								</li>
								<li class="am-active">关于我们</li>
							</ol>
						</div>
					</div>
					<div class="newsList"  id="newsNoticeUl">
						<!-- <ul id="newsNoticeUl">
						
							<li>
								<span class="newsDate">2018-11-29</span> ●&nbsp;&nbsp;
								<a href="news_content.jsp">集团为湖南一师优秀贫困大学生再颁助学奖励金</a>
							</li>
							<li>
								<span class="newsDate">2018-11-28</span> ●&nbsp;&nbsp;
								<a href="news_content.jsp">集团为湖南一师优秀贫困大学生再颁助学奖励金</a>
							</li>
							<li>
								<span class="newsDate">2018-11-27</span> ●&nbsp;&nbsp;
								<a href="news_content.jsp">集团为湖南一师优秀贫困大学生再颁助学奖励金</a>
							</li>
							<li>
								<span class="newsDate">2018-11-26</span> ●&nbsp;&nbsp;
								<a href="news_content.jsp">集团为湖南一师优秀贫困大学生再颁助学奖励金</a>
							</li>
							<li>
								<span class="newsDate">2018-11-25</span> ●&nbsp;&nbsp;
								<a href="news_content.jsp">集团为湖南一师优秀贫困大学生再颁助学奖励金</a>
							</li>
						</ul> -->

					</div>
					<div style="height: 40px;" id="pagesid">
						<ul data-am-widget="pagination" class="am-pagination am-pagination-default" style="text-align: center;">
<!-- 						 	<div class="page">第<span id="a2"></span>/<span id="a1"></span>页<span id="a3"></span>　<a href="#" onClick="change1(--pageno1)">上一页</a><a href="#" onClick="change1(++pageno1)">下一页</a></div> -->
						
							<!-- <li class="am-pagination-first ">
								<a href="#" class="">首页</a>
							</li>

							<li class="am-pagination-prev ">
								<a href="#" class="">上一页</a>
							</li>

							<li class="">
								<a href="#" class="">1</a>
							</li>
							<li class="am-active">
								<a href="#" class="am-active">2</a>
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
							</li> -->
						</ul>
					</div>

				</div>
				<!--侧边栏-->
				<div class="am-u-md-3 am-u-md-pull-9 my-sidebar mySiderbar">
					<div class="am-offcanvas" id="sidebar">
						<div class="am-offcanvas-bar">
							<ul class="am-nav">
								<li class="sidebar_contactUs">■概况</li>
								<li class="promo_detailed--list_item sidebarListLi" style="border-top:1px solid #001A35;text-align: center;padding: 10px 0 0 0;">
									<a href="centerOverview.jsp" style="font-weight: 600;color: #FF2F2F;">概况</a>
								</li>
								<li class="promo_detailed--list_item sidebarListLi" style="border-bottom: 1px solid #001A35;text-align: center;padding: 5px 0 10px 0;">
									<a href="organization.jsp" style="color: #000000;">师资招聘</a>
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
				<jsp:include   page="footer.jsp" flush="true"/>
			</div>
		</div>
		<!--[if lt IE 9]>
		<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
		<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
		<script src="/js/amazeui.ie8polyfill.min.js"></script>
		<![endif]-->
		<script src="../assets/js/jquery-2.1.0.js" charset="utf-8"></script>
		<script src="../assets/js/amazeui.js" charset="utf-8"></script>
		<script>
			window.onload = function(){
				$(".regulations_bannerbg").height($(".regulations_bannerbg").width()*400/1581-172);//banner图高度
			}
			$(window).resize(function(){
				$(".regulations_bannerbg").height($(".regulations_bannerbg").width()*400/1581-172);//banner图高度
			});
		</script>
			<script >
		var datas=new Array()
		var datas1=new Array()
		var pageno1=0;
		$(document).ready(function() {
				
				  $.ajax({
						url : '<%=request.getContextPath()%>/Show/getlistAbout',
						type : 'post',
						async:false,
			      		dataType:'json',
						success : function(data) {
							datas=data.data
							for(var i=0;i <datas.length;i++){ 
								if(datas[i].about_titile=='中心概况'){
									datas1=datas[i];
								}
							}
						
							if(datas1.length == 0){
								document.getElementById("newsNoticeUl").innerHTML=""//全部清空
								var div =document.createElement("li")//建立div对象
								div.innerHTML="暂无中心概况!";//建立显示元素
								document.getElementById("newsNoticeUl").appendChild(div)//加入all中 
							
								document.getElementById("pagesid").style.display="none";
								return;
							}
// 								var str = '<span class="newsDate">'+datas[0].about_Release_time+'</span> ●&nbsp;&nbsp;<a href=\"newsNotice_content.jsp?about_id='+datas[0].about_id+'\">'+datas[0].about_titile+'</a>'
							
								document.getElementById("newsNoticeUl").innerHTML='<div style="text-align: center;">'+'<h1 class="am-article-title">'+datas1.about_titile+'</h1>'+
		 						'<p class="am-article-meta" style="border-bottom: 1px solid #999999;border-top: 1px solid #999999;">'+
		 						'<label style="padding-right: 3%;">作者：'+datas1.about_Creater+'</label>'+
		 						'<label style="padding-left: 3%;">时间：'+datas1.about_Release_time+'</label>'+
		 						datas1.about_context;
		 						//全部清空
// 										var div =document.createElement("li")//建立div对象
// 										document.getElementById("newsNoticeUl").appendChild(div)//加入all中 
						},
						error : function(error) {
							console.log('接口不通' + error);
						}
					});
		});
		
					
					
			
		</script>
	</body>

</html>