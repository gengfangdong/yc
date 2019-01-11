<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
	String scheduled_id = request.getParameter("scheduled_id");
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
		<link rel="stylesheet" href=" ../../../../admin/bootstrap/css/bootstrap.min.css">
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
			#contactPersonName,#contactPhone,#contactWorkTel,#companyInformation{
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
							<div class="row" style="height: 30px;line-height: 30px;">
								<div class="col-sm-9 col-md-9">
									<label style="font-size: 14px; padding-left: 10px;">
										<img src="../../../../admin/image/square.png" style="margin-top: -1px;width: 12px;">
										基本信息
									</label>
								</div>
							</div>
							<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 10px;padding-right: 10px;">
								<table id="branchTable" class="table table-bordered table-hover example1_x">
									<tbody>
										<tr>
										<input type="hidden" name = "suuserid"/>
											<td class="leftTd">本期培训名称:</td>
											<td class="rightTd" colspan="2">
												<input type="text" value="第四期国税系统税务稽查专业骨干中级培训班" id="trainingClassesName" disabled="disabled" class="disabledStyle" style="width: 100%;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">培训开课地点:</td>
											<td class="rightTd" colspan="2">
												<input type="text" value="北京市海淀区" id="trainingVenue" disabled="disabled" class="disabledStyle" style="width: 100%;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">报名开始日期:</td>
											<td class="rightTd" colspan="2">
												<input type="text" value="2018/11/11" id="togetherClassesStartDate" disabled="disabled" class="disabledStyle" style="width: 257px;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">拼班截止日期:</td>
											<td class="rightTd" colspan="2">
												<input type="text" value="2018/12/10" id="togetherClassesEndDate" disabled="disabled" class="disabledStyle" style="width: 257px;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">预计开课日期:</td>
											<td class="rightTd" colspan="2">
												<input type="text" value="2018/12/11" id="classesStartDate" disabled="disabled" class="disabledStyle" style="width: 257px;" />
											</td>
										</tr>
										<tr>
											<td class="leftTd">预计结课日期:</td>
											<td class="rightTd" colspan="2">
												<input type="text" value="32018/12/30" id="classesEndDate" disabled="disabled" class="disabledStyle" style="width: 257px;" />
											</td>
										</tr>
										<tr>
											<td class="leftTd">班级容纳人数:</td>
											<td class="rightTd" colspan="2">
												<input type="text" value="50" id="maxClassesNumber" disabled="disabled" class="disabledStyle" style="width: 100%;" />
											</td>
										</tr>
										<tr>
											<td class="leftTd">已经报名人数:</td>
											<td class="rightTd" colspan="2">
												<input type="text" value='<%=number %>' id="enrollNumber" disabled="disabled" class="disabledStyle" style="width: 100%;" />
											</td>
										</tr>
										<tr>
											<div class="layui-upload-list">
											    <table class="layui-table">
											      <thead>
											        <tr><th>文件名</th>
											        <th>操作</th>
											      </tr></thead>
											      <tbody id="demoList"></tbody>
											    </table>
											 </div>
											 
										</tr>
									</tbody>
								</table>
							</div>
							<div class="row" style="height: 30px;line-height: 30px;">
								<div class="col-sm-9 col-md-9">
									<label style="font-size: 14px; padding-left: 24px;">
										<img src="../../../../admin/image/square.png" style="margin-top: -1px;width: 12px;">
										课程大纲
									</label>
								</div>
							</div>
							<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 10px;padding-right: 10px;">
								<table id="branchTable" class="table table-bordered table-hover example1_x">
									<tbody>
										<tr>
											<td class="leftTd">课程大纲:</td>
											<td class="rightTd" colspan="2">
												<div id="syllabus"></div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="row" style="height: 30px;line-height: 30px;">
								<div class="col-sm-9 col-md-9">
									<label style="font-size: 14px; padding-left: 24px;">
										<img src="../../../../admin/image/square.png" style="margin-top: -1px;width: 12px;">
										其他相关信息
									</label>
								</div>
							</div>
							<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 10px;padding-right: 10px;">
								<table id="branchTable" class="table table-bordered table-hover example1_x">
									<tbody>
										<tr>
											<td class="leftTd">其他相关信息:</td>
											<td class="rightTd" colspan="2">
												<div id="syllabusother"></div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="row" style="height: 30px;line-height: 30px;">
								<div class="col-sm-9 col-md-9">
									<label style="font-size: 14px; padding-left: 24px;">
										<img src="../../../../admin/image/square.png" style="margin-top: -1px;width: 12px;">
										参加人员
									</label>
								</div>
							</div>
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
										<!-- <tr>
											<td class="leftTd">参加人员名单:<span style="color:red;">*</span></td>
											<td class="rightTd">
												<input type="text" id="studentList" value="参加人员名单一"  style="width: 100%;"  />
											</td>
											<td>
												<button type="button" class="layui-btn lay_btn" id="test12" style="width: 95px;background:#1e9fff;">
												  <i class="layui-icon">&#xe67c;</i>浏览
												</button>
											</td>
										</tr> -->
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
			function Baoming(){
				var number = document.getElementById("numOfParticipants").value;
				var name = document.getElementById("contactPersonName").value;
	        	var workPhone = document.getElementById("contactWorkTel").value;
	        	var phone = document.getElementById("contactPhone").value;
	        	var department = document.getElementById("companyInformation").value;
	        	var maxClassesNumber = $("#maxClassesNumber").val();
	        	var enrollNumber = $("#enrollNumber").val();
	        	if(number==""){
	        		alert("请输入参加培训的人数！");
	        		return;
	        	}else if(number>(maxClassesNumber-enrollNumber)){
	        		alert("参加报名人数超过剩余容纳人数！");
	        		return;
	        	}
	        	if(name==""){
	        		alert("请输入联系人姓名！");
	        		return;
	        	}
	        	if(workPhone==""){
	        		alert("请输入联系方式！");
	        		return;
	        	}
	        	if(phone==""){
	        		alert("请输入联系人办公电话！");
	        		return;
	        	}
	        	if(department==""){
	        		alert("请输入单位信息！");
	        		return;
	        	}
	        	var fd = new FormData();
				//fd.append('file', filea);
    			fd.append('Ssu_ssid', '<%=scheduled_id%>');
    			fd.append('Ssu_usernumber', number);
    			fd.append('Ssu_username', name);
    			fd.append('Ssu_ydphone', phone);
    			fd.append('Ssu_phone', workPhone);
    			fd.append('Ssu_department', department);
				$.ajax({
					url:'<%=request.getContextPath()%>/Ssuser/SignUpnf',
					type:'post',
					encType: 'multipart/form-data', //表明上传类型为文件
					processData: false,  //tell jQuery not to process the data
        			contentType: false,  //tell jQuery not to set contentType
					data:fd,
					success:function(data){
						if(data.success == true){
							if(data.message == "4"){
								layer.confirm('报名成功!', { title:'提示'}, function(index){
									  
									window.parent.location.reload();
									var index1 = parent.layer.getFrameIndex(window.name);
									parent.layer.close(index1);
									console.log(error);
								});
							}
						}
						else{
							if(data.message == "0"){
								layer.alert("未登录!");
							}else if(data.message == "1"){
								layer.alert("班次不存在!");
							}else if(data.message == "2"){
								layer.alert("Execl无数据!");
							}else if(data.message == "3"){
								layer.alert("人员数量与Execl数据数量不符!");
							}else if(data.message == "4"){
								layer.alert("Execl存在身份证重复!");
							}

						}
					},
					error:function(data){
						layer.alert("保存失败!");
					}
				})
		}
		</script>
		<script>
		window.onload = function(){
			$.ajax({
        			url:'<%=request.getContextPath()%>/ScheduledShift/getDetailByid',
        			type:"POST",
        			data:{
        				"Scheduled_id":'<%=scheduled_id%>'
        			},
        			success:function(data){
        				if(data.success == true){
        					var scheduled_name = data.data.scheduled_name;
        					var scheduled_initiator = data.data.scheduled_initiator;
        					var scheduled_address = data.data.scheduled_address;
        					var scheduled_start = data.data.scheduled_start;
        					var scheduled_end = data.data.scheduled_end;
        					var scheduled_class_start = data.data.scheduled_class_start;
        					var scheduled_class_end = data.data.scheduled_class_end;
        					var scheduled_class_pnumber = data.data.scheduled_class_pnumber;
        					var scheduled_class_context = data.data.scheduled_class_context;
        					var scheduled_other_context = data.data.scheduled_other_context;
        					var memotr = "";
							var files=new Array();
        					files = data.data.scheduleds;
        					document.getElementById("trainingClassesName").value=scheduled_name;
        					document.getElementById("trainingVenue").value=scheduled_address;
        					document.getElementById("togetherClassesStartDate").value=scheduled_start;
        					document.getElementById("togetherClassesEndDate").value=scheduled_end;
        					document.getElementById("classesStartDate").value=scheduled_class_start;
        					document.getElementById("classesEndDate").value=scheduled_class_end;
        					document.getElementById("maxClassesNumber").value=scheduled_class_pnumber;
        					$("#syllabus").html(scheduled_class_context);
							$("#syllabusother").html(scheduled_class_context);
        					for(var i = 0 ;i<files.length;i++){

        						memotr += '<tr id="upload-'+ i +'">'+
						          '<td>'+ files[i].scheduled_oldfile +'</td>'+
						          '<td>'+
						          '<button class="layui-btn layui-btn-xs demo-delete" style="background:#1e9fff;" ><a href="<%=request.getContextPath()%>/ScheduledShift/download/'+files[i].scheduled_file+' " class="hoverColor" id="downLoad">下载</a></button>'+
						          '</td>'+
						        '</tr>';
        					}
        					$("#demoList").append(memotr);
        				}
        				else{
        					if(data.msg == "0"){
        						layer.alert("参数错误!");
        					}
        					else
        						layer.alert("未获取规定班次!");
        				}
        			},error:function(data){

        			}

        		});
			//回显
			var name = document.getElementById("contactPersonName");
        	var workPhone = document.getElementById("contactWorkTel");
        	var phone = document.getElementById("contactPhone");
        	var department = document.getElementById("companyInformation");
        	$.ajax({
			url : '<%=request.getContextPath()%>/IUser/getdetailShow',
			type : 'GET',
			success:function(data){
				name.value=data.data.user_name;
				phone.value=data.data.user_ydphone;
				workPhone.value = data.data.user_phone;
				department.value = data.data.user_department;

			},error:function(data){

			}
			});
		};
		</script>
	</body>
</html>
