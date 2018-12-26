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
									<a href="#"><i class="fa fa-circle-o"></i> 新闻公告<i class="fa fa-angle-left pull-right"></i></a>
									<ul class="treeview-menu menu_tree">
										<li>
											<a href="noticeAnnouncement.jsp" ><i class="fa fa-square-o"></i> 通知公告</a>
										</li>
										<li>
											<a href="newsManagement.jsp"><i class="fa fa-square-o"></i> 新闻管理</a>
										</li>
										<li>
											<a href="rotationPicture.jsp"><i class="fa fa-square-o"></i> 轮播图片</a>
										</li>
										<li>
											<a href="aboutUs.jsp" ><i class="fa fa-square-o"></i> 关于我们</a>
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
											<a href="solution.jsp" ><i class="fa fa-square-o"></i> 解决方案</a>
										</li>
										<li>
											<a href="teachingMaterialSystem.jsp"><i class="fa fa-square-o"></i> 教材体系</a>
										</li>
										<li>
											<a href="taxCollectionFund.jsp" ><i class="fa fa-square-o"></i> 领税基金</a>
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
											<a href="courseCatalogue.jsp" style="color: #ffffff;"><i class="fa fa-square-o"></i> 课程目录</a>
										</li>
										<li>
											<a href="classesPlan.jsp"><i class="fa fa-square-o"></i> 课程方案</a>
										</li>
										<li>
											<a href="prescribedShift.jsp"><i class="fa fa-square-o"></i> 规定班次</a>
										</li>
										<li>
											<a href="membershipManagement.jsp"><i class="fa fa-square-o"></i> 会员管理</a>
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
					<h1>资源管理 <small>课程目录</small></h1>
					<ol class="breadcrumb">
						<li><i class="fa fa-dashboard"></i> 首页</li>
						<li> 资源管理</li>
						<li class="active">课程目录</li>
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
											<div class="text-c">
								                用户名称：<input type="text" class="input-text" style="width:250px" placeholder="输入用户名称" id="name"
								                       name="name">
								                <button type="submit" class="btn btn-success" onclick="search()"><i class="icon-search"></i> 搜用户
								                </button>
								            </div>
											<div class="row">
												<div class="col-sm-12 col-md-12">
													<div id="myTabContent" class="tab-content common-inline" style="padding-top: 0;">
														<div class="tab-pane fade in active" id="taxpayerAnalysis">
															<div class="row">
																<div class="col-sm-12 col-md-12">
																	<div class="form-group" style="width: 100%;margin-top: 5px;height: 32px;line-height: 32px;margin-bottom: 0;">
																		<div class="col-sm-10" style="height: 32px;line-height: 32px;">
																			<ul class="f-sort-ul">
																				<li><button href="#" class="add" onclick="addBranch(this);">新增</button></li>
																			</ul>
																		</div>
																	</div>
																	<div class="form-group" style="margin-top: 5px;height: 32px;line-height: 32px;">
																		<div class="col-sm-10" style="height: 32px;line-height: 32px;">
																			<label for="" class="control-label" style="float: left;">一级目录：</label>
																			<select id="firstObj" class="select" onclick="firstSelect(this);" style="min-width: 150px;border-radius: 5px;border: 1px solid #cccccc;">
																		        <option value="全部">全部</option>
																		        <!-- <option value="热点培训">热点培训</option>
																		        <option value="单项课程">单项课程</option> -->
																		   </select>
																		</div>
																		<div class="col-sm-10" style="height: 32px;line-height: 32px;">
																			<label for="" class="control-label" style="float: left;">二级目录：</label>
																			<select id="secondObj" class="select" onclick="secondSelect(this);" style="min-width: 150px;border-radius: 5px;border: 1px solid #cccccc;">
																		        <!-- <option value="全部">全部</option>
																		        <option value="基础班">基础班</option>
																		        <option value="项目班">项目班</option>
																		        <option value="师资班">师资班</option> -->
																		   </select>
																		</div>
																	</div> 
																	<div class="row">
																		<div class="col-sm-12 col-md-12">
																			<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 10px;padding-right: 10px;">
																				<table id="secondSelect" class="table table-bordered table-hover example1_x" style="margin-top: 20px!important;">
																					<thead>
																						<tr>
																							<th style="text-align: center;">序号</th>
																							<th style="text-align: center;">id</th> 
																							<th style="text-align: center;">一级目录</th>
																							<th style="text-align: center;">二级目录</th>
																							<th style="text-align: center;">三级目录</th>
																							<th style="text-align: center;">操作</th>
																						</tr>
																					</thead>
																					<tbody>
																						<tr>
																							<td style="text-align: center;">1</td>
																							<td>热点培训</td>
																							<td>基础班</td>
																							<td>税收分析基础培训班</td>
																							<td>
																								<a href="#" onclick="addBranch(this);">查看</a>
																								<a href="#" onclick="addBranch(this);">修改</a>
																								<a onclick="isDelete(this);">删除</a>
																							</td>
																						</tr>
																						<tr>
																							<td style="text-align: center;">2</td>
																							<td>热点培训</td>
																							<td>项目班</td>
																							<td>税收分析项目特训班</td>
																							<td>
																								<a href="#" onclick="addBranch(this);">查看</a>
																								<a href="#" onclick="addBranch(this);">修改</a>
																								<a onclick="isDelete(this);">删除</a>
																							</td>
																						</tr>
																						<tr>
																							<td style="text-align: center;">3</td>
																							<td>热点培训</td>
																							<td>师资班</td>
																							<td>税收分析高级人才培养师资班</td>
																							<td>
																								<a href="#" onclick="addBranch(this);">查看</a>
																								<a href="#" onclick="addBranch(this);">修改</a>
																								<a onclick="isDelete(this);">删除</a>
																							</td>
																						</tr>
																						<tr>
																							<td style="text-align: center;">4</td>
																							<td>单项课程</td>
																							<td>税收分析</td>
																							<td>结构性减税对消费的影响</td>
																							<td>
																								<a href="#" onclick="addBranch(this);">查看</a>
																								<a href="#" onclick="addBranch(this);">修改</a>
																								<a onclick="isDelete(this);">删除</a>
																							</td>
																						</tr>
																						<tr>
																							<td style="text-align: center;">5</td>
																							<td>单项课程</td>
																							<td>纳税服务</td>
																							<td>纳税人需求管理</td>
																							<td>
																								<a href="#" onclick="addBranch(this);">查看</a>
																								<a href="#" onclick="addBranch(this);">修改</a>
																								<a onclick="isDelete(this);">删除</a>
																							</td>
																						</tr>
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
		var branchPage;
		function search() {
        branchPage.draw();
    	}
			$(function() {
				//设置结束日期为当前日期  
				var date = new Date();
				var seperator1 = "-";
				var seperator2 = ":";
				var month = date.getMonth() + 1;
				var strDate = date.getDate();
				if(month >= 1 && month <= 9) {
					month = "0" + month;
				}
				if(strDate >= 0 && strDate <= 9) {
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
				//$('#secondSelect').dataTable().fnReloadAjax();
				if(branchPage == null){
				branchPage = $('#secondSelect').DataTable({
					"language": dataTableLang,
					"paging": true,
					"info": true,
					"aLengthMenu": [10],
					"lengthChange": false,
					"searching": false,
					"ordering": false,
					"autoWidth": false,
					"retrieve":true,
					"destroy": true,
					"sInfoFiltered":'',//设置为空 相当于删除 (从 _MAX_ 条中过滤)
					
					ajax: {
		                url: "<%=request.getContextPath()%>/Course/getlist"
		            },
		            serverSide: true,
		            columns: [
		                
		                {"data": "course_id",
		                 "render":function(data,type,row,meta){
		                	           var startIndex = meta.settings._iDisplayStart;
		                	     return startIndex+meta.row+1;
		                }},
		                {"data": "course_id"},
		                {"data": "first_course"},
		                {"data": "second_course"},
		                {"data": "third_course"},
		                {"data": null}
		            ],
		            "aoColumnDefs":[{"targets":1,
		            	visible:false
		            	},/* //设置列的属性，此处设置第一列不排序
		                      {"targets":5,
		                         "data": null,
		                        "bSortable": false,
		                        "defaultContent": "<p>&nbsp;&nbsp;&nbsp;&nbsp;<a id=\"show\" href=\"#\" onclick=\"addNews(this);\">查看</a>&nbsp;&nbsp;&nbsp;&nbsp;<a id=\"edit\" href=\"#\">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;<a id=\"del\"  href=\"#\">删除</a></p>"
		              }, */{//倒数第一列
	                        "targets":-1,
	                        "bSortable": false,
	                        render: function(data, type, row) {
	                            var html ='<a id=\"show\" href=\"#\" onclick=\"addBranch(this,\''+row.course_id+'\');\">查看</a>&nbsp;&nbsp;&nbsp;&nbsp;<a id=\"edit\" href=\"#\" onclick=\"addBranch(this,\''+row.course_id+'\');\">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;<a id=\"del\"  href=\"#\" onclick=\"addBranch(this,\''+row.course_id+'\');\">删除</a></p>';
	                            return html;
	                        }
	                    }], 
					"stripeClasses": ["datatable_odd", "datatable_even"]

				});
			}
			branchPage.draw();
				
			});
		</script>
		<script>
			var firstObj;
			var secondObj;
			function firstSelect(obj){
				firstObj = obj.value;
				if(firstObj=="全部"){
					firstObj="";
				}
				$.ajax({
					url:"<%=request.getContextPath()%>/Course/getSecond",
					type:"post",
					data:{
						First_course:firstObj
					},
					success:function(data){
						if(data.success==true){
							document.getElementById("secondObj").innerHTML = '';
							document.getElementById("secondObj").innerHTML = '<option value="全部">全部</option>';
							for(var i=0;i<data.data.length;i++){
								document.getElementById("secondObj").innerHTML += '<option value='+data.data[i]+'>'+data.data[i]+'</option>';
							}
							var len = $('#firstObj').children().length;
							for(var j=0;j<len;j++){
								if($($('#firstObj').children()[j]).selected==true){
									$($('#firstObj').children()[j]).attr('selected','');
								}
							}
							for(var i=0;i<len;i++){
								if($($('#firstObj').children()[i]).val()==firstObj){
									$($('#firstObj').children()[i]).attr('selected','selected');
									break;
								}
							}
							$('#secondSelect').dataTable().fnReloadAjax();
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

								var branchPage = $('#secondSelect').DataTable({
									"language": dataTableLang,
									"paging": true,
									"info": true,
									"aLengthMenu": [10],
									"lengthChange": false,
									"searching": false,
									"ordering": false,
									"autoWidth": false,
									"retrieve":true,
									"destroy":true,
									ajax: {
						                url: "<%=request.getContextPath()%>/Course/getlist"
						            },
						            serverSide: true,
						            columns: [
						                
						                {"data": "course_id",
						                 "render":function(data,type,row,meta){
						                	           var startIndex = meta.settings._iDisplayStart;
						                	     return startIndex+meta.row+1;
						                }},
						                {"data": "course_id"},
						                {"data": "first_course"},
						                {"data": "second_course"},
						                {"data": "third_course"},
						                {"data": null}
						            ],
						            "aoColumnDefs":[{"targets":1,
						            	visible:false
						            	},/* //设置列的属性，此处设置第一列不排序
						                      {"targets":5,
						                         "data": null,
						                        "bSortable": false,
						                        "defaultContent": "<p>&nbsp;&nbsp;&nbsp;&nbsp;<a id=\"show\" href=\"#\" onclick=\"addNews(this);\">查看</a>&nbsp;&nbsp;&nbsp;&nbsp;<a id=\"edit\" href=\"#\">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;<a id=\"del\"  href=\"#\">删除</a></p>"
						              }, */{//倒数第一列
					                        "targets":-1,
					                        "bSortable": false,
					                        render: function(data, type, row) {
					                            var html ='<a id=\"show\" href=\"#\" onclick=\"addBranch(this,\''+row.course_id+'\');\">查看</a>&nbsp;&nbsp;&nbsp;&nbsp;<a id=\"edit\" href=\"#\" onclick=\"addBranch(this,\''+row.course_id+'\');\">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;<a id=\"del\"  href=\"#\" onclick=\"addBranch(this,\''+row.course_id+'\');\">删除</a></p>';
					                            return html;
					                        }
					                    }], 
									"stripeClasses": ["datatable_odd", "datatable_even"]

								});
							
							
							
							
							
						}else{
							alert("请求失败！");
						}
					},
					error:function(error){
						alert("接口错误"+error);
					}
				});
				
				
			}
			
			function secondSelect(obj){

				secondObj = obj.value;
				var First_course = $($('#firstObj').children()[i]).val()
				
				$.ajax({
					url:"<%=request.getContextPath()%>/Course/getSecond",
					type:"post",
					data:{
						First_course:firstObj,
						Second_course:secondObj
					},
					success:function(data){
						if(data.success==true){
							document.getElementById("secondObj").innerHTML = '<option value="全部">全部</option>';
							for(var i=0;i<data.data.length;i++){
								document.getElementById("secondObj").innerHTML += '<option value="+data.data[i]+">'+data.data[i]+'</option>';
							}
							var len = $('#secondObj').children().length;
							for(var j=0;j<len;j++){
								if($($('#secondObj').children()[i]).selected==true){
									$($('#secondObj').children()[i]).attr('selected','');
								}
							}
							for(var i=0;i<len;i++){
								if($($('#secondObj').children()[i]).val()==secondObj){
									$($('#secondObj').children()[i]).attr('selected','selected');		
								}
							}
							
							/* $("#secondObj").children(); */
						}else{
							alert("请求失败！");
						}
					},
					error:function(error){
						alert("接口错误"+error);
					}
				})
			}
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
							content: 'openPage/addCourseCatalogue.jsp',
							zIndex: layer.zIndex, //重点1
							success: function(layero) {
								layer.setTop(layero); //重点2
							}
						});
					})
				} else if(sText == '查看') {
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
							content: 'openPage/showCourseCatalogue.jsp?course_id='+id,
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
							content: 'openPage/updateCourseCatalogue.jsp?course_id='+id,
							zIndex: layer.zIndex, //重点1
							success: function(layero) {
								layer.setTop(layero); //重点2
							}
						});
					})
				}else if(sText=='删除'){
		        	$.ajax({
						url : '<%=request.getContextPath()%>/Course/deleteCourse',
						type : 'post',
						dataType:"json",
						data:{
							Course_id:id
						},
						success : function(data) {
							if(data.message == "0"){
								alert("参数错误!");
							}
							else if(data.message == "1"){
								alert("获取课程目录失败!");
							}
							else if(data.message == "2"){
								alert("删除成功!");
							}
							
						},
						error : function(error) {
							console.log('接口不通' + error);
						}
					});	
		        }

			}
		</script>
		<script>
			window.onload = function() {
				//左侧树
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
                
                
                //筛选项
                $.ajax({
					url:"<%=request.getContextPath()%>/Course/getFirst",
					type:"post",
					success:function(data){
						if(data.success==true){
							//document.getElementById("firstObj").innerHTML = '<option value="全部">全部</option>';
							for(var i=0;i<data.data.length;i++){
								document.getElementById("firstObj").innerHTML += '<option value='+data.data[i]+'>'+data.data[i]+'</option>';
							}
							
						}else{
							alert("没有数据！");
						}
					},
					error:function(error){
						alert("接口错误"+error);
					}
				})
                
			};
		</script>
	</body>

</html>