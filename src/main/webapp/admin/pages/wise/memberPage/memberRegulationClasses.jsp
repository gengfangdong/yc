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
		<link rel="stylesheet" href="../../../layui-v2.3.0/layui/css/layui.css">
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
		<link rel="stylesheet" href="../../../layui-v2.3.0/layui/css/modules/layer/default/layer.css">
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
			option{
				color: black;
			}
		</style>
	</head>

	<body class="hold-transition skin-blue sidebar-mini">
		<div class="wrapper">
			<header class="main-header" style="background-color: #2a3b4c;height: 50px;position: fixed;width: 100%;">
				<!-- Logo -->
				<a href="#" class="logo"  style="background-color: #2a3b4c;height: 50px;width: 500px;z-index: 1000000;">
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
									<span class="hidden-xs">liwei</span>
								</a>
								<ul class="dropdown-menu">
									<!-- User image -->
									<li class="user-header">
										<img src="../../../dist/img/1.png" class="img-circle" alt="User Image">
										<p>
											中央财经大学
											<small>学员</small>
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
			<aside class="main-sidebar" style="position: fixed;">
				<!-- sidebar: style can be found in sidebar.less -->
				<section class="sidebar">
					<!-- Sidebar user panel -->
					<div class="user-panel">
						<div class="pull-left image">
							<img src="../../../dist/img/1.png" class="img-circle" alt="User Image">
						</div>
						<div class="pull-left info">
							<p>o1234675</p>
							<a href="#"><i class="fa fa-circle text-success"></i> liwen</a>
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
									<a href="#"><i class="fa fa-circle-o"></i> 基本设置<i class="fa fa-angle-left pull-right"></i></a>
									<ul class="treeview-menu menu_tree">
										<li>
											<a href="memberMessage.jsp"><i class="fa fa-square-o"></i> 我的信息</a>
										</li>
										<li>
											<a href="memberPersonList.jsp"><i class="fa fa-square-o"></i> 人员列表</a>
										</li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="fa fa-circle-o"></i> 我的项目<i class="fa fa-angle-left pull-right"></i></a>
									<ul class="treeview-menu menu_tree">
										<li>
											<a href="memberCustomProject.jsp"><i class="fa fa-square-o"></i> 定制项目</a>
										</li>
										<li>
											<a href="memberRegulationClasses.jsp" style="color: #FFFFFF;"><i class="fa fa-square-o"></i> 规定班次</a>
										</li>
										<li>
											<a href="memberOnlineClasses.jsp" ><i class="fa fa-square-o"></i> 在线拼班</a>
										</li>
										<li>
										   <a href="memberIncumbencyStudent.jsp"><i class="fa fa-square-o"></i> 在职研</a>
										</li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="fa fa-circle-o"></i> 项目管理<i class="fa fa-angle-left pull-right"></i></a>
									<ul class="treeview-menu menu_tree">
										<li>
											<a href="memberProjectList.jsp"><i class="fa fa-square-o"></i> 项目列表</a>
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
					<h1>我的项目 <small>规定班次</small></h1>
					<ol class="breadcrumb">
						<li><i class="fa fa-dashboard"></i> 首页</li>
						<li> 我的项目</li>
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
											<div class="row" >
												<div class="col-sm-12 col-md-12">
													<div id="myTabContent" class="tab-content common-inline" style="padding-top: 0;">
														<div class="tab-pane fade in active" id="taxpayerAnalysis">
															<div class="row">
																<div class="col-sm-12 col-md-12">
																	<div class="form-group" style="margin-top: 5px;height: 32px;line-height: 32px;">
																		<div class="demoTable">
																		  <!-- 搜索ID： -->
																		  <div class="layui-inline selectObj">
																		   <!--  <input class="layui-input" name="id" id="demoReload" autocomplete="off"> -->
																		    <label for="" class="control-label" style="float: left;">班次状态：</label>
																			<select id="firstObj" class="select" onclick="firstSelect(this);" style="min-width: 150px;border-radius: 5px;border: 1px solid #cccccc;">
																		        <option value="全部">全部</option>
																		        <option value="未开始">未开始</option>
																		        <option value="进行中">进行中</option>
																		        <option value="已结束">已结束</option>
																		   </select>
																		  </div>
																		  <div class="layui-inline selectObj">
																		    <label for="" class="control-label" style="float: left;">是否报名：</label>
																			<select id="secondObj" class="select" onclick="secondSelect(this);" style="min-width: 150px;border-radius: 5px;border: 1px solid #cccccc;">
																		        <option value="全部">全部</option>
																		        <option value="已报名">已报名</option>
																		        <option value="未报名">未报名</option>
																		   </select>
																		  </div>
																		  <button class="layui-btn selectBtn" data-type="reload">搜索</button>
																		</div>
																	</div> 
																	<div class="row">
																		<div class="col-sm-12 col-md-12">
																			<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 10px;padding-right: 10px;">
																				<table id="LAY_table_user" class="table table-bordered table-hover example1_x" style="margin-top: 20px!important;" lay-filter="user">
																					<thead>
																						<tr>
																							
																						</tr>
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
		<script src="../../../layui-v2.3.0/layui/layui.js"></script>
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
		
		<script>
			var firstObj="";
			var secondObj="";
		</script>
		
		
		<script type="text/javascript">
			/* 日期控件，执行多个laydate实例 begin */
			layui.use('laydate', function(){
				var laydate = layui.laydate;
				lay(".fzy-border").each(function(){
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
			    url: '<%=request.getContextPath()%>/Course/getlistLay',
			    cols: [[
				  {type:'numbers',title:"序号"},
			      {field:'course_id', title: 'ID',style:'display:none;'},
			      {field:'course_name', title: '班次名称'},
			      {field:'start_class', title: '开班日期'},
			      {field:'end_class', title: '结课日期'},
			      {field:'start_entry', title: '开始报名时间'},
			      {field:'end_entry', title: '结束报名时间'},
			      {field:'train_address', title: '培训地点'},
			      {field:'accommodating_population', title: '容纳人数'},
			      {field:'signUp_person', title: '已报名人数'},
			      {field:'class_status', title: '班次状态'},
			      {field:'isEntry', title: '是否已报名'},
			      {field:'handle', title: '操作',toolbar: '#barDemo'}
			    ]],
			    id: 'testReload',
			    page: true
			  });
			  
			//监听工具条
			  table.on('tool(user)', function(obj){
			    var data = obj.data;
			    if(obj.event === 'detail'){
			    	layer.open({
						type: 2, //此处以iframe举例
						title: '报名',
						area: ['1063px', '530px'],
						shade: 0,
						maxmin: true,
						offset: [100, 200],
						content: 'openPage/addRegulationClasses.jsp',
						zIndex: layer.zIndex, //重点1
						success: function(layero) {
							layer.setTop(layero); //重点2
						}
					});
			    } else if(obj.event === 'del'){
			      	layer.confirm('确认取消报名？', function(index){
			      		$.ajax({
							url : '<%=request.getContextPath()%>/Course/deleteCourse',
							type : 'post',
							dataType:"json",
							data:{
								Course_id:data.course_id
							},
							success : function(data) {
								if(data.message == "0"){
									layer.alert("参数错误!");
								}
								else if(data.message == "1"){
									layer.alert("获取班次名称失败!");
								}
								else if(data.message == "2"){
									layer.alert("报名已取消!");
								}
							},
							error : function(error) {
								console.log('接口不通' + error);
							}
						});	
			        layer.close(index);
			      });
			    }
			  });
			  var $ = layui.$, active = {
			    reload: function(){
			      var demoReload = $('#demoReload');
			      firstObj = document.getElementById("firstObj").value;
			      secondObj = document.getElementById("secondObj").value;
			      if(firstObj=="全部"){
			    	  firstObj="";
			      }
			      if(secondObj=="全部"){
			    	  secondObj="";
			      }
			      
			      //执行重载
			      table.reload('testReload', {
			        page: {
			          curr: 1 //重新从第 1 页开始
			        },
			        method:'post',
			        where: {
			        	    First_course:firstObj,
							Second_course:secondObj
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
			
		</script>
		<script>
			window.onload = function(){
				var treeUls = document.getElementsByClassName('menu_tree');
				treeUls[0].setAttribute('style','display: block;');
				treeUls[1].setAttribute('style','display: block;');
				treeUls[2].setAttribute('style','display: block;');
			};
		</script>
		<script type="text/html" id="barDemo">
  			<a class="" lay-event="detail" style="margin-right:10px; cursor: pointer;">报名</a>
  			<a class="" lay-event="del" style="margin-right:10px; cursor: pointer;">取消报名</a>
		</script>
	</body>

</html>