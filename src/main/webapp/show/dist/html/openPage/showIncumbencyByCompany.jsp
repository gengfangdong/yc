<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
	String project_name=request.getParameter("project_name");
	String applyUnit_id=request.getParameter("applyUnit_id");
	System.out.println(project_name+"  "+applyUnit_id);
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>中央财经大学</title>
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
										单位报名
									</label>
								</div>
							</div>
							<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 10px;padding-right: 10px;">
								<input hidden="hidden" name="applyunit_id" />
								<table id="branchTable" class="table table-bordered table-hover example1_x">
									<tbody>
										<tr>
											<td class="leftTd">报名项目:</td>
											<td class="rightTd" colspan="2">
												<input type="text" value="<%=project_name%>" id="entryByCompanyProject" disabled="disabled" style="background:#FFF;border: none; border: 1px solid #ccc; border-radius: 5px; width: 100%;height:23px;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">报名类别:</td>
											<td class="rightTd" colspan="2">
												<input type="text" value="单位" id="entryByCompanyStates" disabled="disabled" style="background:#FFF;border: none; border: 1px solid #ccc; border-radius: 5px; width: 100%;height:23px;"/>
											</td>

										</tr>
										<tr>
											<td class="leftTd">报名日期:</td>
											<td class="rightTd" colspan="2">
												<input type="text" value="" placeholder="YYYY-MM-DD" id="entryByCompanyDate" disabled="disabled" style="background:#FFF;border: none; border: 1px solid #ccc; border-radius: 5px; width: 257px;height:23px;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">报名单位:</td>
											<td class="rightTd" colspan="2">
												<input type="text" value="" placeholder="请输入报名单位" id="entryByCompanyEntryCompany" style=" border: none; border: 1px solid #ccc; border-radius: 5px; width: 100%;height:23px;" />
											</td>

										</tr>
									<!-- 	<tr>
											<td class="leftTd">报名人数:</td>
											<td class="rightTd" colspan="2">
												<input type="text" value="" id="entryByCompanyEntryPersonNum" placeholder="请填写报名人数" style="width: 100%;height: 23px;border-radius: 5px;border: 1px solid #CCCCCC" />
											</td>

										</tr> -->
										<tr>
											<td class="leftTd">联系人:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="entryByCompanyContactMan" value="" placeholder="请输入联系人" style=" border: none; border: 1px solid #ccc; border-radius: 5px; width: 100%;height:23px;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">联系人电话:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="entryByCompanyPhoneNum" value=""  maxlength="11" placeholder="请输入联系人电话" style=" border: none; border: 1px solid #ccc; border-radius: 5px; width: 100%;height:23px;" />
											</td>
										</tr>
										<tr>
											<td class="leftTd">办公电话:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="entryByCompanyPhoneCode" value=""  maxlength="15" placeholder="请输入联系人电话" style=" border: none; border: 1px solid #ccc; border-radius: 5px; width: 100%;height:23px;" />
											</td>
										</tr>
										<tr>
											<td class="leftTd">联系人邮箱:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="entryByCompanyEmail" value="" placeholder="请输入联系人邮箱" style=" border: none; border: 1px solid #ccc; border-radius: 5px; width: 100%;height:23px;" />
											</td>
										</tr>
										<tr>
											<td class="leftTd" style="vertical-align: middle;">报名名单模板:</td>
											<td class="rightTd">
												<input type="text"  id="file1" disabled="disabled" value="文件一" style="width: 100%;background: #fff;border: none;" />
											</td>
											<td>
												<a class="download_a"  href="<%=request.getContextPath()%>/ApplyUnit/download/<%=applyUnit_id%>" style="color: #FFFFFF;margin-right: 0;">
													<button type="button" class="layui-btn lay_btn" style="width: 85px;">
													<i class="layui-icon">&#xe67c;</i>下载
												</button>
												</a>
											</td>

										</tr>
							<!-- 			<tr>
											<td class="leftTd" style="vertical-align: middle;">报名名单上传:</td>
											<td class="rightTd">
												<input type="text" id="test1Input" disabled="disabled" value="" style="width: 100%;background: #fff;border: none;" />
											</td>
											<td>
												<button type="button" class="layui-btn lay_btn" id="test1">
												<i class="layui-icon">&#xe67c;</i>上传
											</button>
											</td>

										</tr> -->
									</tbody>
								</table>
							</div>
							<!-- <div style="text-align: center;margin-top: 30px;">
								<button class="branchSave" onclick="branchSave();">保存</button>
								<button class="branchSave branchSub" id="CompanySubmit" onclick="entryByCompanySave();">提交</button>
							</div> -->

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
<!-- 		<script src="../../ckeditor/ckeditor.js"></script> -->
		<script src="../../../../admin/layui-v2.3.0/layui/layui.js"></script>
	
		<script type="text/javascript">
			//分页
			$(function() {
				//设置结束日期为当前日期  
				var date = new Date();
				var seperator1 = "-";
				var seperator2 = ":";
				var month = date.getMonth() + 1;
				var strDate = date.getDate();
				if(month >= 1 && month <= 9) {
					month = "0" + month;
				}
				if(strDate >= 0 && strDate <= 9) {
					strDate = "0" + strDate;
				}
				var end = date.getFullYear() + seperator1 + month + seperator1 + strDate;
				/*$("#foundDate").val("万年历");*/

			});
		</script>
		<script>
			function changeStyleColor1(obj) {
				var nLi = $('.shaixuan li');
				if($(obj).is('.conditionSelectStyle')) {
					for(var i = 0; i < nLi.length; i++) {
						if($(nLi[i].children[0]).is('.conditionSelectStyle')) {
							$(nLi[i].children[0]).removeClass('conditionSelectStyle');
						}
					}
					$(obj).addClass('conditionSelectStyle');
				} else {
					for(var i = 0; i < nLi.length; i++) {
						if($(nLi[i].children[0]).is('.conditionSelectStyle')) {
							$(nLi[i].children[0]).removeClass('conditionSelectStyle');
						}
					}
					$(obj).addClass('conditionSelectStyle');
				}
				//					debugger;
			}
		</script>
<script type="text/javascript">
			 window.onload = function(){
//         		CKEDITOR.replace('projectListDescription');
        		$.ajax({
				url : '<%=request.getContextPath()%>/ApplyUnit/getdetailByid',
				type : 'GET',
				data:{
					applyunit_id:'<%=applyUnit_id%>'
				},
				success : function(data) {
					if(data.success == true){
						
						var CompanyDate = document.getElementById("entryByCompanyDate");
						var EntryCompany = document.getElementById("entryByCompanyEntryCompany");
// 						var PersonNum = document.getElementById("entryByCompanyEntryPersonNum");
						var ContactMan = document.getElementById("entryByCompanyContactMan");
						var PhoneNum = document.getElementById("entryByCompanyPhoneNum");
						var PhoneCode = document.getElementById("entryByCompanyPhoneCode");
						var email = document.getElementById("entryByCompanyEmail");	
						var file1 = document.getElementById("file1");	

// 							applyunit_caogery: "1"
// 							applyunit_creater: "usere491c4e7738a42aab5624ef202cfdfb2"
// 							applyunit_createtime: "2019-01-01 21:29:11"
// 							applyunit_date: "2019-1-01"
// 							applyunit_file: "功能点11.xlsx"
// 							applyunit_id: "aunitd61db14c0b1b41cd8f0e952f8d6dbe87"
// 							applyunit_mail: "111@qq.com"
// 							applyunit_name: "测试1"
// 							applyunit_person: "111"
// 							applyunit_phone: "13832879422"
// 							applyunit_status: "0"
// 							isdelete: "0"
// 							project_id: "Project5ff71fd070eb468c94c6a24b68befdfc"
// 							__proto__: Object
// 							name: "测试1"
// 							success: true
							
						CompanyDate.value = data.data.applyunit_createtime;
						EntryCompany.value = data.data.applyunit_name;
// 						PersonNum.value = "5";
						ContactMan.value=data.data.applyunit_person;
						PhoneNum.value=data.data.applyunit_phone;
						PhoneCode.value=data.data.phone_code;
						email.value=data.data.applyunit_mail;
						file1.value=data.data.applyunit_file;

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