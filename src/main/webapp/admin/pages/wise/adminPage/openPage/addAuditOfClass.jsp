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
										拼班信息
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
											<td class="leftTd">拼班发起单位:</td>
											<td class="rightTd" colspan="2">
												<input type="text" value="北京市海淀区税务局" id="togetherClassesCompany" style="width: 100%;" />
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
												<button type="button" class="layui-btn lay_btn" id="test1">
												  <i class="layui-icon">&#xe67c;</i><a class="download_a" href="../../../../../前台/dist/doc/培训通知.zip" style="color: #FFFFFF;">下载</a>
												</button>
											</td>

										</tr>
										<tr>
											<td class="rightTd">
												<a href="../../../../../前台/dist/doc/培训通知.zip" style="color: #666666;">文件二</a>
											</td>
											<td>
												<button type="button" class="layui-btn lay_btn" id="test2">
												  <i class="layui-icon">&#xe67c;</i><a class="download_a" href="../../../../../前台/dist/doc/培训通知.zip" style="color: #FFFFFF;">下载</a>
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
										参加单位
									</label>
								</div>
							</div>
							<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 10px;padding-right: 10px;">
								<table id="branchTable" class="table table-bordered table-hover example1_x">
									<thead>
										<tr>
											<th>拼班单位名称</th>
											<th>报名人数</th>
											<th>联系人</th>
											<th>电话</th>
											<th>邮箱</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>北京市海淀区税务局</td>
											<td>50</td>
											<td>李四</td>
											<td>13312341234</td>
											<td>123456789@qq.com</td>
										</tr>
										<tr>
											<td>北京市海淀区税务局</td>
											<td>50</td>
											<td>李四</td>
											<td>13312341234</td>
											<td>123456789@qq.com</td>
										</tr>
										<tr>
											<td>北京市海淀区税务局</td>
											<td>50</td>
											<td>李四</td>
											<td>13312341234</td>
											<td>123456789@qq.com</td>
										</tr>
										<tr>
											<td>北京市海淀区税务局</td>
											<td>50</td>
											<td>李四</td>
											<td>13312341234</td>
											<td>123456789@qq.com</td>
										</tr>
										<tr>
											<td>北京市海淀区税务局</td>
											<td>50</td>
											<td>李四</td>
											<td>13312341234</td>
											<td>123456789@qq.com</td>
										</tr>

									</tbody>
								</table>
							</div>
							<div class="row" style="height: 30px;line-height: 30px;">
								<div class="col-sm-9 col-md-9">
									<label style="font-size: 14px; padding-left: 10px;">
										<img src="../../../../image/square.png" style="margin-top: -1px;width: 12px;">
										课程大纲
									</label>
								</div>
							</div>
							<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 10px;padding-right: 10px;">
								<table id="branchTable" class="table table-bordered table-hover example1_x">
									<thead>
										<tr>
											<th>序号</th>
											<th>一级标题</th>
											<th>二级标题</th>
											<th>学习天数</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>基础学习</td>
											<td>税法一</td>
											<td>16</td>
										</tr>
										<tr>
											<td>2</td>
											<td>基础学习</td>
											<td>税法二</td>
											<td>16</td>
										</tr>
										<tr>
											<td colspan="3">合计</td>
											<td>32</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="row" style="height: 30px;line-height: 30px;">
								<div class="col-sm-9 col-md-9">
									<label style="font-size: 14px; padding-left: 10px;">
										<img src="../../../../image/square.png" style="margin-top: -1px;width: 12px;">
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
												<p>参训学员名册上传方式：报名成功的单位在报到日前10天，请登陆中共国家税务总局党校门户网站http://www.tax-edu.net，进入招生招聘——名册上传入口，上传参训学员名册。</p>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="row" style="height: 30px;line-height: 30px;">
								<div class="col-sm-9 col-md-9">
									<label style="font-size: 14px; padding-left: 10px;">
										<img src="../../../../image/square.png" style="margin-top: -1px;width: 12px;">
										项目审核信息
									</label>
								</div>
							</div>
							<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 10px;padding-right: 10px;">
								<table id="branchTable" class="table table-bordered table-hover example1_x">
									<tbody>
										<tr>
											<td class="leftTd">审核结果:</td>
											<td class="rightTd">
												<input type="radio" name="isPass" />通过
												<input type="radio" name="isPass" />不通过
											</td>
										</tr>
									</tbody>
								</table>
								<div style="text-align: center;margin-top: 0px;">
									<button class="picSave" onclick="onlineAuditSave();">保存</button>
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
			function onlineAuditSave() {
				//										var branchCategoryLen = document.getElementById('branchCategory').value.length;
				//										if(branchCategoryLen>10){
				//											alert('类别字数过长，请输入10个字以内字数！');
				//										}
				return;
			}
		</script>

	</body>

</html>