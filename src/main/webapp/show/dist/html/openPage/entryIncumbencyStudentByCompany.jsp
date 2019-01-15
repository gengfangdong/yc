<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
	String project_id=request.getParameter("project_id");
	String project_name=request.getParameter("project_name");
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
												<input type="text" value="<%=project_name%>" id="entryByCompanyProject" disabled="disabled" style="width: 100%;background: #fff;border:1px solid #ccc;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">报名类别:</td>
											<td class="rightTd" colspan="2">
												<input type="text" value="单位" id="entryByCompanyStates" disabled="disabled" style="width: 100%;background: #fff;border:1px solid #ccc;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">报名日期:</td>
											<td class="rightTd" colspan="2">
												<input type="text" value="" placeholder="YYYY-MM-DD" id="entryByCompanyDate" disabled="disabled" style="background: #fff;border: 1px solid #ccc;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">报名单位:</td>
											<td class="rightTd" colspan="2">
												<input type="text" value="" placeholder="请输入报名单位" id="entryByCompanyEntryCompany" style="width: 100%;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">报名人数:</td>
											<td class="rightTd" colspan="2">
												<input type="text" value="" id="entryByCompanyEntryPersonNum" placeholder="请填写报名人数" style="width: 100%;height: 23px;border-radius: 5px;border: 1px solid #CCCCCC" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">联系人:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="entryByCompanyContactMan" value="" placeholder="请输入联系人" style="width: 100%;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">联系人电话:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="entryByCompanyPhoneNum" value=""  maxlength="11" placeholder="请输入联系人电话" style="width: 100%;" />
											</td>
										</tr>
										<tr>
											<td class="leftTd">联系人邮箱:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="entryByCompanyEmail" value="" placeholder="请输入联系人邮箱" style="width: 100%;" />
											</td>
										</tr>
										<tr>
											<td class="leftTd" style="vertical-align: middle;">报名名单模板:</td>
											<td class="rightTd">
												<input type="text" disabled="disabled" value="文件一" style="width: 100%;background: #fff;border: none;" />
											</td>
											<td>
												<a class="download_a" href="../../../../../show/dist/doc/培训通知.docx" style="color: #FFFFFF;margin-right: 0;">
													<button type="button" class="layui-btn lay_btn" style="width: 85px;">
													<i class="layui-icon">&#xe67c;</i>下载
												</button>
												</a>
											</td>

										</tr>
										<tr>
											<td class="leftTd" style="vertical-align: middle;">报名名单上传:</td>
											<td class="rightTd">
												<input type="text" id="test1Input" disabled="disabled" value="" style="width: 100%;background: #fff;border: none;" />
											</td>
											<td>
												<button type="button" class="layui-btn lay_btn" id="test1">
												<i class="layui-icon">&#xe67c;</i>上传
											</button>
											</td>

										</tr>
									</tbody>
								</table>
							</div>
							<div style="text-align: center;margin-top: 30px;">
								<button class="branchSave" onclick="branchSave();">保存</button>
								<button class="branchSave branchSub" id="CompanySubmit" onclick="entryByCompanySave();">提交</button>
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
		<script>
			$(function() {
				var myDate = new Date();
				var year = myDate.getFullYear();
				var month = myDate.getMonth() + 1;
				var day = myDate.getDate();
				if(day < 10) {
					day = "0" + day;
				}
				var newDay = year + '-' + month + '-' + day;
				$("#entryByCompanyDate").val(newDay);
			})
		</script>
		<script >
		layui.use('upload', function() {
			var upload = layui.upload;
			var uploadInst = upload.render({
				elem: '#test1', //绑定元素
				url: '<%=request.getContextPath()%>/ApplyUnit/apply', //上传接口
				accept: 'file', //普通文件
			    auto: false, //选择文件后不自动上传
			    bindAction: '#CompanySubmit', //指向一个按钮触发上传
			    choose:function(obj){
			    	  obj.preview(function(index, file, result){
			    	document.getElementById('test1Input').value = file.name;
			    	  });
			    },
			    before:function(obj){
			    	layer.load(); //上传loading
			    	this.data={
			    	"applyunit_name": '<%=project_name%>',
			    	"applyunit_phone":document.getElementById("entryByCompanyPhoneNum").value,
					"applyunit_mail":document.getElementById("entryByCompanyEmail").value,
					"applyunit_date":document.getElementById("entryByCompanyDate").value,
					"applyunit_person":document.getElementById("entryByCompanyContactMan").value,
					"project_id":'<%=project_id%>'
			    	}//携带额外的数据
//					    obj.preview(function(index, file, result){
//					        $('#demo1').attr('src', result); //图片链接（base64）
//					    });
			    },
			    done: function(res){
				      //如果上传失败
				      if(res.msg == 3){
				        return layer.msg('没有选择文件!');
				      }
				      else if(res.msg == 1){
				        return layer.msg('上传失败!');
				      }
				      //上传成功
				      else if(res.msg == 2){
				    	 layer.alert("保存成功!");
				   	}
				      layer.closeAll('loading'); //关闭loading
				    },
				error: function() {
					//请求异常回调
					 layer.closeAll('loading'); //关闭loading
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
		<script>
			function entryByCompanySave() {
				var projectName = $("#entryByCompanyProject").val();
				var companyStatus = $("#entryByCompanyStates");
				var entryDate = $("#entryByCompanyDate").val();
				var entryCompany = $("#entryByCompanyEntryCompany").val();
				var entryNum = $("#entryByCompanyEntryPersonNum").val();
				var entryMan = $("#entryByCompanyContactMan").val();
				var entryPhone = $("#entryByCompanyPhoneNum").val();
				var entryEmail = $("#entryByCompanyEmail").val();
				var submitFile = $("#test1Input").val();
				var testPhone = /^1\d{10}$/;
				var testEmail = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;

				if(entryCompany == "") {
					alert("请输入报名单位！");
					return;
				}
				if(entryNum == "") {
					alert("请输入报名人数！");
					return;
				}
				if(entryMan == "") {
					alert("请输入联系人！");
					return;
				}
				if(entryPhone == "") {
					alert("请输入联系人电话！");
					return;
				} else if(testPhone.test(entryPhone) == false) {
					alert("请输入有效的电话号码！");
					return;
				}
				if(entryEmail == "") {
					alert("请输入联系人邮箱！");
					return;
				} else if(testEmail.test(entryEmail) == false) {
					alert("请输入有效的电子邮箱地址！");
					return;
				}
				if(submitFile == "") {
					alert("请上传学员名单！");
					return;
				}

			}
		</script>

	</body>

</html>