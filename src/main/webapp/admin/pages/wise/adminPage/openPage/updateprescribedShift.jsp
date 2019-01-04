<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	String scheduled_id = request.getParameter("scheduled_id");
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
		<link rel="stylesheet" href="../../bootstrap-fileinput-master/css/fileinput.css" media="all">
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
			#testListAction,#testList{
				float:right;
				margin-left:10px;
				margin-right:10px;
				font-size:12px;
				height:28px;
				line-height:28px;
			}
			.hoverColor{
				color:#fff!important;				
			}
			.layui-btn .hoverColor:hover{
				color: #fff!important;
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
										规定班次信息
									</label>
								</div>
							</div>
							<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 10px;padding-right: 10px;">
								<table id="branchTable" class="table table-bordered table-hover example1_x">
									<tbody>
										<tr>
											<td class="leftTd">班次名称:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="className" style="width: 100%;border:none;border:1px solid #ccc;height:23px;border-radius:5px;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">发起单位:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="hostCompany" style="width: 100%;border:none;border:1px solid #ccc;height:23px;border-radius:5px;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">培训开课地点:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="hostAddress" placeholder="请填写培训开课地点" style="width: 100%;border:none;border:1px solid #ccc;height:23px;border-radius:5px;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">报名开始日期:</td>
											<td class="rightTd" colspan="2">
											<input id="hostStartDate" name="projectListDate" placeholder="请选择报名开始日期" type="text" class="" style="border:none;border:1px solid #ccc;height:23px;border-radius:5px;width:257px;"  />
											</td>

										</tr>
										<tr>
											<td class="leftTd">报名截止日期:</td>
											<td class="rightTd" colspan="2">
											<input id="hostEndDate" name="projectListDate" placeholder="请选择报名截止日期" type="text" class=""  style="border:none;border:1px solid #ccc;height:23px;border-radius:5px;width:257px;"  />
											</td>

										</tr>
										<tr>
											<td class="leftTd">预计开课日期:</td>
											<td class="rightTd" colspan="2">
											<input id="startClassDate" name="projectListDate" placeholder="请选择开课日期" type="text" class=""  style="border:none;border:1px solid #ccc;height:23px;border-radius:5px;width:257px;" />
											</td>
										</tr>
										<tr>
											<td class="leftTd">预计结课日期:</td>
											<td class="rightTd" colspan="2">
											<input id="endClassDate" name="projectListDate" placeholder="请选择结课日期" type="text" class="" style="border:none;border:1px solid #ccc;height:23px;border-radius:5px;width:257px;" />
											</td>
										</tr>
										<tr>
											<td class="leftTd">班级容纳人数:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="peopleNum" placeholder="请输入班级容纳人数" style="width: 100%;border:none;border:1px solid #ccc;height:23px;border-radius:5px;"  />
											</td>
										</tr>
										<tr>
											<div class="layui-upload-list">
											    <table class="layui-table">
											      <thead>
											        <tr><th>文件名</th>
											        <th>操作</th>
											      </tr></thead>
											      <tbody id="demoList"></tbody>
											    </table>
											 </div>
											 <button type="button" class="layui-btn layui-btn-normal" id="testList">选择多文件</button>
										</tr>
									</tbody>
								</table>
							</div>
							
							<div class="row" style="height: 30px;line-height: 30px;">
								<div class="col-sm-9 col-md-9">
									<label style="font-size: 14px; padding-left: 24px;">
										<img src="../../../../image/square.png" style="margin-top: -1px;width: 12px;">
										课程大纲
									</label>
								</div>
							</div>
							<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 10px;padding-right: 10px;">
								<table id="branchTable" class="table table-bordered table-hover example1_x">
									<tbody>
										<tr>
											<td class="">
												<textarea name="description" id="syllabus" /></textarea>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="row" style="height: 30px;line-height: 30px;">
								<div class="col-sm-9 col-md-9">
									<label style="font-size: 14px; padding-left:24px;">
										<img src="../../../../image/square.png" style="margin-top: -1px;width: 12px;">
										其他相关信息
									</label>
								</div>
							</div>
							<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 10px;padding-right: 10px;">
								<table id="branchTable" class="table table-bordered table-hover example1_x">
									<tbody>
										<tr>
											<td class="">
												<textarea name="description" id="otherInformation" /></textarea>
											</td>
										</tr>
									</tbody>
								</table>
								<div style="text-align: center;margin-top: 0px;">
									<button class="picSave" onclick="perscribedShift();">保存</button>
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
		<script src="../../bootstrap-fileinput-master/js/fileinput.js" type="text/javascript"></script>
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
			    	elem: '#hostStartDate' //指定元素
			  	});
			  	 //执行一个laydate实例
			  	laydate.render({
			    	elem: '#hostEndDate' //指定元素
			  	});
			  	 //执行一个laydate实例
			  	laydate.render({
			    	elem: '#startClassDate' //指定元素
			  	});
			  	 //执行一个laydate实例
			  	laydate.render({
			    	elem: '#endClassDate' //指定元素
			  	});
			});
		</script>
		<script>
		
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
			var filesa=new Array();
			 window.onload = function(){
        		CKEDITOR.replace('syllabus');
        		CKEDITOR.replace('otherInformation');
        		$.ajax({
        			url:'<%=request.getContextPath()%>/ScheduledShift/getDetailByid',
        			type:"POST",
        			data:{
        				"Scheduled_id":'<%=scheduled_id%>'
        			},
        			success:function(data){
        				if(data.success == true){
        					var scheduled_name = data.data.scheduled_name;
        					var scheduled_initiator = data.data.scheduled_initiator;
        					var scheduled_address = data.data.scheduled_address;
        					var scheduled_start = data.data.scheduled_start;
        					var scheduled_end = data.data.scheduled_end;
        					var scheduled_class_start = data.data.scheduled_class_start;
        					var scheduled_class_end = data.data.scheduled_class_end;
        					var scheduled_class_pnumber = data.data.scheduled_class_pnumber;
        					var scheduled_class_context = data.data.scheduled_class_context;
        					var scheduled_other_context = data.data.scheduled_other_context;
        					var memotr = "";
							
        					filesa = data.data.scheduleds;
        					document.getElementById("className").value=scheduled_name;
        					document.getElementById("hostCompany").value=scheduled_initiator;
        					document.getElementById("hostAddress").value=scheduled_address;
        					document.getElementById("hostStartDate").value=scheduled_start;
        					document.getElementById("hostEndDate").value=scheduled_end;
        					document.getElementById("startClassDate").value=scheduled_class_start;
        					document.getElementById("endClassDate").value=scheduled_class_end;
        					document.getElementById("peopleNum").value=scheduled_class_pnumber;
        					
        					CKEDITOR.instances.syllabus.setData(scheduled_class_context);
        					CKEDITOR.instances.otherInformation.setData(scheduled_other_context);

        					for(var i = 0 ;i<filesa.length;i++){

        						memotr += '<tr id="upload-'+ i +'">'+
						          '<td>'+ filesa[i].scheduled_oldfile +'</td>'+
						          '<td>'+
						          '<button class="layui-btn layui-btn-xs demo-delete" style="background:#1e9fff;"><a href="<%=request.getContextPath()%>/ScheduledShift/download/'+filesa[i].scheduled_file+' " class="hoverColor">下载</a></button><button class="layui-btn layui-btn-xs demo-delete" style="background:#1e9fff;" onclick="deleteRow(this);">'+
						          '删除</button>'+
						          '</td>'+
						        '</tr>';
        					}
        					$("#demoList").append(memotr);
        				}
        				else{
        					if(data.msg == "0"){
        						layer.alert("参数错误!");
        					}
        					else
        						layer.alert("未获取规定班次!");
        				}
        			},error:function(data){

        			}

        		})
   	 		};
   	 		function deleteRow(objs){
   	 			var tr = objs.parentElement.parentElement;
   	 			var ttbody = tr.parentNode;
   	 			var filedeletename = tr.childNodes[0].innerText;
   	 			for(var oo = 0; oo<filesa.length;oo++){
   	 				if(filesa[oo].scheduled_oldfile == filedeletename){
			      			filesa.splice(oo,1);
			      			break;
			      	}
   	 			}
   	 			ttbody.removeChild(tr);
   	 		}
   	 		var filelist = [];
			layui.use('upload', function() {
				var upload = layui.upload;

				//多文件列表示例
			  var demoListView = $('#demoList')
			    ,uploadListIns = upload.render({
			    elem: '#testList'
			    ,url: '/upload/'
			    ,accept: 'file'
			    ,multiple: true
			    ,auto: false
			    ,bindAction: '#testListAction'
			    ,choose: function(obj){   
			      var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
			      //读取本地文件
			      obj.preview(function(index, file, result){
			      	var filenamea = file.name;
			      	for(var o = 0 ;o<filesa.length;o++){
			      		if(filesa[o].scheduled_oldfile == filenamea){
			      			layer.alert("文件已存在!");
			      			break;
			      			return ;
			      		}
			      	}
			      	filelist.push(file);
			        var tr = $(['<tr id="upload-'+ index +'">'
			          ,'<td>'+ file.name +'</td>'
			          ,'<td>'
			            ,'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
			            ,'<button class="layui-btn layui-btn-xs demo-delete" style="background:#1e9fff;">删除</button>'
			          ,'</td>'
			        ,'</tr>'].join(''));
			        
			        //单个重传
			        tr.find('.demo-reload').on('click', function(){
			          obj.upload(index, file);
			        });
			        
			        //删除
			        tr.find('.demo-delete').on('click', function(){
			        	
			          var temp = files[index];
			          for(var t=0;t<filelist.length;t++){
			          	if(filelist[t] == temp){
			          		delete filelist[t];
			          		break;
			          	}
			          }
			          delete files[index]; //删除对应的文件
			          tr.remove();

			          uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
			        });
			        
			        demoListView.append(tr);
			      });
			    }
			    ,done: function(res, index, upload){
			      if(res.code == 0){ //上传成功
			        var tr = demoListView.find('tr#upload-'+ index)
			        ,tds = tr.children();
			        tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
			        tds.eq(3).html(''); //清空操作
			        return delete this.files[index]; //删除文件队列已经上传成功的文件
			      }
			      this.error(index, upload);
			    }
			    ,error: function(index, upload){
			      var tr = demoListView.find('tr#upload-'+ index)
			      ,tds = tr.children();
			      tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
			      tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
			    }
			  });
			});
			function perscribedShift(){
				var className = $("#className").val();
				var hostCompany = $("#hostCompany").val();
				var hostAddress = $("#hostAddress").val();
				var hostStartDate = $("#hostStartDate").val();
				var hostEndDate = $("#hostEndDate").val();
				var startClassDate = $("#startClassDate").val();
				var endClassDate = $("#endClassDate").val();
				var peopleNum = $("#peopleNum").val();
				var Scheduled_class_context = CKEDITOR.instances.syllabus.getData();
				var Scheduled_other_context = CKEDITOR.instances.otherInformation.getData();
				
				if(className==""){
					alert("请输入班次名称！");
					return;
				}
				if(hostCompany==""){
					alert("请输入发起单位！");
					return;
				}
				if(hostAddress==""){
					alert("请输入培训开课地点！");
					return;
				}
				if(hostStartDate==""){
					alert("请选择报名开始日期！");
					return;
				}
				if(hostEndDate==""){
					alert("请选择报名截止日期！");
					return;
				}
				if(hostStartDate>hostEndDate){
					alert("报名截止日期应在报名开始日期之后！");
					return;
				}
				if(startClassDate==""){
					alert("请选择开课日期！");
					return;
				}
				if(endClassDate==""){
					alert("请选择结课日期！");
					return;
				}
				if(startClassDate>endClassDate){
					alert("结课日期应在开课日期之后！");
					return;
				}
				if(hostEndDate>startClassDate){
					alert("开课日期应在报名截止日期之后！");
					return;
				}
				if(peopleNum==""){
					alert("请输入班级容纳人数！");
					return;
				}
				
				var fd = new FormData();
				for(var j = 0;j<filelist.length;j++){
					fd.append('file', filelist[j]);
				}
				for(var ttt = 0;ttt<filesa.length;ttt++){
					fd.append('oldfilename',filesa[ttt].scheduled_file);
				}
				fd.append('Scheduled_id','<%=scheduled_id%>');
    			fd.append('Scheduled_name', className);
    			fd.append('Scheduled_initiator', hostCompany);
    			fd.append('Scheduled_address', hostAddress);
    			fd.append('Scheduled_start', hostStartDate);
    			fd.append('Scheduled_end', hostEndDate);
    			fd.append('Scheduled_class_start', startClassDate);
    			fd.append('Scheduled_class_end', endClassDate);
    			fd.append('Scheduled_class_pnumber', peopleNum);
    			fd.append('Scheduled_class_context', Scheduled_class_context);
    			fd.append('Scheduled_other_context', Scheduled_other_context);
				$.ajax({
					url:'<%=request.getContextPath()%>/ScheduledShift/updateScheduled',
					type:'post',
					encType: 'multipart/form-data', //表明上传类型为文件
					processData: false,  //tell jQuery not to process the data
        			contentType: false,  //tell jQuery not to set contentType
					data:						/*"txt_file":filelist,
						"Scheduled_name":className,
						"Scheduled_initiator":hostCompany,
						"Scheduled_address":hostAddress,
						"Scheduled_start":hostStartDate,
						"Scheduled_end":hostEndDate,
						"Scheduled_class_start":startClassDate,
						"Scheduled_class_end":endClassDate,
						"Scheduled_class_pnumber":peopleNum,
						"Scheduled_class_context":Scheduled_class_context,
						"Scheduled_other_context":Scheduled_other_context*/
						fd
					,
					success:function(data){
						if(data.success == true){
							if(data.message == "3"){
								layer.alert("修改成功!");
							}
						}
						else
							layer.alert("修改失败!");
					},
					error:function(data){

					}
				})
			}
		</script>
		<script>
			
		</script>

	</body>
</html>
