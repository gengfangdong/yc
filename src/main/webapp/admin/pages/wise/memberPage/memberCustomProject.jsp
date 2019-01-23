<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="entity.IUser" %>
<%
	IUser user = (IUser)session.getAttribute("user");
String caogery = (String)session.getAttribute("isad");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>领税教育网</title>
		<link rel="icon" href="../../../image/logo.ico" type="image/x-icon"/>
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
							<li class="goHome"><a href="<%=request.getContextPath()%>/" style="color:#fff;">返回首页</a></li>
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
											<% if(user != null) {%><span class="hidden-xs"><%=user.getUser_name()%>&nbsp;</span>
																				
											<%}; %>
											<% if(user == null) {%><span class="hidden-xs">未登录</span><%}; %>
										</p>
									</li>

									<!-- Menu Footer-->
									<li class="user-footer">
										
										<div class="pull-right">
											<a href="<%=request.getContextPath()%>/admin/login" class="btn btn-default btn-flat">安全退出</a>
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
											<a href="memberCustomProject.jsp" style="color: #FFFFFF;"><i class="fa fa-square-o"></i> 定制项目</a>
										</li>
										<li>
											<a href="memberRegulationClasses.jsp"><i class="fa fa-square-o"></i> 自主报名</a>
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
					<h1>我的项目 <small>定制项目</small></h1>
					<ol class="breadcrumb">
						<li><i class="fa fa-dashboard"></i> 首页</li>
						<li> 我的项目</li>
						<li class="active">定制项目</li>
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
																	<div class="form-group" style="width: 100%;margin-top: 5px;height: 32px;line-height: 32px;margin-bottom: 0;">
																		<div class="col-sm-10" style="height: 32px;line-height: 32px;">
																			<ul class="f-sort-ul">
																				<li><button href="#" class="add" onclick="addBranch(this);">新增</button></li>
																			</ul>
																			<div class="demoTable">
																			<div class="layui-inline selectObj">
																				<label for="" class="control-label" style="float: left;">定制类别：</label>
																				<select id="secondObj" class="select" style="min-width: 150px;border-radius: 5px;border: 1px solid #cccccc;">
																			        <option value="全部">全部</option>
																			        <option value="方案定制">方案定制</option>
																			        <option value="课程定制">课程定制</option>
																			        <option value="自由定制">自由定制</option>
																				</select>
																			</div>
																			<div class="layui-inline selectObj">
																				<label for="" class="control-label" style="float: left;">状态：</label>
																				<select id="firstObj" class="select" style="min-width: 150px;border-radius: 5px;border: 1px solid #cccccc;">
																			        <option value="全部">全部</option>
																			        <option value="未审核">未审核</option>
																			        <option value="已通过">已通过</option>
																			        <option value="未通过">未通过</option>
																			        <option value="开课中">开课中</option>
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
																				<table id="LAY_table_user" lay-filter="user" class="table table-bordered table-hover example1_x" style="margin-top: 20px!important;">
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
			    url: '<%=request.getContextPath()%>/Constom/LayConstom',
			    cols: [[
				  {type:'numbers',title:"序号",minWidth:60},
			      {field:'freeco_name', title: '班级名称',minWidth:180,sort: true},
			      {field:'freeco_creater',title:'发起人',minWidth:120,sort:true},
			      {field:'freeco_updatetime',title:'发起时间',minWidth:180,sort: true},
			      {field:'freeco_gaoery', title: '定制类别',templet:'#typecaogery',minWidth:120,sort: true},
			      {field:'freeco_datanum', title: '举办天数',templet:'#typedatanum',minWidth:160,sort: true},
			      {field:'freeco_pernum', title: '计划参加人数',minWidth:160,sort: true},
			      {field:'freeco_data', title: '开始时间',minWidth:120,sort: true},
			      {field:'freeco_status', title: '状态',templet:'#typestatus',minWidth:120,sort: true},
			      {field:'freeco_id', title: '操作',toolbar: '#barDemo',minWidth:250}
			    ]],
			    id: 'testReload',
			    height:'full-250',
			    page: true
			  });
			  
			//监听工具条
			  table.on('tool(user)', function(obj){
			    var data = obj.data;
			    if(obj.event === 'show'){
			    	layer.open({
						type: 2, //此处以iframe举例
						title: '查看',
						area: ['70%', '530px'],
						shade: 0,
						maxmin: true,
						offset: ['10%', '15%'],
						content: 'openPage/showCustomProject.jsp?constom_id='+data.freeco_id,
						zIndex: layer.zIndex, //重点1
						success: function(layero) {
							layer.setTop(layero); //重点2
						}
					});
			    } else if(obj.event === 'delete'){
			      	layer.confirm('确认删除？', function(index){
			      		$.ajax({
							url : '<%=request.getContextPath()%>/Constom/cancel',
							type : 'post',
							dataType:"json",
							data:{
								Constom_id:data.freeco_id
							},
							success : function(data) {
								if(data.message == "0"){
									layer.alert("参数错误!");
								}
								else if(data.message == "1"){
									layer.alert("定制班次不存在!");
								}
								else if(data.message == "2"){
									layer.confirm('取消成功!', { title:'提示'}, function(index){
									  
										window.parent.location.reload();
										var index1 = parent.layer.getFrameIndex(window.name);
										parent.layer.close(index1);
								});
								}
							},
							error : function(error) {
								console.log('接口不通' + error);
							}
						});	
			        layer.close(index);
			      });
			    } else if(obj.event === 'cancel'){
			      	layer.confirm('确认取消定制？', function(index){
			      		$.ajax({
							url : '<%=request.getContextPath()%>/Constom/cancel',
							type : 'post',
							dataType:"json",
							data:{
								Constom_id:data.freeco_id
							},
							success : function(data) {
								if(data.message == "0"){
									layer.alert("参数错误!");
								}
								else if(data.message == "1"){
									layer.alert("定制班次不存在!");
								}
								else if(data.message == "2"){
									layer.confirm('取消成功!', { title:'提示'}, function(index){
									  
									window.parent.location.reload();
									var index1 = parent.layer.getFrameIndex(window.name);
									parent.layer.close(index1);
								});
								}
							},
							error : function(error) {
								console.log('接口不通' + error);
							}
						});	
			        layer.close(index);
			      });
			    }else if(obj.event === 'cancel'){
			      	layer.confirm('确认取消定制？', function(index){
			      		$.ajax({
							url : '<%=request.getContextPath()%>/Constom/cancel',
							type : 'post',
							dataType:"json",
							data:{
								Constom_id:data.freeco_id
							},
							success : function(data) {
								if(data.message == "0"){
									layer.alert("参数错误!");
								}
								else if(data.message == "1"){
									layer.alert("定制班次不存在!");
								}
								else if(data.message == "2"){
									layer.confirm('取消成功!', { title:'提示'}, function(index){
									  
									window.parent.location.reload();
									var index1 = parent.layer.getFrameIndex(window.name);
									parent.layer.close(index1);
								});
								}
							},
							error : function(error) {
								console.log('接口不通' + error);
							}
						});	
			        layer.close(index);
			      });
			    }else if(obj.event === 'edit'){
			    	layer.open({
						type: 2, //此处以iframe举例
						title: '修改',
						area: ['70%', '530px'],
						shade: 0,
						maxmin: true,
						offset: ['10%', '15%'],
						content: 'openPage/editCustomProject.jsp?constom_id='+data.freeco_id,
						zIndex: layer.zIndex, //重点1
						success: function(layero) {
							layer.setTop(layero); //重点2
						}
					});
			    } else if(obj.event === 'update'){
			    	layer.open({
						type: 2, //此处以iframe举例
						title: '上传名单',
						area: ['70%', '530px'],
						shade: 0,
						maxmin: true,
						offset: ['10%', '15%'],
						content: 'openPage/updateCustomProjectNameList.jsp',
						zIndex: layer.zIndex, //重点1
						success: function(layero) {
							layer.setTop(layero); //重点2
						}
					});
					}else if(obj.event === 'upload'){
					    layui.layer.open({
				            title: "名单上传",
				            content: $('#upload_file_dialog').html(),
				            area: ['500px', '300px'],
				            btn: ['发送', '取消'],
				            yes: function (index, layero) {//发送
				                var f = document.getElementById("Userfile").files;
				                if(f.length<=0){
				                	layui.layer.alert("请选择文件!");
				                	return;
				                }
				                var fd = new FormData();
								fd.append("file",f[0]);
								fd.append("Constom_id",data.freeco_id);
								$.ajax({
									url:'<%=request.getContextPath()%>/Constom/importUser',
									type:'post',
									encType: 'multipart/form-data', //表明上传类型为文件
									processData: false,  //tell jQuery not to process the data
				        			contentType: false,  //tell jQuery not to set contentType
									data:fd,
									success:function(data){
										if(data.success == true){
											if(data.message == "5"){
												layer.alert("上传成功!");
											}
										}
										else if(data.message == "4"){
											layer.alert("excel存在身份证重复!");
										}else if(data.message == "2"){
											layer.alert(" execl无数据!");
										}
									},
									error:function(data){

									}
								})
				            },
				            btn2:function(index, layero) {//取消
				                
				            }
			       		});

				        //文件上传change事件
				        $("input[name=uploadfile][type=file]").on("change", function (e) {
				            var filePath = $(this).val();
				            filePath = filePath.substring(filePath.lastIndexOf("\\")+1);
				            $("#uploadFileName").text(filePath);
				        });
				}else if(obj.event === 'uploadto'){
				    layui.layer.open({
			            title: "名单上传",
			            content: $('#upload_file_dialog').html(),
			            area: ['500px', '300px'],
			            btn: ['发送', '取消'],
			            yes: function (index, layero) {//发送
			                var f = document.getElementById("Userfile").files;
			                if(f.length<=0){
			                	layui.layer.alert("请选择文件!");
			                	return;
			                }
			                var fd = new FormData();
							fd.append("file",f[0]);
							fd.append("Constom_id",data.freeco_id);
							$.ajax({
								url:'<%=request.getContextPath()%>/Constom/importUsertoo',
								type:'post',
								encType: 'multipart/form-data', //表明上传类型为文件
								processData: false,  //tell jQuery not to process the data
			        			contentType: false,  //tell jQuery not to set contentType
								data:fd,
								success:function(data){
									if(data.success == true){
										if(data.message == "5"){
											layer.alert("上传成功!");
										}
									}
									else if(data.message == "4"){
										layer.alert("excel存在身份证重复!");
									}else if(data.message == "2"){
										layer.alert(" execl无数据!");
									}
								},
								error:function(data){

								}
							})
			            },
			            btn2:function(index, layero) {//取消
			                
			            }
		       		});

			        //文件上传change事件
			        $("input[name=uploadfile][type=file]").on("change", function (e) {
			            var filePath = $(this).val();
			            filePath = filePath.substring(filePath.lastIndexOf("\\")+1);
			            $("#uploadFileName").text(filePath);
			        });
			}
			  });
			  var $ = layui.$, active = {
			    reload: function(){
			    var demoReload = $('#demoReload');
			    var status = $("#firstObj").val();
				var category = $("#secondObj").val();
				if(status == '未审核'){
					status = 0;
				}else if(status == '未通过'){
					status = 2;
				}else if(status == '已通过'){
					status = 1;
				}else if(status == '开课中'){
					status = 3;
				}else if(status == '已结课'){
					status = 4;
				}else if(status == '全部'){
					status = "";
				}
		        if(category=="全部"){
					category = "";
				}else if(category=="方案定制"){
					category = 0;
				}else if(category=="课程定制"){
					category = 1;
				}else if(category=="自由定制"){
					category = 2;
				}
			      //执行重载
			      table.reload('testReload', {
			        page: {
			          	curr: 1 //重新从第 1 页开始
			        },
			        method:'post',
			        where: {
		        	    caogery:category,
						status:status
			        }
			      });
			    }
			  };
			  
			  $('.demoTable .layui-btn').on('click', function(){
			    var type = $(this).data('type');
			    active[type] ? active[type].call(this) : '';
			  });
			});
			
			
			function addBranch(obj){
				var sText = obj.innerHTML;
				if(sText=='新增'){
					layui.use('layer',function(){
			        	var $ = layui.jquery,
			        	layer = layui.layer;
			        	layer.open({
					        type: 2, //此处以iframe举例
					        title: '新增',
					        area: ['70%', '530px'],
					        shade: 0,
					        maxmin: true,
					        offset: ['10%', '15%'] ,
					        content: 'openPage/addCustomProject.jsp',
					        zIndex: layer.zIndex, //重点1
					        success: function(layero){
					          layer.setTop(layero); //重点2
					        }
					    });
			        })
				}/* else if(sText=='查看'){
					layui.use('layer',function(){
			        	var $ = layui.jquery,
			        	layer = layui.layer;
			        	layer.open({
					        type: 2, //此处以iframe举例
					        title: '查看',
					        area: ['1063px', '530px'],
					        shade: 0,
					        maxmin: true,
					        offset: [100,200] ,
					        content: 'openPage/addCustomProject.html',
					        zIndex: layer.zIndex, //重点1
					        success: function(layero){
					          layer.setTop(layero); //重点2
					        }
					    });
			        })
				}else if(sText=='修改'){
					layui.use('layer',function(){
			        	var $ = layui.jquery,
			        	layer = layui.layer;
			        	layer.open({
					        type: 2, //此处以iframe举例
					        title: '修改',
					        area: ['1063px', '530px'],
					        shade: 0,
					        maxmin: true,
					        offset: [100,200] ,
					        content: 'openPage/addCustomProject.html',
					        zIndex: layer.zIndex, //重点1
					        success: function(layero){
					          layer.setTop(layero); //重点2
					        }
					    });
			        })
				}
				*/
				
			} 
		</script>
		<script type="text/html" id="barDemo">
			{{#  if(d.freeco_status == '0'){ }}
		        <a class="" lay-event="show" style="margin-right:10px; cursor: pointer;">查看</a>
				<a class="" lay-event="edit" style="margin-right:10px; cursor: pointer;">修改</a>
				<a class="" lay-event="cancel" style="margin-right:10px; cursor: pointer;">取消定制</a>
	        {{#  } else if(d.freeco_status == "2"){ }}
				<a class="" lay-event="show" style="margin-right:10px; cursor: pointer;">查看</a>
				<a class="" lay-event="delete" style="margin-right:10px; cursor: pointer;">删除</a>
			{{#  } else if(d.freeco_status == "1"){ }}
					{{#  if(d.freeco_numfile == '0'){ }}
						<a class="" lay-event="show" style="margin-right:10px; cursor: pointer;">查看</a>
						<a class="" lay-event="upload" style="margin-right:10px; cursor: pointer;">提交名单</a>
						<input type="file" lay-type="file" id="xxxxx" name="file" class="layui-upload-file">
					{{#  } else if(d.freeco_numfile == "1"){ }}
						<a class="" lay-event="show" style="margin-right:10px; cursor: pointer;">查看</a>
						<a class="" lay-event="uploadto" style="margin-right:10px; cursor: pointer;">重新上传名单</a>
						<a class="" lay-event="download" style="margin-right:10px; cursor: pointer;" href="<%=request.getContextPath()%>/Constom/exportUser/{{d.freeco_id}}">下载名单</a>
					{{#  } }}
			{{#  } else if(d.freeco_status == "3"){ }}
				<a class="" lay-event="show" style="margin-right:10px; cursor: pointer;">查看</a>
				<a class="" lay-event="download" style="margin-right:10px; cursor: pointer;" href="<%=request.getContextPath()%>/Constom/exportUser/{{d.freeco_id}}">下载名单</a>
			{{#  } else if(d.freeco_status == "4"){ }}
				<a class="" lay-event="show" style="margin-right:10px; cursor: pointer;">查看</a>
				<a class="" lay-event="download" style="margin-right:10px; cursor: pointer;" href="<%=request.getContextPath()%>/Constom/exportUser/{{d.freeco_id}}">下载名单</a>
				<a class="" lay-event="delete" style="margin-right:10px; cursor: pointer;">删除</a>
			{{#  } }}
		</script>
		<script>
			window.onload = function(){
				<% if(user == null||!"0".equals(caogery)){%>
					
					window.open('<%=request.getContextPath()%>/admin/login.jsp','_self');				
				<%}%>
				var treeUls = document.getElementsByClassName('menu_tree');
				treeUls[0].setAttribute('style','display: block;');
				treeUls[1].setAttribute('style','display: block;');
				treeUls[2].setAttribute('style','display: block;');
			};
		</script>

		<script type="text/html" id="typestatus">
	     {{#  if(d.freeco_status == "0"){ }}
	                            未审核
	     {{#  }else if(d.freeco_status=="1"){ }}
	     	审核通过
	     {{#  }else if(d.freeco_status=="2"){ }}
	     	审核未通过
	     {{#  }else if(d.freeco_status=="3"){ }}
	     	开班中
	     {{#  }else if(d.freeco_status=="4"){ }}
	     	已结课
	     {{# } }}
 		</script>
 		<script type="text/html" id="typecaogery">
	     {{#  if(d.freeco_gaoery == "0"){ }}
	        方案定制
	     {{#  }else if(d.freeco_gaoery=="1"){ }}
	     	课程定制
	     {{#  }else if(d.freeco_gaoery=="2"){ }}
	     	自由定制
	     {{# } }}
 		</script>
 		<script type="text/html" id="typedatanum">
	     {{#  if(d.freeco_datanum!=null){ }}
	        {{d.freeco_datanum}}
	     {{#  }else{ }}
	     	{{#  if(d.freeco_gaoery == "1"){ }}
	        	{{d.freeco_day}}
		     {{#  }else if(d.freeco_gaoery=="0"){ }}
		     	待定
		     {{# } }}
	     	
	     {{# } }}
 		</script>


 		<script id="upload_file_dialog" type="text/html">
		     <div class="layui-form-item">
		        <label class="layui-form-label" style="display:none;">名单上传</label>
		        <div class="layui-input-block" style="margin-left:0;">
		            <button type="button" class="layui-btn" onclick="$('input[name=uploadfile]').click();" style="background-color:#1e9fff;border-radius:5px;font-size:12px;">
		                <i class="layui-icon">&#xe67c;</i>上传名单
		            </button>
					<button href="../../../../show/dist/doc/学员名单上传1218.xlsx" class="layui-btn" style="background-color:#1e9fff;border-radius:5px;font-size:12px;">
						<a href="../../../../show/dist/doc/1218.xlsx" style="font-size: 12px;line-height: 24px;color: #FFFFFF;">下载名单模板</a>
					</button>
		        	<label class="layui-form-label" style="color:#000;width:90px;float:inherit;" id="uploadFileName">文件名</label>
		            <input type="file" name="uploadfile" style="display: none;" id="Userfile"/>
		        </div>
		    </div>
		</script>
	</body>

</html>