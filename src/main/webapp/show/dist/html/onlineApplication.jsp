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
		<!-- DataTables -->
		<link rel="stylesheet" href="../../../admin/plugins/DataTables-1.10.15/media/css/jquery.dataTables.min.css">
		<link rel="stylesheet" href="../../../admin/plugins/DataTables-1.10.15/media/css/dataTables.bootstrap.min.css">
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
				border: 1px solid #9a9a9a;
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
									<% if(user == null) {%><a href="login.jsp" style="color: #000000;">登录</a><%}; %>
									<a href="register.jsp" style="color: #000000;">注册</a>
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
										<ul class="am-nav am-nav-pills am-nav-justify">
											<li class="">
												<a href="../index.jsp">首页</a>
											</li>
											<li>
												<a href="about.jsp">关于我们</a>
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
				<div class="page-header news_bannerBg">
					<div class="am-container">
						<h1 class="page-header-title">在职研</h1>
					</div>
				</div>

			</div>

			<div class="am-g am-g-fixed myFixedSiderbar">
				<!--正文-->
				<div class="am-u-md-9 am-u-md-push-3" style="padding-right: 100px;">
					<div class="breadcrumb-box">
						<div class="am-container">
							<ol class="am-breadcrumb">
								<li>
									<a href="../index.jsp">首页</a>
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
									<h4 class="am-popup-title">基础学习</h4>
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
								<li class="sidebar_contactUs" style="border-bottom: 1px solid #001A35;">联系我们</li>
								<li class="promo_detailed--list_item sidebarListLi" style="padding-top: 20px;">
									<!--<span class="promo_detailed--list_item_icon noBorder">
	                  <i class="am-icon-phone" ></i>
	                </span>-->
									<dl>
										<dd><i class="am-icon-phone"></i> 010-83951097、83951120、83951104、13260122245
										</dd>
									</dl>
								</li>
								<li class="promo_detailed--list_item sidebarListLi">
									<!--<span class="promo_detailed--list_item_icon noBorder">
                  <i class="am-icon-map-marker"></i>
                </span>-->
									<dl>
										<dd><i class="am-icon-map-marker"></i> 北京市丰台区樊羊路33号首都经济贸易大学华侨学院1层C104/C105办公室
										</dd>
									</dl>
								</li>
								<li class="promo_detailed--list_item sidebarListLi">
									<!--<span class="promo_detailed--list_item_icon noBorder">
                  <i class="am-icon-envelope-o" ></i>
                </span>-->
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
				<a href="#sidebar" class="am-btn am-btn-sm am-btn-success am-icon-bars am-show-sm-only my-button" data-am-offcanvas><span
					 class="am-sr-only">侧栏导航</span></a>
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
		<!-- DataTables -->
		<script src="../../../admin/plugins/DataTables-1.10.15/media/js/jquery.dataTables.min.js"></script>
		<script src="../../../admin/plugins/DataTables-1.10.15/media/js/dataTables.bootstrap.min.js"></script>
<!-- 		<script type="text/javascript" src="../../../js/changeSelectStyle.js"></script>	 -->


		<script>
			function updatediv(id){
// 				var Project_id = id;
// 				Project_id= Project_id.replace("\"","").replace("\"","");
				$.ajax({
					url : '<%=request.getContextPath()%>/Project/getProjectdetailByid',
					type : 'GET',
					dataType:"json",
					data:{
						Project_id:id
					},
	                success:function(data){
	                	if(data.success == true){
	                		var project_context = data.data.project_context;
		 					 document.getElementById('my-popup1').innerHTML=project_context;
	                	}
	                },
	                error:function(error){
	                	console.log('接口不通' + error);
	                }
	            })
	            
	            
// 		 		alert(id);
// 		 		 $("#my-popup1").html=id;
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
				"aLengthMenu": [20],
				"lengthChange": false,
				"searching": false,
				"ordering": false,
				"autoWidth": false,
				ajax: {
	                url: "<%=request.getContextPath()%>/Project/getlist"
	            },
	            serverSide: true,
	            columns: [
	                
	                {"data": "project_id",
	                 "render":function(data,type,row,meta){
	                	           var startIndex = meta.settings._iDisplayStart;
	                	     return startIndex+meta.row+1;
	                }
	                },
// 	                {"data": "project_id"},
// <a title="点击查看详情">第五期国税系统税务稽查专业骨干中级培训班</a>
// <td data-am-modal="{target: '#my-popup'}"><a title="点击查看详情">第三期国税系统税务稽查专业骨干中级培训班</a></td>
//  target=\"#my-popup\"
	                {"data": "project_name"},
// 	                {"data": "project_date"},
	                {"data": null}
	            ],
	            "aoColumnDefs":[
	                        	{
	        					    "targets":-2,
	        					    "bSortable": false,
	        					    render: function(data, type, row) {
// 																												<a href="javascript:changeType();">	onclick="changeType()" href="javascript:void(0);"  <a href="javascript:alert('3')">超链接3</a>
																															//	 href="javascript:updatediv('+row.project_id+')\"			onclick=\"updatediv('+row.project_id+')\"  href="javascript:void(0);\"													
	        					        var html ='<a id=\"show\" data-am-modal=\"{target: \'#my-popup\'}\"  title=\"点击查看详情\"    href=\"javascript:updatediv(\''+row.project_id+'\')\">'+row.project_name+'</a>';
	        					        return html;
	        					    }},
    					 			{		
                        "targets":-1,
                        "bSortable": false,
                        render: function(data, type, row) {
                            var html ='<a id=\"show\" href=\"#\" onclick=\"addBranch(this,\''+row.project_id+'\');\">单位报名</a>&nbsp;&nbsp;&nbsp;&nbsp;<a id=\"edit\" href=\"#\" onclick=\"addBranch(this,\''+row.project_id+'\');\">个人报名</a></p>';
                            return html;
                        }
                    }], 
// 				"stripeClasses": ["datatable_odd","datatable_even"]	
				
			});
			
		</script>
		<script type="text/javascript">
			function addBranch(obj,id){
				<%
					if(user == null){
						
						%> window.open("login.jsp",'_self');<%}else if(user != null){
							%> window.open("onlineApplicationByOne.jsp",'_self');<%	
						}
				%>
			}
		</script>
		<script>
//			window.onload = function(){
//				document.getElementsByClassName('paginate_button');
//				debugger;
//			}
		</script>
	</body>

</html>
