<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String culture_id = request.getParameter("culture_id");
%>
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
			.layui-this{
				color: #0066CC;
			}
			#taxTab{
				background-color: #FFFFFF;
				height: 42px;
			}
			#taxTab li{
				border:1px;
				border-style: solid;
				border-color:#fff #eee #e6e6e6;
			}
			#taxTab li:hover{
				background-color: #ecf0f5;
			}
			#taxTab li a{
				height: 40px;
			}
			#taxTab li a:hover{
				background-color: #ecf0f5;
				border: none;
				color: #222222;
			}
			.layui-this a{
				color: #555555;
			}
		</style>
	</head>
	<body>
		<div>
			<div class="row" >
				<div class="col-sm-12 col-md-12 layui-tab layui-tab-card">
			    	<div class="row">
						<div class="col-sm-12 col-md-12">
							<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 10px;padding-right: 10px;">
								<table id="cultureTable" class="table table-bordered table-hover example1_x">
									<tbody>
										<tr>
											<td class="leftTd">标题:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="cultureTitle"readonly="readonly"/>
											</td>
										</tr>
										<tr>
											<td class="leftTd">封面:</td>
											<td class="rightTd">
												<div class="layui-upload-list">
												  <img class="layui-upload-img" id="demo1" style="width:150px;" src="<%=request.getContextPath()%>/Culture/Culture_title_page_Show?culture_id=<%=culture_id%>">
											</td>
										</tr>
										<tr>
											<td class="leftTd">简介:</td>
											<td class="rightTd" colspan="2">
												<input type="text" placeholder="请输入50字以下文字" id="cultureAbstract" readonly="readonly"/>
											</td>
										</tr>
										<tr>
											<td class="leftTd">关键字:</td>
											<td class="rightTd" colspan="2">
												<input type="text" placeholder="请输入5个以内关键字，用逗号隔开" id="cultureKeyWords" readonly="readonly"/>
											</td>
										</tr>
										<!--<tr>
											<td class="leftTd">类别:</td>
											<td class="rightTd">
												<input type="text" id="cultureCategory" />
											</td>
										</tr>-->
										<tr>
											<td class="leftTd">发布日期:</td>
											<td class="rightTd" colspan="2">
												<input id="cultureDate" name="cultureDate" placeholder="YYYY-MM-DD" type="text" class="" style="height: 23px;" readonly="readonly"/>
											</td>
										</tr>
										<tr>
											<td class="leftTd">状态:</td>
											<td class="rightTd" colspan="2">
												<input type="radio" value="发布" name="cultureStates" class="cultureStates" style="margin-right: 5px;" disabled="disabled" /><span>发布</span>
												<input type="radio" value="保存" name="cultureStates" class="cultureStates" style="margin-right: 5px;margin-left: 10px;" disabled="disabled"/><span>保存</span>
											</td>
										</tr>
										
										<tr>
											<td class="leftTd" style="vertical-align: middle;">内容:</td>
											<td class="rightTd" colspan="2">
												<textarea name="description" id="cultureDescription" readonly="readonly"/></textarea>
											</td>
										</tr>
									</tbody>
								</table>
								<div style="text-align: center;">
									<button class="cultureSave saveBtn" id="cultureSave" onclick="">关闭</button>
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
		<script type="text/javascript">
			 window.onload = function(){
        		CKEDITOR.replace('cultureDescription');
        		$.ajax({
				url : '<%=request.getContextPath()%>/Culture/getCulturedetailByid',
				type : 'GET',
				data:{
					culture_id:'<%=culture_id%>'
				},
				success : function(data) {
					if(data.success == true){
						var culturecontext = CKEDITOR.instances.cultureDescription;
						var cultureTitle = document.getElementById("cultureTitle");
						var cultureAbstract = document.getElementById("cultureAbstract");
						var cultureKeyWords = document.getElementById("cultureKeyWords");
						var cultureDate = document.getElementById("cultureDate");
						var cultureStatus = document.getElementsByName("cultureStates");

						var culture_id = data.data.culture_id;
						var culture_Introduction = data.data.culture_Introduction;
						var culture_KeyWords = data.data.culture_KeyWords;
						var culture_Rlease_time = data.data.culture_Release_time;
						var culture_context = data.data.culture_context;
						var culture_titile = data.data.culture_titile;
						var culture_status = data.data.culture_status;
						var culture_title_page = culture_title_page;
						
						cultureTitle.value=culture_titile; //标题
						cultureAbstract.value=culture_Introduction;//简介
						cultureKeyWords.value=culture_KeyWords;//关键字
						cultureDate.value=culture_Rlease_time;//发布日期
						cultureTitle.value=culture_titile;//状态
						culturecontext.setData(culture_context);//内容

						if(culture_status == "1"||culture_status == "2"){
							cultureStatus[0].checked = true;
						}
						else if(culture_status == "0"){
							cultureStatus[1].checked = true;
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
