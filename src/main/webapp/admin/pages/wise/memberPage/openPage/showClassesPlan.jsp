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
		<link rel="icon" href="../../../../image/logo.ico" type="image/x-icon"/>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
		<link rel="stylesheet" href="../../../../bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="../../../../layui-v2.3.0/layui/css/layui.css">
		<!-- DataTables -->
		<!-- <link rel="stylesheet" href="../../plugins/DataTables-1.10.15/media/css/jquery.dataTables.min.css"> -->
		<link rel="stylesheet" href="../../../../plugins/DataTables-1.10.15/media/css/dataTables.bootstrap.min.css">
		<!-- zTree -->
		<link rel="stylesheet" href="../../../../zTree_v3/css/zTreeStyle/zTreeStyle.css">

		<!-- Font Awesome -->
		<link rel="stylesheet" href="../../../../css/font-awesome-4.7.0/css/font-awesome.min.css">
		<!-- Ionicons -->
		<link rel="stylesheet" href="../../../../css/ionicons-2.0.1/css/ionicons.min.css">
		<!-- jvectormap -->
		<link rel="stylesheet" href="../../../../plugins/jvectormap/jquery-jvectormap-1.2.2.css">
		<!-- Theme style -->
		<link rel="stylesheet" href="../../../../dist/css/AdminLTE.css">
		<!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
		<link rel="stylesheet" href="../../../../dist/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="../../../../bootstrap/css/style.css">
		<link rel="stylesheet" href="../../../../layui-v2.3.0/layui/css/modules/layer/default/layer.css">
		<link rel="stylesheet" href="../../../../css/myStyle.css">
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
										<img src="../../../../image/square.png" style="margin-top: -1px;width: 12px;">
										查看
									</label>
								</div>
							</div>
							<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 10px;padding-right: 10px;">
								<table id="branchTable" class="table table-bordered table-hover example1_x">
									<tbody>
										<tr>
											<td class="leftTd">课程方案名称:</td>
											<td class="rightTd" colspan="2">
												 <input type="text" id="classesName" style="width: 100%;" disabled="disabled" /> 
												<!--<select id="catalog" class="select" style="min-width: 150px;border-radius: 5px;border: 1px solid #cccccc;">
													<option value="课程方案一">课程方案一</option>
													<option value="课程方案二">课程方案二</option>
												</select>-->
											</td>

										</tr>
										
										<tr>
											<td class="leftTd" style="vertical-align: middle;">内容:</td>
											<td class="rightTd" colspan="2">
												<textarea name="description" id="newsDescription" disabled="disabled" /></textarea>
											</td>
										</tr>
										<!--<tr>
											<td class="leftTd">所属课程大纲:</td>
											<td class="rightTd" colspan="2">
												<select id="catalog" class="select" style="min-width: 150px;border-radius: 5px;border: 1px solid #cccccc;">
													<option value="课程大纲一">课程大纲一</option>
													<option value="课程大纲二">课程大纲二</option>
												</select>
											</td>

										</tr>
										<tr>
											<td class="leftTd">所属课程内容:</td>
											<td class="rightTd" colspan="2">
												<select id="catalog" class="select" style="min-width: 150px;border-radius: 5px;border: 1px solid #cccccc;">
											        <option value="内容一">内容一</option>
											        <option value="内容二">内容二</option>
											    </select>
											</td>

										</tr>-->
										<!--<tr>
											<td class="leftTd">名称:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="classesName" style="width: 100%;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">天数:</td>
											<td class="rightTd" colspan="2">
												&lt;!&ndash; <input type="text" id="hostDateNum" style="width: 100%;" /> &ndash;&gt;
												<select id="dateNum" class="select" style="min-width: 150px;border-radius: 5px;border: 1px solid #cccccc;">
											        <option value="halfDay">0.5天</option>
											        <option value="oneDay">1天</option>
											        <option value="oneHalfDay">1.5天</option>
											        <option value="twoDay">2天</option>
											    </select>
											</td>

										</tr>-->
										<!--<tr>
											<td class="leftTd">状态:</td>
											<td class="rightTd" colspan="2">
												<input type="radio" name="states" />暂停
												<input type="radio" name="states" />发布
											</td>

										</tr>-->
										
									</tbody>
								</table>
								<div style="text-align: center;margin-top: 0px;">
									<button class="picSave" onclick="">关闭</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- jQuery 2.1.4 -->
		<script src="../../../../plugins/jQuery/jQuery-2.1.4.min.js"></script>
		<!-- Bootstrap 3.3.5 -->
		<script src="../../../../bootstrap/js/bootstrap.min.js"></script>
		<!-- layui 2.3.0 -->
		<script src="../../../../layui-v2.3.0/layui/layui.js"></script>
		<script src="../../../../layui-v2.3.0/layui/lay/modules/layer.js"></script>
		<!-- DataTables -->
		<script src="../../../../plugins/DataTables-1.10.15/media/js/jquery.dataTables.min.js"></script>
		<script src="../../../../plugins/DataTables-1.10.15/media/js/dataTables.bootstrap.min.js"></script>
		<!-- zTree -->
		<script src="../../../../zTree_v3/js/jquery.ztree.core.js"></script>
		<script src="../../../../zTree_v3/js/jquery.ztree.excheck.js"></script>

		<!-- Slimscroll -->
		<script src="../../../../plugins/slimScroll/jquery.slimscroll.min.js"></script>
		<!-- FastClick -->
		<script src="../../../../plugins/fastclick/fastclick.min.js"></script>
		<!-- AdminLTE App -->
		<script src="../../../../dist/js/app.min.js"></script>
		<script type="text/javascript" src="../../../../My97DatePicker/WdatePicker.js"></script>
		<!-- AdminLTE for demo purposes -->
		<script src="../../../../dist/js/demo.js"></script>
		<script src="../../ckeditor/ckeditor.js"></script>
		<script src="../../../../layui-v2.3.0/layui/layui.js"></script>
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
			//分页
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
			});
		</script>
		
		<script type="text/javascript">
			 window.onload = function(){
        		CKEDITOR.replace('newsDescription');
        		var classplanname = document.getElementById("classesName");
        		var classescontext = CKEDITOR.instances.newsDescription;
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
								classescontext.setData(classPlancontext);
							}

						}
        			},error:function(data){

        			}
        		})
   	 		};
		</script>
		<script>
			function branchSave(){
				var classesName = document.getElementById('classesName').value;
				var classesContext = CKEDITOR.instances.newsDescription.getData();
				$.ajax({
					url:"<%=request.getContextPath()%>/ClassPlan/saveClassPlan",
					type:'POST',
					data:{
						"ClassPlan_name":classesName,
						"ClassPlan_context":classesContext
					},
					success:function(data){
						if(data.success== true){
							if(data.message == "1"){
								layer.alert("保存成功!");
							}
						}
						
					},
					error:function(data){

					}

				})
			}
		</script>

	</body>
</html>
