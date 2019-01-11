<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
	String figClass_id = request.getParameter("figClass_id");
	String number = request.getParameter("number");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>中央财经大学</title>
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
			.disabledStyle{
				background-color:#FFFFFF;
				border:1px solid #ccc;
				border-radius: 5px;
				height:23px;
			}
			#downLoad{
				color:#fff;
				margin-left:10px;
				margin-right:10px;
			}
			#downLoad:hover{
				color:#FFF!important;
			}
			#numOfParticipants,#contactPersonName,#contactPhone,#contactWorkTel,#companyInformation{
				border:none;
				border:1px solid #ccc;
				border-radius:5px;
				height:23px;
			}
		</style>
	</head>
	<body>
		<div>
			<div class="row">
				<div class="col-sm-12 col-md-12 layui-tab layui-tab-card" style="border-style: none;box-shadow: none;">
					<div class="row">
						<div class="col-sm-12 col-md-12">
							<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 10px;padding-right: 10px;">
								<table id="branchTable" class="table table-bordered table-hover example1_x">
									<tbody>
										<tr>
											<td class="leftTd">参加培训人数:<span style="color:red;">*</span></td>
											<td class="rightTd" colspan="2">
												<input type="text" id="numOfParticipants" placeholder="" style="width: 100%;"   />
											</td>
										</tr>
										<tr>
											<td class="leftTd">联系人姓名:<span style="color:red;">*</span></td>
											<td class="rightTd" colspan="2">
												<input type="text" id="contactPersonName" placeholder="请输入联系人姓名" style="width: 100%;"   />
											</td>
										</tr>
										<tr>
											<td class="leftTd">联系人联系方式:<span style="color:red;">*</span></td>
											<td class="rightTd" colspan="2">
												<input type="text" id="contactPhone" placeholder="请输入联系人联系方式" style="width: 100%;"   />
											</td>
										</tr>
										<tr>
											<td class="leftTd">联系人办公电话:<span style="color:red;">*</span></td>
											<td class="rightTd" colspan="2">
												<input type="text" id="contactWorkTel" placeholder="请输入联系人办公电话" style="width: 100%;"   />
											</td>
										</tr>
										<tr>
											<td class="leftTd">单位信息:<span style="color:red;">*</span></td>
											<td class="rightTd" colspan="2">
												<input type="text" id="companyInformation" placeholder="请输入单位信息" style="width: 100%;"   />
											</td>
										</tr>
									</tbody>
								</table>
								<div style="text-align: center;margin-top: 0px;">
									<button class="picSave" onclick="Baoming();">保存</button>
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
			function Baoming(){
				var number = document.getElementById("numOfParticipants").value;
				var name = document.getElementById("contactPersonName").value;
	        	var workPhone = document.getElementById("contactWorkTel").value;
	        	var phone = document.getElementById("contactPhone").value;
	        	var department = document.getElementById("companyInformation").value;
				var testTel = /([0-9]{3,4}-)?[0-9]{7,8}$/;//办公电话
				var testPhone = /^1\d{10}$/;//手机
	        	if(number==""){
	        		alert("请输入参加培训的人数！");
	        		return;
	        	}else if(number<0){
	        		alert('请输入大于0的人数！');
	        		return;
	        	}
	        	if(name==""){
	        		alert("请输入联系人姓名！");
	        		return;
	        	}
	        	if(workPhone==""){
	        		alert("请输入联系方式！");
	        		return;
	        	}else if(testTel.test(workPhone)==false){
					alert("请填写有效的办公电话！");
					return;
				}
	        	if(phone==""){
	        		alert("请输入联系人电话！");
	        		return;
	        	}else if(testPhone.test(phone)==false){
					alert("请填写有效的手机号！");
					return;
				}
	        	if(department==""){
	        		alert("请输入单位信息！");
	        		return;
	        	}
	        	var fd = new FormData();
    			fd.append('figClass_id', '<%=figClass_id%>');
    			fd.append('Fiu_number', number);
    			fd.append('Fiu_username', name);
    			fd.append('Fiu_ydphone', phone);
    			fd.append('Fiu_phone', workPhone);
    			fd.append('Fiu_department', department);
				$.ajax({
					url:'<%=request.getContextPath()%>/FigClass/apply',
					type:'post',
					encType: 'multipart/form-data', //表明上传类型为文件
					processData: false,  //tell jQuery not to process the data
        			contentType: false,  //tell jQuery not to set contentType
					data:fd,
					success:function(data){
						if(data.success == true){
							if(data.message == "2"){
								layer.confirm('报名成功!', { title:'提示'}, function(index){
									  
									window.parent.location.reload();
									var index1 = parent.layer.getFrameIndex(window.name);
									parent.layer.close(index1);
									
								});
							}
						}
						else{
							if(data.message == "0"){
								layer.alert("未登录!");
							}else if(data.message == "1"){
								layer.alert("班次不存在!");
							}else if(data.message == "2"){
								layer.alert("人数超过限制!");
							}else if(data.message == "3"){
								layer.alert("报名失败!");
							}

						}
					},
					error:function(data){
						layer.alert("保存失败!");
					}
				})
		}
		</script>
	</body>
</html>
