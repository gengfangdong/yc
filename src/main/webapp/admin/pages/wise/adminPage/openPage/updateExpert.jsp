<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String expert_id = request.getParameter("expert_id");
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
								<table id="expertTable" class="table table-bordered table-hover example1_x">
									<tbody>
										<input type="text" id="expertid" hidden="hidden" id="expertid"/>
										<input type="text" id="filename" name="filename" hidden="hidden">
										<tr>
											<td class="leftTd">标题:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="expertTitle" />
											</td>
										</tr>
										<tr>
											<td class="leftTd">封面:</td>
											<td class="rightTd">
												<div class="layui-upload-list">
												  <img class="layui-upload-img" id="demo1" style="width:150px;" src="<%=request.getContextPath()%>/Expert/Expert_title_page_Show?expert_id=<%=expert_id%>">
												  </div>注1：请上传1024*600以上尺寸的图片<br>
														注2：保存后，封面才会修改
											</td>
											<td style="width: 20%;">
												<button type="button" class="layui-btn lay_btn" id="test1" style="width: 95px;">
												  <i class="layui-icon">&#xe67c;</i>浏览
												</button>
											</td>
										</tr>
										<tr>
											<td class="leftTd">简介:</td>
											<td class="rightTd" colspan="2">
												<input type="text" placeholder="请输入50字以下文字" id="expertAbstract" />
											</td>
										</tr>
										<tr>
											<td class="leftTd">关键字:</td>
											<td class="rightTd" colspan="2">
												<input type="text" placeholder="请输入5个以内关键字，用逗号隔开" id="expertKeyWords" />
											</td>
										</tr>
										<!--<tr>
											<td class="leftTd">类别:</td>
											<td class="rightTd">
												<input type="text" id="expertCategory" />
											</td>
										</tr>-->
										<tr>
											<td class="leftTd">发布日期:</td>
											<td class="rightTd" colspan="2">
												<input id="expertDate" name="expertDate" placeholder="YYYY-MM-DD" type="text" class="" style="height: 23px;" />
											</td>
										</tr>
										<tr>
											<td class="leftTd">状态:</td>
											<td class="rightTd" colspan="2">
												<input type="radio" value="发布" name="expertStates" class="expertStates" style="margin-right: 5px;" /><span>发布</span>
												<input type="radio" value="保存" name="expertStates" class="expertStates" style="margin-right: 5px;margin-left: 10px;" /><span>保存</span>
											</td>
										</tr>
										
										<tr>
											<td class="leftTd" style="vertical-align: middle;">内容:</td>
											<td class="rightTd" colspan="2">
												<textarea name="description" id="expertDescription" /></textarea>
											</td>
										</tr>
									</tbody>
								</table>
								</form>
								<div style="text-align: center;">
									<button class="expertSave saveBtn" id="expertSave" onclick="save();">保存</button>
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
				<script>
		layui.use('laydate', function(){
		  var laydate = layui.laydate;
		  
		  //执行一个laydate实例
		  laydate.render({
		    elem: '#expertDate' //指定元素
		  });
		});
		</script>
		<script>
		layui.use('upload', function(){
			  var $ = layui.jquery,
			  upload = layui.upload;
			  
			  //普通图片上传
			  var uploadInst = upload.render({
			    elem: '#test1' ,
			    url: '<%=request.getContextPath()%>/Expert/updateExpertandFile',
			    auto:false,
			    bindAction: '#expertSave',
			    /*data:{
           		 		Expert_Title:document.getElementById("expertTitle").value,
						Expert_Introduction:expertAbstract,
						Expert_KeyWords:expertKeyWords,
						Expert_Release_time:expertDate,
						Expert_status:expert_status//,
						//Expert_context:expert_context
        		},*/
			    choose: function(obj){
			      //预读本地文件示例，不支持ie8
			      obj.preview(function(index, file, result){
			        $('#demo1').attr('src', result); //图片链接（base64）
			      });
			      document.getElementById("filename").value="";
			    },
			    before:function(obj){
			    	var expertStatus = document.getElementsByName("expertStates");
			    	var expert_status="";
					for(var i=0;i<expertStatus.length;i++){
						if(expertStatus[i].checked == true){
							if("发布"==expertStatus[i].value){
								expert_status = '1';
							}
							else
								expert_status = '0';
							//expert_status = expertStatus[i].value;
							break;
						}
					}
			    	this.data={
			    	"Expert_Title": document.getElementById("expertTitle").value,
			    	"Expert_Introduction":document.getElementById("expertAbstract").value,
					"Expert_KeyWords":document.getElementById("expertKeyWords").value,
					"Expert_Release_time":document.getElementById("expertDate").value,
					"Expert_status":expert_status,
					"Expert_context":CKEDITOR.instances.expertDescription.getData(),
					"filename":document.getElementById("filename").value,
					"Expert_id":document.getElementById("expertid").value
			    	}//携带额外的数据
				    obj.preview(function(index, file, result){
				        $('#demo1').attr('src', result); //图片链接（base64）
				    });
			    },
			    done: function(res){
			    	
			      //如果上传失败
			      if(res.code == 2){
			        return layer.msg('没有选择图片!');
			      }
			      else if(res.code == 3){
			        return layer.msg('上传失败!');
			      }
			      //上传成功
			      else if(res.code == 1){
			    	 layer.alert("保存成功!");
									
			   	  }
			   	  else if(res.code == 0){
			   	  	layer.alert("保存失败!");
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
			function save(){
				var expertTitle = $('#expertTitle').val();
				var expertAbstract = $("#expertAbstract").val();
				var expertKeyWords = $("#expertKeyWords").val();
				var expertDate = $("#expertDate").val();
				var expertStates = $(".expertStates");
				var expertDescription = CKEDITOR.instances.expertDescription.getData();
				if(expertTitle == "") {
					alert("请填写标题！");
					return;
				}
				if(expertAbstract == "") {
					alert("请填写简介！");
					return;
				}
				if(expertKeyWords == "") {
					alert("请填写关键字！");
					return;
				}
				if(expertDate == "") {
					alert("请选择日期！");
					return;
				}
				if(expertDescription.length == "") {
					alert("请填写内容！");
					return;
				}
				if(expertStates[0].checked == true) {
// 					var sex = "0";
				} else if(expertStates[1].checked == true) {
// 					var sex = "1";
				} else {
					alert("请选择状态！");
					return;
				}
				
				//debugger;
				var oldfilename = document.getElementById("filename").value; 
				if(oldfilename !=""){
					var expert_title_page = oldfilename;
			    	var expert_context = CKEDITOR.instances.expertDescription.getData();
					var expertTitle = document.getElementById("expertTitle").value;
					var expertAbstract = document.getElementById("expertAbstract").value;
					var expertKeyWords = document.getElementById("expertKeyWords").value;
					var expertDate = document.getElementById("expertDate").value;
					var expertStatus = document.getElementsByName("expertStates");
					var Expert_id = document.getElementById("expertid").value;
					var expert_status="";
					for(var i=0;i<expertStatus.length;i++){
						if(expertStatus[i].checked == true){
							if("发布"==expertStatus[i].value){
								expert_status = '1';
							}
							else
								expert_status = '0';
							//expert_status = expertStatus[i].value;
							break;
						}
					}
					$.ajax({
						url : '<%=request.getContextPath()%>/Expert/updateExpert',
						type : 'post',
						dataType:"json",
						data:{
							Expert_Title:expertTitle,
							Expert_Introduction:expertAbstract,
							Expert_KeyWords:expertKeyWords,
							Expert_Release_time:expertDate,
							Expert_status:expert_status,
							Expert_context:expert_context,
							filename:expert_title_page,
							Expert_id:Expert_id
						},
						success : function(data) {
							if(data.message == "1"){
								layer.alert("保存成功!");
							}
							
						},
						error : function(error) {
							console.log('接口不通' + error);
						}
					});	
				}
				
			}
		</script>
		<script type="text/javascript">
			 window.onload = function(){
        		CKEDITOR.replace('expertDescription');
        		$.ajax({
				url : '<%=request.getContextPath()%>/Expert/getExpertdetailByid',
				type : 'GET',
				data:{
					expert_id:'<%=expert_id%>'
				},
				success : function(data) {
					if(data.success == true){
						var expertcontext = CKEDITOR.instances.expertDescription;
						var expertTitle = document.getElementById("expertTitle");
						var expertAbstract = document.getElementById("expertAbstract");
						var expertKeyWords = document.getElementById("expertKeyWords");
						var expertDate = document.getElementById("expertDate");
						var expertStatus = document.getElementsByName("expertStates");
						var expertid = document.getElementById("expertid");
						var filename = document.getElementById("filename");
						var expert_id = data.data.expert_id;
						var expert_Introduction = data.data.expert_Introduction;
						var expert_KeyWords = data.data.expert_KeyWords;
						var expert_Rlease_time = data.data.expert_Release_time;
						var expert_context = data.data.expert_context;
						var expert_titile = data.data.expert_titile;
						var expert_status = data.data.expert_status;
						var expert_title_page = data.data.expert_title_page;
						
						expertid.value=expert_id;//专家id
						expertTitle.value=expert_titile; //标题
						expertAbstract.value=expert_Introduction;//简介
						expertKeyWords.value=expert_KeyWords;//关键字
						expertDate.value=expert_Rlease_time;//发布日期
						expertTitle.value=expert_titile;//状态
						expertcontext.setData(expert_context);//内容
						filename.value=expert_title_page;
						if(expert_status == "1"||expert_status == "2"){
							expertStatus[0].checked = true;
						}
						else if(expert_status == "0"){
							expertStatus[1].checked = true;
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
