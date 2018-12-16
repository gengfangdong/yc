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
										<!--<button class="am-btn am-btn-primary am-dropdown-toggle" data-am-dropdown-toggle>Language <span class="am-icon-caret-down"></span></button>
                  <ul class="am-dropdown-content">
                    <li><a href="#">English</a></li>
                    <li class="am-divider"></li>
                    <li><a href="#">Chinese</a></li>
                  </ul>-->
									</div>
								</div>
							</div>
							<div class="am-u-md-4">
								<div class="topbar-right am-text-right am-fr">
									<!--Follow us
                <i class="am-icon-facebook"></i>
                <i class="am-icon-twitter"></i>
                <i class="am-icon-google-plus"></i>
                <i class="am-icon-pinterest"></i>
                <i class="am-icon-instagram"></i>
                <i class="am-icon-linkedin"></i>
                <i class="am-icon-youtube-play"></i>
                <i class="am-icon-rss"></i>-->
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
															<a href="index.html" style="color: #FF2F2F;">首页</a>
														</li>
														<li>
															<a href="html/cultureSystem.html">项目概况</a>
															<!-- sub-menu start-->
															<ul class="sub-menu">
																<li class="menu-item">
																	<a href="html/cultureSystem.html">培养体系</a>
																</li>
																<li class="menu-item">
																	<a href="html/solution.html">解决方案</a>
																</li>
																<li class="menu-item">
																	<a href="html/teachingMaterialSystem.html">教材体系</a>
																</li>
																<li class="menu-item">
																	<a href="html/taxCollectionFund.html">领税基金</a>
																</li>
																<li class="menu-item">
																	<a href="html/expertTeam.html">专家团队</a>
																</li>
															</ul>
															<!-- sub-menu end-->
														</li>
														<li>
															<a href="html/regulationsClasses.html">规定班次</a>
														</li>
														<li>
															<a href="html/customizedClasses.html">定制班次</a>
														</li>
														<li>
															<a href="html/onlineClasses.html">拼班</a>
														</li>
														<li>
															<a href="html/incumbencyStudent.html">在职研</a>
															<!-- sub-menu start-->
															<ul class="sub-menu">
																<li class="menu-item">
																	<a href="html/incumbencyStudent.html">招生简章</a>
																</li>
																<li class="menu-item">
																	<a href="html/onlineApplication.jsp">在线报名</a>
																</li>
															</ul>
															<!-- sub-menu end-->
														</li>
														<li>
															<a href="html/newsNotice.html">新闻公告</a>
															<!-- sub-menu start-->
															<ul class="sub-menu">
																<li class="menu-item">
																	<a href="html/newsNotice.html">通知公告</a>
																</li>
																<li class="menu-item">
																	<a href="html/newsTrain.html">培训新闻</a>
																</li>
															</ul>
															<!-- sub-menu end-->
														</li>
														<li>
															<a href="html/about.html">关于我们</a>
															<!-- sub-menu start-->
															<ul class="sub-menu">
																<li class="menu-item">
																	<a href="html/centerOverview.html">中心概况</a>
																</li>
																<li class="menu-item">
																	<a href="html/organization.html">组织结构</a>
																</li>
																<li class="menu-item">
																	<a href="html/aboutSchool.html">学校介绍</a>
																</li>
															</ul>
															<!-- sub-menu end-->
														</li>


														<!--<li>
							                <a href="#">产品中心</a>
							                <ul class="sub-menu">
							                  <li class="menu-item"><a href="html/product1.html">产品展示1</a></li>
							                  <li class="menu-item"><a href="html/product2.html">产品展示2</a></li>
							                  <li class="menu-item"><a href="html/product3.html">产品展示3</a></li>
							                </ul>
							              </li>-->

													</ul>
												</div>
											</div>
											<!--<div class="header_contacts--item">
  											<div class="contact_mini">
  												<i style="color:#7c6aa6" class="contact-icon am-icon-phone"></i>
  												<strong>0 (855) 233-5385</strong>
  												<span>周一~周五, 8:00 - 20:00</span>
  											</div>
  										</div>
                      <div class="header_contacts--item">
  											<div class="contact_mini">
  												<i style="color:#7c6aa6" class="contact-icon am-icon-envelope-o"></i>
  												<strong>cn@yunshipei.com</strong>
  												<span>随时欢迎您的来信！</span>
  											</div>
  										</div>
                      <div class="header_contacts--item">
  											<div class="contact_mini">
  												<i style="color:#7c6aa6" class="contact-icon am-icon-map-marker"></i>
  												<strong>天使大厦,</strong>
  												<span>海淀区海淀大街27</span>
  											</div>
  										</div>-->
										</div>
										<!--<a href="html/incumbencyStudent.html" class="contact-btn">
                      <button type="button" class="am-btn am-btn-secondary am-radius">联系我们</button>
                    </a>-->
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--header end-->

					<!--nav start-->
					<!--<div class="nav-contain">
          <div class="nav-inner">
            <ul class="am-nav am-nav-pills am-nav-justify">
              <li class=""><a href="./index.html">首页</a></li>
              <li>
                <a href="#">产品中心</a>
                <ul class="sub-menu">
                  <li class="menu-item"><a href="html/product1.html">产品展示1</a></li>
                  <li class="menu-item"><a href="html/product2.html">产品展示2</a></li>
                  <li class="menu-item"><a href="html/product3.html">产品展示3</a></li>
                </ul>
              </li>
              <li><a href="html/regulationsClasses.html">客户案例</a></li>
              <li><a href="html/customizedClasses.html">解决方案</a></li>
              <li>
                <a href="html/newsNotice.html">新闻中心</a>
                <ul class="sub-menu">
                  <li class="menu-item"><a href="html/news-content.html">公司动态</a></li>
                  <li class="menu-item"><a href="html/404-dark.html">行业动态</a></li>
                  <li class="menu-item"><a href="html/404-light.html">精彩专题</a></li>
                </ul>
              </li>
              <li><a href="html/about.html">关于我们</a></li>
              <li><a href="html/onlineClasses.html">加入我们</a></li>
              <li><a href="html/incumbencyStudent.html">联系我们</a></li>
            </ul>
          </div>
        </div>-->
					<!--nav end-->
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
												<a href="../index.html" class="" style="color: #FF2F2F;">首页</a>
											</li>
											<li class="am-parent">
												<a href="#" class="">产品中心</a>
												<ul class="am-menu-sub am-collapse ">
													<li class="">
														<a href="html/product1.html" class="">产品展示1</a>
													</li>
													<li class="">
														<a href="html/product2.html" class="">产品展示2</a>
													</li>
													<li class="">
														<a href="html/product3.html" class="">产品展示3</a>
													</li>
												</ul>
											</li>
											<li class="">
												<a href="html/regulationsClasses.html" class="">客户案例</a>
											</li>
											<li class="">
												<a href="html/customizedClasses.html" class="">解决方案</a>
											</li>
											<li class="am-parent">
												<a href="html/newsNotice.html" class="">新闻中心</a>
												<ul class="am-menu-sub am-collapse  ">
													<li class="menu-item">
														<a href="newsNotice.html">通知公告</a>
													</li>
													<li class="menu-item">
														<a href="newsTrain.html">培训新闻</a>
													</li>
												</ul>
											</li>
											<li class="">
												<a href="html/about.html" class="">关于我们</a>
											</li>
											<li class="">
												<a href="html/onlineClasses.html" class="">加入我们</a>
											</li>
											<li class="">
												<a href="html/incumbencyStudent.html" class="">联系我们</a>
											</li>
											<li class="am-parent">
												<a href="" class="nav-icon nav-icon-globe">Language</a>
												<ul class="am-menu-sub am-collapse  ">
													<li>
														<a href="#">English</a>
													</li>
													<li class="">
														<a href="#">Chinese</a>
													</li>
												</ul>
											</li>
											<li class="nav-share-contain">
												<div class="nav-share-links">
													<i class="am-icon-facebook"></i>
													<i class="am-icon-twitter"></i>
													<i class="am-icon-google-plus"></i>
													<i class="am-icon-pinterest"></i>
													<i class="am-icon-instagram"></i>
													<i class="am-icon-linkedin"></i>
													<i class="am-icon-youtube-play"></i>
													<i class="am-icon-rss"></i>
												</div>
											</li>
											<li class="">
												<a href="html/login.jsp" class="">登录</a>
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
			<div class="promo_detailed" style="min-height: auto!important;background: #ffffff;">
				<div class="promo_detailed-container">
					<div class="container" style="width: auto!important;padding-top: 20px;">
						<div class="am-g">
							<div class="am-u-md-6">
								<h2 class="notice">■通知公告</h2>
								<ul class="promo_detailed--list noPadding_li">
									<li class="promo_detailed--list_item">
										<!--<span class="promo_detailed--list_item_icon">
	                  <i class="am-icon-diamond"></i>
	                </span>-->
										<dl>
											<dt>东岳集团举行2019产业链合作年会，绘就千亿...</dt>
											<dd>
												2018-11-19
											</dd>
										</dl>
									</li>
									<li class="promo_detailed--list_item">
										<!--<span class="promo_detailed--list_item_icon">
	                  <i class="am-icon-dollar" style="margin-left: 15px;"></i>
	                </span>-->
										<dl>
											<dt>集团为湖南一师优秀贫困大学生再颁助学奖励...</dt>
											<dd>
												2018-11-17
											</dd>
										</dl>
									</li>
									<li class="promo_detailed--list_item">
										<!--<span class="promo_detailed--list_item_icon">
	                  <i class="am-icon-bank" style="margin-left: 10px;"></i>
	                </span>-->
										<dl>
											<dt>新华联董事局主席傅军：建议加大创新型企业...</dt>
											<dd>
												2018-03-04
											</dd>
										</dl>
									</li>
									<li class="promo_detailed--list_item">
										<!--<span class="promo_detailed--list_item_icon">
	                  <i class="am-icon-bank" style="margin-left: 10px;"></i>
	                </span>-->
										<dl>
											<dt>傅军委员：应鼓励更多创新型“独角兽”企业...</dt>
											<dd>
												2018-03-07
											</dd>
										</dl>
									</li>
								</ul>
							</div>

							<div class="am-u-md-6" style="max-height: 360px;padding-right: 60px;">
								<div class="promo_detailed--cta">
									<h2 class="news">■培训新闻</h2>
									<ul class="promo_detailed--list rePadding_li" style="padding:0 0 0 20px;">
										<li class="promo_detailed--list_item">
											<span class="promo_detailed--list_item_icon promo_detailed--list_item_pic">
		                  <!--<i class="am-icon-diamond"></i>-->
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
							<h2 class="section--title tltle_center title_bottom_border" style="font-weight: 600;font-size: 16px;color: #000;">五大核心优势</h2>
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
												<a  href="html/expertTeam.html"><img src="assets/img/about/content_img3.png" alt="" style="width: 100%;" /></a>
											</div>
											<div class="article-header">
												<h6 style="text-align: center;margin-bottom: 0;"><a href="html/expertTeam.html" style="color: #333333;">国内一流顶尖的</a></h6>
											</div>
											<div class="article-container">
												<p style="text-align: center;"><a href="html/expertTeam.html" style="font-weight: 400;color: #333333;">讲师团队</a></p>
											</div>
										</div>
									</div>

									<div class="am-u-lg-4 am-u-md-4 about_center" style="width: 20%;">
										<div class="article">
											<div class="article-img">
												<a href="html/teachingMaterialSystem.html"><img src="assets/img/about/content_img4.png" alt="" style="width: 100%;" /></a>
											</div>
											<div class="article-header">
												<h6 style="text-align: center;margin-bottom: 0;"><a href="html/teachingMaterialSystem.html" style="color: #333333;">全面实用的</a></h6>
											</div>
											<div class="article-container">
												<p style="text-align: center;"><a href="html/teachingMaterialSystem.html.html" style="font-weight: 400;color: #333333;">管理会计体系</a></p>
											</div>
										</div>
									</div>
									<div class="am-u-lg-4 am-u-md-4 about_center" style="width: 20%;">
										<div class="article">
											<div class="article-img">
												<a href="html/cultureSystem.html" ><img src="assets/img/about/content_img4.png" alt="" style="width: 100%;" /></a>
											</div>
											<div class="article-header">
												<h6 style="text-align: center;margin-bottom: 0;"><a href="html/cultureSystem.html" style="color: #333333;">国内领先的</a></h6>
											</div>
											<div class="article-container">
												<p style="text-align: center;"><a href="html/cultureSystem.html" style="font-weight: 400;color: #333333;">税务培训基地</a></p>
											</div>
										</div>
									</div>
									<div class="am-u-lg-4 am-u-md-4 about_center" style="width: 20%;">
										<div class="article">
											<div class="article-img">
												<a href="html/taxCollectionFund.html" ><img src="assets/img/about/content_img4.png" alt="" style="width: 100%;" /></a>
											</div>
											<div class="article-header">
												<h6 style="text-align: center;margin-bottom: 0;"><a href="html/taxCollectionFund.html" style="color: #333333;">聚焦本土</a></h6>
											</div>
											<div class="article-container">
												<p style="text-align: center;"><a href="html/taxCollectionFund.html" style="font-weight: 400;color: #333333;">最佳实现</a></p>
											</div>
										</div>
									</div>

									<div class="am-u-lg-4 am-u-md-4  am-u-end about_center" style="width: 20%;">
										<div class="article">
											<div class="article-img">
												<a href="html/solution.html" ><img src="assets/img/about/content_img5.png" alt="" style="width: 100%;" /></a>
											</div>
											<div class="article-header">
												<h6 style="text-align: center;margin-bottom: 0;"><a href="html/solution.html" style="color: #333333;">精英小班</a></h6>
											</div>
											<div class="article-container">
												<p style="text-align: center;"><a href="html/solution.html" style="font-weight: 400;color: #333333;">学习社交平台</a></p>
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
								<div class="am-u-md-3 ">
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

</html>