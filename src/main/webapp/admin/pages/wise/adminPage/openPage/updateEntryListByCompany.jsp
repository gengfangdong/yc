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
											<td class="rightTd" colspan="3">
												<input type="text" value="第四期国税系统税务稽查专业骨干中级培训班" id="entryByCompanyProject" style="width: 100%;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">报名类别:</td>
											<td class="rightTd" colspan="3">
												<input type="text" value="单位" id="entryByCompanyStates" style="width: 100%;"  />
											</td>

										</tr>
										<tr>
											<td class="leftTd">报名日期:</td>
											<td class="rightTd" colspan="3">
												<input type="text" value="2018-12-11" placeholder="YYYY-MM-DD" id="entryByCompanyDate"   />
											</td>

										</tr>
										<tr>
											<td class="leftTd">报名单位:</td>
											<td class="rightTd" colspan="3">
												<input type="text" value="北京市海淀区税务局" id="entryByCompanyEntryCompany"  style="width: 100%;" />
											</td>

										</tr>

										<tr>
											<td class="leftTd">联系人:</td>
											<td class="rightTd" colspan="3">
												<input type="text" id="entryByCompanyContactMan" value="王老师"  style="width: 100%;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">联系人电话:</td>
											<td class="rightTd" colspan="3">
												<input type="text" id="entryByCompanyPhoneNum" value="010-3456789"  style="width: 100%;" />
											</td>
										</tr>
										<tr>
											<td class="leftTd">联系人邮箱:</td>
											<td class="rightTd" colspan="3">
												<input type="text" id="entryByCompanyEmail" value="123456789@qq.com"  style="width: 100%;" />
											</td>
										</tr>
										<tr>
											<td class="leftTd" rowspan="2" style="vertical-align: middle;">报名名单:</td>
											<td class="rightTd">
												<input type="text" id="entryByCompanyfile" value="文件名" style="width: 100%;" disabled="disabled">
												<input type="text" name="hiddenfilename" hidden="hidden" id="hiddenfilename">
											</td>
											<td>
												<a class="download_a" href='<%=request.getContextPath()%>/ApplyUnit/download/<%=applyshow_id%>' style="color: #FFFFFF;"><button type="button" class="layui-btn lay_btn" id="test1">
												  <i class="layui-icon">&#xe67c;</i>下载
												</button></a>
											</td>
											<td>
												<button type="button" class="layui-btn lay_btn" id="test11"  >
												<i class="layui-icon">&#xe67c;</i>上传
												</button>
											</td>

										</tr>
									</tbody>
								</table>
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
									<button class="picSave" onclick="CompanySave();" id="CompanySave">保存</button>
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
		layui.use('upload', function(){
			  var $ = layui.jquery,
			  upload = layui.upload;
			  
			  //普通图片上传
			  var uploadInst = upload.render({
			    elem: '#test11' ,
			    url: '<%=request.getContextPath()%>/ApplyUnit/updatefile',
			    auto:false,
			    accept: 'file', //允许上传的文件类型
			    bindAction: '#CompanySave',
			    /*data:{
           		 		News_Title:document.getElementById("newsTitle").value,
						News_Introduction:newsAbstract,
						News_KeyWords:newsKeyWords,
						News_Release_time:newsDate,
						News_status:news_status//,
						//News_context:news_context
        		},*/
			    choose: function(obj){
			       //预读本地文件示例，不支持ie8
			      obj.preview(function(index, file, result){
			        document.getElementById("entryByCompanyfile").value=file.name;
			        document.getElementById("hiddenfilename").value="";
			      });
			    },
			    before:function(obj){
			    	var entryByCompanyProject = document.getElementById("entryByCompanyProject");
					var entryByCompanyStates = document.getElementById("entryByCompanyStates");
					var entryByCompanyDate = document.getElementById("entryByCompanyDate");
					var entryByCompanyEntryCompany = document.getElementsByName("entryByCompanyEntryCompany");
					var entryByCompanyContactMan = document.getElementById("entryByCompanyContactMan");
					var entryByCompanyEmail = document.getElementById("entryByCompanyEmail");
					var entryByCompanyPhoneNum = document.getElementById("entryByCompanyPhoneNum");
					var isPass = document.getElementsByName("isPass");
					var applyunitid = document.getElementById("applyunit_id");
					var applyunit_status="";
					if(isPass[0].checked==true){
						applyunit_status = "1";
					}else if(isPass[1].checked==true){
						applyunit_status = "2";
					}
			    	this.data={
			    		"applyunit_id":'<%=applyshow_id%>',
						"applyunit_status":applyunit_status,
						"applyunit_date":entryByCompanyDate.value,
						"applyunit_name":entryByCompanyEntryCompany.value,
						"applyunit_person":entryByCompanyContactMan.value,
						"applyunit_phone":entryByCompanyPhoneNum.value,
						"applyunit_mail":entryByCompanyEmail.value,
			    	}//携带额外的数据
				    obj.preview(function(index, file, result){
				        $('#demo1').attr('src', result); //图片链接（base64）
				    });
			    },
			    done: function(res){
			    	
			      //如果上传失败
			      if(res.code == 2){
			        return layer.msg('没有选择模板!');
			      }
			      else if(res.code == 3){
			        return layer.msg('上传失败!');
			      }
			      //上传成功
			      else if(res.code == 1){
			    	 layer.alert("保存成功!");
									
			   	}
			    },
			    error: function(res){
			      //演示失败状态，并实现重传
			      var demoText = $('#demoText');
			      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
			      demoText.find('.demo-reload').on('click', function(){
			        uploadInst.upload();
			      });
			    }
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
						var entryByCompanyEmail = document.getElementById("entryByCompanyEmail");
						var isPass = document.getElementsByName("isPass");
						var applyunitid = document.getElementById("applyunit_id");
						var entryByCompanyfile = document.getElementById("entryByCompanyfile");
						var hiddenfilename = document.getElementById("hiddenfilename");
						var entryByCompanyPhoneNum = document.getElementById("entryByCompanyPhoneNum");

						var projectname = data.name;
						var apply_id = data.data.applyunit_id;
						var applyunit_date = data.data.applyunit_date;
						var applyunit_name = data.data.applyunit_name;
						var applyunit_person = data.data.applyunit_person;
						var applyunit_status = data.data.applyunit_status;
						var applyunit_phone = data.data.applyunit_phone;
						var file = data.data.applyunit_file;
						var applyunit_mail = data.data.applyunit_mail;
						
						entryByCompanyProject.value=projectname; 
						entryByCompanyStates.value="单位";
						entryByCompanyDate.value=applyunit_date;
						entryByCompanyEntryCompany.value=applyunit_name;
						entryByCompanyContactMan.value=applyunit_person;
						entryByCompanyPhoneNum.value = applyunit_phone;
						entryByCompanyEmail.value=applyunit_mail;
						entryByCompanyfile.value=file;
						hiddenfilename.value = file;
						applyunitid.value = apply_id;
						if(applyunit_status == "1"){
							isPass[0].checked=true;
						}else if(applyunit_status == "2"){
							isPass[1].checked=true;
						}


					}
					
				},
				error : function(error) {
					console.log('接口不通' + error);
				}
			});	
   	 		};
		</script>
		<script type="text/javascript">
			function CompanySave(){
				var hiddenfilename = document.getElementById("hiddenfilename").value;
				if(hiddenfilename == "" || hiddenfilename == undefined){

				}
				else{
					var entryByCompanyProject = document.getElementById("entryByCompanyProject");
					var entryByCompanyStates = document.getElementById("entryByCompanyStates");
					var entryByCompanyDate = document.getElementById("entryByCompanyDate");
					var entryByCompanyEntryCompany = document.getElementsByName("entryByCompanyEntryCompany");
					var entryByCompanyContactMan = document.getElementById("entryByCompanyContactMan");
					var entryByCompanyEmail = document.getElementById("entryByCompanyEmail");
					var entryByCompanyPhoneNum = document.getElementById("entryByCompanyPhoneNum");
					var isPass = document.getElementsByName("isPass");
					var applyunitid = document.getElementById("applyunit_id");
					var applyunit_status;
					if(isPass[0].checked==true){
						applyunit_status = "1";
					}else if(isPass[1].checked==true){
						applyunit_status = "2";
					}
					$.ajax({
						url : '<%=request.getContextPath()%>/ApplyUnit/update',
						type : 'POST',
						data:{
							"applyunit_id":'<%=applyshow_id%>',
							"applyunit_status":applyunit_status,
							"applyunit_date":entryByCompanyDate.value,
							"applyunit_name":entryByCompanyEntryCompany.value,
							"applyunit_person":entryByCompanyContactMan.value,
							"applyunit_phone":entryByCompanyPhoneNum.value,
							"applyunit_mail":entryByCompanyEmail.value,
						},
						success : function(data) {
							if(data.success == true){
								if("2" == data.msg){
									layer.alert("修改成功!");
								}
							}
						
					},
					error : function(error) {
						console.log('接口不通' + error);
					}
					});	
				}

			}
		</script>
	</body>

</html>