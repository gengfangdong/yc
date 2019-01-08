<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="entity.IUser" %>
<%
	IUser user = (IUser)session.getAttribute("user");
	String figClass_id = request.getParameter("figClass_id");
%>
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
			#downLoad{
				color:#fff;
				margin:10px;
			}
			#downLoad:hover{
				color:#FFF!important;
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
										课程大纲
									</label>
								</div>
							</div>
							<div class="layui-tab layui-tab-card" style="border-style: none;box-shadow: none;min-height:250px;">
								<ul class="layui-tab-title">
									<li class="layui-this"">方案定制</li>
									<li>课程定制</li>
									<li>自由定制</li>
								</ul>
								<div class="layui-tab-content" style="height: 200px;overflow-y:scroll;">
									<div class="layui-tab-item layui-show">
										<div class="table-responsive table-responsive_vis" id="sample-table-2" style="padding-left: 10px;padding-right: 10px;">
											<table id="LAY_table_user2" lay-filter="user2"  class="table table-bordered table-hover example1_x" style="margin-top: 20px!important;">
												<thead>
													
												</thead>
												<tbody>
													
												</tbody>
											</table>
											
										</div>
									</div>
									<div class="layui-tab-item">
										<div class="form-group">
											 <div class="form-group" style="margin-top: 5px;height: 32px;line-height: 32px;margin-bottom: 0;">
												<div class="col-sm-10" style="height: 32px;line-height: 32px;">
													 <div class="layui-inline selectObj">
													    <label for="" class="control-label" style="float: left;">一级目录：</label>
														<select id="firstObj" class="select" onclick="firstSelect(this);" style="min-width: 150px;border-radius: 5px;border: 1px solid #cccccc;">
													        <option value="全部">全部</option>
													   </select>
													  </div>
													  <div class="layui-inline selectObj">
													    <label for="" class="control-label" style="float: left;">二级目录：</label>
														<select id="secondObj" class="select" onclick="secondSelect(this);"  style="min-width: 150px;border-radius: 5px;border: 1px solid #cccccc;">
													        <option value="全部">全部</option>
													   </select>
													  </div>
													<button class="layui-btn selectBtn" data-type="reload">搜索</button>
												</div>
											</div>	
										</div>
										<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 10px;padding-right: 10px;">
											<table id="LAY_table_user" lay-filter="user" class="table table-bordered table-hover example1_x" style="margin-top: 20px!important;">
												<thead>
												</thead>
												<tbody>
												</tbody>
											</table>
											
										</div>
									</div>
									
									<div class="layui-tab-item">
										<label for="" class="control-label" style="float: left;">大纲：</label>	
										<textarea style="width: 93%;height: 150px;border-radius:5px;"></textarea>
									</div>
									
								</div>
							</div>
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
											<td class="leftTd">拼班发起单位:</td>
											<td class="rightTd" colspan="2">
												<input type="text" value="" id="togetherClassesCompany" style="width: 100%;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">预计举办地点:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="planHostAddress" placeholder="请精确到所在市区县，如：北京市海淀区" style="width: 100%;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">报名开始日期:</td>
											<td class="rightTd" colspan="2">
												<input value="" id="togetherClassesStartDate" name="togetherClassesStartDate"  placeholder="YYYY-MM-DD" type="text" class="" style="height: 23px;width:252px;cursor:pointer;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">报名截止日期:</td>
											<td class="rightTd" colspan="2">
												<input value="" id="togetherClassesEndDate" name="togetherClassesEndDate" placeholder="YYYY-MM-DD" type="text" class="" style="height: 23px;width:252px;cursor:pointer;" />
											</td>

										</tr>
										
										<tr>
											<td class="leftTd">预计举办日期:</td>
											<td class="rightTd" colspan="2">
												<input id="hostDate" name="hostDate" placeholder="YYYY-MM-DD" type="text" class="" style="height: 23px;width:252px;cursor:pointer;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">预计结课日期:</td>
											<td class="rightTd" colspan="2">
												<input value="" id="classesEndDate" name="classesEndDate"  placeholder="YYYY-MM-DD" type="text" class="" style="height: 23px;width:252px;cursor:pointer;" />
											</td>
										</tr>
										
										<!-- <tr>
											<td class="leftTd">累计举办天数:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="hostDateNum" style="width: 100%;" />
											</td>

										</tr> -->
										<!-- <tr>
											<td class="leftTd">计划参加人数:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="planNumOfEntries" placeholder="请选择人数大于50人，低于50人，将发布到拼班项目" style="width: 100%;" />
											</td>

										</tr> -->
										<tr>
											<td class="leftTd">班级容纳人数:</td>
											<td class="rightTd" colspan="2">
												<input type="text" value="" id="maxClassesNumber" style="width: 100%;" />
											</td>
										</tr>
										
										<!-- <tr>
											<td class="leftTd">已经报名人数:</td>
											<td class="rightTd" colspan="2">
												<input type="text" value="" id="enrollNumber" style="width: 100%;" />
											</td>
										</tr> -->
										<tr>
											<td class="leftTd">拼班联系人员:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="contactPersonnel" style="width: 100%;" />
											</td>

										</tr>
										<tr>
											<td class="leftTd">拼班联系电话:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="contactNumber" style="width: 100%;" />
											</td>
										</tr>
										<tr>
											<td class="leftTd">相关资料:</td>
											<td class="rightTd" colspan="2">
												<div class="layui-upload-list">
												    <table class="layui-table">
												      <thead>
												        <tr><th>文件名</th>
												        <th>操作</th>
												      </tr></thead>
												      <tbody id="demoList"></tbody>
												    </table>
												 </div>
												 <button type="button" class="layui-btn layui-btn-normal" id="testList" style="float:right;margin-right:10px;">选择多文件</button>
											</td>
										</tr>
									</tbody>
								</table>
								<div style="text-align: center;margin-top: 100px;">
									<button class="branchSave branchSub" onclick="branchSub();">提交</button>
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
		
		<script>
			var firstObj="";
			var secondObj="";
			function firstSelect(obj){
				firstObj = obj.value;
				
				if(firstObj=="全部"){
					firstObj="";
				}
				$.ajax({
					url:"<%=request.getContextPath()%>/Course/getSecond",
					type:"post",
					data:{
						First_course:firstObj,
						Second_course:secondObj
					},
					success:function(data){
						if(data.success==true){
							document.getElementById("secondObj").innerHTML = '';
							document.getElementById("secondObj").innerHTML = '<option value="全部">全部</option>';
							for(var i=0;i<data.data.length;i++){
								document.getElementById("secondObj").innerHTML += '<option value='+data.data[i]+'>'+data.data[i]+'</option>';
							}
							var len = $('#firstObj').children().length;
							for(var j=0;j<len;j++){
								if($($('#firstObj').children()[j]).selected==true){
									$($('#firstObj').children()[j]).attr('selected','');
								}
							}
							for(var i=0;i<len;i++){
								if($($('#firstObj').children()[i]).val()==firstObj){
									$($('#firstObj').children()[i]).attr('selected','selected');
									break;
								}
							}
							secondObj = $("#secondObj").val();
							if(secondObj=="全部"){
								secondObj="";
							}
						}else{
							alert("没有数据！");
						}
					},
					error:function(error){
						alert("接口错误"+error);
					}
				});
				
				
			}
			
			function secondSelect(obj){

				secondObj = obj.value;
				if(secondObj=="全部"){
					secondObj="";
				}
				for(var i=0;i<$('#firstObj').length;i++){
					if($($('#firstObj').children()[i]).selected==true){
						var First_course = $($('#firstObj').children()[i]).val()
					}
				}
				
				$.ajax({
					url:"<%=request.getContextPath()%>/Course/getSecond",
					type:"post",
					data:{
						First_course:firstObj,
						Second_course:secondObj
					},
					success:function(data){
						if(data.success==true){
							document.getElementById("secondObj").innerHTML = '<option value="全部">全部</option>';
							for(var i=0;i<data.data.length;i++){
								document.getElementById("secondObj").innerHTML += '<option value='+data.data[i]+'>'+data.data[i]+'</option>';
							}
							var len = $('#secondObj').children().length;
							for(var j=0;j<len;j++){
								if($($('#secondObj').children()[i]).selected==true){
									$($('#secondObj').children()[i]).attr('selected','');
								}
							}
							for(var i=0;i<len;i++){
								if($($('#secondObj').children()[i]).val()==secondObj){
									$($('#secondObj').children()[i]).attr('selected','selected');		
								}
							}
							
							/* $("#secondObj").children(); */
						}else{
							alert("没有数据！");
						}
					},
					error:function(error){
						alert("接口错误"+error);
					}
				})
			}
		</script>
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
			    	elem: '#hostDate' //指定元素
			  	});
			  	
			  	laydate.render({
			    	elem: '#togetherClassesStartDate' //指定元素
			  	});
			  	
			  	laydate.render({
			    	elem: '#togetherClassesEndDate' //指定元素
			  	});
			  	
			  	laydate.render({
			    	elem: '#classesEndDate' //指定元素
			  	});
			});
			
			layui.use('table', function(){
				var table = layui.table;
			  
			  //方法级渲染
			  table.render({
			    elem: '#LAY_table_user',
			    url: '<%=request.getContextPath()%>/Course/getlistLay/<%=figClass_id%>',
			    cols: [[
			      {type:'checkbox'},
				  {type:'numbers',title:"序号",minWidth:90},
			     /*  {field:'course_id', title: 'ID',style:'display:none;'}, */
			      {field:'first_course', title: '一级目录',minWidth:120},
			      {field:'second_course', title: '二级目录',minWidth:120},
			      {field:'third_course', title: '三级目录',minWidth:120},
			      {field:'handle', title: '操作',toolbar: '#barDemo',minWidth:90}
			    ]],
			    id: 'testReload',
			    page: false
			  });
			  
			//监听工具条
			 table.on('tool(user)', function(obj){
			    var data = obj.data;
			    if(obj.event === 'show'){
			    	layer.open({
						type: 2, //此处以iframe举例
						title: '查看',
						area: ['90%', '90%'],
						shade: 0,
						maxmin: true,
						offset: [0, 0],
						content: 'showCourseCatalogue.jsp?course_id='+data.course_id,
						zIndex: layer.zIndex, //重点1
						success: function(layero) {
							layer.setTop(layero); //重点2
						}
					});
			     }  
			  });
			  
			  var $ = layui.$, active = {
			    reload: function(){
			      var demoReload = $('#demoReload');
			      
			      //执行重载
			      table.reload('testReload', {
			        page: {
			          curr: 1 //重新从第 1 页开始
			        },
			        method:'post',
			        where: {
			        	    First_course:firstObj,
							Second_course:secondObj
			        }
			      });
			    }
			  };
			  
			  //方案定制
			  table.render({
				    elem: '#LAY_table_user2',
				    url: '<%=request.getContextPath()%>/ClassPlan/getlistnopagef/<%=figClass_id%>',
				    cols: [[
					 // {field:'radio', title: '选择',toolbar: '#radio2'},
					  {type:'checkbox'},
					  {type:'numbers',title:"序号"},
				      {field:'classplan_id', title: 'ID',style:'display:none;'},
				      {field:'classplan_name', title: '方案名称'},
				      {field:'classplan_date', title: '选择天数',toolbar: '#selected'},
				      {field:'handle', title: '操作',toolbar: '#barDemo2'}
				    ]],
				    id: 'testReload2',
				    page: false,
				    done:function(){
				    	for(var i=0;i<$('#sample-table-2 .layui-table-body tr').length;i++){
				    		if($("#sample-table-2 .layui-table-body tr")[i].children[2].children[0].innerHTML == freeco_outline){
				    			$("#sample-table-2 .layui-table-body tr")[i].children[4].children[0].children[0].value = freeco_day;
				    		}
				    	}
				    }
				  });
			  
			//监听工具条
				 table.on('tool(user2)', function(obj){
				    var data = obj.data;
				    if(obj.event === 'show2'){
				    	layer.open({
							type: 2, //此处以iframe举例
							title: '查看',
							area: ['90%', '90%'],
							shade: 0,
							maxmin: true,
							offset: [0, 0],
							content: 'showCourseCatalogue.jsp?course_id='+data.course_id,
							zIndex: layer.zIndex, //重点1
							success: function(layero) {
								layer.setTop(layero); //重点2
							}
						});
				     }  
				  });
			  $('.demoTable .layui-btn').on('click', function(){
			    var type = $(this).data('type');
			    active[type] ? active[type].call(this) : '';
			    $('table.layui-table thead tr th:eq(2)').addClass('layui-hide');
			  });
			  $('table.layui-table thead tr th:eq(2)').addClass('layui-hide');
			});
		</script>
		<script>
		function deleteRow(objs){
	 			var tr = objs.parentElement.parentElement;
	 			var ttbody = tr.parentNode;
	 			var filedeletename = tr.childNodes[0].innerText;
	 			for(var oo = 0; oo<filesa.length;oo++){
	 				if(filesa[oo].oldfilename == filedeletename){
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
				      	if(filesa[o].oldfilename == filenamea){
				      		layer.alert("文件已存在!");
				      		return ;
				      	}
				    }
		      	filelist.push(file);
		        var tr = $(['<tr id="upload-'+ index +'">'
		          ,'<td>'+ file.name +'</td>'
		          ,'<td>'
		            ,'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
		            ,'<button class="layui-btn layui-btn-xs demo-delete" style="background:#1e9fff;padding:0 15px;margin:0;">删除</button>'
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
		</script>
		
		<script>
			function branchSub(){
				var classesName = $("#classesName").val();
				var togetherClassesCompany = $("#togetherClassesCompany").val();
				var planHostAddress = $("#planHostAddress").val();
				var togetherClassesStartDate = $("#togetherClassesStartDate").val();
				var togetherClassesEndDate = $("#togetherClassesEndDate").val(); 
				var hostDate = $("#hostDate").val();
				var classesEndDate = $("#classesEndDate").val();
				var maxClassesNumber = $("#maxClassesNumber").val();
				//var enrollNumber = $("#enrollNumber").val();
				var contactPersonnel = $("#contactPersonnel").val();
				var contactNumber = $("#contactNumber").val();
				var type = $(".layui-this")[0].innerHTML;
				var selectList = new Array;
				var reg=/^[1-9]\d*$|^0$/; // 注意：故意限制了 0321 这种格式，如不需要，直接reg=/^\d+$/;
				var testTel = /([0-9]{3,4}-)?[0-9]{7,8}$/;//办公电话
				var testPhone = /^1\d{10}$/;//手机
				if(type=="方案定制"){
					type=0;
					if($('#sample-table-2 .layui-form-checked').length==1){
						selectList[0] = $('.layui-form-checked')[0].parentNode.parentNode.parentNode.children[2].children[0].innerHTML;
						selectList[1] = $('.layui-form-checked')[0].parentNode.parentNode.parentNode.children[4].children[0].children[0].value
					}else if($("#sample-table-2 th .layui-form-checkbox").is(".layui-form-checked")&&$('.layui-form-checked').length==2){
						selectList[0] = $('.layui-form-checked')[1].parentNode.parentNode.parentNode.children[2].children[0].innerHTML;
						selectList[1] = $('.layui-form-checked')[1].parentNode.parentNode.parentNode.children[4].children[0].children[0].value;
					}else if($('#sample-table-2 .layui-form-checked').length==0){
						alert("请选择一个方案！");
						return;
					}else{
						alert("只能选择一个方案进行定制！");
						return;
					}

				}else if(type=="课程定制"){
					type=1;
					if($($("#sample-table-1 .layui-table-header tr")[0].children[0].children[0].children[1]).is('.layui-form-checked')==true){
						for(var i=1,j=0;i<$('.layui-form-checked').length;i++,j++){
							selectList[j] = $('.layui-form-checked')[i].parentNode.parentNode.parentNode.children[5].children[0].children[0].id;
						}
					}else if($('.layui-form-checked').length==0){
						alert("请选择课程！");
						return;
					}else{
						for(var i=0,j=0;i<$('.layui-form-checked').length;i++,j++){
							selectList[i] = $('.layui-form-checked')[i].parentNode.parentNode.parentNode.children[5].children[0].children[0].id;
						}
					}
				}else if(type=="自由定制"){
					type=2;
					selectList[0] = $("textarea")[0].value;
				}
				
				if(classesName==""){
					alert("请填写班级名称！");
					return;
				}
				if(togetherClassesCompany==""){
					alert("请填写拼班发起单位！");
					return;
				}
				if(planHostAddress==""){
					alert("请填写预计举办地点！");
					return;
				}
				if(togetherClassesStartDate==""){
					alert("请选择报名开始日期！");
					return;
				}
				if(togetherClassesEndDate==""){
					alert("请选择报名截止日期！");
					return;
				}
				if(hostDate==""){
					alert("请选择预计举办日期！");
					return;
				}
				if(classesEndDate==""){
					alert("请选择预计结课日期！");
					return;
				}
				if(maxClassesNumber==""){
					alert("请填写班级容纳人数！");
					return;
				}
				
				if(contactPersonnel==""){
					alert("请填写联系人员！");
					return;
				}
				if(contactNumber==""){
					alert("请填写联系电话！");
					return;
				}else if(testPhone.test(contactNumber)==false && testTel.test(contactNumber)==false){
					alert("请输入有效的联系电话！");
					return;
				}
				if(filelist.length<=0&&filesa.length<=0){
					alert("请选择资料上传!");
					return;
				}  
				var fd = new FormData();
				for(var i=0;i<filelist.length;i++){
					fd.append('file',filelist[i]);
				}
				for(var ttt = 0;ttt<filesa.length;ttt++){
					fd.append('oldfilename',filesa[ttt].newfilename);
				}
				fd.append('figClass_id','<%=figClass_id%>');
				fd.append('figClass_name',classesName);
				fd.append('figClass_deparment',togetherClassesCompany);
				fd.append('figClass_address',planHostAddress);
				fd.append('figClass_start_date',togetherClassesStartDate);
				fd.append('figClass_end_date',togetherClassesEndDate);
				fd.append('figClass_class_start',hostDate);
				fd.append('figClass_class_end',classesEndDate);
				fd.append('figClass_pernum',maxClassesNumber);
				fd.append('figClass_person',contactPersonnel);
				fd.append('figClass_phone',contactNumber);
				fd.append('figClass_caogery',type);
			
				fd.append('figClass_outline',selectList);

				$.ajax({
					url:'<%=request.getContextPath()%>/FigClass/updateFigClass',
					type:'post',
					encType: 'multipart/form-data', //表明上传类型为文件
					processData: false,  //tell jQuery not to process the data
	    			contentType: false,  //tell jQuery not to set contentType
					data:fd,
					success:function(data){
						if(data.success == true){
							if(data.message == "5"){
								layer.confirm('保存成功!', { title:'提示'}, function(index){
									  
									window.parent.location.reload();
									var index1 = parent.layer.getFrameIndex(window.name);
									parent.layer.close(index1);
								});
							}
						}else{
							layer.confirm('保存失败！', { title:'提示'}, function(index){ 
								window.parent.location.reload();
								var index1 = parent.layer.getFrameIndex(window.name);
								parent.layer.close(index1);
								console.log(error);
							});
						}
					},
					error:function(error){
						layer.confirm('保存失败!', { title:'提示'}, function(index){
							  
							window.parent.location.reload();
							var index1 = parent.layer.getFrameIndex(window.name);
							parent.layer.close(index1);
							console.log(error);
						});
					}
				})
				
			}
		</script>

		<script>
		var filesa = new Array();
		window.onload = function(){
			
			$.ajax({
				url:'<%=request.getContextPath()%>/FigClass/getDetailByid',
				type:'post',
				data:{
					FigClass_id:'<%=figClass_id%>'
				},
				success:function(data){
					if(data.success == true){
						
						var classesName = $("#classesName").val();
						var togetherClassesCompany = $("#togetherClassesCompany").val();
						var planHostAddress = $("#planHostAddress").val();
						var togetherClassesStartDate = $("#togetherClassesStartDate").val();
						var togetherClassesEndDate = $("#togetherClassesEndDate").val(); 
						var hostDate = $("#hostDate").val();
						var classesEndDate = $("#classesEndDate").val();
						var maxClassesNumber = $("#maxClassesNumber").val();
						//var enrollNumber = $("#enrollNumber").val();
						var contactPersonnel = $("#contactPersonnel").val();
						var contactNumber = $("#contactNumber").val();
						var type = $(".layui-this")[0].innerHTML;
						var selectList = new Array;
						
						$("#classesName").val(data.data.figClass.figClass_name);
						$("#togetherClassesCompany").val(data.data.figClass.figClass_deparment);
						$("#planHostAddress").val(data.data.figClass.figClass_address);
						$("#togetherClassesStartDate").val(data.data.figClass.figClass_start_date);
						$("#togetherClassesEndDate").val(data.data.figClass.figClass_end_date); 
						$("#hostDate").val(data.data.figClass.figClass_class_start);
						$("#classesEndDate").val(data.data.figClass.figClass_class_end);
						$("#maxClassesNumber").val(data.data.figClass.figClass_pernum);
 						$("#contactPersonnel").val(data.data.figClass.figClass_person);
						$("#contactNumber").val(data.data.figClass.figClass_phone);
						
						if(data.data.figClass.figClass_caogery==0){
							var type="方案定制";
							var nDivShow = $('.layui-tab-item');
							var nLiShow = $(".layui-tab-title li");
							for(var i=0;i<nLiShow.length;i++){
								if($(nLiShow[i]).is(".layui-this")){
									$(nLiShow[i]).removeClass("layui-this");
								}
								if($(nDivShow[i]).is(".layui-show")){
									$(nDivShow[i]).removeClass("layui-show");
								}
							}
							for (var j = 0; j <nLiShow.length; j++) {
								if($($(nLiShow[j])[0])[0].innerHTML==type){
									$(nLiShow[j]).addClass("layui-this");
								}
								$(nDivShow[0]).addClass('layui-show');
							}
							window.freeco_outline = data.data.figClass.figClass_outline;
							window.freeco_day = data.data.figClass.figClass_day;
							/*for(var n=0;n<nLiShow.length;n++){
								if(nLiShow[n].is(".layui-this")){
									return true;
								}else{
									$(nLiShow[n]).css('display','none');
								}
							}*/				
						}else if(data.data.figClass.figClass_caogery==1){
							var type="课程定制";
							var nDivShow = $('.layui-tab-item');
							var nLiShow = $(".layui-tab-title li");
							for(var i=0;i<nLiShow.length;i++){
								if($(nLiShow[i]).is(".layui-this")){
									$(nLiShow[i]).removeClass("layui-this");
								}
								if($(nDivShow[i]).is(".layui-show")){
									$(nDivShow[i]).removeClass("layui-show");
								}
							}
							for (var j = 0; j <nLiShow.length; j++) {
								if($($(nLiShow[j])[0])[0].innerHTML==type){
									$(nLiShow[j]).addClass("layui-this");
								}
								$(nDivShow[1]).addClass('layui-show');
							}

							window.freeco_outline = data.data.figClass.figClass_outline;
			
						}else if(data.data.figClass.figClass_caogery==2){
							var type="自由定制";
							var nDivShow = $('.layui-tab-item');
							var nLiShow = $(".layui-tab-title li");
							for(var i=0;i<nLiShow.length;i++){
								if($(nLiShow[i]).is(".layui-this")){
									$(nLiShow[i]).removeClass("layui-this");
								}
								if($(nDivShow[i]).is(".layui-show")){
									$(nDivShow[i]).removeClass("layui-show");
								}
							}
							for (var j = 0; j <nLiShow.length; j++) {
								if($($(nLiShow[j])[0])[0].innerHTML==type){
									$(nLiShow[j]).addClass("layui-this");
								}
								$(nDivShow[2]).addClass('layui-show');
							}
							$('#hostingDay').val(data.data.figClass.freeco_datanum);
							$('textarea').val(data.data.figClass.figClass_outline);
						}
						//文件回显start
						var memotr = "";
						filesa = data.data.figClass.figFiles;
    					for(var i = 0 ;i<filesa.length;i++){
    						memotr += '<tr id="upload-'+ i +'">'+
					          '<td>'+ filesa[i].oldfilename +'</td>'+
					          '<td>'+
					          '<button class="layui-btn layui-btn-xs demo-delete" style="background:#1e9fff;"><a href="<%=request.getContextPath()%>/FigClass/download/'+filesa[i].newfilename+' " class="hoverColor" id="downLoad">下载</a></button>'+
					          '</td>'+
					        '</tr>';
    					}
    					$("#demoList").append(memotr);
						//文件回显end
						
						//$(".layui-this").css('display','');
						//$($(nLiShow[j])[0])[0].innerHTML=type;
						//$(".layui-this")[0].innerHTML = type;
						
					}else{
						if(data.message == "0"){
							layer.alert("未登录!");
						}
						else if(data.message == "1"){
							layer.alert("定制班次不存在");
						} 

					}
				},error:function(data){

				}
			});
		}
		</script>
		<script type="text/html" id="barDemo">
  			<a class="" id={{d.course_id}}  lay-event="show" style="margin-right:10px;">查看</a>
		</script>
		<script type="text/html" id="barDemo2">
  			<a class="" lay-event="show2" style="margin-right:10px;">查看</a>
		</script>
		<script type="text/html" id="radio2">
			<input type="radio" name="planRadio" value="{{d.id}}" />
		</script>
		<script type="text/html" id="selected">
			<select lay-ignore>
  				<option value="0.5">0.5天</option>
				<option value="1">1天</option>
				<option value="1.5">1.5天</option>
				<option value="2">2天</option>
				<option value="2.5">2.5天</option>
				<option value="3">3天</option>
				<option value="3.5">3.5天</option>
				<option value="4">4天</option>
			</select>
		</script>
	</body>
</html>
