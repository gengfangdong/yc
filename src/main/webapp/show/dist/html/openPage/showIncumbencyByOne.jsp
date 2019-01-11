<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
	String apply_id=request.getParameter("apply_id");
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
										个人报名
									</label>
								</div>
							</div>
							<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 10px;padding-right: 10px;">
								<table id="branchTable" class="table table-bordered table-hover example1_x">
									<tbody>
									<tr>
										<td class="leftTd">您的姓名:</td>
										<td class="rightTd" >
											<input type="text" value=""  placeholder="请输入您的真实姓名"  id="entryByOneName" style=" border: none; border: 1px solid #ccc; border-radius: 5px; width: 100%;height:23px;" />
										</td>

									</tr>
									<tr>
										<td class="leftTd">您的性别:</td>
										<td class="rightTd" >
											<!-- <input type="radio" name="sex" value="man" id="entryByOneSex" />男
											<input type="radio" name="sex" value="woman" id="entryByOneSex"  />女 -->
											<input class="onlineRadio byOneSex" type="radio" name="sex" value="man" />男
											<input class="onlineRadio byOneSex" type="radio" name="sex" value="woman" />女
										</td>

									</tr>

									<tr>
										<td class="leftTd">出生日期:</td>
										<td class="rightTd" >
											<input type="text" value="" id="entryByOneBirthday" placeholder="YYYY-MM-DD"  style=" border: none; border: 1px solid #ccc; border-radius: 5px; width: 257px;height:23px;"/>
										</td>

									</tr>
									<tr>
										<td class="leftTd">身份证号:</td>
										<td class="rightTd" >
											<input type="text" value=""  placeholder="请输入您的18位身份证号码"  maxlength="18"  id="entryByOneIDNum" style=" border: none; border: 1px solid #ccc; border-radius: 5px; width: 100%;height:23px;" />
										</td>

									</tr>
									<tr>
										<td class="leftTd">政治面貌:</td>
										<td class="rightTd" >
											<!-- <input type="radio" value="党员" name="politicalOutlook"  />党员
											<input type="radio" value="群众" name="politicalOutlook"   />群众
											<input type="radio" value="民主党派" name="politicalOutlook"   />民主党派 -->
											<input class="onlineRadio byOnePoliticalStatus" type="radio" name="politicalStatus" value="partyMember" />党员
											<input class="onlineRadio byOnePoliticalStatus" type="radio" name="politicalStatus" value="masses" />群众
											<input class="onlineRadio byOnePoliticalStatus" type="radio" name="politicalStatus" value="democraticParties" />民主党派
										</td>

									</tr>
									<tr>
										<td class="leftTd">手机号码:</td>
										<td class="rightTd">
											<input type="text" value=""  placeholder="请输入您真实的手机号码"  maxlength="11"  id="entryByOnePhoneNum" style=" border: none; border: 1px solid #ccc; border-radius: 5px; width: 100%;height:23px;" />
										</td>
									</tr>
									<tr>
										<td class="leftTd">办公电话:</td>
										<td class="rightTd">
											<input type="text" value=""  placeholder="请输入您真实的办公电话"  maxlength="15"  id="entryByOnePhoneCode" style=" border: none; border: 1px solid #ccc; border-radius: 5px; width: 100%;height:23px;" />
										</td>
									</tr>
									<tr>
										<td class="leftTd">电子邮箱:</td>
										<td class="rightTd" >
											<input type="text" value="" placeholder="请输入您真实的邮箱"  id="entryByOneEmail" style=" border: none; border: 1px solid #ccc; border-radius: 5px; width: 100%;height:23px;" />
										</td>

									</tr>
									<tr>
										<td class="leftTd">所在部门:</td>
										<td class="rightTd" >
											<input type="text" value="" placeholder="请填写您所在部门"  id="entryByOneDepartment" style=" border: none; border: 1px solid #ccc; border-radius: 5px; width: 100%;height:23px;" />
										</td>

									</tr>
									<tr>
										<td class="leftTd">任职岗位:</td>
										<td class="rightTd" >
											<input type="text" value="" placeholder="请填写您任职的岗位"  id="entryByOneJob" style=" border: none; border: 1px solid #ccc; border-radius: 5px; width: 100%;height:23px;" />
										</td>
									</tr>
							<!-- 		<tr>
										<td class="leftTd">任职职务:</td>
										<td class="rightTd" >
											<input type="text" value="" placeholder="请填写您担任的职务"  id="entryByOnePost" style=" border: none; border: 1px solid #ccc; border-radius: 5px; width: 100%;height:23px;" />
										</td>
									</tr> -->
									<tr>
										<td class="leftTd">通讯地址:</td>
										<td class="rightTd" >
											<input type="text" value=""  placeholder="请填写您详细的通讯地址" id="entryByOneAddress" style=" border: none; border: 1px solid #ccc; border-radius: 5px; width: 100%;height:23px;" />
										</td>
									</tr>
									<tr>
										<td class="leftTd">其他信息:</td>
										<td class="rightTd" >
											<input type="text" value=""  id="entryByOneInformation"  placeholder="请输入您的学习方向、学习时间等信息"  style=" border: none; border: 1px solid #ccc; border-radius: 5px; width: 100%;height:23px;" />
										</td>
									</tr>

									</tbody>
								</table>
							</div>
							<!-- <div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 10px;padding-right: 10px;">
								<div style="text-align: center;margin-top: 0px;">
									<button class="picSave" onclick="branchSave();">保存</button>
									<button class="branchSave branchSub" onclick="entryByOneSave();">提交</button>
								</div>
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
            layui.use('element', function() {
                var element = layui.element;

                //一些事件监听
                element.on('tab(demo)', function(data) {
                    console.log(data);
                });
            });layui.use('laydate', function(){
                var laydate = layui.laydate;

                //执行一个laydate实例
                laydate.render({
                    elem: '#entryByOneBirthday' //指定元素
                });
            });
		</script>

		<script type="text/javascript">
			 window.onload = function(){
//         		CKEDITOR.replace('projectListDescription');
        		$.ajax({
				url : '<%=request.getContextPath()%>/Apply/getApplydetail',
				type : 'GET',
				data:{
					apply_id:'<%=apply_id%>'
				},
				success : function(data) {
					if(data.success == true){
						var name = document.getElementById("entryByOneName");
						var sex = document.getElementById("byOneSex");
						var Birthday = document.getElementById("entryByOneBirthday");
						var IDNum = document.getElementById("entryByOneIDNum");
						var PoliticalStatus = document.getElementById("byOnePoliticalStatus");
						var PhoneNum = document.getElementById("entryByOnePhoneNum");	
						var PhoneCode = document.getElementById("entryByOnePhoneCode");	
						var email = document.getElementById("entryByOneEmail");
						var Department = document.getElementById("entryByOneDepartment");
						var Job = document.getElementById("entryByOneJob");//岗位
// 						var Post = document.getElementById("entryByOnePost");//职务
						var Address = document.getElementById("entryByOneAddress");
						var others = document.getElementById("entryByOneInformation");

						name.value = data.data.name;
						Birthday.value = data.data.brithday;
						IDNum.value = data.data.indentity_number;
						PhoneNum.value = data.data.phone_number;
						PhoneCode.value = data.data.phone_code;
						email.value=data.data.mail;
						Department.value=data.data.department;
						Job.value=data.data.job;
// 						Post.value=data.data.position;
						Address.value=data.data.address;
						others.value=data.data.other;
// 						<input class="onlineRadio byOneSex" type="radio" name="sex" value="man" />男
// 						<input class="onlineRadio byOneSex" type="radio" name="sex" value="woman" />女
// 					$("input[name=sex][value=1]").attr("checked", data.UserSex == 1 ? true : false);
//                     $("input[name=sex][value=2]").attr("checked", data.UserSex == 2 ? true : false);

						if(data.data.sex=="0"){
							$("input[name=sex][value=man]").attr("checked",  true );
						}else if(data.data.sex=="1"){
							$("input[name=sex][value=woman]").attr("checked",  true );
						}
						
// 						<input class="onlineRadio byOnePoliticalStatus" type="radio" name="politicalStatus" value="partyMember" />党员
// 						<input class="onlineRadio byOnePoliticalStatus" type="radio" name="politicalStatus" value="masses" />群众
// 						<input class="onlineRadio byOnePoliticalStatus" type="radio" name="politicalStatus" value="democraticParties" />民主党派
						if(data.data.political_status=="0"){
							$("input[name=politicalStatus][value=partyMember]").attr("checked",  true );
						}else if(data.data.political_status=="1"){
							$("input[name=politicalStatus][value=masses]").attr("checked",  true );
						}else if(data.data.political_status=="2"){
							$("input[name=politicalStatus][value=democraticParties]").attr("checked",  true );
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