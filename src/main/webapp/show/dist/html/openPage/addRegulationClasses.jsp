<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
	String scheduled_id = request.getParameter("scheduled_id");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>中央财经大学</title>
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
												<input type="text" value="第四期国税系统税务稽查专业骨干中级培训班" id="trainingClassesName" style="width: 100%;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">培训开课地点:</td>
											<td class="rightTd" colspan="2">
												<input type="text" value="北京市海淀区" id="trainingVenue" style="width: 100%;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">报名开始日期:</td>
											<td class="rightTd" colspan="2">
												<input type="text" value="2018/11/11" id="togetherClassesStartDate" style="width: 100%;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">拼班截止日期:</td>
											<td class="rightTd" colspan="2">
												<input type="text" value="2018/12/10" id="togetherClassesEndDate" style="width: 100%;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">预计开课日期:</td>
											<td class="rightTd" colspan="2">
												<input type="text" value="2018/12/11" id="classesStartDate" style="width: 100%;" />
											</td>
										</tr>
										<tr>
											<td class="leftTd">预计结课日期:</td>
											<td class="rightTd" colspan="2">
												<input type="text" value="32018/12/30" id="classesEndDate" style="width: 100%;" />
											</td>
										</tr>
										<tr>
											<td class="leftTd">班级容纳人数:</td>
											<td class="rightTd" colspan="2">
												<input type="text" value="50" id="maxClassesNumber" style="width: 100%;" />
											</td>
										</tr>
										<tr>
											<td class="leftTd">已经报名人数:</td>
											<td class="rightTd" colspan="2">
												<input type="text" value="0" id="enrollNumber" style="width: 100%;" />
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
									<label style="font-size: 14px; padding-left: 10px;">
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
												<!-- <p>为确保培训组织工作的顺利实施，自函到之日起开始接受报名，报名截止时间为每期培训班报到日前10天，额满为止。报名工作以县局以上税务机关为单位统一组织，
												同时请各报名单位通知参训学员登陆中共国家税务总局党校网站招生招聘——招生信息栏下载本函电子稿,以便注册登记参训名单及接站信息。
												</p>
												<p>报名时请报名单位登陆中共国家税务总局党校门户网站http://www.tax-edu.net，进入招生招聘——培训报名入口，直接注册报名。
												报名成功后并请填写《国家税务总局税务干部进修学院2019年培训项目报名表》（见附件3）盖章后传真至0514-87806661 。
												</p>
												<p>欢迎各税务机关开展全年培训项目一揽子报名，在年初将拟参加各项目培训的人数、班期一次性发送我院。
												如不能做到全年培训项目一揽子报名，请按《2019年专业化培训项目总体安排表》分批组织报名。
												</p>
												<p>参训学员名册上传方式：报名成功的单位在报到日前10天，请登陆中共国家税务总局党校门户网站http://www.tax-edu.net，
												进入招生招聘——名册上传入口，上传参训学员名册。
												</p> -->
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="row" style="height: 30px;line-height: 30px;">
								<div class="col-sm-9 col-md-9">
									<label style="font-size: 14px; padding-left: 10px;">
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
												<!-- <p>为确保培训组织工作的顺利实施，自函到之日起开始接受报名，报名截止时间为每期培训班报到日前10天，额满为止。报名工作以县局以上税务机关为单位统一组织，
												同时请各报名单位通知参训学员登陆中共国家税务总局党校网站招生招聘——招生信息栏下载本函电子稿,以便注册登记参训名单及接站信息。
												</p>
												<p>报名时请报名单位登陆中共国家税务总局党校门户网站http://www.tax-edu.net，进入招生招聘——培训报名入口，直接注册报名。
												报名成功后并请填写《国家税务总局税务干部进修学院2019年培训项目报名表》（见附件3）盖章后传真至0514-87806661 。
												</p>
												<p>欢迎各税务机关开展全年培训项目一揽子报名，在年初将拟参加各项目培训的人数、班期一次性发送我院。
												如不能做到全年培训项目一揽子报名，请按《2019年专业化培训项目总体安排表》分批组织报名。
												</p>
												<p>参训学员名册上传方式：报名成功的单位在报到日前10天，请登陆中共国家税务总局党校门户网站http://www.tax-edu.net，
												进入招生招聘——名册上传入口，上传参训学员名册。
												</p> -->
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="row" style="height: 30px;line-height: 30px;">
								<div class="col-sm-9 col-md-9">
									<label style="font-size: 14px; padding-left: 10px;">
										<img src="../../../../admin/image/square.png" style="margin-top: -1px;width: 12px;">
										参加人员
									</label>
								</div>
							</div>
							<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 10px;padding-right: 10px;">
								<table id="branchTable" class="table table-bordered table-hover example1_x">
									<tbody>
										<tr>
											<td class="leftTd">参加培训人数:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="numOfParticipants" placeholder="请输入想要参加的人数" style="width: 100%;"   />
											</td>
										</tr>
										<tr>
											<td class="leftTd">联系人姓名:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="contactPersonName" placeholder="请输入联系人姓名" style="width: 100%;"   />
											</td>
										</tr>
										<tr>
											<td class="leftTd">联系人联系方式:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="contactPhone" placeholder="请输入联系人联系方式" style="width: 100%;"   />
											</td>
										</tr>
										<tr>
											<td class="leftTd">联系人办公电话:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="contactWorkTel" placeholder="请输入联系人办公电话" style="width: 100%;"   />
											</td>
										</tr>
										<tr>
											<td class="leftTd">单位信息:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="companyInformation" placeholder="请输入单位信息" style="width: 100%;"   />
											</td>
										</tr>
										<tr>
											<td class="leftTd">学员名单模板:</td>
											<td class="rightTd">
												<input type="text" id="studentListTemplate" value="学员名单模板一" style="width: 100%;" />
											</td>
											<td>
												<button type="button" class="layui-btn lay_btn">
												  <i class="layui-icon">&#xe67c;</i><a href="../../../../../前台/dist/doc/培训通知.zip" style="color: #FFFFFF;">下载</a>
												</button>
											</td>
										</tr>
										<tr>
											<td class="leftTd">参加人员名单:</td>
											<td class="rightTd">
												<input type="text" id="studentList" value="参加人员名单一"  style="width: 100%;"  />
											</td>
											<td>
												<button type="button" class="layui-btn lay_btn" id="test12" style="width: 95px;">
												  <i class="layui-icon">&#xe67c;</i>浏览
												</button>
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
			var filea;
			layui.use('upload', function() {
				var upload = layui.upload;

				//执行实例
				var uploadInst = upload.render({
					elem: '#test12', //绑定元素
					url: '/upload/' //上传接口
					,accept: 'file'
			    	,multiple: true
			    	,auto: false
			    	,choose: function(obj){   
			      		obj.preview(function(index, file, result){
			      			filea = file;
			    		});
			    	},
					done: function(res) {
						//上传完毕回调
					},
					error: function() {
						//请求异常回调
					}
				});
			});
			function Baoming(){
				var number = document.getElementById("numOfParticipants").value;
				var name = document.getElementById("contactPersonName").value;
	        	var workPhone = document.getElementById("contactWorkTel").value;
	        	var phone = document.getElementById("contactPhone").value;
	        	var department = document.getElementById("companyInformation").value;
	        	var fd = new FormData();
				fd.append('file', filea);
    			fd.append('Ssu_ssid', '<%=scheduled_id%>');
    			fd.append('Ssu_usernumber', number);
    			fd.append('Ssu_username', name);
    			fd.append('Ssu_ydphone', phone);
    			fd.append('Ssu_phone', workPhone);
    			fd.append('Ssu_department', department);
				$.ajax({
					url:'<%=request.getContextPath()%>/Ssuser/SignUp',
					type:'post',
					encType: 'multipart/form-data', //表明上传类型为文件
					processData: false,  //tell jQuery not to process the data
        			contentType: false,  //tell jQuery not to set contentType
					data:fd,
					success:function(data){
						if(data.success == true){
							if(data.message == "4"){
								layer.alert("保存成功!");
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
						          '<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete" ><a href="<%=request.getContextPath()%>/ScheduledShift/download/'+files[i].scheduled_file+' " class="hoverColor">下载</a></button>'+
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
		<script type="text/javascript">

		

		</script>
	</body>
</html>
