<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="entity.IUser" %>
<%
	IUser user = (IUser)session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<%
	String ClassPlan_id = request.getParameter("ClassPlan_id");
%>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>领税教育网</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
		<link rel="stylesheet" href="../../../../admin/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="../../../../admin/layui-v2.3.0/layui/css/layui.css">
		<!-- DataTables -->
		<!-- <link rel="stylesheet" href="../../plugins/DataTables-1.10.15/media/css/jquery.dataTables.min.css"> -->
		<link rel="stylesheet" href="../../../../admin/plugins/DataTables-1.10.15/media/css/dataTables.bootstrap.min.css">
		<!-- zTree -->
		<link rel="stylesheet" href="../../../../admin/zTree_v3/css/zTreeStyle/zTreeStyle.css">

		<!-- Font Awesome -->
		<link rel="stylesheet" href="../../../../admin/css/font-awesome-4.7.0/css/font-awesome.min.css">
		<!-- Ionicons -->
		<link rel="stylesheet" href="../../../../admin/css/ionicons-2.0.1/css/ionicons.min.css">
		<!-- jvectormap -->
		<link rel="stylesheet" href="../../../../admin/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
		<!-- Theme style -->
		<link rel="stylesheet" href="../../../../admin/dist/css/AdminLTE.css">
		<!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
		<link rel="stylesheet" href="../../../../admin/dist/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="../../../../admin/bootstrap/css/style.css">
		<link rel="stylesheet" href="../../../../admin/layui-v2.3.0/layui/css/modules/layer/default/layer.css">
		<link rel="stylesheet" href="../../../../admin/css/myStyle.css">
		<style type="text/css">
			.layui-this {
				color: #0066CC;
			}

			#taxTab {
				background-color: #FFFFFF;
				height: 42px;
			}

			#taxTab li {
				border: 1px;
				border-style: solid;
				border-color: #fff #eee #e6e6e6;
			}

			#taxTab li:hover {
				background-color: #ecf0f5;
			}

			#taxTab li a {
				height: 40px;
			}

			#taxTab li a:hover {
				background-color: #ecf0f5;
				border: none;
				color: #222222;
			}

			.layui-this a {
				color: #555555;
			}
		</style>
	</head>
	<body>
		<div>
			<div class="row">
				<div class="col-sm-12 col-md-12 layui-tab layui-tab-card" style="border-style: none;box-shadow: none;">
					<div class="row">
						<div class="col-sm-12 col-md-12">
							<div class="row" style="height: 30px;line-height: 30px;">
								<div class="col-sm-9 col-md-9">
									<label style="font-size: 14px; padding-left: 10px;">
										<img src="../../../../admin/image/square.png" style="margin-top: -1px;width: 12px;">
										新增
									</label>
								</div>
							</div>
							<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 10px;padding-right: 10px;">
								<table id="branchTable" class="table table-bordered table-hover example1_x">
									<tbody>
										<tr>
											<td class="leftTd">课程方案名称:</td>
											<td class="rightTd" colspan="2">
												 <input type="text" id="classesName" style="width: 100%;background:#fff;" disabled="disabled" /> 
											</td>

										</tr>
										
										<tr>
											<td class="leftTd" style="vertical-align: middle;">内容:</td>
											<td class="rightTd" colspan="2" id="newsDescription">
												
											</td>
										</tr>
										
									</tbody>
								</table>
								<div style="text-align: center;margin-top: 0px;">
									<button class="picSave" onclick="parent.layer.close(parent.layer.getFrameIndex(window.name))">关闭</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- jQuery 2.1.4 -->
		<script src="../../../../admin/plugins/jQuery/jQuery-2.1.4.min.js"></script>
		<!-- Bootstrap 3.3.5 -->
		<script src="../../../../admin/bootstrap/js/bootstrap.min.js"></script>
		<!-- layui 2.3.0 -->
		<script src="../../../../admin/layui-v2.3.0/layui/layui.js"></script>
		<script src="../../../../admin/layui-v2.3.0/layui/lay/modules/layer.js"></script>
		<!-- DataTables -->
		<script src="../../../../admin/plugins/DataTables-1.10.15/media/js/jquery.dataTables.min.js"></script>
		<script src="../../../../admin/plugins/DataTables-1.10.15/media/js/dataTables.bootstrap.min.js"></script>
		<!-- zTree -->
		<script src="../../../../admin/zTree_v3/js/jquery.ztree.core.js"></script>
		<script src="../../../../admin/zTree_v3/js/jquery.ztree.excheck.js"></script>

		<!-- Slimscroll -->
		<script src="../../../../admin/plugins/slimScroll/jquery.slimscroll.min.js"></script>
		<!-- FastClick -->
		<script src="../../../../admin/plugins/fastclick/fastclick.min.js"></script>
		<!-- AdminLTE App -->
		<script src="../../../../admin/dist/js/app.min.js"></script>
		<script type="text/javascript" src="../../../../admin/My97DatePicker/WdatePicker.js"></script>
		<!-- AdminLTE for demo purposes -->
		<script src="../../../../admin/dist/js/demo.js"></script>
		<script src="../../../../admin/pages/wise/ckeditor/ckeditor.js"></script>
		<script src="../../../../admin/layui-v2.3.0/layui/layui.js"></script>
		<script type="text/javascript">
			layui.use('element', function() {
				var element = layui.element;

				//一些事件监听
				element.on('tab(demo)', function(data) {
					console.log(data);
				});
			});
		</script>
		<script>
			layui.use('upload', function() {
				var upload = layui.upload;

				//执行实例
				var uploadInst = upload.render({
					elem: '#test1', //绑定元素
					url: '/upload/', //上传接口
					done: function(res) {
						//上传完毕回调
					},
					error: function() {
						//请求异常回调
					}
				});

				var uploadInst = upload.render({
					elem: '#test2', //绑定元素
					url: '/upload/', //上传接口
					done: function(res) {
						//上传完毕回调
					},
					error: function() {
						//请求异常回调
					}
				});

				var uploadInst = upload.render({
					elem: '#test3', //绑定元素
					url: '/upload/', //上传接口
					done: function(res) {
						//上传完毕回调
					},
					error: function() {
						//请求异常回调
					}
				});
				var uploadInst = upload.render({
					elem: '#test4', //绑定元素
					url: '/upload/', //上传接口
					done: function(res) {
						//上传完毕回调
					},
					error: function() {
						//请求异常回调
					}
				});
			});
		</script>
		
		<script type="text/javascript">
			 window.onload = function(){
        		//CKEDITOR.replace('newsDescription');
        		var classplanname = document.getElementById("classesName");
        		//var classescontext = CKEDITOR.instances.newsDescription;
        		$.ajax({
        			url:'<%=request.getContextPath()%>/ClassPlan/getClassPlandetailByid',
        			type:'POST',
        			data:{
        				"ClassPlan_id":'<%=ClassPlan_id%>'
        			},
        			success:function(data){
        				if(data.success== true){
							if(data.message == "0"){
								layer.alert("参数错误!");
							}else if(data.message == "0"){
								layer.alert("请求错误!");
							}
							else{
								var classPlanname = data.data.classplan_name;
								var classPlancontext = data.data.classplan_context;
								classplanname.value=classPlanname;
								//classescontext.setData(classPlancontext);
								document.getElementById("newsDescription").innerHTML=classPlancontext;
							}

						}
        			},error:function(data){

        			}
        		})
   	 		};
		</script>

	</body>
</html>
