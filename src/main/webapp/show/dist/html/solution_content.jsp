<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="entity.IUser" %>
<%
	IUser user = (IUser)session.getAttribute("user");
%>
<!DOCTYPE html>
<%
	String solution_id = request.getParameter("solution_id");
%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>领税教育网</title>
	<link rel="icon" href="../assets/img/logo.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="../assets/css/amazeui.css"/>
    <link rel="stylesheet" href="../assets/css/common.min.css"/>
    <link rel="stylesheet" href="../assets/css/index.min.css"/>
    <link rel="stylesheet" href="../assets/css/myStyle.css"/>
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
            .am-offcanvas-bar .am-nav > li > a {
                color: #ccc;
                border-radius: 0;
                border-top: 1px solid rgba(0, 0, 0, .3);
                box-shadow: inset 0 1px 0 rgba(255, 255, 255, .05)
            }

            .am-offcanvas-bar .am-nav > li > a:hover {
                background: #404040;
                color: #fff
            }

            .am-offcanvas-bar .am-nav > li.am-nav-header {
                color: #777;
                background: #404040;
                box-shadow: inset 0 1px 0 rgba(255, 255, 255, .05);
                text-shadow: 0 1px 0 rgba(0, 0, 0, .5);
                border-top: 1px solid rgba(0, 0, 0, .3);
                font-weight: 400;
                font-size: 75%
            }

            .am-offcanvas-bar .am-nav > li.am-active > a {
                background: #1a1a1a;
                color: #fff;
                box-shadow: inset 0 1px 3px rgba(0, 0, 0, .3)
            }

            .am-offcanvas-bar .am-nav > li + li {
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
										<a href="<%=request.getContextPath()%>/show/dist/html/register.jsp" style="color: #000000;">注册</ a>                      </div>
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
                                <a href=""><img src="../assets/img/index/logo_top.png" alt="" style="width: auto;"/></a>
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
                                                    <a href="cultureSystem.jsp" style="color: #FF2F2F;">项目概况</a>
                                                    <!-- sub-menu start-->
                                                    <ul class="sub-menu">
                                                        <li class="menu-item">
                                                            <a href="cultureSystem.jsp"
                                                               >培养体系</a>
                                                        </li>
                                                        <li class="menu-item">
                                                            <a href="solution.jsp" style="color: #FF2F2F;">解决方案</a>
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
												<a href="cultureSystem.jsp"  style="color: #FF2F2F;">项目概况</a>
												<ul class="am-menu-sub am-collapse ">
													<li class="">
														<a href="cultureSystem.jsp" >培养体系</a>
													</li>
													<li class="">
														<a href="solution.jsp" style="color: #FF2F2F;">解决方案</a>
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
                <h1 class="page-header-title">解决方案</h1>
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
                        <li class="am-active">项目概况</li>
                        <li class="am-active">解决方案</li>
                    </ol>
                </div>
            </div>
            <div class="am-g">
                <div class="am-u-sm-11 am-u-sm-centered">
                    <div class="am-cf am-article"   id="solutioncontext">
                        <div style="text-align: center;">
                            <h1 class="am-article-title">“领税”项目基本情况</h1>
                            <!--<p class="am-article-meta" style="border-bottom: 1px solid #999999;border-top: 1px solid #999999;">
                                <label style="padding-right: 3%;">作者：集团企业文化与信息管理部</label>
                                <label style="padding-left: 3%;">时间：2018-11-17</label>
                            </p>-->
                        </div>

                        <p style="text-indent: 25px;">
                            为进一步发挥高校社会服务职能作用，深入推进产、学、研协同创新，加快实施中央财经大学“双一流”建设，牢牢把握数字经济赋能教育产业新机遇。中央财经大学举办“领税”项目，项目内容主要包括：设立“领税”基金，成立“领税”教育中心、推进
                        </p>
                       <!-- <div style="text-align: center;">
                            <img src="../assets/img/projectOverview/content.jpg" alt="" style="max-height: 400px;max-width: 100%;">
                        </div>-->
                        <p style="text-indent: 25px;">
                            税收大数据学科建设、推进税收管理生态系统建设，力争将“领税”项目打造为中央财经大学服务税务行业的领军品牌。
                        </p>
                        <p style="text-indent: 25px;">
                            一、成立“领税”基金。每年200万元人民币，来源于税务培训收入。主要用于三个方面：一是对教师的教学、科研、教材专著出版的奖励或资助；二是对学业优秀、家庭困难学生的奖励或资助；三是和国家税务总局联合举办每年一度或两年一度的“领税杯”税收事业贡献奖，奖励对税收事业做出突出贡献的税收教育工作者、税收科研工作者、税务干部、纳税人。
                        </p>
                        <p style="text-indent: 25px;">二、成立“领税”教育中心。开发“领税”教育网站，建立一站式的税收人才培养体系，组织编写了税收经济分析、大数据与税收风险管理、社保与非税收入、个人所得税改革与征管实务等系列教材，面向全国税务干部开展税务培训工作，适时面向社会开展涉税业务培训工作。</p>
                        <p style="text-indent: 25px;">
                            三、推进税收大数据学科建设。按照国税、地税征管机制改革统一部署，全国省、市级税务机构全部新成立了大数据与风险管理局、税收经济分析处（科）等适应数字经济业态的专门机构，税收大数据的研究与实践变得更加迫切，相应的税收大数据学科建设亟需同步推进。“领税”项目在师资团队培训、税务专业硕士教材编写等学科建设方面发挥积极作用，为中央财经大学加快实施“双一流”建设贡献力量。
                        </p>
                        <p style="text-indent: 25px;">
                            四、推进税收管理生态系统建设。习近平总书记于2018年11月7日在第五届世界互联网大会上指出：当今世界，正在经历一场更大范围、更深层次的科技革命和产业变革，数字经济正在快速发展。创立以项目集群为载体的协同创新模式，发挥“领税”项目行业引领作用，协同相关高校、科研机构、科技公司，逐步推出数据集市、应用系统、创新基地等项目，把握数字经济赋能教育产业新机遇，建立以教育为入口的税务行业供应链，构建以服务税收管理现代化为愿景的智能化生态系统。
                        </p>


                    </div>
                    <hr/>
                </div>
            </div>
        </div>
        <!--侧边栏-->
        <div class="am-u-md-3 am-u-md-pull-9 my-sidebar mySiderbar">
            <div class="am-offcanvas" id="sidebar">
                <div class="am-offcanvas-bar">
                    <ul class="am-nav">
                        <li class="sidebar_contactUs">■项目概况</li>
                        <li class="promo_detailed--list_item sidebarListLi"
                            style="border-top:1px solid #001A35;text-align: center;padding: 10px 0 0 0;">
                            <a href="cultureSystem.jsp" style="color: #000;">培养体系</a>
                        </li>
                        <li class="promo_detailed--list_item sidebarListLi"
                            style="text-align: center;padding: 5px 0 0px 0;">
                            <a href="solution.jsp" style="font-weight: 600;color: #FF2F2F;">解决方案</a>
                        </li>

                        <li class="promo_detailed--list_item sidebarListLi"
                            style="text-align: center;padding: 5px 0 0px 0;">
                            <a href="teachingMaterialSystem.jsp" style="color: #000;">教材体系</a>
                        </li>

                        <li class="promo_detailed--list_item sidebarListLi"
                            style="text-align: center;padding: 5px 0 0px 0;">
                            <a href="taxCollectionFund.jsp" style="color: #000;">领税基金</a>
                        </li>

                        <li class="promo_detailed--list_item sidebarListLi"
                            style="border-bottom: 1px solid #001A35;text-align: center;padding: 5px 0 10px 0;">
                            <a href="expertTeam.jsp" style="color: #000;">专家团队</a>
                        </li>
                    </ul>
                    <ul class="am-nav">
                        <jsp:include   page="mainBodyRight.jsp" flush="true"/>
                    </ul>
                </div>
            </div>
        </div>
        <a href="#sidebar" class="am-btn am-btn-sm am-btn-success am-icon-bars am-show-sm-only my-button"
           data-am-offcanvas><span class="am-sr-only">侧栏导航</span></a>
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
</body>
<script type="text/javascript">
			 window.onload = function(){
//         		CKEDITOR.replace('teachingDescription');
        		$.ajax({
				url : '<%=request.getContextPath()%>/Solution/getSolutiondetailByid',
				type : 'GET',
				data:{
					solution_id:'<%=solution_id%>'
				},
				success : function(data) {
					if(data.success == true){
						var solution_context = data.data.solution_context;
						 document.getElementById('solutioncontext').innerHTML=
							 '<div style="text-align: center;">'+'<h1 class="am-article-title">'+data.data.solution_titile+'</h1>'+
		 						'<p class="am-article-meta" style="border-bottom: 1px solid #999999;border-top: 1px solid #999999;">'+
		 						'<label style="padding-right: 3%;">作者：'+data.data.solution_Creater+'</label>'+
		 						'<label style="padding-left: 3%;">时间：'+data.data.solution_Release_time+'</label>'+solution_context;
					}
				},
				error : function(error) {
					console.log('接口不通' + error);
				}
			});	
        		$(".regulations_bannerbg").height($(".regulations_bannerbg").width()*400/1581-172);//banner图高度
   	 		};
   	 		
   	 	$(window).resize(function(){
			$(".regulations_bannerbg").height($(".regulations_bannerbg").width()*400/1581-172);//banner图高度
		});

		</script>
</html>