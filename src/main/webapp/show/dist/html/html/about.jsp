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
		<link rel="stylesheet" href="../assets/css/index.min.css" />
		<link rel="stylesheet" href="../assets/css/myStyle.css" />
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
															<a href="about.jsp" style="color: #FF2F2F;">关于我们</a>
															<!-- sub-menu start-->
															<ul class="sub-menu">
																<li class="menu-item">
																	<a href="centerOverview.jsp" style="color: #FF2F2F;">中心概况</a>
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
										<ul class="am-nav am-nav-pills am-nav-justify">
											<li class="">
												<a href="../index.jsp">首页</a>
											</li>
											<li>
												<a href="about.jsp" style="color: #FF2F2F;">关于我们</a>
											</li>
											<li>
												<a href="newsNotice.jsp">新闻中心</a>
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
												<a href="regulationsClasses.jsp">规定班次</a>
											</li>
											<li>
												<a href="customizedClasses.jsp">定制班次</a>
											</li>
											<li>
												<a href="onlineClasses.jsp">在线拼班</a>
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
											<li class="">
												<a href="login.jsp" class="">登录</a>
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
				<div class="page-header about_bannerBg">
					<div class="am-container">
						<h1 class="page-header-title">关于我们</h1>
					</div>
				</div>

				<div class="breadcrumb-box">
					<div class="am-container">
						<ol class="am-breadcrumb">
							<li>
								<a href="../index.jsp">首页</a>
							</li>
							<li class="am-active">关于我们</li>
						</ol>
					</div>
				</div>
			</div>

			<div class="section">
				<div class="container">
					<!--<div class="section--header">
					<h2 class="section--title">云适配</h2>
					<p class="section--description">
						全球领先HTML5企业移动化解决方案供应商，由前微软美国总部IE浏览器核心研发团队成员及移动互联网行业专家在美国西雅图创立
						<br>获得了微软创投的扶持以及晨兴资本、IDG资本、天创资本等国际顶级风投机构的投资。
					</p>
				</div>-->

					<!--about-container start-->
					<div class="about-container">
						<div class="am-g">
							<div class="am-u-md-6">
								<div class="our-company-text">
									<h3 style="border-bottom:1px solid #ccc;">关于我们</h3>
									<p>
										首都经济贸易大学创建于1956年，是由原北京经济学院和原北京财贸学院于1995年3月合并、组建的北京市属重点大学。60余年来，学校已发展为拥有经济学、管理学、法学、文学、理学和工学等六大学科，以经济学、管理学为重要特色和突出优势，各学科相互支撑、协调发展的现代化、多科性财经类大学。
									</p>
								</div>
							</div>

							<div class="am-u-md-6">
								<div class="our-company-quote">
									<div class="am-g">
										<div class="am-u-md-12">
											<div class="our-company-img">
												<img src="../assets/img/about/content_bg1.png" alt="" style="width: 100%;" />
											</div>
										</div>

										<!--<div class="am-u-md-6">
                    <p class="our-company-brief">
                      国家“千人计划”特聘专家、中国企业级HTML5产业联盟主席、HTML5国际标准制定者之一、微软总部IE浏览器核心研发,成功发布了IE8、IE9、IE10,参与了下一代互联网标准HTML5国际标准制定以及IE中HTML5引擎的设计。
                    </p>
                    <div class="our-company-quote_author"><strong>陈本峰 Ben</strong><span>云适配创始人CEOy</span></div>
                  </div>-->
									</div>
								</div>
							</div>
						</div>
						<div class="am-g" style="margin-top: 10px;">
							<div class="am-u-md-6">
								<div class="our-company-quote">
									<div class="am-g">
										<div class="am-u-md-12">
											<div class="our-company-img" >
												<img src="../assets/img/about/content_bg2.png" alt="" style="width: 100%;" />
											</div>
										</div>

										<!--<div class="am-u-md-6">
                    <p class="our-company-brief">
                      国家“千人计划”特聘专家、中国企业级HTML5产业联盟主席、HTML5国际标准制定者之一、微软总部IE浏览器核心研发,成功发布了IE8、IE9、IE10,参与了下一代互联网标准HTML5国际标准制定以及IE中HTML5引擎的设计。
                    </p>
                    <div class="our-company-quote_author"><strong>陈本峰 Ben</strong><span>云适配创始人CEOy</span></div>
                  </div>-->
									</div>
								</div>
							</div>
							<div class="am-u-md-6">
								<div class="our-company-text">
									<h3 style="border-bottom:1px solid #ccc;">服务领域</h3>
									<p>
										首都经济贸易大学创建于1956年，是由原北京经济学院和原北京财贸学院于1995年3月合并、组建的北京市属重点大学。60余年来，学校已发展为拥有经济学、管理学、法学、文学、理学和工学等六大学科，以经济学、管理学为重要特色和突出优势，各学科相互支撑、协调发展的现代化、多科性财经类大学。
									</p>
								</div>
							</div>
						</div>
					</div>
					<!--about-container end-->
					<div class="container" style="margin-top: 20px;">
				        <div class="section--header first_title_padding_bottom" style="text-align: center;border-bottom: 1px solid #ccc;margin-bottom: 10px;padding-bottom: 5px;">
							<a class="section--title tltle_center title_bottom_border" style="font-weight: 600;font-size: 16px;color: #000;">解决方案</a>
						</div>	

				        <div class="news-contaier">
				          <div class="blog">
				            <div class="am-g">
				            	<div class="am-u-lg-8 am-u-md-8 about_center" style="margin-left: 15%;">
				                <div class="article">
				                  <!-- <div class="article-img">
				                    <img src="../assets/img/about/content_img3.png" alt="" />
				                  </div> -->
				                  <div class="article-header">
				                    <h4 style="text-align: center;font-size: 16px;font-weight: 400;">数字化将人们联系起来，但是数字智能，有人也称之为人工智能，能做到的远不止于此。未来十年，我们需要考虑如何结合数字智能，成就认知商业。这是一个新时代的开始。</h4>
				                  </div>
				                </div>
				              </div>

				              <div class="am-u-lg-4 am-u-md-4 about_center">
				                <div class="article">
				                  <div class="article-img"> 
				                    <img src="../assets/img/about/content_img3.png" alt="" style="width: 100%;" />
				                  </div>
				                  <div class="article-header">
				                    <h6 style="text-align: center;">IBM 区块链即服务(BaaS)平台</h6>
				                  </div>
				                  <div class="article-container">
				                    <p>致力于让开发者专注于区块链业务代码本身，提升开发和运维效率。</p>
				                  </div>
				                </div>
				              </div>

				              <div class="am-u-lg-4 am-u-md-4 about_center">
				                <div class="article">
				                  <div class="article-img">
				                    <img src="../assets/img/about/content_img4.png" alt="" style="width: 100%;" />
				                  </div>
				                  <div class="article-header">
				                    <h6 style="text-align: center;">IBM 区块链即服务(BaaS)平台</h6>
				                  </div>
				                  <div class="article-container">
				                    <p>致力于让开发者专注于区块链业务代码本身，提升开发和运维效率。</p>
				                  </div>
				                </div>
				              </div>

				              <div class="am-u-lg-4 am-u-md-4  am-u-end about_center">
				                <div class="article">
				                  <div class="article-img">
				                    <img src="../assets/img/about/content_img5.png" alt="" style="width: 100%;" />
				                  </div>
				                  <div class="article-header">
				                    <h6 style="text-align: center;">IBM 区块链即服务(BaaS)平台</h6>
				                  </div>
				                  <div class="article-container">
				                    <p>致力于让开发者专注于区块链业务代码本身，提升开发和运维效率。</p>
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
			</div>

			<!--===========layout-footer================-->
			<div class="layout-footer">
				<jsp:include   page="footer.jsp" flush="true"/>
			</div>
			<script src="../assets/js/jquery-2.1.0.js" charset="utf-8"></script>
			<script src="../assets/js/amazeui.js" charset="utf-8"></script>
	</body>

</html>