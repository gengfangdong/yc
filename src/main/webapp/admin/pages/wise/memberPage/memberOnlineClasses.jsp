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
											<a href="memberCustomProject.jsp"><i class="fa fa-square-o"></i> 定制项目</a>
										</li>
										<li>
											<a href="memberRegulationClasses.jsp"><i class="fa fa-square-o"></i> 规定班次</a>
										</li>
										<li>
											<a href="memberOnlineClasses.jsp" style="color: #FFFFFF;"><i class="fa fa-square-o"></i> 在线拼班</a>
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
					<h1>我的项目 <small>在线拼班</small></h1>
					<ol class="breadcrumb">
						<li><i class="fa fa-dashboard"></i> 首页</li>
						<li> 我的项目</li>
						<li class="active">在线拼班</li>
					</ol>
				</section>
				
				<section class="content">
					<div class="row">
						<div class="col-xs-12">
							<div class="box">
								<div class="box-body" style="padding: 0px;">
									<div class="row">
										<div class="col-sm-12">
											<!-- <ul class="f-sort-ul">
												<li><button href="#" class="add" onclick="addBranch(this);">新增</button></li>
											</ul> -->
											<div class="form-group" style="margin-top: 5px;height: 32px;line-height: 32px;">
												<div class="demoTable">
													<button href="#" class="add layui-btn" onclick="addBranch(this);" style="margin-left:15px;margin-top:3px;">新增</button>
												  <!-- 搜索ID： -->
												  <div class="layui-inline selectObj">
												   <!--  <input class="layui-input" name="id" id="demoReload" autocomplete="off"> -->
												    <label for="" class="control-label" style="float: left;">班次状态：</label>
													<select id="firstObj" class="select"  style="min-width: 150px;border-radius: 5px;border: 1px solid #cccccc;">
												        <option value="全部">全部</option>
												        <option value="待审核">待审核</option>
												        <option value="审核未通过">审核未通过</option>
												        <option value="审核通过">审核通过</option>
												        <option value="报名未开始">报名未开始</option>
												        <option value="报名进行中">报名进行中</option>
												        <option value="待开课">待开课</option>
												        <option value="开课中">开课中</option>
												        <option value="已结课">已结课</option>
												   </select>
												  </div>
												  <div class="layui-inline selectObj">
												    <label for="" class="control-label" style="float: left;">是否已报名：</label>
													<select id="secondObj" class="select" style="min-width: 150px;border-radius: 5px;border: 1px solid #cccccc;">
												        <option value="全部">全部</option>
												        <option value="已报名">已报名</option>
												        <option value="未报名">未报名</option>
												   </select>
												  </div>
												  <button class="layui-btn selectBtn" data-type="reload">搜索</button>
												</div>
											</div> 
											<div class="row" >
												<div class="col-sm-12 col-md-12">
													<div id="myTabContent" class="tab-content common-inline" style="padding-top: 0;">
														<div class="tab-pane fade in active" id="taxpayerAnalysis">
															<div class="row">
																<div class="col-sm-12 col-md-12">
																	<!-- <div class="form-group" style="width: 100%;margin-top: 5px;height: 32px;line-height: 32px;margin-bottom: 0;">
																		<div class="col-sm-10" style="height: 32px;line-height: 32px;">
																			<ul class="f-sort-ul">
																				<li><button href="#" class="add" onclick="addBranch(this);">新增</button></li>
																			</ul>
																		</div>
																	</div> -->
																	<div class="row">
																		<div class="col-sm-12 col-md-12">
																			<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 10px;padding-right: 10px;">
																				<table id="LAY_table_user"  lay-filter="user" class="table table-bordered table-hover example1_x" style="margin-top: 20px!important;">
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
		
		<script>
		layui.use('table', function(){
			var table = layui.table;
		  
		  //方法级渲染
		  table.render({
		    elem: '#LAY_table_user',
		    url: '<%=request.getContextPath()%>/FigClass/LayFig',
		    cols: [[
			  {type:'numbers',title:"序号",minWidth:90},
		      {field:'figClass_name', title: '班级名称',minWidth:140},
		      {field:'figClass_start', title: '报名开始时间',minWidth:160},
		      {field:'figClass_end', title: '报名截止时间',minWidth:160},
		      {field:'figClass_class_start', title: '开课日期',minWidth:120},
		      {field:'figClass_class_end', title: '结课日期',minWidth:120},
		      {field:'figClass_pernum', title: '班级容纳人数',minWidth:160},
		      {field:'figClass_number', title: '可拼人数',minWidth:120},
		      {field:'figClass_status', title: '班次状态',templet:'#typestatus',minWidth:120},
		      {field:'user_status', title: '是否已报名',templet:'#typeuserstatus',minWidth:120},
		      {field:'figClass_id', title: '操作',toolbar: '#barDemo',minWidth:200}
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
					area: ['70%', '530px'],
					shade: 0,
					maxmin: true,
					offset: [100, 200],
					content: 'openPage/showOnlieClasses.jsp?figClass_id='+data.figClass_id,
					zIndex: layer.zIndex, //重点1
					success: function(layero) {
						layer.setTop(layero); //重点2
					}
				});
		    }else if(obj.event === 'cancel'){
		      	layer.confirm('确认取消报名?', function(index){
		      		$.ajax({
						url : '<%=request.getContextPath()%>/FigClass/cancel',
						type : 'post',
						dataType:"json",
						data:{
							Figclass_id:data.figClass_id
						},
						success : function(data) {
							if(data.message == "0"){
								layer.confirm('参数错误!', { title:'提示'}, function(index){
									  
									window.parent.location.reload();
									var index1 = parent.layer.getFrameIndex(window.name);
									parent.layer.close(index1);
									console.log(error);
								});
							}
							else if(data.message == "1"){
								
								layer.confirm('获取班次名称失败!', { title:'提示'}, function(index){
									  
									window.parent.location.reload();
									var index1 = parent.layer.getFrameIndex(window.name);
									parent.layer.close(index1);
									console.log(error);
								});
							}
							else if(data.message == "2"){
								
								layer.confirm('取消成功!', { title:'提示'}, function(index){
									  
									window.parent.location.reload();
									var index1 = parent.layer.getFrameIndex(window.name);
									parent.layer.close(index1);
									console.log(error);
								});
							}
						},
						error : function(error) {
							console.log('接口不通' + error);
						}
					});	
		        layer.close(index);
		      });
		    }else if(obj.event === 'delete'){
		      	layer.confirm('确认取消拼班?', function(index){
		      		$.ajax({
						url : '<%=request.getContextPath()%>/FigClass/deleteFig/'+data.figClass_id,
						type : 'post',
						dataType:"json",
						success : function(data) {
							if(data.message == "0"){
								layer.confirm('参数错误!', { title:'提示'}, function(index){
									  
									window.parent.location.reload();
									var index1 = parent.layer.getFrameIndex(window.name);
									parent.layer.close(index1);
								});
							}
							else if(data.message == "1"){
								
								layer.confirm('获取班次名称失败!', { title:'提示'}, function(index){
									  
									window.parent.location.reload();
									var index1 = parent.layer.getFrameIndex(window.name);
									parent.layer.close(index1);
								});
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
					area: ['1063px', '530px'],
					shade: 0,
					maxmin: true,
					offset: [100, 200],
					content: 'openPage/editOnlieClasses.jsp?figClass_id='+data.figClass_id,
					zIndex: layer.zIndex, //重点1
					success: function(layero) {
						layer.setTop(layero); //重点2
					}
				});
		    }else if(obj.event === 'update'){
		    	layer.open({
					type: 2, //此处以iframe举例
					title: '上传名单',
					area: ['1063px', '530px'],
					shade: 0,
					maxmin: true,
					offset: [100, 200],
					content: 'openPage/updateOnlieClasses.jsp?figClass_id='+data.figClass_id,
					zIndex: layer.zIndex, //重点1
					success: function(layero) {
						layer.setTop(layero); //重点2
					}
				});
		    }else if(obj.event === 'Userupload'){
					    layui.layer.open({
				            title: "文件上传",
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
								fd.append("figClass_id",data.figClass_id);
								$.ajax({
									url:'<%=request.getContextPath()%>/FigClass/importUser',
									type:'post',
									encType: 'multipart/form-data', //表明上传类型为文件
									processData: false,  //tell jQuery not to process the data
				        			contentType: false,  //tell jQuery not to set contentType
									data:fd,
									success:function(data){
										if(data.success == true){
											if(data.message == "5"){
												
												layer.confirm('上传成功!', { title:'提示'}, function(index){
													  
													window.parent.location.reload();
													var index1 = parent.layer.getFrameIndex(window.name);
													parent.layer.close(index1);
													console.log(error);
												});
											}
										}
										else if(data.message == "4"){

											layer.confirm('excel存在身份证重复!', { title:'提示'}, function(index){
												  
												window.parent.location.reload();
												var index1 = parent.layer.getFrameIndex(window.name);
												parent.layer.close(index1);
												console.log(error);
											});
										}else if(data.message == "2"){
											layer.confirm('excel无数据!', { title:'提示'}, function(index){
												  
												window.parent.location.reload();
												var index1 = parent.layer.getFrameIndex(window.name);
												parent.layer.close(index1);
												console.log(error);
											});
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
			var isEntry = $("#secondObj").val();
			if(status == '待审核'){
				status = '0';
			}else if(status == '审核未通过'){
				status = '2';
			}else if(status == '审核通过'){
				status = '1';
			}else if(status == '报名未开始'){
				status = '3';
			}else if(status == '报名进行中'){
				status = '4';
			}else if(status == '待开课'){
				status = '5';
			}else if(status == '开课中'){
				status = '6';
			}else if(status == '已结课'){
				status = '7';
			}else if(status == '全部'){
				status = "";
			}
	        if(isEntry=="全部"){
				isEntry = "";
			}else if(isEntry=="未报名"){
				isEntry = '0';
			}else if(isEntry=="已报名"){
				isEntry = '1';
			}
		      //执行重载
		      table.reload('testReload', {
		        page: {
		          	curr: 1 //重新从第 1 页开始
		        },
		        method:'post',
		        where: {
	        	    status:status,
					isbm:isEntry
		        }
		      });
		    }
		  };
		  
		  $('.demoTable .layui-btn').on('click', function(){
		    var type = $(this).data('type');
		    active[type] ? active[type].call(this) : '';
		  });
		});
		
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
			function addBranch(obj){
				var sText = obj.innerHTML;
				if(sText=='新增'){
					layui.use('layer',function(){
			        	var $ = layui.jquery,
			        	layer = layui.layer;
			        	layer.open({
					        type: 2, //此处以iframe举例
					        title: '新增',
					        area: ['1063px', '530px'],
					        shade: 0,
					        maxmin: true,
					        offset: [100,'20%'] ,
					        content: 'openPage/addOnlieClasses.jsp',
					        zIndex: layer.zIndex, //重点1
					        success: function(layero){
					          layer.setTop(layero); //重点2
					        }
					    });
			        })
				}
			}
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
		<script type="text/html" id="barDemo">
			{{#  if(d.figClass_status == '0'){ }}
		        <a class="" lay-event="show" style="margin-right:10px; cursor: pointer;">查看</a>
				{{#  if(d.isdelete == '1'){ }}
					<a class="" lay-event="edit" style="margin-right:10px; cursor: pointer;">修改</a>
					<a class="" lay-event="delete" style="margin-right:10px; cursor: pointer;">取消拼班</a>
				{{#  } }}
			{{#  } else if(d.figClass_status == "2"){ }}
				<a class="" lay-event="show" style="margin-right:10px; cursor: pointer;">查看</a>
				{{#  if(d.isdelete == '1'){ }}
					<a class="" lay-event="delete" style="margin-right:10px; cursor: pointer;">删除</a>
				{{#  } }}
	        {{#  } else if(d.figClass_status == "1"){ }}
				<a class="" lay-event="show" style="margin-right:10px; cursor: pointer;">查看</a>
			{{#  } else if(d.figClass_status == "3"){ }}
				<a class="" lay-event="show" style="margin-right:10px; cursor: pointer;">查看</a>
			{{#  } else if(d.figClass_status == "4"){ }}
				{{#  if(d.user_status == '0'){ }}
			        <a class="" lay-event="show" style="margin-right:10px; cursor: pointer;">查看</a>
					<a class="" lay-event="Userupload" style="margin-right:10px; cursor: pointer;">报名</a>
	        	{{#  } else if(d.user_status == "1"){ }}
					<a class="" lay-event="show" style="margin-right:10px; cursor: pointer;">查看</a>
					<a class="" lay-event="download" style="margin-right:10px; cursor: pointer;" href="<%=request.getContextPath()%>/FigClass/exportUser/{{d.figClass_id}}">下载名单</a>
					<a class="" lay-event="cancel" style="margin-right:10px; cursor: pointer;">取消报名</a>
				{{#  } }}
			{{#  } else if(d.figClass_status == "5"){ }}
				<a class="" lay-event="show" style="margin-right:10px; cursor: pointer;">查看</a>
				{{#  if(d.user_status == "1"){ }}
					<a class="" lay-event="show" style="margin-right:10px; cursor: pointer;">查看</a>
					<a class="" lay-event="download" style="margin-right:10px; cursor: pointer;" href="<%=request.getContextPath()%>/FigClass/exportUser/{{d.figClass_id}}">下载名单</a>
				{{#  } }}
			{{#  } else if(d.figClass_status == "6"){ }}
				<a class="" lay-event="show" style="margin-right:10px; cursor: pointer;">查看</a>
				{{#  if(d.user_status == "1"){ }}
					<a class="" lay-event="show" style="margin-right:10px; cursor: pointer;">查看</a>
					<a class="" lay-event="download" style="margin-right:10px; cursor: pointer;" href="<%=request.getContextPath()%>/FigClass/exportUser/{{d.figClass_id}}">下载名单</a>
				{{#  } }}
			{{#  } else if(d.figClass_status == "7"){ }}
				<a class="" lay-event="show" style="margin-right:10px; cursor: pointer;">查看</a>
				{{#  if(d.user_status == "1"){ }}
					<a class="" lay-event="download" style="margin-right:10px; cursor: pointer;" href="<%=request.getContextPath()%>/FigClass/exportUser/{{d.figClass_id}}">下载名单</a>
				{{#  } }}
				{{#  if(d.isdelete == '1'){ }}
					<a class="" lay-event="delete" style="margin-right:10px; cursor: pointer;">删除</a>
				{{#  } }}
			{{#  } }}
		</script>

		<script type="text/html" id="typestatus">
	     {{#  if(d.figClass_status == "0"){ }}
	                            未审核
	     {{#  }else if(d.figClass_status=="1"){ }}
	     	审核通过
	     {{#  }else if(d.figClass_status=="2"){ }}
	     	审核未通过
	     {{#  }else if(d.figClass_status=="3"){ }}
	     	报名未开始
	     {{#  }else if(d.figClass_status=="4"){ }}
	     	报名中
		 {{#  }else if(d.figClass_status=="5"){ }}
	     	未开课
		 {{#  }else if(d.figClass_status=="6"){ }}
	     	开课中
		 {{#  }else if(d.figClass_status=="7"){ }}
	     	已结课
	     {{# } }}
	     </script>
	     <script type="text/html" id="typeuserstatus">
	     {{#  if(d.user_status == "0"){ }}
	        	未报名
	     {{#  }else if(d.user_status=="1"){ }}
	     		已报名
	     {{# } }}
	     </script>
	     <script id="upload_file_dialog" type="text/html">
		    <div class="layui-form-item">
		        <label class="layui-form-label">文件上传</label>
		        <div class="layui-input-block">
		            <button type="button" class="layui-btn" onclick="$('input[name=uploadfile]').click();">
		                <i class="layui-icon">&#xe67c;</i>上传文件
		            </button>
		            <input type="file" name="uploadfile" style="display: none;" id="Userfile"/>
		        </div>
		        <label class="layui-form-label" style="width: 100%; text-align: left; padding-left: 110px;color:red;"
		            id="uploadFileName">
		            文件上传</label>
		    </div>
		</script>
	</body>

</html>