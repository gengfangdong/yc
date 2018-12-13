<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
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

			option {
				color: black;
			}
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
											<a href="memberMessage.html" style="color: #FFFFFF;"><i class="fa fa-square-o"></i> 我的信息</a>
										</li>
										<li>
											<a href="memberPersonList.html"><i class="fa fa-square-o"></i> 人员列表</a>
										</li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="fa fa-circle-o"></i> 我的项目<i class="fa fa-angle-left pull-right"></i></a>
									<ul class="treeview-menu menu_tree">
										<li>
											<a href="memberCustomProject.html"><i class="fa fa-square-o"></i> 定制项目</a>
										</li>
										<li>
											<a href="memberRegulationClasses.html"><i class="fa fa-square-o"></i> 规定班次</a>
										</li>
										<li>
											<a href="memberOnlineClasses.html"><i class="fa fa-square-o"></i> 在线拼班</a>
										</li>
									</ul>
								</li>
								<li>
									<a href="#"><i class="fa fa-circle-o"></i> 项目管理<i class="fa fa-angle-left pull-right"></i></a>
									<ul class="treeview-menu menu_tree">
										<li>
											<a href="memberProjectList.html"><i class="fa fa-square-o"></i> 项目列表</a>
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
					<h1>基本设置 <small>我的信息</small></h1>
					<ol class="breadcrumb">
						<li><i class="fa fa-dashboard"></i> 首页</li>
						<li> 基本设置</li>
						<li class="active">我的信息</li>
					</ol>
				</section>

				<section class="content">
					<div class="row">
						<div class="col-xs-12">
							<div class="box" style="margin-bottom: 0;padding-bottom: 20px;">
								<div class="box-body" style="padding: 0px;">
									<div class="row">
										<div class="col-sm-12">

											<div class="row">
												<div class="col-sm-12 col-md-12">
													<div id="myTabContent" class="tab-content common-inline" style="padding-top: 0;">
														<div class="tab-pane fade in active" id="taxpayerAnalysis">
															<div class="row">
																<div class="col-sm-12 col-md-12">
																	<!--<div class="form-group" style="width: 100%;margin-top: 5px;height: 32px;line-height: 32px;margin-bottom: 0;">
																		<div class="col-sm-10" style="height: 32px;line-height: 32px;">
																			<ul class="f-sort-ul">
																				<li><button href="#" class="add" onclick="addBranch(this);">新增</button></li>
																			</ul>
																		</div>
																	</div>-->
																	<div class="row">
																		<div class="col-sm-12 col-md-12">
																			<div class="row" style="height: 30px;line-height: 30px;">
																				<div class="col-sm-9 col-md-9">
																					<label style="font-size: 14px; padding-left: 10px;">
																						<img src="../../../image/square.png" style="margin-top: -1px;width: 12px;">
																						基本信息
																					</label>
																				</div>
																			</div>
																			<div class="" id="" style="padding-left: 10px;padding-right: 10px;border-top: 1px solid #F4F4F4;">
																				<div class="form-group" style="padding-top: 5px;height: 30px;margin-top: 5px;">
																					<label for="" class="control-label" style="float: left;margin-left: 5px;height: 30px;line-height: 30px;">用户名称：</label>
																					<div class="col-sm-4">
																						<input type="text" class="form-control searchInput1" placeholder="" style="height: 30px;font-size: 12px;" />
																					</div>
																				</div>
																				<div class="form-group" style="padding-top: 5px;height: 30px;margin-top: 5px;">
																					<label for="" class="control-label" style="float: left;margin-left: 5px;height: 30px;line-height: 30px;">所在区域：</label>
																					<div class="col-sm-4">
																						<input type="text" class="form-control searchInput1" placeholder="" style="height: 30px;font-size: 12px;" />
																					</div>
																					<!-- <label for="" class="control-label" style="float: left;margin-left: 5px;height: 30px;line-height: 30px;">用户名：</label>
																					<div class="col-sm-4">
																						<input type="text" class="form-control searchInput1" placeholder="" style="height: 30px;font-size: 12px;" />
																					</div> -->
																					<!--<label for="" class="col-sm-1 control-label" style="text-align: center;margin-top: 5px;"> —— </label>
																					<div class="col-sm-4">
																						<input type="text" class="form-control searchInput2" placeholder="输入数量" style="height: 30px;font-size: 12px;" />
																					</div>-->
																				</div>
																				<div class="form-group" style="padding-top: 5px;height: 30px;margin-top: 5px;">
																					<label for="" class="control-label" style="float: left;margin-left: 5px;height: 30px;line-height: 30px;">联系电话：</label>
																					<div class="col-sm-4">
																						<input type="text" class="form-control searchInput1" placeholder="" style="height: 30px;font-size: 12px;" />
																					</div>
																				</div>
																				<div class="form-group" style="padding-top: 5px;height: 30px;margin-top: 5px;">
																					<label for="" class="control-label" style="float: left;margin-left: 5px;height: 30px;line-height: 30px;">联系邮箱：</label>
																					<div class="col-sm-4">
																						<input type="text" class="form-control searchInput1" placeholder="" style="height: 30px;font-size: 12px;" />
																					</div>
																				</div>
																				<div class="form-group" style="padding-top: 5px;height: 30px;margin-top: 5px;">
																					<label for="" class="control-label" style="float: left;margin-left: 5px;height: 30px;line-height: 30px;">详细地址：</label>
																					<div class="col-sm-4">
																						<input type="text" class="form-control searchInput1" placeholder="" style="height: 30px;font-size: 12px;" />
																					</div>
																				</div>
																				<!--<div class="form-group">
																					<div class="col-sm-6" style="text-align: right;">
																						<button type="submit" class="btn btn-default" style="font-size: 12px;padding: 5px 12px;background-color: #1e9fff;color: #fff;border-color: #1E9FFF;">搜索</button>
																					</div>
																				</div>-->
																				<div class="form-group" style="width: 100%;margin-top: 5px;height: 32px;line-height: 32px;margin-bottom: 0;">
																					<div class="col-sm-10" style="height: 32px;line-height: 32px;">
																						<ul class="f-sort-ul" style="padding-left: 15%;">
																							<li><button href="#" class="add saveMessage">保存</button></li>
																							<li><button href="#" class="add changeMessage">修改</button></li>
																						</ul>
																					</div>
																				</div>
																			</div>

																			<div class="row" style="height: 30px;line-height: 30px;">
																				<div class="col-sm-9 col-md-9">
																					<label style="font-size: 14px; padding-left: 10px;">
																						<img src="../../../image/square.png" style="margin-top: -1px;width: 12px;">
																						模板管理
																					</label>
																				</div>
																			</div>
																			<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 10px;padding-right: 10px;border-top: 1px solid #F4F4F4;">
																				<div class="form-group" style="padding-top: 5px;height: 30px;margin-top: 5px;">
																					<label for="" class="control-label" style="float: left;margin-left: 5px;height: 30px;line-height: 30px;">会员名单模板：</label>
																					<div class="col-sm-10">
																						<button href="../../../../前台/dist/doc/报名表格.zip" class="add saveMessage" style="margin-top: 5px;"><a href="../../../../前台/dist/doc/报名表格.zip" style="font-size: 12px;line-height: 24px;color: #FFFFFF;">下载</a></button>
																						<span style="font-size: 12px;padding-left: 20px;">注：本模板用于在“人员列表”模块中导入本单位培训人员名单</span>
																					</div>
																				</div>
																				
																				<!-- <table id="" class="example1_x moreSelected" style="margin-top: 6px!important;">

																					<tbody>
																						<tr>
																							<td class="firstTd">会员名单模板</td>
																							<td class="otherTd expenditureContribution1" onclick="riskIndexed7(this);">
																								<a href="../../../../前台/dist/doc/报名表格.zip">下载</a>
																							</td>
																						</tr>
																					</tbody>
																				</table> -->
																			</div>
																			<div class="row" style="height: 30px;line-height: 30px;">
																				<div class="col-sm-9 col-md-9">
																					<label style="font-size: 14px; padding-left: 10px;">
																						<img src="../../../image/square.png" style="margin-top: -1px;width: 12px;">
																						密码设置
																					</label>
																				</div>
																			</div>
																			<div class="" id="" style="padding-left: 10px;padding-right: 10px;border-top: 1px solid #F4F4F4;">
																				<div class="form-group" style="padding-top: 5px;height: 30px;margin-top: 5px;">
																					<label for="" class="control-label" style="float: left;margin-left: 5px;height: 30px;line-height: 30px;">原密码：</label>
																					<div class="col-sm-4">
																						<input type="password" class="form-control searchInput1" placeholder="请输入原密码" style="height: 30px;font-size: 12px;" />
																					</div>
																				</div>
																				<div class="form-group" style="padding-top: 5px;height: 30px;margin-top: 5px;">
																					<label for="" class="control-label" style="float: left;margin-left: 5px;height: 30px;line-height: 30px;">新密码：</label>
																					<div class="col-sm-4">
																						<input type="password" class="form-control searchInput1" placeholder="请输入新密码" style="height: 30px;font-size: 12px;" />
																					</div>
																				</div>
																				<div class="form-group" style="padding-top: 5px;height: 30px;margin-top: 5px;">
																					<label for="" class="control-label" style="float: left;margin-left: 5px;height: 30px;line-height: 30px;">新密码：</label>
																					<div class="col-sm-4">
																						<input type="password" class="form-control searchInput1" placeholder="请再次输入新密码" style="height: 30px;font-size: 12px;" />
																					</div>
																				</div>
																				<div class="form-group" style="width: 100%;margin-top: 5px;height: 32px;line-height: 32px;margin-bottom: 0;">
																					<div class="col-sm-10" style="height: 32px;line-height: 32px;">
																						<ul class="f-sort-ul" style="padding-left: 15%;">
																							<li><button href="#" class="add savePassword">保存</button></li>
																							<li><button href="#" class="add changePassword">修改</button></li>
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
			$(function() {
				//设置结束日期为当前日期  
				var date = new Date();
				var seperator1 = "-";
				var seperator2 = ":";
				var month = date.getMonth() + 1;
				var strDate = date.getDate();
				if (month >= 1 && month <= 9) {
					month = "0" + month;
				}
				if (strDate >= 0 && strDate <= 9) {
					strDate = "0" + strDate;
				}
				var end = date.getFullYear() + seperator1 + month + seperator1 + strDate;
				/*$("#foundDate").val("万年历");*/

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

				var branchPage = $('#branchPage').DataTable({
					"language": dataTableLang,
					"paging": true,
					"info": true,
					"aLengthMenu": [10],
					"lengthChange": false,
					"searching": false,
					"ordering": false,
					"autoWidth": false,
					"stripeClasses": ["datatable_odd", "datatable_even"]

				});

			});
		</script>
		<script type="text/javascript">
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

			function addBranch(obj) {
				var sText = obj.innerHTML;
				if (sText == '新增') {
					layui.use('layer', function() {
						var $ = layui.jquery,
							layer = layui.layer;
						layer.open({
							type: 2, //此处以iframe举例
							title: '新增',
							area: ['1063px', '530px'],
							shade: 0,
							maxmin: true,
							offset: [100, '20%'],
							content: 'openPage/addBranch.html',
							zIndex: layer.zIndex, //重点1
							success: function(layero) {
								layer.setTop(layero); //重点2
							}
						});
					})
				} else if (sText == '查看') {
					layui.use('layer', function() {
						var $ = layui.jquery,
							layer = layui.layer;
						layer.open({
							type: 2, //此处以iframe举例
							title: '查看',
							area: ['1063px', '530px'],
							shade: 0,
							maxmin: true,
							offset: [100, '20%'],
							content: 'openPage/addBranch.html',
							zIndex: layer.zIndex, //重点1
							success: function(layero) {
								layer.setTop(layero); //重点2
							}
						});
					})
				} else if (sText == '修改') {
					layui.use('layer', function() {
						var $ = layui.jquery,
							layer = layui.layer;
						layer.open({
							type: 2, //此处以iframe举例
							title: '修改',
							area: ['1063px', '530px'],
							shade: 0,
							maxmin: true,
							offset: [100, '20%'],
							content: 'openPage/addBranch.html',
							zIndex: layer.zIndex, //重点1
							success: function(layero) {
								layer.setTop(layero); //重点2
							}
						});
					})
				}

			}
		</script>
		<script>
			window.onload = function() {
				var treeUls = document.getElementsByClassName('menu_tree');
				treeUls[0].setAttribute('style', 'display: block;');
				treeUls[1].setAttribute('style', 'display: block;');
				treeUls[2].setAttribute('style', 'display: block;');
				treeUls[3].setAttribute('style', 'display: block;');
			};
		</script>
	</body>

</html>
