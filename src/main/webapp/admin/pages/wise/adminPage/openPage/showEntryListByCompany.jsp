<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%
	String applyshow_id = request.getParameter("applyshow_id");
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
										单位报名
									</label>
								</div>
							</div>
							<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 10px;padding-right: 10px;">
							<input hidden="hidden" name="applyunit_id" id="applyunit_id"/>
								<table id="branchTable" class="table table-bordered table-hover example1_x">
									<tbody>
										<tr>
											<td class="leftTd">报名项目:</td>
											<td class="rightTd" colspan="2">
												<input type="text" value="第四期国税系统税务稽查专业骨干中级培训班" id="entryByCompanyProject" style="width: 100%;height:23px;background:#FFF;border:none;border-radius:5px;border:1px solid #CCC;" disabled="disabled" class="disableInput" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">报名类别:</td>
											<td class="rightTd" colspan="2">
												<input type="text" value="单位" id="entryByCompanyStates" style="width: 100%;background:#FFF;height:23px;border:none;border-radius:5px;border:1px solid #CCC;" disabled="disabled" class="disableInput" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">报名日期:</td>
											<td class="rightTd" colspan="2">
												<input type="text" value="2018-12-11" placeholder="YYYY-MM-DD" id="entryByCompanyDate"  disabled="disabled" class="disableInput" style="background:#FFF;height:23px;border:none;border-radius:5px;border:1px solid #CCC;width:257px;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">报名单位:</td>
											<td class="rightTd" colspan="2">
												<input type="text" value="北京市海淀区税务局" id="entryByCompanyEntryCompany" disabled="disabled" class="disableInput" style="width: 100%;height:23px;background:#FFF;border:none;border-radius:5px;border:1px solid #CCC;" />
											</td>

										</tr>

										<tr>
											<td class="leftTd">联系人:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="entryByCompanyContactMan" value="王老师" disabled="disabled" class="disableInput" style="width: 100%;height:23px;background:#FFF;border:none;border-radius:5px;border:1px solid #CCC;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">联系人电话:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="entryByCompanyPhoneNum" value="" disabled="disabled" class="disableInput" style="width: 100%;height:23px;background:#FFF;border:none;border-radius:5px;border:1px solid #CCC;" />
											</td>
										</tr>
										<tr>
											<td class="leftTd">办公电话:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="entryByCompanyPhoneCode" value="" disabled="disabled" class="disableInput" style="width: 100%;height:23px;background:#FFF;border:none;border-radius:5px;border:1px solid #CCC;" />
											</td>
										</tr>
										<tr>
											<td class="leftTd">联系人邮箱:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="entryByCompanyEmail" value="123456789@qq.com" disabled="disabled" class="disableInput" style="width: 100%;height:23px;background:#FFF;border:none;border-radius:5px;border:1px solid #CCC;" />
											</td>
										</tr>
										<tr id="fileShowTrue" style="display:none;">
											<td class="leftTd" rowspan="2" style="vertical-align: middle;">报名名单:</td>
											<td class="rightTd">
												<input type="text" id="entryByCompanyfile" value="文件名" disabled="disabled" class="disableInput" style="width: 100%;background:#FFF;height:23px;border:none;border-radius:5px;border:1px solid #CCC;">
											</td>
											<td>
												<a class="download_a" href='<%=request.getContextPath()%>/ApplyUnit/download/<%=applyshow_id%>' style="color: #FFFFFF;"><button type="button" class="layui-btn lay_btn" id="test1" style="background:#1e9fff;">
												  <i class="layui-icon">&#xe67c;</i>下载
												</button></a>
											</td>

										</tr>
										<tr id="fileShowFalse" >
											<td class="leftTd" style="vertical-align: middle;">报名名单:</td>
											<td class="rightTd" colspan="2">
												未上传名单
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 10px;padding-right: 10px;">
								<!-- <table id="branchTable" class="table table-bordered table-hover example1_x">
									<tbody>
										<tr>
											<td class="leftTd">审核结果:</td>
											<td class="rightTd">
												<input type="radio" name="isPass" disabled="disabled" class="disableInput" />通过
												<input type="radio" name="isPass" disabled="disabled" class="disableInput" />不通过
											</td>
										</tr>
									</tbody>
								</table> -->
								<div style="text-align: center;margin-top: 0px;">
									<button class="picSave" onclick="parent.layer.close(parent.layer.getFrameIndex(window.name));">关闭</button>
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
            layui.use('laydate', function(){
                var laydate = layui.laydate;

                //执行一个laydate实例
                laydate.render({
                    elem: '#entryByCompanyDate' //指定元素
                });
            });
		</script>
		
		<script>
			window.onload = function(){
        		$.ajax({
				url : '<%=request.getContextPath()%>/ApplyUnit/getdetailByid',
				type : 'GET',
				data:{
					applyunit_id:'<%=applyshow_id%>'
				},
				success : function(data) {
					if(data.success == true){
						var entryByCompanyProject = document.getElementById("entryByCompanyProject");
						var entryByCompanyStates = document.getElementById("entryByCompanyStates");
						var entryByCompanyDate = document.getElementById("entryByCompanyDate");
						var entryByCompanyEntryCompany = document.getElementsByName("entryByCompanyEntryCompany");
						var entryByCompanyContactMan = document.getElementById("entryByCompanyContactMan");
						var entryByCompanyPhoneCode = document.getElementById("entryByCompanyPhoneCode");
						var entryByCompanyPhoneNum = document.getElementById("entryByCompanyPhoneNum");
						var entryByCompanyEmail = document.getElementById("entryByCompanyEmail");
						var isPass = document.getElementsByName("isPass");
						var applyunitid = document.getElementById("applyunit_id");
						var entryByCompanyfile = document.getElementById("entryByCompanyfile");

						var projectname = data.name;
						var apply_id = data.data.applyunit_id;
						var applyunit_date = data.data.applyunit_date;
						var applyunit_name = data.data.applyunit_name;
						var applyunit_person = data.data.applyunit_person;
						var applyunit_status = data.data.applyunit_status;
						var applyunit_phone = data.data.applyunit_phone;
						var phone_code = data.data.phone_code;
						var file = data.data.applyunit_file;
						var applyunit_mail = data.data.applyunit_mail;
						
						entryByCompanyProject.value=projectname; 
						entryByCompanyStates.value="单位";
						entryByCompanyDate.value=applyunit_date;
						entryByCompanyEntryCompany.value=applyunit_name;
						entryByCompanyContactMan.value=applyunit_person;
						entryByCompanyPhoneCode.value=phone_code;
						entryByCompanyPhoneNum.value=applyunit_phone;
						entryByCompanyEmail.value=applyunit_mail;
						entryByCompanyfile.value=file;
						applyunitid.value = apply_id;
						
						
						if(file == null ){
							$("#fileShowTrue").css("display","none");
							$("#fileShowFalse").css("display","");
						}else{
							$("#fileShowFalse").css("display","none");
							$("#fileShowTrue").css("display","");
						}


					}
					
				},
				error : function(error) {
					console.log('接口不通' + error);
				}
			});	
   	 		};
		</script>

	</body>

</html>