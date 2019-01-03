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
		<link rel="stylesheet" href="assets/css/amazeui.css" />
		<link rel="stylesheet" href="assets/css/common.min.css" />
		<link rel="stylesheet" href="assets/css/index.min.css" />
		<link rel="stylesheet" href="assets/css/myStyle.css" />
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
										<a href=""><img src="assets/img/index/logo_top.png" alt="" style="width: auto;" /></a>
									</div>
								</div>
								<div class="am-u-lg-8 am-u-md-12">
									<div class="header-right am-fr">
										<div class="header-contact">
											<div class="nav-contain" style="border: none;box-shadow: none;">
												<div class="nav-inner">
													<ul class="am-nav am-nav-pills am-nav-justify">
														<li class="">
															<a href="index.jsp" style="color: #FF2F2F;">首页</a>
														</li>
														<li>
															<a href="html/cultureSystem.jsp">项目概况</a>
															<!-- sub-menu start-->
															<ul class="sub-menu">
																<li class="menu-item">
																	<a href="html/cultureSystem.jsp">培养体系</a>
																</li>
																<li class="menu-item">
																	<a href="html/solution.jsp">解决方案</a>
																</li>
																<li class="menu-item">
																	<a href="html/teachingMaterialSystem.jsp">教材体系</a>
																</li>
																<li class="menu-item">
																	<a href="html/taxCollectionFund.jsp">领税基金</a>
																</li>
																<li class="menu-item">
																	<a href="html/expertTeam.jsp">专家团队</a>
																</li>
															</ul>
															<!-- sub-menu end-->
														</li>
														<li>
															<a href="html/regulationsClasses.jsp">规定班次</a>
														</li>
														<li>
															<a href="html/customizedClasses.jsp">定制班次</a>
														</li>
														<li>
															<a href="html/onlineClasses.jsp">拼班</a>
														</li>
														<li>
															<a href="html/incumbencyStudent.jsp">在职研</a>
															<!-- sub-menu start-->
															<ul class="sub-menu">
																<li class="menu-item">
																	<a href="html/incumbencyStudent.jsp">招生简章</a>
																</li>
																<li class="menu-item">
																	<a href="html/onlineApplication.jsp">在线报名</a>
																</li>
															</ul>
															<!-- sub-menu end-->
														</li>
														<li>
															<a href="html/newsNotice.jsp">新闻公告</a>
															<!-- sub-menu start-->
															<ul class="sub-menu">
																<li class="menu-item">
																	<a href="html/newsNotice.jsp">通知公告</a>
																</li>
																<li class="menu-item">
																	<a href="html/newsTrain.jsp">培训新闻</a>
																</li>
															</ul>
															<!-- sub-menu end-->
														</li>
														<li>
															<a href="html/about.jsp">关于我们</a>
															<!-- sub-menu start-->
															<ul class="sub-menu">
																<li class="menu-item">
																	<a href="html/centerOverview.jsp">中心概况</a>
																</li>
																<li class="menu-item">
																	<a href="html/organization.jsp">组织结构</a>
																</li>
																<li class="menu-item">
																	<a href="html/aboutSchool.jsp">学校介绍</a>
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
												<a href="index.jsp" style="color: #FF2F2F;">首页</a>
											</li>
											<li class="am-parent">
												<a href="html/cultureSystem.jsp">项目概况</a>
												<ul class="am-menu-sub am-collapse ">
													<li class="">
														<a href="html/cultureSystem.jsp">培养体系</a>
													</li>
													<li class="">
														<a href="html/solution.jsp">解决方案</a>
													</li>
													<li class="">
														<a href="html/teachingMaterialSystem.jsp" class="">教材体系</a>
													</li>
													<li class="">
														<a href="html/taxCollectionFund.jsp" class="">领税基金</a>
													</li>
													<li class="">
														<a href="html/expertTeam.jsp" class="">专家团队</a>
													</li>
												</ul>
											</li>
											<li class="">
												<a href="html/regulationsClasses.jsp">规定班次</a>
											</li>
											<li class="">
												<a href="html/customizedClasses.jsp">定制班次</a>
											</li>
											<li class="">
												<a href="html/onlineClasses.jsp">拼班</a>
											</li>

											<li class="am-parent">
												<a href="html/incumbencyStudent.jsp">在职研</a>
												<ul class="am-menu-sub am-collapse  ">
													<li class="menu-item">
														<a href="html/incumbencyStudent.jsp">招生简章</a>
													</li>
													<li class="menu-item">
														<a href="html/onlineApplication.jsp">在线报名</a>
													</li>
												</ul>
											</li>
											<li class="am-parent">
												<a href="html/newsNotice.jsp">新闻公告</a>
												<ul class="am-menu-sub am-collapse  ">
													<li class="menu-item">
														<a href="html/newsNotice.jsp">通知公告</a>
													</li>
													<li class="menu-item">
														<a href="html/newsTrain.jsp">培训新闻</a>
													</li>
												</ul>
											</li>
											<li class="am-parent">
												<a href="html/about.jsp">关于我们</a>
												<ul class="am-menu-sub am-collapse  ">
													<li class="menu-item">
														<a href="html/centerOverview.jsp">中心概况</a>
													</li>
													<li class="menu-item">
														<a href="html/organization.jsp">组织结构</a>
													</li>
													<li class="menu-item">
														<a href="html/aboutSchool.jsp">学校介绍</a>
													</li>
												</ul>
											</li>
											<li class="">
												<% if(user != null) {%><a >欢迎 &nbsp;&nbsp; <%=user.getUser_name()%>&nbsp;</a>
													<a href="<%=request.getContextPath()%>/Logout">注销</a>
												<%}; %>
												<% if(user == null) {%><a href="html/login.jsp" >登录</a><%}; %>
											</li>
											<li class="">
												<a href="html/register.jsp" class="">注册</a>
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
				<div class="index-page">
					<div data-am-widget="tabs" class="am-tabs am-tabs-default">
						<div class="am-tabs-bd">
							<div data-tab-panel-0 class="am-tab-panel am-active">
								<div class="">
									<div data-am-widget="slider" class="am-slider am-slider-a1" data-am-slider='{&quot;directionNav&quot;:false}'>
										<ul class="am-slides">
											<li><img src="assets/img/index/lunbo1.png"></li>
											<li><img src="assets/img/index/lunbo2.png"></li>
											<li><img src="assets/img/index/lunbo3.png"></li>
											<li><img src="assets/img/index/lunbo4.png"></li>
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
											<dt><a href="newsNotice_content.jsp">东岳集团举行2019产业链合作年会，绘就千亿...</a></dt>
											<dd>
												2018-11-19
											</dd>
										</dl>
									</li>
									<!-- <li class="promo_detailed--list_item">
										<span class="promo_detailed--list_item_icon">
	                  <i class="am-icon-dollar" style="margin-left: 15px;"></i>
	                </span>
										<dl>
											<dt>集团为湖南一师优秀贫困大学生再颁助学奖励...</dt>
											<dd>
												2018-11-17
											</dd>
										</dl>
									</li>
									<li class="promo_detailed--list_item">
										<span class="promo_detailed--list_item_icon">
	                  <i class="am-icon-bank" style="margin-left: 10px;"></i>
	                </span>
										<dl>
											<dt>新华联董事局主席傅军：建议加大创新型企业...</dt>
											<dd>
												2018-03-04
											</dd>
										</dl>
									</li>
									<li class="promo_detailed--list_item">
										<span class="promo_detailed--list_item_icon">
	                  <i class="am-icon-bank" style="margin-left: 10px;"></i>
	                </span>
										<dl>
											<dt>傅军委员：应鼓励更多创新型“独角兽”企业...</dt>
											<dd>
												2018-03-07
											</dd>
										</dl>
									</li> -->
								</ul>
							</div>

							<div class="am-u-md-6 trainNews" style="max-height: 360px;padding-right: 1rem;padding-left:1rem;">
								<div class="promo_detailed--cta">
									<h2 class="news">■培训新闻</h2>
										<ul class="promo_detailed--list rePadding_li" style="padding:0 0 0 2.5%;" id="showNewsList">
										<li class="promo_detailed--list_item">
											<span class="promo_detailed--list_item_icon promo_detailed--list_item_pic">
		             				     		<img src="assets/img/index/f03.png" />
		         			    		   </span>
											<dl>
												<dt>微软重登全球市值第一，退居次席的苹果最近有点烦</dt>
												<dd>
													在苹果的阴影下生活10年之后，微软终于超过苹果，再次成为全球市值最高的公司。
												</dd>
												<dd class="timeRight">
													2小时前
												</dd>
											</dl>
										</li>
										<li class="promo_detailed--list_item">
											<span class="promo_detailed--list_item_icon promo_detailed--list_item_pic">
		                  <!--<i class="am-icon-dollar" style="margin-left: 15px;"></i>-->
		                  <img src="assets/img/index/f04.png" />
		                </span>
											<dl>
												<dt>一出手就是50亿，送外卖的美团，金融也玩的这么溜！</dt>
												<dd>
													2015年，美团点评CEO王兴说了一句话，把所有人惊呆了：打造一个千亿元资产规模的金融事业。
												</dd>
												<dd class="timeRight">
													2小时前
												</dd>
											</dl>
										</li>
									</ul>
								</div>
							</div>

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
									<!--<div class="am-u-lg-8 am-u-md-8 about_center" style="margin-left: 15%;">
										<div class="article">
											&lt;!&ndash; <div class="article-img">
                                              <img src="../assets/img/about/content_img3.png" alt="" />
                                            </div> &ndash;&gt;
											<div class="article-header">
												<h4 style="text-align: center;font-size: 16px;font-weight: 400;">数字化将人们联系起来，但是数字智能，有人也称之为人工智能，能做到的远不止于此。未来十年，我们需要考虑如何结合数字智能，成就认知商业。这是一个新时代的开始。</h4>
											</div>
										</div>
									</div>-->

									<div class="am-u-lg-4 am-u-md-4 about_center" style="width: 20%;">
										<div class="article">
											<div class="article-img">
												<a  href="html/expertTeam.jsp"><img src="assets/img/about/content_img3.png" alt="" style="width: 100%;" /></a>
											</div>
											<div class="article-header">
												<h6 style="text-align: center;margin-bottom: 0;"><a href="html/expertTeam.jsp" style="color: #333333;">国内一流顶尖的</a></h6>
											</div>
											<div class="article-container">
												<p style="text-align: center;"><a href="html/expertTeam.jsp" style="font-weight: 400;color: #333333;">讲师团队</a></p>
											</div>
										</div>
									</div>

									<div class="am-u-lg-4 am-u-md-4 about_center" style="width: 20%;">
										<div class="article">
											<div class="article-img">
												<a href="html/teachingMaterialSystem.jsp"><img src="assets/img/about/content_img4.png" alt="" style="width: 100%;" /></a>
											</div>
											<div class="article-header">
												<h6 style="text-align: center;margin-bottom: 0;"><a href="html/teachingMaterialSystem.jsp" style="color: #333333;">全面实用的</a></h6>
											</div>
											<div class="article-container">
												<p style="text-align: center;"><a href="html/teachingMaterialSystem.jsp.jsp" style="font-weight: 400;color: #333333;">管理会计体系</a></p>
											</div>
										</div>
									</div>
									<div class="am-u-lg-4 am-u-md-4 about_center" style="width: 20%;">
										<div class="article">
											<div class="article-img">
												<a href="html/cultureSystem.jsp" ><img src="assets/img/about/content_img4.png" alt="" style="width: 100%;" /></a>
											</div>
											<div class="article-header">
												<h6 style="text-align: center;margin-bottom: 0;"><a href="html/cultureSystem.jsp" style="color: #333333;">国内领先的</a></h6>
											</div>
											<div class="article-container">
												<p style="text-align: center;"><a href="html/cultureSystem.jsp" style="font-weight: 400;color: #333333;">税务培训基地</a></p>
											</div>
										</div>
									</div>
									<div class="am-u-lg-4 am-u-md-4 about_center" style="width: 20%;">
										<div class="article">
											<div class="article-img">
												<a href="html/taxCollectionFund.jsp" ><img src="assets/img/about/content_img4.png" alt="" style="width: 100%;" /></a>
											</div>
											<div class="article-header">
												<h6 style="text-align: center;margin-bottom: 0;"><a href="html/taxCollectionFund.jsp" style="color: #333333;">聚焦本土</a></h6>
											</div>
											<div class="article-container">
												<p style="text-align: center;"><a href="html/taxCollectionFund.jsp" style="font-weight: 400;color: #333333;">最佳实现</a></p>
											</div>
										</div>
									</div>

									<div class="am-u-lg-4 am-u-md-4  am-u-end about_center" style="width: 20%;">
										<div class="article">
											<div class="article-img">
												<a href="html/solution.jsp" ><img src="assets/img/about/content_img5.png" alt="" style="width: 100%;" /></a>
											</div>
											<div class="article-header">
												<h6 style="text-align: center;margin-bottom: 0;"><a href="html/solution.jsp" style="color: #333333;">精英小班</a></h6>
											</div>
											<div class="article-container">
												<p style="text-align: center;"><a href="html/solution.jsp" style="font-weight: 400;color: #333333;">学习社交平台</a></p>
											</div>
										</div>
									</div>
								</div>

								<!-- pagination-->
								<!--<ul class="am-pagination">
                                  <li class="am-disabled"><a href="#">&laquo;</a></li>
                                  <li class="am-active"><a href="#">1</a></li>
                                  <li><a href="#">2</a></li>
                                  <li><a href="#">3</a></li>
                                  <li><a href="#">4</a></li>
                                  <li><a href="#">5</a></li>
                                  <li><a href="#">&raquo;</a></li>
                                </ul>-->
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
								<div class="am-u-lg-4 am-u-md-4 am-u-sm-12">
									<div class="footer_main--column">
										<strong class="footer_main--column_title">友情链接</strong>
										<ul class="footer_navigation">
											<li class="footer_navigation--item"><a href="http://www.cufe.edu.cn/" class="footer_navigation--link">中央财经大学</a></li>
											<li class="footer_navigation--item"><a href="http://spft.cufe.edu.cn/index.htm" class="footer_navigation--link">中央财经大学财政税务学院</a></li>
											<li class="footer_navigation--item"><a href="http://www.cscse.edu.cn/publish/portal0/" class="footer_navigation--link">中国(教育部)留学服务中心</a></li>
											<li class="footer_navigation--item"><a href="http://www.moe.gov.cn/" class="footer_navigation--link">中华人民共和国教育部</a></li>
											<li class="footer_navigation--item"><a href="https://cn.accaglobal.com" class="footer_navigation--link">ACCA（特许公认会计师工会）</a></li>
										</ul>
									</div>
								</div>

								<div class="am-u-lg-8 am-u-md-8 am-u-sm-12">
									<div class="footer_main--column am-u-lg-8 am-u-md-8 am-u-sm-12">
										<strong class="footer_main--column_title">联系详情</strong>
										<ul class="footer_contact_info">
											<li class="footer_contact_info--item"><i class="am-icon-phone"></i><span>服务专线：400 069 0309</span></li>
											<li class="footer_contact_info--item"><i class="am-icon-envelope-o"></i><span>yunshipei.com</span></li>
											<li class="footer_contact_info--item"><i class="am-icon-map-marker"></i><span>北京市海淀区海淀大街27号天使大厦（原亿景大厦）三层</span></li>
											<li class="footer_contact_info--item"><i class="am-icon-clock-o"></i><span>Monday - Friday, 9am - 6 pm; </span></li>
										</ul>
									</div>
									<div class="am-u-lg-4 am-u-md-4 am-u-sm-12 " style="margin-top: 20px;">
										<div class="footer_main--column">
											<ul class="footer_navigation">
												<div class="article-img">
													<img src="assets/img/index/wx_code.png" style="width: 150px;" />
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
		<script src="assets/js/jquery-2.1.0.js" charset="utf-8"></script>
		﻿<!--[if (gte IE 9)|!(IE)]><!-->
		<script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
		<!--<![endif]-->

		<!--[if lt IE 9]>
		<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
		<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
		<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
		<![endif]-->
		<script src="assets/js/amazeui.js" charset="utf-8"></script>
		<script src="assets/js/common.js" charset="utf-8"></script>
	</body>
	
		<script >
		var datas=new Array()
		var datas1=new Array()
		var pageno1=0;
		$(document).ready(function() {
// 				var oNewsList = document.getElementsByClassName('newsList')[0];
// 				if(oNewsList.children[0].childElementCount){
// 					var newsListNum = oNewsList.children[0].childElementCount;
// 					var newsListNumHeight = newsListNum*35+5 +'px';
// 					$('.newsList').css('height',newsListNumHeight);
// 				}
				
				  $.ajax({
						url : '<%=request.getContextPath()%>/Show/findAllNotice',
						type : 'post',
						async:false,
			      		dataType:'json',
						success : function(data) {
							datas=data.data
							if(datas.length == 0){
								document.getElementById("newsNoticeUl").innerHTML=""//全部清空
								var div =document.createElement("li")//建立div对象
								div.setAttribute("class","promo_detailed--list_item");
								div.innerHTML="暂无通知公告!"//建立显示元素
								document.getElementById("newsNoticeUl").appendChild(div)//加入all中 
								return;
							}
							var zz =new Array(datas.length);
							
							var content='东岳集团举行2019产业链合作年会，绘就千亿'
							var size=content.length
							for(var i=0;i <datas.length;i++){ 
								
								var msg=datas[i].notice_titile
								var content = filterHTMLTag(msg)
								function filterHTMLTag(msg) {
							        var msg = msg.replace(/<\/?[^>]*>/g, ''); //去除HTML Tag
							        msg = msg.replace(/[|]*\n/, '') //去除行尾空格
							        msg = msg.replace(/&npsp;/ig, ''); //去掉npsp
							        return msg;
								}
								if(content.length>22){
					  				var content=content.substring(0, 22)+'...'
					  			}else{
					  				var content=content
					  			}
// 							东岳集团举行2019产业链合作年会，绘就千亿...
								zz[i]= '<dl><dt><a href="html/newsNotice_content.jsp?notice_id='+datas[i].notice_id+'">'+content+'</a></dt><dd>'+datas[i].notice_Release_time+'</dd></dl>'
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
								document.getElementById("newsNoticeUl").innerHTML=""//全部清空
									for(var i=0;i<pagesize;i++){
										var div =document.createElement("li")//建立div对象
										div.setAttribute("class","promo_detailed--list_item");
										div.innerHTML=zz[(e-1)*pagesize+i]//建立显示元素
										document.getElementById("newsNoticeUl").appendChild(div)//加入all中 
										if(zz[(e-1)*pagesize+i+1]==null) break;//超出范围跳出
							        }
							}
							change(1);
						},
						error : function(error) {
							console.log('接口不通' + error);
						}
					});
		});
		
		
// 		<span class="promo_detailed--list_item_icon promo_detailed--list_item_pic">
//   		<img src="assets/img/index/f03.png" />
// 	   </span>
// 	<dl>
// 		<dt>微软重登全球市值第一，退居次席的苹果最近有点烦</dt>
// 		<dd>
// 			在苹果的阴影下生活10年之后，微软终于超过苹果，再次成为全球市值最高的公司。
// 		</dd>
// 		<dd class="timeRight">
// 			2小时前
// 		</dd>
// 		</dl>
		
			 $.ajax({
						url : '<%=request.getContextPath()%>/Show/findAllNews',
						type : 'post',
						async:false,
			      		dataType:'json',
						success : function(data) {
							datas=data.data
// 							if(data.success == true){
							var zz =new Array(datas.length);
							
							var content="   11月18日上午，集团在北京新华联国际文化交流中心召开重点企业工作会议，促进2018年整体经营目标的实现。集团领导傅军、丁伟、马晨山、肖文慧、冯建军、苏波、张必书、张皓若、刘静、杨运辉、蒋赛、曾敏、苟永平..."
// 							var length=content.substring(0, 108)
// 							var length=content.toString()
							if(datas.length ==0){
								if(datas.length == 0){
									document.getElementById("showNewsList").innerHTML=""//全部清空
									var div =document.createElement("li")//建立div对象
								 	div.setAttribute("class","promo_detailed--list_item");
									div.innerHTML="暂无培训新闻!"//建立显示元素 
//										var div=zz[(e-1)*pagesize+i]//建立显示元素
									document.getElementById("showNewsList").appendChild(div)//加入all中 
									return;
								}
							}
							for(var i=0;i <datas.length;i++){ 
								
								var msg=datas[i].news_context
		
								var content = filterHTMLTag(msg)
								
								function filterHTMLTag(msg) {
							        var msg = msg.replace(/<\/?[^>]*>/g, ''); //去除HTML Tag
							        msg = msg.replace(/[|]*\n/, '') //去除行尾空格
							        msg = msg.replace(/&npsp;/ig, ''); //去掉npsp
							        return msg;
								}
								
								if(content.length>22){
					  				var content=content.substring(0, 22)+'...'
					  			}else{
					  				var content=content
					  			}
//						 		<span class="promo_detailed--list_item_icon promo_detailed--list_item_pic">
//					   		<img src="assets/img/index/f03.png" />
//					 	   </span>
//					 	<dl>
//					 		<dt>微软重登全球市值第一，退居次席的苹果最近有点烦</dt>
//					 		<dd>
//					 			在苹果的阴影下生活10年之后，微软终于超过苹果，再次成为全球市值最高的公司。
//					 		</dd>
//					 		<dd class="timeRight">
//					 			2小时前
//					 		</dd>
//					 		</dl>
					  			
						  		zz[i]=
											'<span class="promo_detailed--list_item_icon promo_detailed--list_item_pic">'+
												'<a href=\"html/news_content.jsp?news_id='+datas[i].news_id+'\" target="_blank" title=\"'+datas[i].news_titile+'\">'+
														'<img src="<%=request.getContextPath()%>/Show/News_title_page_Show?news_id='+datas[i].news_id+'" title=\"'+datas[i].news_titile+'\" alt=\"'+datas[i].news_titile+'\" style="height: 100px;width: 100px;" />'+
												'</a>'+
											'</span>'+'<dl>'+'<dt>'+
												'<a href=\"html/news_content.jsp?news_id='+datas[i].news_id+'\" target="_blank" title=\"'+datas[i].news_titile+'\">'+datas[i].news_titile+'</a>'+
														'</dt><dd>'+'<a href=\"html/news_content.jsp?news_id='+datas[i].news_id+'\" target="_blank" title=\"'+datas[i].news_titile+'\">'+
														content+
														'</a>'+'</dd>'+'<dd class="timeRight">'+
														'<a href=\"html/news_content.jsp?news_id='+datas[i].news_id+'\" target="_blank" title=\"'+datas[i].news_titile+'\">'+
														datas[i].news_Release_time+'</a>'+
												'</dd>'+
											'</dl>'
										
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
								document.getElementById("showNewsList").innerHTML=""//全部清空
									for(var i=0;i<pagesize;i++){
									 	var div =document.createElement("li")//建立div对象
									 	div.setAttribute("class","promo_detailed--list_item");
										div.innerHTML=zz[(e-1)*pagesize+i]//建立显示元素 
// 										var div=zz[(e-1)*pagesize+i]//建立显示元素
										document.getElementById("showNewsList").appendChild(div)//加入all中 
										if(zz[(e-1)*pagesize+i+1]==null) break;//超出范围跳出
							        }
							}
							change(1);
// 							}
						},
						error : function(error) {
							console.log('接口不通' + error);
						}
					});
		
		$(function(){
			var windowWidth = $(window).width();
		    if(windowWidth < 640){
		        // do something
		    	var newsBlockHeight = $(".newsBlock").height()+330;
		        $(".newsBlock").css("height",newsBlockHeight);
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
			
		})
	</script>

</html>