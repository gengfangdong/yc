<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="entity.IUser" %>
<%
	IUser user = (IUser)session.getAttribute("user");
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>中央财经大学</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
		<link rel="stylesheet" href="../../../bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="../../../layui-v2.4.5/layui/css/layui.css">
		<!-- DataTables -->
		<!-- <link rel="stylesheet" href="../../plugins/DataTables-1.10.15/media/css/jquery.dataTables.min.css"> -->
		<link rel="stylesheet" href="../../../plugins/DataTables-1.10.15/media/css/dataTables.bootstrap.min.css">
		<!-- zTree -->
		<link rel="stylesheet" href="../../../zTree_v3/css/zTreeStyle/zTreeStyle.css">

		<!-- Font Awesome -->
		<link rel="stylesheet" href="../../../css/font-awesome-4.7.0/css/font-awesome.min.css">
		<!-- Ionicons -->
		<link rel="stylesheet" href="../../../css/ionicons-2.0.1/css/ionicons.min.css">
		<!-- jvectormap -->
		<link rel="stylesheet" href="../../../plugins/jvectormap/jquery-jvectormap-1.2.2.css">
		<!-- Theme style -->
		<link rel="stylesheet" href="../../../dist/css/AdminLTE.css">
		<!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
		<link rel="stylesheet" href="../../../dist/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="../../../bootstrap/css/style.css">
		<link rel="stylesheet" href="../../../layui-v2.4.5/layui/css/modules/layer/default/layer.css">
		<link rel="stylesheet" href="../../../css/myStyle.css">

		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    	<![endif]-->
		<style type="text/css">
			.fzy-border {
				background: #fff url(../../../image/datePicker.png) no-repeat right;
				/* background-color: #FCFCFC; */
			}
			
			option {
				color: black;
			}
			/* .layui-table-box{
				overflow: auto!important;
			}
			.layui-table-header,.layui-table-body{
				overflow: hidden!important;
			} */
		</style>
	</head>

	<body class="hold-transition skin-blue sidebar-mini">
		<div class="wrapper">
			<header class="main-header" style="background-color: #2a3b4c;height: 50px;position: fixed;width: 100%;">
				<!-- Logo -->
				<a href="#" class="logo" style="background-color: #2a3b4c;height: 50px;width: 500px;z-index: 1000000;">
					<!-- mini logo for sidebar mini 50x50 pixels -->
					<span class="logo-mini"><img src="" width="40"></span>
					<!-- logo for regular state and mobile devices -->
					<span class="logo-lg"><img src="../../../image/logo_text2.png" style="width: 240px;height: auto;"></span>
				</a>
				<!-- Header Navbar: style can be found in header.less -->
				<nav class="navbar navbar-static-top" role="navigation">
					<!-- Sidebar toggle button-->
					<div class="navbar-custom-menu">
						<ul class="nav navbar-nav">
							<!-- User Account: style can be found in dropdown.less -->
							<li class="dropdown user user-menu">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									<img src="../../../dist/img/1.png" class="user-image" alt="User Image">
									<% if(user != null) {%><span class="hidden-xs"><%=user.getUser_name()%>&nbsp;</span>
										
									<%}; %>
									<% if(user == null) {%><span class="hidden-xs">未登录</span><%}; %>
								</a>
								<ul class="dropdown-menu">
									<!-- User image -->
									<li class="user-header">
										<img src="../../../dist/img/1.png" class="img-circle" alt="User Image">
										<p>
											中央财经大学
											<small>管理员</small>
										</p>
									</li>

									<!-- Menu Footer-->
									<li class="user-footer">
										<div class="pull-left">
											<a href="#" class="btn btn-default btn-flat">个人设置</a>
										</div>
										<div class="pull-right">
											<a href="#" class="btn btn-default btn-flat">安全退出</a>
										</div>
									</li>
								</ul>
							</li>
							<!-- Control Sidebar Toggle Button -->
							<li>
								<a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
							</li>
						</ul>
					</div>
				</nav>
			</header>
			<!-- Left side column. contains the logo and sidebar -->
			<aside class="main-sidebar" >
				<!-- sidebar: style can be found in sidebar.less -->
				<section class="sidebar">
					<!-- Sidebar user panel -->
					<div class="user-panel">
						<div class="pull-left image">
							<img src="../../../dist/img/1.png" class="img-circle" alt="User Image">
						</div>
						<div class="pull-left info">
							<% if(user != null) {%>
							<p><%=user.getUser_loginname()%></p>
							<a href="#">
								<i class="fa fa-circle text-success"></i> 
								<%=user.getUser_name()%>&nbsp;
							</a>
										
							<%}; %>
							<% if(user == null) {%><span class="hidden-xs">未登录</span><%}; %>
							</a>
						</div>
					</div>

					<!-- sidebar menu: : style can be found in sidebar.less -->
					<ul class="sidebar-menu">
						<li class="treeview active">
							<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button" onclick="hiddenLi(this);">
								<i class="fa menu-iconss" style="width: 15px;"></i> <span>管理控制台</span>
							</a>
							<ul class="treeview-menu treeUl">
								<li>
									<a href="#"><i class="fa fa-circle-o"></i> 新闻公告<i class="fa fa-angle-left pull-right"></i></a>
									<ul class="treeview-menu menu_tree">
										<li>
											<a href="noticeAnnouncement.jsp"><i class="fa fa-square-o"></i> 通知公告</a>
										</li>
										<li>
											<a href="newsManagement.jsp"><i class="fa fa-square-o"></i> 新闻管理</a>
										</li>
										<li>
											<a href="rotationPicture.jsp"><i class="fa fa-square-o"></i> 轮播图片</a>
										</li>
										<li>
											<a href="aboutUs.jsp"><i class="fa fa-square-o"></i> 关于我们</a>
										</li>

									</ul>
								</li>
								<li>
									<a href="#"><i class="fa fa-circle-o"></i> 项目概况<i class="fa fa-angle-left pull-right"></i></a>
									<ul class="treeview-menu menu_tree">
										<li>
											<a href="cultureSystem.jsp" ><i class="fa fa-square-o"></i> 培养体系</a>
										</li>
										<li>
											<a href="solution.jsp"><i class="fa fa-square-o"></i> 解决方案</a>
										</li>
										<li>
											<a href="teachingMaterialSystem.jsp"><i class="fa fa-square-o"></i> 教材体系</a>
										</li>
										<li>
											<a href="taxCollectionFund.jsp"><i class="fa fa-square-o"></i> 领税基金</a>
										</li>
										<li>
											<a href="expertTeam.jsp"><i class="fa fa-square-o"></i> 专家团队</a>
										</li>

									</ul>
								</li>
								<li>
									<a href="#"><i class="fa fa-circle-o"></i> 项目管理<i class="fa fa-angle-left pull-right"></i></a>
									<ul class="treeview-menu menu_tree">
										<li>
											<a href="auditOfClassArrangement.jsp"><i class="fa fa-square-o"></i> 拼班审核</a>
										</li>
										<li>
											<a href="customizationAudit.jsp"><i class="fa fa-square-o"></i> 定制审核</a>
										</li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="fa fa-circle-o"></i> 资源管理<i class="fa fa-angle-left pull-right"></i></a>
									<ul class="treeview-menu menu_tree">
										<li>
											<a href="courseCatalogue.jsp"><i class="fa fa-square-o"></i> 课程目录</a>
										</li>
										<li>
											<a href="classesPlan.jsp"><i class="fa fa-square-o"></i> 课程方案</a>
										</li>
										<li>
											<a href="prescribedShift.jsp" style="color: #ffffff;"><i class="fa fa-square-o"></i> 规定班次</a>
										</li>
										<li>
											<a href="membershipManagement.jsp" ><i class="fa fa-square-o"></i> 会员管理</a>
										</li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="fa fa-circle-o"></i> 在职研<i class="fa fa-angle-left pull-right"></i></a>
									<ul class="treeview-menu menu_tree">
										<li>
											<a href="projectList.jsp"><i class="fa fa-square-o"></i> 项目列表</a>
										</li>
										<li>
											<a href="entryList.jsp"><i class="fa fa-square-o"></i> 报名列表</a>
										</li>
									</ul>
								</li>
							</ul>
						</li>
					</ul>
				</section>
				<!-- /.sidebar -->
			</aside>

			<!-- Content Wrapper. Contains page content -->
			<div class="content-wrapper">
				<section class="content-header">
					<h1>项目管理 <small>规定班次</small></h1>
					<ol class="breadcrumb">
						<li><i class="fa fa-dashboard"></i> 首页</li>
						<li> 项目管理</li>
						<li class="active">规定班次</li>
					</ol>
				</section>

				<section class="content">
					<div class="row">
						<div class="col-xs-12">
							<div class="box">
								<div class="box-body" style="padding: 0px;">
									<div class="row">
										<div class="col-sm-12">
											<!--<div class="form-group" style="margin-top: 5px;height: 32px;line-height: 32px;">
												<div class="col-sm-10" style="height: 32px;line-height: 32px;">
													<label for="" class="control-label" style="float: left;">年度：</label>
													<ul class="f-sort-ul">
														<li><a href="#" class>2019</a></li>
														<li><a href="#" class>2018</a></li>
														<li><a href="#" class>2017</a></li>
													</ul>
												</div>
											</div>-->
											<div class="row">
												<div class="col-sm-12 col-md-12">
													<div id="myTabContent" class="tab-content common-inline" style="padding-top: 0;">
														<div class="tab-pane fade in active" id="taxpayerAnalysis">
															<div class="row">
																<div class="col-sm-12 col-md-12">
																	<div class="form-group" style="width: 100%;margin-top: 5px;height: 32px;line-height: 32px;">
																		<div class="col-sm-10" style="height: 32px;line-height: 32px;">
																			<ul class="f-sort-ul">
																				<li><button href="#" class="add" onclick="addBranch(this);">新增</button></li>
																			</ul>
																		
																			<div class="demoTable">
																			  <!-- 搜索ID： -->
																			  <div class="layui-inline selectObj">
																			   <!--  <input class="layui-input" name="id" id="demoReload" autocomplete="off"> -->
																			    <label for="" class="control-label" style="float: left;">班次状态：</label>
																				<select id="firstObj" class="select" style="min-width: 150px;border-radius: 5px;border: 1px solid #cccccc;">
																			        <option value="全部">全部</option>
																			        <option value="报名未开始">报名未开始</option>
																			        <option value="报名进行中">报名进行中</option>
																			        <option value="未开课">未开课</option>
																			        <option value="课程进行中">课程进行中</option>
																			        <option value="已结课">已结课</option>
																			   </select>
																			  </div>
																			  <button class="layui-btn selectBtn" data-type="reload">搜索</button>
																			</div>
																		</div>
																	</div> 
																	<div class="row">
																		<div class="col-sm-12 col-md-12">
																			<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 10px;padding-right: 10px;">
																				<table id="LAY_table_user" class="table table-bordered table-hover example1_x" style="margin-top: 20px!important;" lay-filter="user">
																					<thead>
																					</thead>
																					<tbody>
																					</tbody>
																				</table>
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
									</div>
								</div>
							</div>
							<!-- /.box -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</section>
			</div>
			<!-- /.content-wrapper -->
			<!--<footer class="main-footer">
				<strong>版权© 2016-2025<a href="">北京大唐神州技术有限公司</a></strong> 保留所有权利。
			</footer>-->

			<!-- Control Sidebar -->
			<aside class="control-sidebar control-sidebar-dark">
				<div class="tab-content">
					<div class="tab-pane" id="control-sidebar-home-tab">
					</div>
				</div>
			</aside>
			<!-- /.control-sidebar -->
			<!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
			<div class="control-sidebar-bg"></div>
		</div>
		<!-- ./wrapper -->

		<!-- jQuery 2.1.4 -->
		<script src="../../../plugins/jQuery/jQuery-2.1.4.min.js"></script>
		<!-- Bootstrap 3.3.5 -->
		<script src="../../../bootstrap/js/bootstrap.min.js"></script>
		<!-- layui 2.3.0 -->
		<script src="../../../layui-v2.4.5/layui/layui.js"></script>
		<!-- DataTables -->
		<script src="../../../plugins/DataTables-1.10.15/media/js/jquery.dataTables.min.js"></script>
		<script src="../../../plugins/DataTables-1.10.15/media/js/dataTables.bootstrap.min.js"></script>
		<!-- zTree -->
		<script src="../../../zTree_v3/js/jquery.ztree.core.js"></script>
		<script src="../../../zTree_v3/js/jquery.ztree.excheck.js"></script>

		<!-- Slimscroll -->
		<script src="../../../plugins/slimScroll/jquery.slimscroll.min.js"></script>
		<!-- FastClick -->
		<script src="../../../plugins/fastclick/fastclick.min.js"></script>
		<!-- AdminLTE App -->
		<script src="../../../dist/js/app.min.js"></script>
		<!-- AdminLTE for demo purposes -->
		<script src="../../../dist/js/demo.js"></script>
		<!-- <script type="text/javascript" src="../../My97DatePicker/WdatePicker.js"></script> -->
		<!--切换选中样式-->
		<script type="text/javascript" src="../../../js/changeSelectStyle.js"></script>

		
		<script type="text/javascript">
		var firstObj="";
		
			/* 日期控件，执行多个laydate实例 begin */
			layui.use('laydate', function() {
				var laydate = layui.laydate;
				lay(".fzy-border").each(function() {
					laydate.render({
						elem: this //指定元素
					});
				});
			});
			/* 日期控件，执行多个laydate实例 end */

			
			layui.use('table', function(){
				var table = layui.table;
			  
			  //方法级渲染
			  table.render({
			    elem: '#LAY_table_user',
			    url: '<%=request.getContextPath()%>/ScheduledShift/getRegulationClasses',
			    cols: [[
				  {type:'numbers',title:"序号",minWidth:40},
			      {field:'d.scheduledshift.scheduled_id', title: 'ID',style:'display:none;'},
			      {field:'scheduledshift.createtime', title: '发布日期',templet:'<div>{{d.scheduledshift.createtime ? d.scheduledshift.createtime: ""}}</div>',minWidth:140,style:'min-width:140px;'},
			      {field:'scheduledshift.scheduled_name', title: '班次名称',templet:'<div>{{d.scheduledshift.scheduled_name ? d.scheduledshift.scheduled_name: ""}}</div>',minWidth:120},
			      {field:'dataNumber', title: '举办天数',minWidth:120},
			      {field:'scheduledshift.scheduled_start', title: '开始报名时间',templet:'<div>{{d.scheduledshift.scheduled_start ? d.scheduledshift.scheduled_start: ""}}</div>',minWidth:140},
			      {field:'scheduledshift.scheduled_end', title: '结束报名时间',templet:'<div>{{d.scheduledshift.scheduled_end ? d.scheduledshift.scheduled_end: ""}}</div>',minWidth:140},
			      {field:'scheduledshift.scheduled_class_start', title: '开班日期',templet:'<div>{{d.scheduledshift.scheduled_class_start ? d.scheduledshift.scheduled_class_start: ""}}</div>',minWidth:120},
			      {field:'scheduledshift.scheduled_class_end', title: '结课日期',templet:'<div>{{d.scheduledshift.scheduled_class_end ? d.scheduledshift.scheduled_class_end: ""}}</div>',minWidth:120},
			     {field:'scheduledshift.scheduled_address', title: '培训地点',templet:'<div>{{d.scheduledshift.scheduled_address ? d.scheduledshift.scheduled_address: ""}}</div>',minWidth:140},
			      {field:'scheduledshift.scheduled_class_pnumber', title: '容纳人数',templet:'<div>{{d.scheduledshift.scheduled_class_pnumber ? d.scheduledshift.scheduled_class_pnumber: "0"}}</div>',minWidth:120},
			      {field:'number', title: '已报名人数',minWidth:140},
			     {field:'scheduledshift.scheduled_status', title: '班次状态',templet:'#typestatus',minWidth:120},
			      {field:'handle', title: '操作',toolbar: '#barDemo',minWidth:300}
			    ]],
			    id: 'testReload',
			    page: true
			  });
			  
			//监听工具条
			  table.on('tool(user)', function(obj){
			    var data = obj.data;
			    if(obj.event === 'show'){
			    	layer.open({
						type: 2, //此处以iframe举例
						title: '查看',
						area: ['1063px', '530px'],
						shade: 0,
						maxmin: true,
						offset: [100, 200],
						content: 'openPage/showprescribedShift.jsp?scheduled_id='+data.scheduledshift.scheduled_id,
						zIndex: layer.zIndex, //重点1
						success: function(layero) {
							layer.setTop(layero); //重点2
						}
					});
			    } else if(obj.event === 'delete'){
			      	layer.confirm('确认删除该行？', function(index){
			      		$.ajax({
							url : '<%=request.getContextPath()%>/ScheduledShift/deleteScheduled',
							type : 'post',
							dataType:"json",
							data:{
								Scheduled_id:data.scheduledshift.scheduled_id
							},
							success : function(data) {
								if(data.message == "0"){
									alert("参数错误!");
								}
								else if(data.message == "1"){
									alert("获取规定班次失败!");
								}
								else if(data.message == "2"){
									alert("删除成功!");
								}
								
							},
							error : function(error) {
								console.log('接口不通' + error);
							}
						});	
			        layer.close(index);
			      });
			    } else if(obj.event === 'edit'){
			    	layer.open({
						type: 2, //此处以iframe举例
						title: '修改',
						area: ['1063px', '530px'],
						shade: 0,
						maxmin: true,
						offset: [100, 200],
						content: 'openPage/updateprescribedShift.jsp?scheduled_id='+data.scheduledshift.scheduled_id,
						zIndex: layer.zIndex, //重点1
						success: function(layero) {
							layer.setTop(layero); //重点2
						}
					});
			    }
			  });
			  var $ = layui.$, active = {
			    reload: function(){
			      var demoReload = $('#demoReload');
			      var status = $("#firstObj").val();
					if(status == '报名未开始'){
						status = 0;
					}else if(status == '报名进行中'){
						status = 1;
					}else if(status == '未开课'){
						status = 2;
					}else if(status == '课程进行中'){
						status = 3;
					}else if(status == '已结课'){
						status = 4;
					}else if(status == '全部'){
						status = "";
					}
			      
			      //执行重载
			      table.reload('testReload', {
			        page: {
			          curr: 1 //重新从第 1 页开始
			        },
			        method:'post',
			        where: {
			        	    status:status
			        }
			      });
			    }
			  };
			  
			  $('.demoTable .layui-btn').on('click', function(){
			    var type = $(this).data('type');
			    active[type] ? active[type].call(this) : '';
			  });
			  $('table.layui-table thead tr th:eq(1)').addClass('layui-hide');
			});
			
			
			function addBranch(obj,id) {
				var sText = obj.innerHTML;
				if(sText == '新增') {
					layui.use('layer', function() {
						var $ = layui.jquery,
							layer = layui.layer;
						layer.open({
							type: 2, //此处以iframe举例
							title: '新增',
							area: ['1063px', '530px'],
							shade: 0,
							maxmin: true,
							offset: [100, 200],
							content: 'openPage/addPrescribedShift.jsp',
							zIndex: layer.zIndex, //重点1
							success: function(layero) {
								layer.setTop(layero); //重点2
							}
						});
					})
				}<%--  else if(sText == '查看') {
					layui.use('layer', function() {
						var $ = layui.jquery,
							layer = layui.layer;
						layer.open({
							type: 2, //此处以iframe举例
							title: '查看',
							area: ['1063px', '530px'],
							shade: 0,
							maxmin: true,
							offset: [100, 200],
							content: 'openPage/showprescribedShift.jsp?scheduled_id='+id,
							zIndex: layer.zIndex, //重点1
							success: function(layero) {
								layer.setTop(layero); //重点2
							}
						});
					})
				} else if(sText == '修改') {
					layui.use('layer', function() {
						var $ = layui.jquery,
							layer = layui.layer;
						layer.open({
							type: 2, //此处以iframe举例
							title: '修改',	
							area: ['1063px', '530px'],
							shade: 0,
							maxmin: true,
							offset: [100, 200],
							content: 'openPage/updateprescribedShift.jsp?scheduled_id='+id,
							zIndex: layer.zIndex, //重点1
							success: function(layero) {
								layer.setTop(layero); //重点2
							}
						});
					})
				}else if(sText=='删除'){
		        	$.ajax({
						url : '<%=request.getContextPath()%>/ScheduledShift/deleteScheduled',
						type : 'post',
						dataType:"json",
						data:{
							Scheduled_id:id
						},
						success : function(data) {
							if(data.message == "0"){
								alert("参数错误!");
							}
							else if(data.message == "1"){
								alert("获取规定班次失败!");
							}
							else if(data.message == "2"){
								alert("删除成功!");
							}
							
						},
						error : function(error) {
							console.log('接口不通' + error);
						}
					});	
		        } --%>

			}
		</script>
		<script>
				function changeStyleColor1(obj) {
					var nLi = $('.shaixuan li');
					if($(obj).is('.conditionSelectStyle')) {
						for(var i = 0; i < nLi.length; i++) {
							if($(nLi[i].children[0]).is('.conditionSelectStyle')) {
								$(nLi[i].children[0]).removeClass('conditionSelectStyle');
							}
						}
						$(obj).addClass('conditionSelectStyle');
					} else {
						for(var i = 0; i < nLi.length; i++) {
							if($(nLi[i].children[0]).is('.conditionSelectStyle')) {
								$(nLi[i].children[0]).removeClass('conditionSelectStyle');
							}
						}
						$(obj).addClass('conditionSelectStyle');
					}
				}
				
			</script>
		<script>
			window.onload = function() {
				<% if(user == null){%>
				window.open('<%=request.getContextPath()%>/admin/login.html','_self');
				
			<%}%>
				var treeUls = document.getElementsByClassName('menu_tree');
				treeUls[0].setAttribute('style', 'display: block;');
				treeUls[1].setAttribute('style', 'display: block;');
				treeUls[2].setAttribute('style', 'display: block;');
                treeUls[3].setAttribute('style','display: block;');
				treeUls[4].setAttribute('style','display: block;');
				
                //左侧导航树高度
                var leftTreeHeight = document.getElementsByClassName('sidebar')[0].offsetHeight;
                //屏幕高度
                var screenHeight = window.screen.height;
                //可用内容高度
                var ableHeight = screenHeight - 150;
                if(ableHeight<leftTreeHeight){
                	$(".content-wrapper").css("min-height",leftTreeHeight);
                }else{
                	$(".content-wrapper").css("min-height",ableHeight);
                }
			};
		</script>
		<script type="text/html" id="barDemo">
			<a class="" lay-event="show" style="margin-right:10px; cursor: pointer;">查看</a>
			<a class="" lay-event="edit" style="margin-right:10px; cursor: pointer;">修改</a>
			<a class="" lay-event="del" style="margin-right:10px; cursor: pointer;">结束</a>
			<a class="" lay-event="delete" style="margin-right:10px; cursor: pointer;">删除</a>
			 {{#  if(d.number != "0"){ }}
	     		<a class="" lay-event="" style="margin-right:10px; cursor: pointer;" href = "<%=request.getContextPath()%>/Ssuser/exportUserad/{{d.scheduledshift.scheduled_id}}">查看名单</a>
	     	 {{# } }}
		</script>

		<script type="text/html" id="typestatus">
	     {{#  if(d.scheduledshift.scheduled_status == "1"){ }}
	       	 报名进行中
	     {{#  }else if(d.scheduledshift.scheduled_status=="2"){ }}
	     	未开课
	     {{#  }else if(d.scheduledshift.scheduled_status=="3"){ }}
	     	开课中
	     {{#  }else if(d.scheduledshift.scheduled_status=="4"){ }}
	     	已结课
	     {{#  }else if(d.scheduledshift.scheduled_status=="0"){ }}
	     	报名未开始
	     {{# } }}
 		</script>
	</body>

</html>