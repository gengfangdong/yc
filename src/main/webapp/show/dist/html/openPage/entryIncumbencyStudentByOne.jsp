<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
	String project_id=request.getParameter("project_id");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>领税教育网</title>
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
											<input type="text" value=""  placeholder="请输入您的真实姓名"  id="entryByOneName" style="width: 100%;" />
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
											<input type="text" value="" id="entryByOneBirthday" placeholder="YYYY-MM-DD" />
										</td>

									</tr>
									<tr>
										<td class="leftTd">身份证号:</td>
										<td class="rightTd" >
											<input type="text" value=""  placeholder="请输入您的18位身份证号码"  maxlength="18"  id="entryByOneIDNum" style="width: 100%;" />
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
											<input type="text" value=""  placeholder="请输入您真实的手机号码"  maxlength="11"  id="entryByOnePhoneNum" style="width: 100%;" />
										</td>

									</tr>
									<tr>
										<td class="leftTd">电子邮箱:</td>
										<td class="rightTd" >
											<input type="text" value="" placeholder="请输入您真实的邮箱"  id="entryByOneEmail" style="width: 100%;" />
										</td>

									</tr>
									<tr>
										<td class="leftTd">所在部门:</td>
										<td class="rightTd" >
											<input type="text" value="" placeholder="请填写您所在部门"  id="entryByOneDepartment" style="width: 100%;" />
										</td>

									</tr>
									<tr>
										<td class="leftTd">任职岗位:</td>
										<td class="rightTd" >
											<input type="text" value="" placeholder="请填写您任职的岗位"  id="entryByOneJob" style="width: 100%;" />
										</td>
									</tr>
									<tr>
										<td class="leftTd">任职职务:</td>
										<td class="rightTd" >
											<input type="text" value="" placeholder="请填写您担任的职务"  id="entryByOnePost" style="width: 100%;" />
										</td>
									</tr>
									<tr>
										<td class="leftTd">通讯地址:</td>
										<td class="rightTd" >
											<input type="text" value=""  placeholder="请填写您详细的通讯地址" id="entryByOneAddress" style="width: 100%;" />
										</td>
									</tr>
									<tr>
										<td class="leftTd">其他信息:</td>
										<td class="rightTd" >
											<input type="text" value=""  id="entryByOneInformation"  placeholder="请输入您的学习方向、学习时间等信息"  style="width: 100%;" />
										</td>
									</tr>

									</tbody>
								</table>
							</div>
							<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 10px;padding-right: 10px;">
								<div style="text-align: center;margin-top: 0px;">
									<button class="picSave" onclick="branchSave();">保存</button>
									<button class="branchSave branchSub" onclick="entryByOneSave();">提交</button>
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
            });layui.use('laydate', function(){
                var laydate = layui.laydate;

                //执行一个laydate实例
                laydate.render({
                    elem: '#entryByOneBirthday' //指定元素
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
                if(month >= 1 && month <= 9) {
                    month = "0" + month;
                }
                if(strDate >= 0 && strDate <= 9) {
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
		<script>

            function entryByOneSave() {
                var name = $("#entryByOneName").val();
                var brithday = $("#entryByOneBirthday").val();
                var IDNum = $("#entryByOneIDNum").val();
                var phone = $("#entryByOnePhoneNum").val();
                var email = $("#entryByOneEmail").val();
                var department = $("#entryByOneDepartment").val();
                var job = $("#entryByOneJob").val();
                var post = $("#entryByOnePost").val();
                var address = $("#entryByOneAddress").val();
                var otherInformation = $("#entryByOneInformation").val();

                var testPhone = /^1\d{10}$/;
				var testEmail = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
				
                if(name==""){
                    alert("请输入您的姓名！");
                    return;
                }
               /*  var sexes = $(".entryByOneSex");
                if(sexes[0].checked==true){
                    var sex = 0;
                }else if(sexes[1].checked==true){
                    var sex = 1;
                }else{
                    alert("请选择您的性别！");
                } */
                var sexes = $(".byOneSex");
				if(sexes[0].checked == true) {
					var sex = "0";
				} else if(sexes[1].checked == true) {
					var sex = "1";
				} else {
					alert("请选择您的性别！");
					return;
				}
                if(brithday==""){
                    alert("请选择您的出生日期！");
                    return;
                }
                if(IDNum == "") {
					alert("请输入您的身份证号！");
					return;
				} else if(IDNum.length < 18) {
					alert("请输入18位的身份证号！");
					return;
				}
    /*             var politicalStatuses = $(".byOnePoliticalStatus");
                if(politicalStatuses[0].checked==true){
                    var politicalStatus = 0;
                }else if(politicalStatuses[1].checked==true){
                    var politicalStatus = 1;
                }else if(politicalStatuses[2].checked==true){
                    var politicalStatus = 2;
                }else {
                    alert("请选择您的政治面貌！");
                    return;
                } */
                var politicalStatuses = $(".byOnePoliticalStatus");
				if(politicalStatuses[0].checked == true) {
					var politicalStatus = 0;
				} else if(politicalStatuses[1].checked == true) {
					var politicalStatus = 1;
				} else if(politicalStatuses[2].checked == true) {
					var politicalStatus = 2;
				} else {
					alert("请选择您的政治面貌！");
					return;
				}
				if(phone == "") {
					alert("请输入您的手机号码！");
					return;
				} else if(testPhone.test(phone) == false) {
					alert("请输入有效的手机号码！");
					return;
				}
				if(email == "") {
					alert("请输入您的电子邮箱！");
					return;
				} else if(testEmail.test(email) == false) {
					alert("请输入有效的邮箱！");
					return;
				}
                if(department==""){
                    alert("请输入您的所在部门！");
                    return;
                }
                if(job==""){
                    alert("请输入您的任职岗位！");
                    return;
                }
                if(post==""){
                    alert("请输入您的任职职务！");
                    return;
                }
                if(address==""){
                    alert("请输入您的通讯地址！");
                    return;
                }
                if(otherInformation==""){
                    alert("若无其他备注，请输入无！");
                    return;
                }
// 				debugger;
                $.ajax({
                	url:'<%=request.getContextPath()%>/Apply/apply' ,
                    type:"post",
                    dataType:"json",
                    data:{
                        "name":name,
                        "sex":sex,
                        "brithday":brithday,
                        "indentity_number":IDNum,
                        "political_status":politicalStatus,
                        "phone_number":phone,
                        "mail":email,
                        "department":department,
                        "job":job,
                        "position":post,
                        "address":address,
                        "other":otherInformation,
                        "project_id":'<%=project_id%>'
                    }
                })
            }

		</script>

	</body>

</html>