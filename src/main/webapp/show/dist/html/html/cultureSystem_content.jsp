<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
	String culture_id = request.getParameter("culture_id");
%>
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
        p{
            margin-top: 5px;
            margin-bottom: 5px;
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
                            <div class="am-dropdown" data-am-dropdown
                                 style="height: 35px;line-height: 35px;color: #000000;">
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
                                                    <a href="../index.jsp">首页</a>
                                                </li>
                                                <li>
                                                    <a href="cultureSystem.jsp" style="color: #FF2F2F;">项目概况</a>
                                                    <!-- sub-menu start-->
                                                    <ul class="sub-menu">
                                                        <li class="menu-item">
                                                            <a href="cultureSystem.jsp"
                                                               style="color: #FF2F2F;">培养体系</a>
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
                    <a href="#doc-oc-demo1" data-am-offcanvas="{effect: 'push'}"><i
                            class="am-menu-toggle-icon am-icon-bars"></i></a>
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
                                        <a href="newsNotice.jsp" style="color: #FF2F2F;">新闻中心</a>
                                        <!-- sub-menu start-->
                                        <!--<ul class="sub-menu">
                                            <li class="menu-item">
                                                <a href="news-content.jsp">公司动态</a>
                                            </li>
                                            <li class="menu-item">
                                                <a href="404-dark.jsp">行业动态</a>
                                            </li>
                                            <li class="menu-item">
                                                <a href="404-light.jsp">精彩专题</a>
                                            </li>
                                        </ul>-->
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
        <div class="page-header news_bannerBg">
            <div class="am-container">
                <h1 class="page-header-title">培养体系</h1>
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
                        <li class="am-active">项目概况</li>
                        <li class="am-active">培养体系</li>
                    </ol>
                </div>
            </div>
            <div class="am-g">
                <div class="am-u-sm-11 am-u-sm-centered">
                    <div class="am-cf am-article"  id="culturecontext">
                       <!--  <div style="text-align: center;">
                            <h1 class="am-article-title">中央财经大学税收分析人才培养体系</h1>
                            <p class="am-article-meta" style="border-bottom: 1px solid #999999;border-top: 1px solid #999999;">
                                <label style="padding-right: 3%;">作者：集团企业文化与信息管理部</label>
                                <label style="padding-left: 3%;">时间：2018-11-17</label>
                            </p>
                        </div>

                        <p style="text-indent: 25px;">
                            为响应国家税务总局全面加强税收经济分析工作安排，中央财经大学在总结连续四年承办国家税务总局税收分析高级研修班及各省市税收分析培训班经验的基础上，积极组织科研和教学力量，研发了中央财经大学税收分析人才培养体系。
                        </p>
                        <div style="text-align: center;">
                            <img src="../assets/img/projectOverview/content.jpg" alt="" style="max-height: 400px;max-width: 100%;">
                        </div>
                        <p style="text-indent: 25px;">
                            基础班：基础理论、方法工具、分析报告写作
                        </p>
                        <p style="text-indent: 25px;">
                            学制：一周、二周、一个月，一年(每三个月脱产学习二周)
                        </p>
                        <p style="text-indent: 25px;">人数要求：50人以上
                        </p>
                        <br>

                        <p style="text-indent: 25px;">
                            项目班：以项目为抓手，专家、教授全程指导，采取“课程+任务”的方式
                        </p>
                        <p style="text-indent: 25px;">
                            学制：一周、二周、一个月，一年(每三个月脱产学习二周)
                        </p>
                        <p style="text-indent: 25px;">
                            人数要求：50人以上
                        </p>
                        <br>
                        <p style="text-indent: 25px;">
                            师资班：以师资培养、创新型人才培养为目标
                        </p>
                        <p style="text-indent: 25px;">
                            学制：一周、二周、一个月，一年(每三个月脱产学习二周)
                        </p>
                        <p style="text-indent: 25px;">
                            人数要求：50人以上
                        </p>
                        <br>
                        <p style="text-indent: 25px;">
                            研究生班：可以申请硕士学位，以培养具有较高转移能力的税收分析人才为目标
                        </p>
                        <p style="text-indent: 25px;">
                            学制：2年
                        </p>
                        <p style="text-indent: 25px;">
                            人数要求：50人以上
                        </p>
                        <br>
                        <p style="text-indent: 25px;">
                            定制班：可以自由组合课程，也可以选择给定的课程方案
                        </p>
                        <p style="text-indent: 25px;">
                            学制：学习时长自定
                        </p>
                        <p style="text-indent: 25px;">
                            人数要求：50人以上
                        </p>
                        <br>
                        <p style="text-indent: 25px;">
                            拼班：
                        </p>
                        <p style="text-indent: 25px;">
                            （一）发起拼班：可以自由组合课程，也可以选择给定的课程方案
                            学制：学习时间及时长自定
                        </p>
                        <p style="text-indent: 25px;">
                            人数要求：无限制
                        </p>
                        <p style="text-indent: 25px;">
                            （二）参与拼班：参加平台上发起的拼班

                        </p>
                        <p style="text-indent: 25px;">学制：发起单位确定的时间和时长
                        </p>
                        <p style="text-indent: 25px;">
                            人数要求：无限制</p> -->

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
                            <a href="cultureSystem.jsp" style="font-weight: 600;color: #FF2F2F;">培养体系</a>
                        </li>
                        <li class="promo_detailed--list_item sidebarListLi"
                            style="text-align: center;padding: 5px 0 0px 0;">
                            <a href="solution.jsp" style="color: #000;">解决方案</a>
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
                        <li class="sidebar_contactUs">联系我们</li>
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
                            <img src="../assets/img/index/wx_code.png" style="max-width: 170px;padding-left: 20px;"/>
                        </li>
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
				url : '<%=request.getContextPath()%>/Show/getCulturedetailByid',
				type : 'GET',
				data:{
					culture_id:'<%=culture_id%>'
				},
				success : function(data) {
					if(data.success == true){
						var culture_context = data.data.culture_context;
						 document.getElementById('culturecontext').innerHTML=
							 '<div style="text-align: center;">'+'<h1 class="am-article-title">'+data.data.culture_titile+'</h1>'+
		 						'<p class="am-article-meta" style="border-bottom: 1px solid #999999;border-top: 1px solid #999999;">'+
		 						'<label style="padding-right: 3%;">作者：管理员</label>'+
		 						'<label style="padding-left: 3%;">时间：'+data.data.culture_Release_time+'</label>'+culture_context;
					}
				},
				error : function(error) {
					console.log('接口不通' + error);
				}
			});	
   	 		};

		</script>
</html>