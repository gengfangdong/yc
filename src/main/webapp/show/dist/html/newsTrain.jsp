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
			.page{
					float:right;
					/* border:1px solid #ccc;
					border-radius:5px; */
					height:30px;
					line-height:30px;
					margin-top:50px;
				}
				.pageNum{
					min-width:85px;
					float:left;
				}
				.linkPage{
					max-width:200px;
					float:left;
				}
				.jumpPage{
					min-width:130px;
					float:left;
				}
				#a3 a{
					margin:0 10px;
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
															<a href="newsNotice.jsp" style="color: #FF2F2F;">新闻公告</a>
															<!-- sub-menu start-->
															<ul class="sub-menu">
																<li class="menu-item">
																	<a href="newsNotice.jsp">通知公告</a>
																</li>
																<li class="menu-item">
																	<a href="newsTrain.jsp" style="color: #FF2F2F;">培训新闻</a>
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
												<a href="newsNotice.jsp"style="color: #FF2F2F;">新闻公告</a>
												<ul class="am-menu-sub am-collapse  ">
													<li class="menu-item">
														<a href="newsNotice.jsp">通知公告</a>
													</li>
													<li class="menu-item">
														<a href="newsTrain.jsp"style="color: #FF2F2F;">培训新闻</a>
													</li>
												</ul>
											</li>
											<li class="am-parent">
												<a href="centerOverview.jsp" >关于我们</a>
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
				<div class="page-header news_bannerBg" style="background:url('../assets/img/banner/news.jpg');background-size:100% 100%;">
				</div>

			</div>

			<div class="am-g am-g-fixed myFixedSiderbar">
				<!--正文-->
				<div class="am-u-md-9 am-u-md-push-3 newsRight mainBody" style="padding-right: 5%;">
					<div class="breadcrumb-box">
						<div class="am-container">
							<ol class="am-breadcrumb">
								<li>
									<a href="<%=request.getContextPath() %>/">首页</a>
								</li>
								<li class="am-active">新闻中心</li>
							</ol>
						</div>
					</div>
					<div class="newsList" style="padding-top: 20px;" id="showNewsList">
						<input type="hidden" id="hiddenContent" ></input>
						<div class="newsPicList" >
							<div class="newsListPic">
								<a href="news_content.jsp" target="_blank" title="集团在京召开重点企业工作会议，力促年度整体经营目标实现 ">
									<span>
										<img src="../assets/img/markets/f04.png" title="集团在京召开重点企业工作会议，力促年度整体经营目标实现 " alt="集团在京召开重点企业工作会议，力促年度整体经营目标实现 " style="height: 100px;width: 100px;" />
									</span>
								</a>
							</div>
							<div class="newsListContent">
								<h4>
									<a href="news_content.jsp" target="_blank" title="集团在京召开重点企业工作会议，力促年度整体经营目标实现 ">集团在京召开重点企业工作会议，力促年度整体经营目标实现 </a>
									<span class="newsListTime">2018-11-19</span>
								</h4>
								<div class="newsListText">
									<a href="news_content.jsp" title="集团在京召开重点企业工作会议，力促年度整体经营目标实现" target="_blank">
										"   11月18日上午，集团在北京新华联国际文化交流中心召开重点企业工作会议，促进2018年整体经营目标的实现。
										集团领导傅军、丁伟、马晨山、肖文慧、冯建军、苏波、张必书、张皓若、刘静、杨运辉、蒋赛、曾敏、苟永平..."
									</a>
									<a href="news_content.jsp" title="集团在京召开重点企业工作会议，力促年度整体经营目标实现" target="_blank">
										<span>[详细]</span>
									</a>
								</div>
							</div>
							<div class="clear"></div>
						</div>

					<div class="newsPicList">
						<div class="newsListPic">
							<a
								href="news_content.jsp?news_id=news06d2df87d572409ab81aaf6eba8afe2a"
								target="_blank" title="新闻1"> <span><img
									src="/ssmtest/Show/News_title_page_Show?news_id=news06d2df87d572409ab81aaf6eba8afe2a"
									title="新闻1" alt="新闻1" style="height: 100px; width: 100px;" /></span>
							</a>
						</div>
						<div class="newsListContent">
							<h4>
								<a
									href="news_content.jsp?news_id=news06d2df87d572409ab81aaf6eba8afe2a"
									target="_blank" title="新闻1">新闻1</a> <span class="newsListTime">2018-12-25</span>
							</h4>
							<div class="newsListText">
								<a
									href="news_content.jsp?news_id=news06d2df87d572409ab81aaf6eba8afe2a"
									target="_blank" title="新闻1">
									【学习进行时】12月18日，习近平出席庆祝改革开放40周年大会并发表重要讲话。在讲话中，他提出了改革开放40年实践的九点启示。这九点启↵↵↵示对当下和未来有什么样的指导意义？新华社《学习进行时》原创品牌栏目今天推出文章，为您解读。↵↵改革开...
								</a> <a
									href="news_content.jsp?news_id=news06d2df87d572409ab81aaf6eba8afe2a"
									target="_blank" title="新闻1"> <span>[详细]</span>
								</a>
							</div>
						</div>
						<div class="clear"></div>
					</div>

				</div>
					<div style="height: 40px;" id="pagesid">
						<ul data-am-widget="pagination" class="am-pagination am-pagination-default" style="text-align: center;">
							<div class="page">
								<div class="pageNum" style="display:none">
									第<span id="a2" class="nowPageNum"></span>
									/<span id="a1" class="allPageNum"></span>页
								</div>
								
								<div class="jumpPage" style="padding:0 10px;">
									<a href="#" onClick="change1(--pageno1)" style="float:left;padding-right:5px;">上一页</a>
									<div class="linkPage">
										<span id="a3"></span>
									</div>
									<a href="#" onClick="change1(++pageno1)" style="padding-left:5px;">下一页</a>
								</div>
							</div>
						</ul>
					</div>
					
				</div>
				<!--侧边栏-->
				<div class="am-u-md-3 am-u-md-pull-9 my-sidebar mySiderbar">
					<div class="am-offcanvas" id="sidebar">
						<div class="am-offcanvas-bar">
							<ul class="am-nav">
								<li class="sidebar_contactUs">■新闻公告</li>
								<li class="promo_detailed--list_item sidebarListLi" style="border-top:1px solid #001A35;text-align: center;padding: 10px 0 0 0;">
									<a href="newsNotice.jsp" style="color: #000000;">通知公告</a>
								</li>
								<li class="promo_detailed--list_item sidebarListLi" style="border-bottom: 1px solid #001A35;text-align: center;padding: 5px 0 10px 0;font-weight: 600;color: #FF2F2F;">
									<a href="newsTrain.jsp" style="font-weight: 600;color: #FF2F2F;">培训新闻</a>
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
// 			window.onload = function() {
		$(document).ready(function() {
				
				  $.ajax({
						url : '<%=request.getContextPath()%>/Show/findAllNews',
						type : 'post',
						async:false,
			      		dataType:'json',
						success : function(data) {
							datas=data.data
// 							if(data.success == true){
							var zz =new Array(datas.length);
							if(datas.length == 0){
								document.getElementById("showNewsList").innerHTML=""//全部清空
								var div =document.createElement("li")//建立div对象
								div.innerHTML="暂无培训新闻";//建立显示元素
								document.getElementById("showNewsList").appendChild(div)//加入all中 
							
								document.getElementById("pagesid").style.display="none";
								return;
							}
							var content="   11月18日上午，集团在北京新华联国际文化交流中心召开重点企业工作会议，促进2018年整体经营目标的实现。集团领导傅军、丁伟、马晨山、肖文慧、冯建军、苏波、张必书、张皓若、刘静、杨运辉、蒋赛、曾敏、苟永平..."
// 							var length=content.substring(0, 108)
// 							var length=content.toString()
							
							for(var i=0;i <datas.length;i++){ 
								
								var msg=datas[i].news_context
		
								var content = filterHTMLTag(msg)
								
								function filterHTMLTag(msg) {
							        var msg = msg.replace(/<\/?[^>]*>/g, ''); //去除HTML Tag
							        msg = msg.replace(/[|]*\n/, '') //去除行尾空格
							        msg = msg.replace(/&npsp;/ig, ''); //去掉npsp
							        return msg;
								}
								
								if(content.length>120){
					  				var content=content.substring(0, 120)+'...'
					  			}else{
					  				var content=content
					  			}
					  			
						  		zz[i]=
											'<div class="newsListPic">'+
												'<a href=\"news_content.jsp?news_id='+datas[i].news_id+'\" target="_blank" title=\"'+datas[i].news_titile+'\">'+
													'<span>'+
														'<img src="<%=request.getContextPath()%>/Show/News_title_page_Show?news_id='+datas[i].news_id+'" title=\"'+datas[i].news_titile+'\" alt=\"'+datas[i].news_titile+'\" style="height: 100px;width: 100px;" />'+
													'</span>'+
												'</a>'+
											'</div>'+
											'<div class="newsListContent">'+
												'<h4>'+
												'<a href=\"news_content.jsp?news_id='+datas[i].news_id+'\" target="_blank" title=\"'+datas[i].news_titile+'\">'+datas[i].news_titile+'</a>'+
													'<span class="newsListTime">'+datas[i].news_Release_time+'</span>'+
												'</h4>'+
												'<div class="newsListText">'+
														'<a href=\"news_content.jsp?news_id='+datas[i].news_id+'\" target="_blank" title=\"'+datas[i].news_titile+'\">'+
														content+
														'</a>'+
														'<a href=\"news_content.jsp?news_id='+datas[i].news_id+'\" target="_blank" title=\"'+datas[i].news_titile+'\">'+
															'<span>[详细]</span>'+
														'</a>'+
												'</div>'+
											'</div>'+
											'<div class="clear"></div>'
										
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
								document.getElementById("showNewsList").innerHTML=""//全部清空
									for(var i=0;i<pagesize;i++){
									 	var div =document.createElement("div")//建立div对象
									 	div.setAttribute("class","newsPicList");
										div.innerHTML=zz[(e-1)*pagesize+i]//建立显示元素 
// 										var div=zz[(e-1)*pagesize+i]//建立显示元素
										document.getElementById("showNewsList").appendChild(div)//加入all中 
										if(zz[(e-1)*pagesize+i+1]==null) break;//超出范围跳出
							        }
								var ye="";
								for(var j=1;j<=pageall;j++){
									if(e==j){
										ye=ye+"<span><a href='#' onClick='change1("+j+")' style='color:#FF0000'>"+j+"</a></span> "
									}else{
										ye=ye+"<a href='#' onClick='change1("+j+")'>"+j+"</a> "
									}
								}
								document.getElementById("a1").innerHTML=pageall;
								document.getElementById("a2").innerHTML=pageno;
								document.getElementById("a3").innerHTML=ye;
							}
							change(1);
// 							}
						},
						error : function(error) {
							console.log('接口不通' + error);
						}
					});
				  
				  var aNewsRightWidth = $('.newsRight').width()-150;
					$('.newsListContent').css('width',aNewsRightWidth);
					var oNewsList = document.getElementsByClassName('newsList')[0];
					if(oNewsList.children[0]){
						var newsListLen = $('.newsPicList').length;
						var newsListNumHeight = newsListLen*120+5 +'px';
						$('.newsList').css('height',newsListNumHeight);
					}
// 			}
		});
		
					
					
 			function change1(e){
// 				var pageno1=1 ;              //当前页
				var pagesize=4;            //每页多少条信息
				if(datas1.length%pagesize==0){
					var  pageall =datas1.length/pagesize ;
				}else{
					var  pageall =parseInt(datas1.length/pagesize)+1;  
				}   //一共多少页   
				pageno1=e;
				if(e<1){ //如果输入页<1页
					e=1;pageno1=1;//就等于第1页 ， 当前页为1
				}
			    if(e>pageall){  //如果输入页大于最大页
					e=pageall;pageno1=pageall; //输入页和当前页都=最大页
				}
				document.getElementById("showNewsList").innerHTML=""//全部清空
					for(var i=0;i<pagesize;i++){
						var div =document.createElement("div")//建立div对象
						div.setAttribute("class","newsPicList");
						div.innerHTML=datas1[(e-1)*pagesize+i]//建立显示元素
						document.getElementById("showNewsList").appendChild(div)//加入all中 
						if(datas1[(e-1)*pagesize+i+1]==null) break;//超出范围跳出
			        }
				var ye="";
				for(var j=1;j<=pageall;j++){
					if(e==j){
						ye=ye+"<span><a href='#' onClick='change1("+j+")' style='color:#FF0000'>"+j+"</a></span> "
					}else{
						ye=ye+"<a href='#' onClick='change1("+j+")'>"+j+"</a> "
					}
				}
				document.getElementById("a1").innerHTML=pageall;
				document.getElementById("a2").innerHTML=pageno1;
				document.getElementById("a3").innerHTML=ye;
				
				var aNewsRightWidth = $('.newsRight').width()-150;
				$('.newsListContent').css('width',aNewsRightWidth);
				var oNewsList = document.getElementsByClassName('newsList')[0];
				if(oNewsList.children[0]){
					var newsListLen = $('.newsPicList').length;
					var newsListNumHeight = newsListLen*120+5 +'px';
					$('.newsList').css('height',newsListNumHeight);
				}
			}
			
		</script>
	</body>

</html>