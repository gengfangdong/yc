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
		<link rel="icon" href="../show/dist/assets/img/logo.ico" type="image/x-icon"/>
		<link rel="stylesheet" href="../show/dist/assets/css/amazeui.css" />
		<link rel="stylesheet" href="../show/dist/assets/css/common.min.css" />
		<link rel="stylesheet" href="../show/dist/assets/css/index.min.css" />
		<link rel="stylesheet" href="../show/dist/assets/css/myStyle.css" />
		<style>
			.am-viewport{
				height:400px;
			}
		</style>
	</head>

	<body>
		<div class="layout">
			<!--===========layout-header================-->
			<div class="layout-header am-hide-sm-only am-hide-xs-only">
				<!--topbar start-->
				<div class="topbar" style="background: #FFFFFF;">
					<div class="container" style="background: #FFFFFF;width: auto!important;">
						<div class="am-g">
							<div class="am-u-md-8">
								<div class="topbar-left">
									<div class="am-dropdown" data-am-dropdown style="height: 35px;line-height: 35px;color: #000000;">
										联系电话010--62280881&nbsp;16601021525
									</div>
								</div>
							</div>
							<div class="am-u-md-4">
								<div class="topbar-right am-text-right am-fr">
									<% if(user != null&&"1".equals(user.getIsadmin())) {%><a style="color: #000;">欢迎 &nbsp;&nbsp; <%=user.getUser_name()%>&nbsp;</a>
										<a href ="<%=request.getContextPath()%>/admin/pages/wise/adminPage/noticeAnnouncement" style="color:#000;">个人中心</a>
										<a href="<%=request.getContextPath()%>/Logout" style="color: #000;">注销</a>
									<%}else if(user != null&&"0".equals(user.getIsadmin())){ %>
										<a style="color: #000;">欢迎 &nbsp;&nbsp; <%=user.getUser_name()%>&nbsp;</a>
										<a href ="<%=request.getContextPath()%>/admin/pages/wise/memberPage/memberMessage" style="color:#000;">个人中心</a>
										<a href="<%=request.getContextPath()%>/Logout" style="color: #000;">注销</a>
									<%} %>
									<% if(user == null) {%><a href="<%=request.getContextPath()%>/show/dist/html/login.jsp" style="color: #000;">登录</a>
										<a href ="<%=request.getContextPath()%>/admin/login.jsp" style="color:#000;">个人中心</a>
									<%}; %>
									<a href="<%=request.getContextPath()%>/show/dist/html/register.jsp" style="color: #000000;">注册</a>
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
										<a href=""><img src="../show/dist/assets/img/index/logo_top.png" alt="" style="width: auto;" /></a>
									</div>
								</div>
								<div class="am-u-lg-8 am-u-md-12">
									<div class="header-right am-fr">
										<div class="header-contact">
											<div class="nav-contain" style="border: none;box-shadow: none;">
												<div class="nav-inner">
													<ul class="am-nav am-nav-pills am-nav-justify">
														<li class="">
															<a href="#" style="color: #FF2F2F;">首页</a>
														</li>
														<li>
															<a href="/show/dist/html/cultureSystem.jsp">项目概况</a>
															<!-- sub-menu start-->
															<ul class="sub-menu">
																<li class="menu-item">
																	<a href="../show/dist/html/cultureSystem.jsp">培养体系</a>
																</li>
																<li class="menu-item">
																	<a href="../show/dist/html/solution.jsp">特色项目</a>
																</li>
																<li class="menu-item">
																	<a href="../show/dist/html/teachingMaterialSystem.jsp">往期回顾</a>
																</li>
																<!-- <li class="menu-item">
																	<a href="../show/dist/html/taxCollectionFund.jsp">领税基金</a>
																</li>
																<li class="menu-item">
																	<a href="../show/dist/html/expertTeam.jsp">专家团队</a>
																</li> -->
															</ul>
															<!-- sub-menu end-->
														</li>
														<li>
															<a href="../show/dist/html/regulationsClasses.jsp">自主报名</a>
														</li>
														<li>
															<a href="../show/dist/html/customizedClasses.jsp">定制班次</a>
														</li>
														<li>
															<a href="../show/dist/html/onlineClasses.jsp">拼班</a>
														</li>
														<li>
															<a href="../show/dist/html/incumbencyStudent.jsp">在职研</a>
															<!-- sub-menu start-->
															<ul class="sub-menu">
																<li class="menu-item">
																	<a href="../show/dist/html/incumbencyStudent.jsp">招生简章</a>
																</li>
																<li class="menu-item">
																	<a href="../show/dist/html/onlineApplication.jsp">在线报名</a>
																</li>
															</ul>
															<!-- sub-menu end-->
														</li>
														<li>
															<a href="../show/dist/html/newsNotice.jsp">新闻公告</a>
															<!-- sub-menu start-->
															<ul class="sub-menu">
																<li class="menu-item">
																	<a href="../show/dist/html/newsNotice.jsp">通知公告</a>
																</li>
																<li class="menu-item">
																	<a href="../show/dist/html/newsTrain.jsp">培训新闻</a>
																</li>
															</ul>
															<!-- sub-menu end-->
														</li>
														<li>
															<a href="../show/dist/html/centerOverview.jsp">下载中心</a>
															<!-- sub-menu start-->
															<!-- <ul class="sub-menu">
																<li class="menu-item">
																	<a href="../show/dist/html/centerOverview.jsp">概况</a>
																</li>
																<li class="menu-item">
																	<a href="../show/dist/html/organization.jsp">师资招聘</a>
																</li>
																<li class="menu-item">
																	<a href="aboutSchool.jsp">学校介绍</a>
																</li>
															</ul> -->
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
												<a href="#" style="color: #FF2F2F;">首页</a>
											</li>
											<li class="am-parent">
												<a href="../show/dist/html/cultureSystem.jsp">项目概况</a>
												<ul class="am-menu-sub am-collapse ">
													<li class="">
														<a href="../show/dist/html/cultureSystem.jsp">培养体系</a>
													</li>
													<li class="">
														<a href="../show/dist/html/solution.jsp">特色项目</a>
													</li>
													<li class="">
														<a href="../show/dist/html/teachingMaterialSystem.jsp" class="">往期回顾</a>
													</li>
												</ul>
											</li>
											<li class="">
												<a href="../show/dist/html/regulationsClasses.jsp">自主报名</a>
											</li>
											<li class="">
												<a href="../show/dist/html/customizedClasses.jsp">定制班次</a>
											</li>
											<li class="">
												<a href="../show/dist/html/onlineClasses.jsp">拼班</a>
											</li>

											<li class="am-parent">
												<a href="../show/dist/html/incumbencyStudent.jsp">在职研</a>
												<ul class="am-menu-sub am-collapse  ">
													<li class="menu-item">
														<a href="../show/dist/html/incumbencyStudent.jsp">招生简章</a>
													</li>
													<li class="menu-item">
														<a href="../show/dist/html/onlineApplication.jsp">在线报名</a>
													</li>
												</ul>
											</li>
											<li class="am-parent">
												<a href="../show/dist/html/newsNotice.jsp">新闻公告</a>
												<ul class="am-menu-sub am-collapse  ">
													<li class="menu-item">
														<a href="../show/dist/html/newsNotice.jsp">通知公告</a>
													</li>
													<li class="menu-item">
														<a href="../show/dist/html/newsTrain.jsp">培训新闻</a>
													</li>
												</ul>
											</li>
											<li class="am-parent">
												<a href="../show/dist/html/centerOverview.jsp">下载中心</a>
															<!-- sub-menu start-->
															
											</li>
											<li class="">
												<% if(user != null&&"1".equals(user.getIsadmin())) {%><a style="color: #FFF;">欢迎 &nbsp;&nbsp; <%=user.getUser_name()%>&nbsp;</a>
													<a href ="/admin/pages/wise/adminPage/noticeAnnouncement" style="color:#FFF;">个人中心</a>
													<a href="<%=request.getContextPath()%>/Logout" style="color: #FFF;">注销</a>
												<%}else if(user != null&&"0".equals(user.getIsadmin())){ %>
													<a style="color: #FFF;">欢迎 &nbsp;&nbsp; <%=user.getUser_name()%>&nbsp;</a>
													<a href ="<%=request.getContextPath()%>/admin/pages/wise/memberPage/memberMessage" style="color:#FFF;">个人中心</a>
													<a href="<%=request.getContextPath()%>/Logout" style="color: #FFF;">注销</a>
												<%} %>
												<% if(user == null) {%><a href="<%=request.getContextPath()%>/show/dist/html/login.jsp" style="color: #FFF;">登录</a>
													<a href ="<%=request.getContextPath()%>/admin/login.jsp" style="color:#FFFFFF;">个人中心</a>
												<%}; %>
											</li>
											<li class="">
												<a href="<%=request.getContextPath()%>/show/dist/html/register.jsp" class="" style="color:#FFF;">注册</a>
											</li>
										</ul>

									</div>
								</div>
							</nav>

						</div>
					</div>
					<div class="am-u-sm-5 am-u-end">
						<div class="m-logo">
							<a href=""><img src="../show/dist/assets/img/index/logo_top.png" alt="" style="width: auto;"></a>
						</div>
					</div>
				</div>
				<!--mobile header end-->
			</div>

			<div class="layout-container">
				<div class="index-page" style='height:100%;border-bottom:none;'>
					<div data-am-widget="tabs" class="am-tabs am-tabs-default"  style='height:100%;'>
						<div class="am-tabs-bd"  style='height:100%;border:none;'>
							<div data-tab-panel-0 class="am-tab-panel am-active" style='height:100%;'>
								<div class="" style='height:100%;'>
									<div data-am-widget="slider" class="am-slider am-slider-a1" data-am-slider='{&quot;directionNav&quot;:false}' id="demo-slider-0" style='height:100%;'>
										<ul class="am-slides" id="pic">
											<li style="">
												<a href="http://www.taxlead.cn/show/dist/html/newsNotice_content.jsp?notice_id=notice9ebc8ea2cecc4e9f852cb83e0e8c91e8" style="">
													<img src="../show/dist/assets/img/index/lunbo.png" style="">
												</a>
											</li>
										</ul>
									</div>
								</div>
							</div>

						</div>


					</div>

				</div>
			</div>

			<!--promo_detailed start-->
			<div class="promo_detailed newsBlock" style="min-height: auto!important;background: #ffffff;">
				<div class="promo_detailed-container">
					<div class="container" style="width: auto!important;padding-top: 20px;">
						<div class="am-g">
							<div class="am-u-md-6">
								<h2 class="notice">■通知公告</h2>
								<ul class="promo_detailed--list noPadding_li" id="newsNoticeUl">
									<li class="promo_detailed--list_item">
										<dl>
											<dt>
												<!-- <a href="newsNotice_content.jsp">东岳集团举行2019产业链合作年会，绘就千亿...</a> -->
											</dt>
											<dd>
												<!-- 2018-11-19 -->
											</dd>
										</dl>
									</li>
								</ul>
							</div>

							<div class="am-u-md-6 trainNews " style="max-height: 360px;padding-right: 1rem;padding-left:1rem;">
								<div class="promo_detailed--cta">
									<h2 class="news">■培训新闻</h2>
										<ul class="promo_detailed--list rePadding_li" style="padding:0 0 0 2.5%;" id="showNewsList">
										<li class="promo_detailed--list_item">
											
										</li>
										<li class="promo_detailed--list_item">
											
										</li>
									</ul>
								</div>
							</div>
							
							
							<!-- <div class="am-g am-show-sm-only">
								<div class="promo_detailed--cta">
									<h2 class="news">■培训新闻</h2>
										<ul class="promo_detailed--list rePadding_li" style="padding:0 0 0 2.5%;" id="showNewsList">
										<li class="promo_detailed--list_item">
											
										</li>
										<li class="promo_detailed--list_item">
											
										</li>
									</ul>
								</div>
							</div> -->

						</div>
					</div>
				</div>
				<!--<div class="promo_detailed-img am-hide-sm-only" style="background-image: url('assets/images/index/promo_detailed_bg.jpg');"></div>-->
			</div>
			<!--promo_detailed end-->

			<!--promo_detailed start-->
			<div class="promo_detailed" style="min-height: auto!important;background: #ffffff;">
				<div class="promo_detailed-container">
					<!--about-container end-->
					<div class="container" style="margin-top: 20px;width: auto!important;">
						<div class="section--header first_title_padding_bottom" style="text-align: center;border-bottom: 1px solid #ccc;margin-bottom: 10px;padding-bottom: 5px;">
							<h2 class="section--title tltle_center title_bottom_border" style="font-weight: 600;color: #000;">五大核心优势</h2>
						</div>

						<div class="news-contaier">
							<div class="blog">
								<div class="am-g" style="margin:0;">
									<div class="am-u-lg-4 am-u-md-4 about_center" style="width: 20%;">
										<div class="article">
											<div class="article-img">
												<a href="../show/dist/html/advantage1.jsp" ><img src="../show/dist/assets/img/index/a03.jpg" alt="" style="width: 100%;" /></a>
											</div>
											<div class="article-header">
												<h6 style="text-align: center;margin-bottom: 0;"><a href="../show/dist/html/advantage1.jsp" style="color: #333333;">以培训需求为导向</a></h6>
											</div>
											<div class="article-container">
												<p style="text-align: center;"><a href="../show/dist/html/advantage1.jsp" style="font-weight: 400;color: #333333;">建立多元化师资团队</a></p>
											</div>
										</div>
									</div>
									

									<div class="am-u-lg-4 am-u-md-4  am-u-end about_center" style="width: 20%;">
										<div class="article">
											<div class="article-img">
												<a href="../show/dist/html/advantage2.jsp" ><img src="../show/dist/assets/img/index/a05.jpg" alt="" style="width: 100%;" /></a>
											</div>
											<div class="article-header">
												<h6 style="text-align: center;margin-bottom: 0;"><a href="../show/dist/html/advantage2.jsp" style="color: #333333;">以人才培养为目标</a></h6>
											</div>
											<div class="article-container">
												<p style="text-align: center;"><a href="../show/dist/html/advantage2.jsp" style="font-weight: 400;color: #333333;">健全多层次一站式培养体系</a></p>
											</div>
										</div>
									</div>
									<div class="am-u-lg-4 am-u-md-4 about_center" style="width: 20%;">
										<div class="article">
											<div class="article-img">
												<a href="../show/dist/html/advantage3.jsp"><img src="../show/dist/assets/img/index/a02.jpg" alt="" style="width: 100%;" /></a>
											</div>
											<div class="article-header">
												<h6 style="text-align: center;margin-bottom: 0;"><a href="../show/dist/html/advantage3.jsp" style="color: #333333;">以岗位培训为入口</a></h6>
											</div>
											<div class="article-container">
												<p style="text-align: center;"><a href="../show/dist/html/advantage3.jsp" style="font-weight: 400;color: #333333;">提供细分领域整体解决方案</a></p>
											</div>
										</div>
									</div>
									
									<div class="am-u-lg-4 am-u-md-4 about_center" style="width: 20%;">
										<div class="article">
											<div class="article-img">
												<a href="../show/dist/html/advantage4.jsp" ><img src="../show/dist/assets/img/index/a04.jpg" alt="" style="width: 100%;" /></a>
											</div>
											<div class="article-header">
												<h6 style="text-align: center;margin-bottom: 0;"><a href="../show/dist/html/advantage4.jsp" style="color: #333333;">以科技创新为依托</a></h6>
											</div>
											<div class="article-container">
												<p style="text-align: center;"><a href="../show/dist/html/advantage4.jsp" style="font-weight: 400;color: #333333;">破解税务培训工作难点痛点</a></p>
											</div>
										</div>
									</div>
									<div class="am-u-lg-4 am-u-md-4 about_center" style="width: 20%;">
										<div class="article">
											<div class="article-img">
												<a  href="../show/dist/html/advantage5.jsp"><img src="../show/dist/assets/img/index/a01.jpg" alt="" style="width: 100%;" /></a>
											</div>
											<div class="article-header">
												<h6 style="text-align: center;margin-bottom: 0;"><a href="../show/dist/html/advantage5.jsp" style="color: #333333;">以共建共生为路径</a></h6>
											</div>
											<div class="article-container">
												<p style="text-align: center;"><a href="../show/dist/html/advantage5.jsp" style="font-weight: 400;color: #333333;">推进税收生态系统建设</a></p>
											</div>
										</div>
									</div>
									
								</div>

							</div>

						</div>
					</div>
				</div>
				<!--<div class="promo_detailed-img am-hide-sm-only" style="background-image: url('assets/images/index/promo_detailed_bg.jpg');"></div>-->
			</div>
			<!--promo_detailed end-->

		</div>


		<!--===========layout-footer================-->
		<div class="layout-footer">
			<div class="footer">
				<div style="background-color:#054371" class="footer--bg"></div>
				<div class="footer--inner">
					<div class="container">
						<div class="footer_main">
							<div class="am-g">
								<div class="am-u-md-12">
									<div class="footer_main--column am-u-md-12" style="margin-top:0;">
										<ul class="footer_contact_info">
											<li class="footer_contact_info--item" >
												<img alt="logo" src="show/dist/assets/img/logo_bottom.png"  style="width: 30px">
											</li>
											<li class="footer_contact_info--item">
												<i class="am-icon-home"></i><span style="padding:0 0 0 15px;">北京市海淀区中关村大街59号中国人民大学财政金融学院</span>
											</li>
											<li class="footer_contact_info--item"><i class="am-icon-phone"></i>
												<span style="padding:0 0 0 15px;">联系电话：16601021525&nbsp;16601021533&nbsp;16601021561 </span>
											</li>
											<li class="footer_contact_info--item">
												<i class="am-icon-envelope-o"></i><span style="padding:0 0 0 15px;">E-mail：tzcpx001@163.com</span>
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
		<script src="../show/dist/assets/js/jquery-2.1.0.js" charset="utf-8"></script>
		﻿<!--[if (gte IE 9)|!(IE)]><!-->
		<script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
		<!--<![endif]-->

		<!--[if lt IE 9]>
		<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
		<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
		<script src="../show/dist/assets/js/amazeui.ie8polyfill.min.js"></script>
		<![endif]-->
		<script src="../show/dist/assets/js/amazeui.js" charset="utf-8"></script>
		<script src="../show/dist/assets/js/common.js" charset="utf-8"></script>
	</body>
	
		<script >
		var datas=new Array()
		var datas1=new Array()
		var pageno1=0;
		$(document).ready(function() {
			$.ajax({
				url : '<%=request.getContextPath()%>/Show/findAllNews',
				type : 'post',
				async:false,
	      		dataType:'json',
				success : function(data) {
					datas=data.data
					var zz =new Array(datas.length);
					
					var content="   11月18日上午，集团在北京新华联国际文化交流中心召开重点企业工作会议，促进2018年整体经营目标的实现。集团领导傅军、丁伟、马晨山、肖文慧、冯建军、苏波、张必书、张皓若、刘静、杨运辉、蒋赛、曾敏、苟永平..."
					if(datas.length ==0){
						if(datas.length == 0){
							document.getElementById("showNewsList").innerHTML="";//全部清空
							var div =document.createElement("li");//建立div对象
						 	div.setAttribute("class","promo_detailed--list_item");
							div.innerHTML="暂无培训新闻!";//建立显示元素 
							document.getElementById("showNewsList").appendChild(div);//加入all中 
							return;
						}
					}
					for(var i=0;i <datas.length;i++){ 
						
						var msg=datas[i].news_context
	
						var content = filterHTMLTag(msg)
						
						function filterHTMLTag(msg) {
					        var msg = msg.replace(/<\/?[^>]*>/g, ''); //去除HTML Tag
					        msg = msg.replace(/[|]*\n/, ''); //去除行尾空格
					        msg = msg.replace(/&npsp;/ig, ''); //去掉npsp
					        return msg;
						}
						
						if(content.length>50){
			  				var content=content.substring(0, 50)+'...';
			  			}else{
			  				var content=content;
			  			}
			  			
			  			if(window.outerWidth<640){
			  				zz[i]='<span class="promo_detailed--list_item_icon promo_detailed--list_item_pic" style="width:100%!important;margin-bottom:20px;text-align:center;">'+
								'<a href=\"../show/dist/html/news_content.jsp?news_id='+datas[i].news_id+'\" target="_blank" title=\"'+datas[i].news_titile+'\">'+
										'<img src="<%=request.getContextPath()%>/Show/News_title_page_Show?news_id='+datas[i].news_id+'" title=\"'+datas[i].news_titile+'\" alt=\"'+datas[i].news_titile+'\" style="height: 100px;width: 162px;" />'+
								'</a>'+
							'</span>'+'<dl>'+'<dt>'+
								'<a href=\"../show/dist/html/news_content.jsp?news_id='+datas[i].news_id+'\" target="_blank" title=\"'+datas[i].news_titile+'\" style=\"color:#333;\">'+datas[i].news_titile+'</a>'+
										'</dt><dd>'+'<a href=\"../show/dist/html/news_content.jsp?news_id='+datas[i].news_id+'\" target="_blank" title=\"'+datas[i].news_content+'\" style=\"color:#333;\">'+
										content+
										'</a>'+'</dd>'+'<dd class="timeRight">'+
										'<a href=\"../show/dist/html/news_content.jsp?news_id='+datas[i].news_id+'\" target="_blank" title=\"'+datas[i].news_Release_time+'\" style=\"color:#333;\">'+
										datas[i].news_Release_time+'</a>'+
								'</dd>'+
							'</dl>';
			  			}else{
			  				zz[i]='<span class="promo_detailed--list_item_icon promo_detailed--list_item_pic">'+
								'<a href=\"../show/dist/html/news_content.jsp?news_id='+datas[i].news_id+'\" target="_blank" title=\"'+datas[i].news_titile+'\">'+
										'<img src="<%=request.getContextPath()%>/Show/News_title_page_Show?news_id='+datas[i].news_id+'" title=\"'+datas[i].news_titile+'\" alt=\"'+datas[i].news_titile+'\" style="height: 100px;width: 162px;" />'+
								'</a>'+
							'</span>'+'<dl>'+'<dt>'+
								'<a href=\"../show/dist/html/news_content.jsp?news_id='+datas[i].news_id+'\" target="_blank" title=\"'+datas[i].news_titile+'\" style=\"color:#333;\">'+datas[i].news_titile+'</a>'+
										'</dt><dd>'+'<a href=\"../show/dist/html/news_content.jsp?news_id='+datas[i].news_id+'\" target="_blank" title=\"'+datas[i].news_content+'\" style=\"color:#333;\">'+
										content+
										'</a>'+'</dd>'+'<dd class="timeRight">'+
										'<a href=\"../show/dist/html/news_content.jsp?news_id='+datas[i].news_id+'\" target="_blank" title=\"'+datas[i].news_Release_time+'\" style=\"color:#333;\">'+
										datas[i].news_Release_time+'</a>'+
								'</dd>'+
							'</dl>';
			  			}


				  		
								
					} //div的字符串数组付给zz
					var pageno=1 ;              //当前页
					var pagesize=2;            //每页多少条信息
					pageno1=pageno;
					if(zz.length%pagesize==0){
						var  pageall =zz.length/pagesize ;
					}else{
						var  pageall =parseInt(zz.length/pagesize)+1;  
					}   //一共多少页   
					
					datas1=zz;
					function change(e){
						pageno=e;
						if(e<1){ //如果输入页<1页
							e=1;pageno=1;//就等于第1页 ， 当前页为1
						}
					    if(e>pageall){  //如果输入页大于最大页
							e=pageall;pageno=pageall; //输入页和当前页都=最大页
						}
						document.getElementById("showNewsList").innerHTML="";//全部清空
							for(var i=0;i<pagesize;i++){
							 	var div =document.createElement("li");//建立div对象
							 	div.setAttribute("class","promo_detailed--list_item");
								div.innerHTML=zz[(e-1)*pagesize+i];//建立显示元素 
								document.getElementById("showNewsList").appendChild(div);//加入all中 
								if(zz[(e-1)*pagesize+i+1]==null) break;//超出范围跳出
					        }
					}
					change(1);
				},
				error : function(error) {
					console.log('接口不通' + error);
				}
			});
			
			
			 $.ajax({
				url : '<%=request.getContextPath()%>/Show/findAllRotation',
				type : 'post',
				async:false,
	      		dataType:'json',
				success : function(data) {
					datas=data.data;
					if(datas.length == 0){
						document.getElementById("pic").innerHTML="";//全部清空
						var div =document.createElement("li");//建立div对象
						div.innerHTML="暂无轮播图!";//建立显示元素
						document.getElementById("pic").appendChild(div);//加入all中 
						return;
					}
					var zz =new Array(datas.length);
					
					var $slider = $('#demo-slider-0');
					for(var i=0;i<datas.length;i++){
						var getSlide = function() {
							var lis="";
							var li='<li style=""><a href="<%=request.getContextPath()%>/show/dist/html/'+datas[i].rotationPic_KeyWords+'" style=""><img src="<%=request.getContextPath()%>/Show/Rotation_title_page_Show?rotation_id='+datas[i].rotationPic_id+'" style=""></img></a></li>';
							if(datas[i].rotationPic_KeyWords=='Nolink'){
								 li='<li style=""><img src="<%=request.getContextPath()%>/Show/Rotation_title_page_Show?rotation_id='+datas[i].rotationPic_id+'" style=""></img></li>';
							}
							
								lis = lis+li;
						   return lis;
						};
						$slider.flexslider('addSlide', getSlide());
					}
					window.reSite();
				},
				error : function(error) {
						console.log('接口不通' + error);
					}
				}); 
			  
				  $.ajax({
						url : '<%=request.getContextPath()%>/Show/findAllNotice',
						type : 'post',
						async:false,
			      		dataType:'json',
						success : function(data) {
							datas=data.data
							if(datas.length == 0){
								document.getElementById("newsNoticeUl").innerHTML="";//全部清空
								var div =document.createElement("li");//建立div对象
								div.setAttribute("class","promo_detailed--list_item");
								div.innerHTML="暂无通知公告!";//建立显示元素
								document.getElementById("newsNoticeUl").appendChild(div);//加入all中 
								return;
							}
							var zz =new Array(datas.length);
							
							var content='东岳集团举行2019产业链合作年会，绘就千亿';
							var size=content.length;
							for(var i=0;i <datas.length;i++){ 
								
								var msg=datas[i].notice_titile;
								var content = filterHTMLTag(msg);
								function filterHTMLTag(msg) {
							        var msg = msg.replace(/<\/?[^>]*>/g, ''); //去除HTML Tag
							        msg = msg.replace(/[|]*\n/, '') //去除行尾空格
							        msg = msg.replace(/&npsp;/ig, ''); //去掉npsp
							        return msg;
								}
								if(content.length>40){
					  				var content=content.substring(0, 40)+'...';
					  			}else{
					  				var content=content;
					  			}
								zz[i]= '<dl style="margin-bottom:0.6rem;"><dt><a href="../show/dist/html/newsNotice_content.jsp?notice_id='+datas[i].notice_id+'" style="color:#333;">'+content+'</a></dt><dd style="text-align:left;margin-top:0;">'+datas[i].notice_Release_time+'</dd></dl>';
						    } //div的字符串数组付给zz
							var pageno=1 ;              //当前页
							var pagesize=4;            //每页多少条信息
							pageno1=pageno;
							if(zz.length%pagesize==0){
								var  pageall =zz.length/pagesize ;
							}else{
								var  pageall =parseInt(zz.length/pagesize)+1;  
							}   //一共多少页   
							
							datas1=zz;
							function change(e){
								pageno=e;
								if(e<1){ //如果输入页<1页
									e=1;pageno=1;//就等于第1页 ， 当前页为1
								}
							    if(e>pageall){  //如果输入页大于最大页
									e=pageall;pageno=pageall; //输入页和当前页都=最大页
								}
								document.getElementById("newsNoticeUl").innerHTML="";//全部清空
									for(var i=0;i<pagesize;i++){
										var div =document.createElement("li");//建立div对象
										div.setAttribute("class","promo_detailed--list_item");
										div.innerHTML=zz[(e-1)*pagesize+i];//建立显示元素
										document.getElementById("newsNoticeUl").appendChild(div);//加入all中 
										if(zz[(e-1)*pagesize+i+1]==null) break;//超出范围跳出
							        }
							}
							change(1);
						},
						error : function(error) {
							console.log('接口不通' + error);
						}
					});
				  
				  
				  
				  var windowWidth = $(window).width();
				    if(windowWidth < 640){
				        // do something
				    	var newsBlockHeight = $(".newsBlock").height()+330;
				        $(".newsBlock").css("height",newsBlockHeight);
				        //20190112-2121
				       // $("#showNewsList li").height(120);
				        $("#showNewsList li").height($(".promo_detailed--cta ul li span").height()+$(".promo_detailed--cta ul li dl dt a").height()+$($(".promo_detailed--cta ul li dl dd a")[0]).height()+$($(".promo_detailed--cta ul li dl dd a")[1]).height())
				        $(".promo_detailed--cta").height($(".promo_detailed--cta h2").height()+40+$(".promo_detailed--cta ul").height());
				        $(".newsBlock").height($(".promo_detailed--cta").height());
				        
				    }
				    if(windowWidth >= 640){
				        // do something
				    }
				    
					var layoutHeight = $(".layout").height();
					var bodyHeight = $("body").height();
					var layoutFootHeight=$(".layout-footer").height();
					if(bodyHeight>(layoutHeight+layoutFootHeight)){
						$(".layout-footer").css("margin-bottom",layoutHeight+layoutFootHeight-bodyHeight);
					}
			});
		var reSite = function(){
			/* 轮播height start */
			var height_pic = $($("#pic li")[1]).height()/($($("#pic li")[1]).width()/window.outerWidth);
			$("#pic").height(height_pic);
			$(".am-viewport").height($($("#pic").height(height_pic)).height());
			/* 轮播height end */
			
			$(".promo_detailed--cta").height($(".promo_detailed--cta h2").height()+$(".promo_detailed--cta ul").height());
		}
		$(window).resize(function(){
			/* 轮播height start */
			var height_pic = $($("#pic li")[1]).height()/($($("#pic li")[1]).width()/window.outerWidth);
			$("#pic").height(height_pic);
			$(".am-viewport").height($($("#pic").height(height_pic)).height());
			/* 轮播height end */
			$(".promo_detailed--cta").height($(".promo_detailed--cta h2").height()+$(".promo_detailed--cta ul").height());
		})
		
		
	</script>


</html>