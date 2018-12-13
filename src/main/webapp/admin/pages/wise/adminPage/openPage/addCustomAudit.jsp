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
											<td class="leftTd">班级名称:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="classesName" style="width: 100%;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">预计举办日期:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="hostDate" style="width: 100%;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">累计举办天数:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="hostDateNum" style="width: 100%;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">计划参加人数:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="planNumOfEntries" placeholder="请选择人数大于50人，低于50人，将发布到拼班项目" style="width: 100%;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">预计举办地点:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="planHostAddress" placeholder="请精确到所在市区县，如：北京市海淀区" style="width: 100%;" />
											</td>

										</tr>
										<!--<tr>
											<td class="leftTd">性别:</td>
											<td class="rightTd" colspan="2">
												<input type="radio" id="sex" />男
												<input type="radio" id="sex" />女
											</td>

										</tr>-->
										<tr>
											<td class="leftTd">联系人员:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="contactPersonnel" style="width: 100%;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">联系电话:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="contactNumber" style="width: 100%;" />
											</td>
										</tr>
										<tr>
											<td class="leftTd" rowspan="2" style="vertical-align: middle;">定制班相关资料:</td>
											<td class="rightTd">
												<a href="../../../../../前台/dist/doc/培训通知.zip" style="color: #666666;">文件一</a>
											</td>
											<td>
												<button type="button" class="layui-btn lay_btn" id="test3" style="width: 95px;">
												  <i class="layui-icon">&#xe67c;</i>上传
												</button>
											</td>

										</tr>
										<tr>
											<td class="rightTd">
												<a href="../../../../../前台/dist/doc/培训通知.zip" style="color: #666666;">文件二</a>
											</td>
											<td>
												<button type="button" class="layui-btn lay_btn" id="test4" style="width: 95px;">
												  <i class="layui-icon">&#xe67c;</i>上传
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
												<input type="text" id="studentListTemplate" style="width: 100%;" />
											</td>
											<td>
												<button type="button" class="layui-btn lay_btn" id="test5" style="width: 95px;">
												  <i class="layui-icon">&#xe67c;</i>上传
												</button>
											</td>
										</tr>
										<tr>
											<td class="leftTd">参加人员数量:</td>
											<td class="rightTd">
												<input type="text" id="numOfParticipants" placeholder="请输入想要参加的人数" style="width: 100%;" />
											</td>
										</tr>
										<tr>
											<td class="leftTd">学员名单:</td>
											<td class="rightTd">
												<input type="text" id="studentList" style="width: 100%;" />
											</td>
											<td>
												<button type="button" class="layui-btn lay_btn" id="test6">
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
										课程大纲
									</label>
								</div>
							</div>
							<div class="layui-tab layui-tab-card" style="border-style: none;box-shadow: none;">
								<ul class="layui-tab-title">
									<li class="layui-this">按课程</li>
									<li>按方案</li>
									<li>自由定制</li>
								</ul>
								<div class="layui-tab-content" style="height: 100px;">
									<div class="layui-tab-item layui-show">
										<div class="form-group">
											<div class="col-sm-10">
												<label for="" class="control-label" style="float: left;">累计天数：<span>16</span>天</label>
											</div>
											<div class="col-sm-10">
												<label for="" class="control-label" style="float: left;">筛选：</label>
												<div class="f-sort">
													<ul class="f-sort-ul shaixuan">
														<li>
															<a class onclick="changeStyleColor1(this);">全部</a>
														</li>
														<li>
															<a class onclick="changeStyleColor1(this);">类别一</a>
														</li>
														<li>
															<a class onclick="changeStyleColor1(this);">类别二</a>
														</li>
														<li>
															<a class onclick="changeStyleColor1(this);">类别三</a>
														</li>
														<li>
															<a class onclick="changeStyleColor1(this);">类别四</a>
														</li>
														<li>
															<a class onclick="changeStyleColor1(this);">类别五</a>
														</li>
														<li>
															<a class onclick="changeStyleColor1(this);">类别六</a>
														</li>
														<li>
															<a class onclick="changeStyleColor1(this);">类别七</a>
														</li>
														<li>
															<a class onclick="changeStyleColor1(this);">类别八</a>
														</li>
														<li>
															<a class onclick="changeStyleColor1(this);">类别九</a>
														</li>
													</ul>
												</div>
											</div>
										</div>
										<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 0px;padding-right: 10px;">
											<table id="branchPage" class="table table-bordered table-hover example1_x" style="margin-top: 20px!important;">
												<thead>
													<tr>
														<th style="text-align: center;">选择</th>
														<th style="text-align: center;">课程目录</th>
														<th style="text-align: center;">所属类别</th>
														<th style="text-align: center;">课程天数</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>
															<input type="checkbox" />
														</td>
														<td>税法一</td>
														<td>基础学习</td>
														<td>16</td>
													</tr>
													<tr>
														<td>
															<input type="checkbox" />
														</td>
														<td>税法二</td>
														<td>基础学习</td>
														<td>16</td>
													</tr>
													<tr>
														<td>
															<input type="checkbox" />
														</td>
														<td>财务与会计</td>
														<td>基础学习</td>
														<td>20</td>
													</tr>
												</tbody>
											</table>
											<div class="row" style="height: 30px;line-height: 30px;padding-left: 0px;">
												<div class="col-sm-9 col-md-9">
													<label style="font-size: 14px; padding-left: 10px;">
										<img src="../../../../image/square.png" style="margin-top: -1px;width: 12px;">
										项目审核信息
									</label>
												</div>
											</div>
											<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 0px;padding-right: 10px;">
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
												<div style="text-align: center;margin-top: 100px;">
													<button class="branchSave" onclick="customAuditSave();">保存</button>
													<button class="branchSave branchSub" onclick="customAuditSave();">提交</button>
												</div>
											</div>

										</div>
									</div>
									<div class="layui-tab-item">
										<div class="layui-tab-item layui-show">
											<div class="form-group">
												<div class="col-sm-10">
													<label for="" class="control-label" style="float: left;">累计天数：<span>16</span>天</label>
												</div>
											</div>
											<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 0px;padding-right: 10px;">
												<table id="branchPage" class="table table-bordered table-hover example1_x" style="margin-top: 20px!important;">
													<thead>
														<tr>
															<th style="text-align: center;">选择</th>
															<th style="text-align: center;">方案名称</th>
															<th style="text-align: center;">方案描述</th>
															<th style="text-align: center;">课程天数</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																<input type="checkbox" />
															</td>
															<td>方案一</td>
															<td>基础学习</td>
															<td>16</td>
														</tr>
														<tr>
															<td>
																<input type="checkbox" />
															</td>
															<td>方案二</td>
															<td>基础学习</td>
															<td>16</td>
														</tr>
														<tr>
															<td>
																<input type="checkbox" />
															</td>
															<td>方案三</td>
															<td>基础学习</td>
															<td>20</td>
														</tr>
													</tbody>
												</table>
											</div>
											<div class="row" style="height: 30px;line-height: 30px;padding-left: 0px;">
												<div class="col-sm-9 col-md-9">
													<label style="font-size: 14px; padding-left: 10px;">
										<img src="../../../../image/square.png" style="margin-top: -1px;width: 12px;">
										项目审核信息
									</label>
												</div>
											</div>
											<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 0px;padding-right: 10px;">
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
												<div style="text-align: center;margin-top: 100px;">
													<button class="branchSave" onclick="customAuditSave();">保存</button>
													<button class="branchSave branchSub" onclick="customAuditSave();">提交</button>
												</div>
											</div>
										</div>
									</div>
									<div class="layui-tab-item">
										<div class="layui-tab-item layui-show">
											<textarea style="width: 100%;height: 150px;"></textarea>
											<div class="row" style="height: 30px;line-height: 30px;padding-left: 0px;">
												<div class="col-sm-9 col-md-9">
													<label style="font-size: 14px; padding-left: 10px;">
										<img src="../../../../image/square.png" style="margin-top: -1px;width: 12px;">
										项目审核信息
									</label>
												</div>
											</div>
											<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 0px;padding-right: 10px;">
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
												<div style="text-align: center;margin-top: 100px;">
													<button class="branchSave" onclick="customAuditSave();">保存</button>
													<button class="branchSave branchSub" onclick="customAuditSave();">提交</button>
												</div>
											</div>

										</div>
									</div>
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
			layui.use('upload', function() {
				var upload = layui.upload;

				//执行实例
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
					elem: '#test4', //绑定元素
					url: '/upload/', //上传接口
					done: function(res) {
						//上传完毕回调
					},
					error: function() {
						//请求异常回调
					}
				});
				var uploadInst = upload.render({
					elem: '#test5', //绑定元素
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
			function customAuditSave() {
				//				var branchCategoryLen = document.getElementById('branchCategory').value.length;
				//				if(branchCategoryLen>10){
				//					alert('类别字数过长，请输入10个字以内字数！');
				//				}
				return;
			}
		</script>

	</body>

</html>