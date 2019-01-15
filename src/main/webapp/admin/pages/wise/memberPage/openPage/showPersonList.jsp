<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="entity.IUser" %>
<%
	IUser user = (IUser)session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<%
	String euser_id = request.getParameter("euser_id");	
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
			.layui-this{
				color: #0066CC;
			}
			#taxTab{
				background-color: #FFFFFF;
				height: 42px;
			}
			#taxTab li{
				border:1px;
				border-style: solid;
				border-color:#fff #eee #e6e6e6;
			}
			#taxTab li:hover{
				background-color: #ecf0f5;
			}
			#taxTab li a{
				height: 40px;
			}
			#taxTab li a:hover{
				background-color: #ecf0f5;
				border: none;
				color: #222222;
			}
			.layui-this a{
				color: #555555;
			}
		</style>
	</head>
	<body>
		<div>
			<div class="row" >
				<div class="col-sm-12 col-md-12 layui-tab layui-tab-card">
			    	<div class="row">
						<div class="col-sm-12 col-md-12">
							<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 10px;padding-right: 10px;">
								<table id="branchTable" class="table table-bordered table-hover example1_x">
									<tbody>
										<tr>
											<td class="leftTd">姓名:<span style="color:red;">*</span></td>
											<td class="rightTd">
												<input type="text" id="personName" />
											</td>
											
										</tr>
										<tr>
											<td class="leftTd">单位:<span style="color:red;">*</span></td>
											<td class="rightTd">
												<input type="text" id="company" />
											</td>
											
										</tr>
										<tr>
											<td class="leftTd">部门:<span style="color:red;">*</span></td>
											<td class="rightTd">
												<input type="text" id="department" />
											</td>
											
										</tr>
										<tr>
											<td class="leftTd">职务:<span style="color:red;">*</span></td>
											<td class="rightTd">
												<input type="text" id="job" />
											</td>
											
										</tr>
										<tr>
											<td class="leftTd">性别:<span style="color:red;">*</span></td>
											<td class="rightTd">
												<input type="radio" name="personSex" />男
												<input type="radio" name="personSex" />女
											</td>
										</tr>
										<tr>
											<td class="leftTd">身份证号:<span style="color:red;">*</span></td>
											<td class="rightTd">
												<input type="text" id="ID_Number" />
											</td>
										</tr>
										<tr>
											<td class="leftTd">联系方式:<span style="color:red;">*</span></td>
											<td class="rightTd">
												<input type="text" id="personPhone" />
											</td>
										</tr>
										<tr>
											<td class="leftTd">备注:<span style="color:red;">*</span></td>
											<td class="rightTd">
												<textarea style="width: 100%;height: 50px;border-radius:5px;border-color:#ccc;" id="remark"></textarea>
											</td>
										</tr>
									</tbody>
								</table>
								<div style="text-align: center;margin-top: 100px;">
									<button class="branchSave" onclick="parent.layer.close(parent.layer.getFrameIndex(window.name))">关闭</button>
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
			layui.use('element', function(){
			  	var element = layui.element;
			  
			  	//一些事件监听
			  	element.on('tab(demo)', function(data){
			    	console.log(data);
			  	});
			});
			
		</script>
		<script type="text/javascript">
			window.onload = function(){
				var EUser_name = document.getElementById("personName");
				var EUser_companyname = document.getElementById("company");
				var EUser_department = document.getElementById("department");
				var EUser_hold = document.getElementById("job");
				var EUser_sex = document.getElementsByName("personSex");
				var EUser_remark = document.getElementById("remark");
				var EUser_indentitynumber = document.getElementById("ID_Number");
				var EUser_phone = document.getElementById("personPhone");
				$.ajax({
					url:'<%=request.getContextPath()%>/EUser/getDetailByid',
					type:'post',
					data:{
						EUser_id:'<%=euser_id%>'
					},success:function(data){
						if(data.success == false){
							if(data.message == "1"){
								layer.alert("获取人员失败!");

							}
							else if(data.message == "0"){
								layer.alert("参数错误!");
							}
						}
						else if(data.success == true){
							var name=data.data.euser_name;
							var companyname = data.data.euser_companyname;
							var department = data.data.euser_department;
							var hold = data.data.euser_hold;
							var sex = data.data.euser_sex;
							var indentitynumber = data.data.euser_indentitynumber;
							var phone = data.data.euser_phone;
							var remark = data.data.euser_remark;
							EUser_name.value = name;
							EUser_companyname.value = companyname;
							EUser_department.value = department;
							EUser_hold.value = hold;
							if(sex == "0"){
								EUser_sex[0].checked = true;
							}
							else if(sex == "1"){
								EUser_sex[1].checked = true;
							}
							EUser_indentitynumber.value = indentitynumber;
							EUser_phone.value = phone;
							EUser_remark.value = remark;

						}
					},
					error:function(data){

					}
				});
			};
		</script>
	</body>
</html>
