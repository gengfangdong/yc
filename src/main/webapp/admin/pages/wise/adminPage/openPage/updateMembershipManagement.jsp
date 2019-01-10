<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	String user_id = request.getParameter("user_id");
%>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>中央财经大学</title>
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
										会员详情
									</label>
								</div>
							</div>
							<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 10px;padding-right: 10px;">
								<table id="branchTable" class="table table-bordered table-hover example1_x">
									<tbody>
										<tr>
											<td class="leftTd">登录名称:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="signUpName" value="13312341234" style="width: 100%;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">用户姓名:<span style="color:red;">*</span></td>
											<td class="rightTd" colspan="2">
												<input type="text" id="classesName" value="赵柳" style="width: 100%;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">用户座机:<span style="color:red;">*</span></td>
											<td class="rightTd" colspan="2">
												<input type="text" id="usersTel" value="010-3456789" style="width: 100%;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">用户邮箱:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="usersEmail" value="123456789@qq.com" style="width: 100%;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">单位名称:<span style="color:red;">*</span></td>
											<td class="rightTd" colspan="2">
												<input type="text" id="unitName" value="北京市海淀区税务局" style="width: 100%;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">所在部门:<span style="color:red;">*</span></td>
											<td class="rightTd" colspan="2">
												<input type="text" id="departmentInCharge" value="财务监督处" style="width: 100%;" />
											</td>

										</tr>
										<!-- <tr>
											<td class="leftTd">任职岗位:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="userPost" value="财务监督员" style="width: 100%;" />
											</td>

										</tr> -->
										<tr>
											<td class="leftTd">担任职务:<span style="color:red;">*</span></td>
											<td class="rightTd" colspan="2">
												<input type="text" id="assumeOffice" value="财务监督" style="width: 100%;" />
											</td>

										</tr>
										<!-- <tr>
											<td class="leftTd">所在地址:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="userAddress" value="北京市海淀区税务局" style="width: 100%;" />
											</td>

										</tr> -->
										<tr>
											<td class="leftTd">输入密码:<span style="color:red;">*</span></td>
											<td class="rightTd" colspan="2">
												<input type="password" id="usersPassword" value="123456" style="width: 100%;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">确认密码:<span style="color:red;">*</span></td>
											<td class="rightTd" colspan="2">
												<input type="password" id="isPassword" value="123456" style="width: 100%;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">使用状态:<span style="color:red;">*</span></td>
											<td class="rightTd" colspan="2">
												<input type="radio" name="states" value="0" />暂停
												<input type="radio" name="states" value="1"/>使用
											</td>

										</tr>
										
									</tbody>
								</table>
								<div style="text-align: center;margin-top: 0px;">
									<button class="picSave" onclick="branchSave();">保存</button>
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
			window.onload = function(){
        		$.ajax({
				url : '<%=request.getContextPath()%>/IUser/showDetail',
				type : 'GET',
				data:{
					User_id:'<%=user_id%>'
				},
				success : function(data) {
					if(data.success == true){
						var aloginname = document.getElementById("signUpName");
						var aname = document.getElementById("classesName");
						var aphone = document.getElementById("usersTel");
						var amail = document.getElementById("usersEmail");
						var acompanyname = document.getElementById("unitName");
						var adepartment = document.getElementById("departmentInCharge");
						//var ajob = document.getElementById("userPost");
						var ahold = document.getElementById("assumeOffice");
						var aaddress = document.getElementById("userAddress");
						//var apassword = document.getElementById("usersPassword");
						var User_status = document.getElementsByName("states");

						var loginname = data.data.user_loginname;
						var name = data.data.user_name;
						var phone = data.data.user_phone;
						var mail = data.data.user_mail;
						var companyname = data.data.user_companyname;
						var department = data.data.user_department;
						//var job = data.data.user_job;
						var hold = data.data.user_hold;
						//var address = data.data.user_address;
						var password = data.data.user_password;
						var states = data.data.user_status;
						
						aloginname.value=loginname; 
						aname.value=name;
						aphone.value=phone;
						amail.value=mail;
						acompanyname.value=companyname;
						adepartment.value=department;
						//ajob.value=job;
						ahold.value=hold;
						//aaddress.value=address;
						apassword.value=password;
						if(states == "1"){
							User_status[1].checked = true;
						}
						else if(states == "0"){
							User_status[0].checked = true;
						}

					}
					
				},
				error : function(error) {
					console.log('接口不通' + error);
				}
			});	
   	 		};
		</script>

		<script>
			function branchSave(){
				var loginname = document.getElementById("signUpName").value;
				var name = document.getElementById("classesName").value;
				var phone = document.getElementById("usersTel").value;
				var mail = document.getElementById("usersEmail").value;
				var companyname = document.getElementById("unitName").value;
				var department = document.getElementById("departmentInCharge").value;
				//var job = document.getElementById("userPost").value;
				var hold = document.getElementById("assumeOffice").value;
				//var address = document.getElementById("userAddress").value;
				var password = document.getElementById("usersPassword").value;
				var User_status = document.getElementsByName("states");
				var states = "";
				if(User_status[0].checked==true){
						states = "0";
					}else if(User_status[1].checked==true){
						states = "1";
					}
				$.ajax({
					url:'<%=request.getContextPath()%>/IUser/updateIUser',
					type:'post',
					data:{
						"User_id":'<%=user_id%>',
						"User_loginname":loginname,
						"User_name":name,
						"User_phone":phone,
						"User_mail":mail,
						"User_companyname":companyname,
						"User_department":department,
						"User_job":'',
						"User_hold":hold,
						"User_address":'',
						"User_password":password,
						"User_status":states
					},
					success:function(data){
						if (data.success == true) {
							if(data.msg == "2"){
								layer.confirm('保存成功!', { title:'提示'}, function(index){				
									window.parent.location.reload();
									var index1 = parent.layer.getFrameIndex(window.name);
									parent.layer.close(index1);
								});
							}

						}
						else{
							if(data.msg == "1"){
								layer.confirm('人员不存在！', { title:'提示'}, function(index){ 
									window.parent.location.reload();
									var index1 = parent.layer.getFrameIndex(window.name);
									parent.layer.close(index1);
									console.log(error);
								});
							}else if(data.msg == "0"){
								layer.confirm('登录名已存在！', { title:'提示'}, function(index){ 
									window.parent.location.reload();
									var index1 = parent.layer.getFrameIndex(window.name);
									parent.layer.close(index1);
									console.log(error);
								});
							}
						}

					},error:function(data){
						layer.confirm('保存失败！', { title:'提示'}, function(index){ 
							window.parent.location.reload();
							var index1 = parent.layer.getFrameIndex(window.name);
							parent.layer.close(index1);
							console.log(error);
						});
					}

				})
			}
		</script>

	</body>
</html>
