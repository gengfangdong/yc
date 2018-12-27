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
		<link rel="stylesheet" href="../../../admin/layui-v2.3.0/layui/css/layui.css">
		<link rel="stylesheet" href="../../../admin/layui-v2.3.0/layui/css/modules/layer/default/layer.css">
			<!-- DataTables -->
		<!-- <link rel="stylesheet" href="../../plugins/DataTables-1.10.15/media/css/jquery.dataTables.min.css"> -->
		<link rel="stylesheet" href="../../../admin/plugins/DataTables-1.10.15/media/css/dataTables.bootstrap.min.css">
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
			
			p {
				margin-top: 5px;
				margin-bottom: 5px;
			}
			.pagination li{
				list-style:none;
				float:left;
				padding:10px;
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
										<a href=""><img src="../assets/img/index/logo_top.png" alt="" style="width: auto;" /></a>
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
															<a href="cultureSystem.jsp" style="color: #FF2F2F;">项目概况</a>
															<!-- sub-menu start-->
															<ul class="sub-menu">
																<li class="menu-item">
																	<a href="cultureSystem.jsp" style="color: #FF2F2F;">培养体系</a>
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
												<a href="cultureSystem.jsp"  style="color: #FF2F2F;">项目概况</a>
												<ul class="am-menu-sub am-collapse ">
													<li class="">
														<a href="cultureSystem.jsp"  style="color: #FF2F2F;">培养体系</a>
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
				<div class="page-header news_bannerBg">
					<div class="am-container">
						<h1 class="page-header-title">培养体系</h1>
					</div>
				</div>

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
								<li class="am-active">项目概况</li>
								<li class="am-active">培养体系</li>
							</ol>
						</div>
					</div>
					<div class="am-cf am-article tableTextAlign">
						<table id="cultureSystemTable"  class="am-table am-table-bordered am-table-radius am-table-compact am-table-centered littleFontSize">
							<thead>
							<tr>
								<th>序号</th>
								<th>标题</th>
								<th>时间</th>
							</tr>
							</thead>
						</table>
					</div>
					<div class="cultureSystemList">
						<ul>
<!-- 							<li>
								<span class="cultureSystemDate">2018-11-29</span> ●&nbsp;&nbsp;
								<a href="cultureSystem_content.jsp">培养体系介绍一</a>
							</li>
							<li>
								<span class="cultureSystemDate">2018-11-28</span> ●&nbsp;&nbsp;
								<a href="cultureSystem_content.jsp">培养体系介绍二</a>
							</li>
							<li>
								<span class="cultureSystemDate">2018-11-27</span> ●&nbsp;&nbsp;
								<a href="cultureSystem_content.jsp">培养体系介绍三</a>
							</li>
							<li>
								<span class="cultureSystemDate">2018-11-26</span> ●&nbsp;&nbsp;
								<a href="cultureSystem_content.jsp">培养体系介绍四</a>
							</li>
							<li>
								<span class="cultureSystemDate">2018-11-25</span> ●&nbsp;&nbsp;
								<a href="cultureSystem_content.jsp">培养体系介绍五</a>
							</li> -->
						</ul>

					</div>
					<div style="height: 40px;">
						<ul data-am-widget="pagination" class="am-pagination am-pagination-default" style="text-align: center;">
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
								<li class="sidebar_contactUs">■项目概况</li>
								<li class="promo_detailed--list_item sidebarListLi" style="border-top:1px solid #001A35;text-align: center;padding: 10px 0 0 0;">
									<a href="cultureSystem.jsp" style="font-weight: 600;color: #FF2F2F;">培养体系</a>
								</li>
								<li class="promo_detailed--list_item sidebarListLi" style="text-align: center;padding: 5px 0 0px 0;">
									<a href="solution.jsp" style="color: #000;">解决方案</a>
								</li>

								<li class="promo_detailed--list_item sidebarListLi" style="text-align: center;padding: 5px 0 0px 0;">
									<a href="teachingMaterialSystem.jsp" style="color: #000;">教材体系</a>
								</li>

								<li class="promo_detailed--list_item sidebarListLi" style="text-align: center;padding: 5px 0 0px 0;">
									<a href="taxCollectionFund.jsp" style="color: #000;">领税基金</a>
								</li>

								<li class="promo_detailed--list_item sidebarListLi" style="border-bottom: 1px solid #001A35;text-align: center;padding: 5px 0 10px 0;">
									<a href="expertTeam.jsp" style="color: #000;">专家团队</a>
								</li>
							</ul>
							<ul class="am-nav">
								<li class="sidebar_contactUs">■联系我们</li>
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
		<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
		<!-- jQuery 2.1.4 -->	
<!-- 		<script src="../../../plugins/jQuery/jQuery-2.1.4.min.js"></script> -->
<!-- 		<script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script> -->
		<script src="../assets/js/jquery-2.1.0.js" charset="utf-8"></script>
		<script src="../assets/js/amazeui.js" charset="utf-8"></script>
				<!-- layui 2.3.0 -->
		<script src="../../../admin/layui-v2.3.0/layui/layui.js"></script>
		<script src="../../../admin/layui-v2.3.0/layui/lay/modules/layer.js"></script>
<!-- DataTables -->
		<script src="../../../admin/plugins/DataTables-1.10.15/media/js/jquery.dataTables.min.js"></script>
		<script src="../../../admin/plugins/DataTables-1.10.15/media/js/dataTables.bootstrap.min.js"></script>
		
		
		<script >
		
		function showcontext(id) {
// 			alert(id);
                        window.location.href='cultureSystem_content.jsp?culture_id='+id;
// 			layui.use('layer', function() {
// 				var $ = layui.jquery,
// 				layer = layui.layer;
// 				layer.open({
					
// 					content: '感谢您参与本次活动！',
//                     btn: ['确认', '取消'],
//                     yes: function(index, layero) {
//                     },
//                     btn2: function(index, layero) {

//                     }
//                     ,
//                     cancel: function() {
//                         //右上角关闭回调

//                     }

// 	            title: "6s考核系统编辑",
// 	            type: 2,
// 	            content: "cultureSystem_content.jsp?culture_id=" + id,
// 	            zIndex: layer.zIndex, //重点1
// 				success: function(layero) {
// 					layer.setTop(layero); //重点2
// 				} 
// 	            success: function (layero, index) {
// 	                setTimeout(function () {
// 	                    layui.layer.tips('点击此处返回', '.layui-layer-setwin .layui-layer-close', {
// 	                        tips: 3
// 	                    });
// 	                }, 500);
// 	            }

// 	        });
// 			})
			
// 	        layui.layer.full(index);

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
		
	 	var cultureSystemTable = $('#cultureSystemTable').DataTable({
			"language" : dataTableLang,
			"paging": true,
			"info": false,
			"aLengthMenu": [20],
			"lengthChange": false,
			"searching": false,
			"ordering": false,
			"autoWidth": false,
			ajax: {
                url: "<%=request.getContextPath()%>/Show/getlistCulture"
            },
            serverSide: true,
            columns: [
                
                {"data": "culture_id",
                 "render":function(data,type,row,meta){
                	           var startIndex = meta.settings._iDisplayStart;
                	     return startIndex+meta.row+1;
                }
                },
                {"data": "culture_titile"},
//	                {"data": "project_date"},
                {"data": "culture_Release_time"}
            ],
            "aoColumnDefs":[
                        	{
        					    "targets":-2,
        					    "bSortable": false,
        					    render: function(data, type, row) {
        					        var html ='<a id=\"show\"   title=\"点击查看详情\"    href=\"javascript:showcontext(\''+row.culture_id+'\')\">'+row.culture_titile+'</a>';
        					        return html;
        					    }},
					 			{		
                    "targets":-1,
                    "bSortable": false,
       /*              render: function(data, type, row) {
                        var html ='<a id=\"show\" href=\"#\" onclick=\"addBranch(this,\''+row.project_id+'\');\">单位报名</a>&nbsp;&nbsp;&nbsp;&nbsp;<a id=\"edit\" href=\"#\" onclick=\"addBranch(this,\''+row.project_id+'\');\">个人报名</a></p>';
                        return html;
                    } */
                }], 
				"stripeClasses": ["datatable_odd","datatable_even"]	
			
		});
		
			window.onload = function() {
				var ocultureSystemList = document.getElementsByClassName('cultureSystemList')[0];
				if(ocultureSystemList.children[0].childElementCount) {
					var cultureSystemListNum = ocultureSystemList.children[0].childElementCount;
					var cultureSystemListNumHeight = cultureSystemListNum * 35 + 5 + 'px';
					$('.cultureSystemList').css('height', cultureSystemListNumHeight);
				}
			}
		</script>
	</body>

</html>