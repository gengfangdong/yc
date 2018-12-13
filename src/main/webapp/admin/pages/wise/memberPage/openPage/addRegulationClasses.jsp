<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
										基本信息
									</label>
								</div>
							</div>
							<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 10px;padding-right: 10px;">
								<table id="branchTable" class="table table-bordered table-hover example1_x">
									<tbody>
										<tr>
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
												<input type="text" value="38" id="enrollNumber" style="width: 100%;" />
											</td>
										</tr>

										<tr>
											<td class="leftTd">拼班联系电话:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="contactNumber" value="010-3456789" style="width: 100%;" />
											</td>
										</tr>
										<tr>
											<td class="leftTd">拼班联系人员:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="contactPersonnel" value="王老师" style="width: 100%;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd" rowspan="2" style="vertical-align: middle;">拼班相关资料:</td>
											<td class="rightTd">
												<a href="../../../../../前台/dist/doc/培训通知.zip" style="color: #666666;">文件一</a>
											</td>
											<td>
												<button type="button" class="layui-btn lay_btn">
												  <i class="layui-icon">&#xe67c;</i><a href="../../../../../前台/dist/doc/培训通知.zip" style="color: #FFFFFF;">下载</a>
												</button>
											</td>

										</tr>
										<tr>
											<td class="rightTd">
												<a href="../../../../../前台/dist/doc/培训通知.zip" style="color: #666666;">文件二</a>
											</td>
											<td>
												<button type="button" class="layui-btn lay_btn">
												  <i class="layui-icon">&#xe67c;</i><a href="../../../../../前台/dist/doc/培训通知.zip" style="color: #FFFFFF;">下载</a>
												</button>
											</td>

										</tr>
									</tbody>
								</table>
							</div>
							<div class="row" style="height: 30px;line-height: 30px;">
								<div class="col-sm-9 col-md-9">
									<label style="font-size: 14px; padding-left: 10px;">
										<img src="../../../../image/square.png" style="margin-top: -1px;width: 12px;">
										参加人员
									</label>
								</div>
							</div>
							<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 10px;padding-right: 10px;">
								<table id="branchTable" class="table table-bordered table-hover example1_x">
									<tbody>
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
											<td class="leftTd">参加人员数量:</td>
											<td class="rightTd">
												<input type="text" id="numOfParticipants" placeholder="请输入想要参加的人数" style="width: 100%;"   />
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
										<tr>
											<td class="leftTd">其他相关信息:</td>
											<td class="rightTd" colspan="2">
												<p>为确保培训组织工作的顺利实施，自函到之日起开始接受报名，报名截止时间为每期培训班报到日前10天，额满为止。报名工作以县局以上税务机关为单位统一组织，
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
												</p>
											</td>
										</tr>
									</tbody>
								</table>
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
			layui.use('upload', function() {
				var upload = layui.upload;

				//执行实例
				var uploadInst = upload.render({
					elem: '#test1', //绑定元素
					url: '/upload/', //上传接口
					done: function(res) {
						//上传完毕回调
					},
					error: function() {
						//请求异常回调
					}
				});

				var uploadInst = upload.render({
					elem: '#test2', //绑定元素
					url: '/upload/', //上传接口
					done: function(res) {
						//上传完毕回调
					},
					error: function() {
						//请求异常回调
					}
				});

				var uploadInst = upload.render({
					elem: '#test3', //绑定元素
					url: '/upload/', //上传接口
					done: function(res) {
						//上传完毕回调
					},
					error: function() {
						//请求异常回调
					}
				});
				var uploadInst = upload.render({
					elem: '#test12', //绑定元素
					url: '/upload/', //上传接口
					done: function(res) {
						//上传完毕回调
					},
					error: function() {
						//请求异常回调
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
				if (month >= 1 && month <= 9) {
					month = "0" + month;
				}
				if (strDate >= 0 && strDate <= 9) {
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
			/*function branchSave(){
				var branchCategoryLen = document.getElementById('branchCategory').value.length;
				if(branchCategoryLen>10){
					alert('类别字数过长，请输入10个字以内字数！');
					return;
				}
			}*/
		</script>

	</body>
</html>
