<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String rules_id = request.getParameter("rules_id");
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
								<table id="newsTable" class="table table-bordered table-hover example1_x">
									<tbody>
										<input type="text" id="newsid" hidden="hidden" id="rulesid"/>
										<input type="text" id="filename" name="filename" hidden="hidden">
										<tr>
											<td class="leftTd">标题:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="newsTitle" />
											</td>
										</tr>
										<tr>
											<td class="leftTd">封面:</td>
											<td class="rightTd">
												<div class="layui-upload-list">
												  <img class="layui-upload-img" id="demo1" style="width:150px;" src="<%=request.getContextPath()%>/Rules/Rules_title_page_Show?rules_id=<%=rules_id%>">
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
												<input type="text" placeholder="请输入50字以下文字" id="newsAbstract" />
											</td>
										</tr>
										<tr>
											<td class="leftTd">关键字:</td>
											<td class="rightTd" colspan="2">
												<input type="text" placeholder="请输入5个以内关键字，用逗号隔开" id="newsKeyWords" />
											</td>
										</tr>
										<!--<tr>
											<td class="leftTd">类别:</td>
											<td class="rightTd">
												<input type="text" id="newsCategory" />
											</td>
										</tr>-->
										<tr>
											<td class="leftTd">发布日期:</td>
											<td class="rightTd" colspan="2">
												<input id="newsDate" name="newsDate" placeholder="YYYY-MM-DD" type="text"  autocomplete="off" class="" style="height: 23px;" />
											</td>
										</tr>
										<tr>
											<td class="leftTd">状态:</td>
											<td class="rightTd" colspan="2">
												<input type="radio" value="发布" name="newsStates" class="newsStates" style="margin-right: 5px;" /><span>发布</span>
												<input type="radio" value="保存" name="newsStates" class="newsStates" style="margin-right: 5px;margin-left: 10px;" /><span>保存</span>
											</td>
										</tr>
										
										<tr>
											<td class="leftTd" style="vertical-align: middle;">内容:</td>
											<td class="rightTd" colspan="2">
												<textarea name="description" id="newsDescription" /></textarea>
											</td>
										</tr>
									</tbody>
								</table>
								</form>
								<div style="text-align: center;">
									<button class="newsSave saveBtn" id="newsSave" onclick="save();">保存</button>
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
		    elem: '#newsDate' //指定元素
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
			    url: '<%=request.getContextPath()%>/Rules/updateRulesandFile',
			    auto:false,
			    bindAction: '#newsSave',
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
			        $('#demo1').attr('src', result); //图片链接（base64）
			      });
			      document.getElementById("filename").value="";
			    },
			    before:function(obj){
			    	var newsStatus = document.getElementsByName("newsStates");
			    	var rules_status="";
					for(var i=0;i<newsStatus.length;i++){
						if(newsStatus[i].checked == true){
							if("发布"==newsStatus[i].value){
								rules_status = '1';
							}
							else
								rules_status = '0';
							//news_status = newsStatus[i].value;
							break;
						}
					}
			    	this.data={
			    	"Rules_Title": document.getElementById("newsTitle").value,
			    	"Rules_Introduction":document.getElementById("newsAbstract").value,
					"Rules_KeyWords":document.getElementById("newsKeyWords").value,
					"Rules_Release_time":document.getElementById("newsDate").value,
					"Rules_status":rules_status,
					"Rules_context":CKEDITOR.instances.newsDescription.getData(),
					"filename":document.getElementById("filename").value,
					"Rules_id":document.getElementById("newsid").value
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
				//debugger;
				
				var newsTitle = $('#newsTitle').val();
				var newsAbstract = $("#newsAbstract").val();
				var newsKeyWords = $("#newsKeyWords").val();
				var newsDate = $("#newsDate").val();
				var newsStates = $(".newsStates");
				var newsDescription = CKEDITOR.instances.newsDescription.getData();
				if(newsTitle == "") {
					alert("请填写标题！");
					return;
				}
				if(newsAbstract == "") {
					alert("请填写简介！");
					return;
				}
				if(newsKeyWords == "") {
					alert("请填写关键字！");
					return;
				}
				if(newsDate == "") {
					alert("请选择日期！");
					return;
				}
				if(newsDescription.length == "") {
					alert("请填写内容！");
					return;
				}
				if(newsStates[0].checked == true) {
// 					var sex = "0";
				} else if(newsStates[1].checked == true) {
// 					var sex = "1";
				} else {
					alert("请选择状态！");
					return;
				}
				
				var s=$("#demo1").attr("src");
				if(s==undefined){
					layer.alert("请选择封面!");
				}
				
				
				var oldfilename = document.getElementById("filename").value; 
				if(oldfilename !=""){
					var rules_title_page = oldfilename;
			    	var rules_context = CKEDITOR.instances.newsDescription.getData();
					var rulesTitle = document.getElementById("newsTitle").value;
					var rulesAbstract = document.getElementById("newsAbstract").value;
					var rulesKeyWords = document.getElementById("newsKeyWords").value;
					var rulesDate = document.getElementById("newsDate").value;
					var newsStatus = document.getElementsByName("newsStates");
					var Rules_id = document.getElementById("newsid").value;
					var rules_status="";
					for(var i=0;i<newsStatus.length;i++){
						if(newsStatus[i].checked == true){
							if("发布"==newsStatus[i].value){
								rules_status = '1';
							}
							else
								rules_status = '0';
							//news_status = newsStatus[i].value;
							break;
						}
					}
					$.ajax({
						url : '<%=request.getContextPath()%>/Rules/updateRules',
						type : 'post',
						dataType:"json",
						data:{
							Rules_Title:rulesTitle,
							Rules_Introduction:rulesAbstract,
							Rules_KeyWords:rulesKeyWords,
							Rules_Release_time:rulesDate,
							Rules_status:rules_status,
							Rules_context:rules_context,
							filename:rules_title_page,
							Rules_id:Rules_id
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
        		CKEDITOR.replace('newsDescription');
        		$.ajax({
				url : '<%=request.getContextPath()%>/Rules/getRulesdetailByid',
				type : 'GET',
				data:{
					rules_id:'<%=rules_id%>'
				},
				success : function(data) {
					if(data.success == true){
						var newscontext = CKEDITOR.instances.newsDescription;
						var newsTitle = document.getElementById("newsTitle");
						var newsAbstract = document.getElementById("newsAbstract");
						var newsKeyWords = document.getElementById("newsKeyWords");
						var newsDate = document.getElementById("newsDate");
						var newsStatus = document.getElementsByName("newsStates");
						var newsid = document.getElementById("newsid");
						var filename = document.getElementById("filename");
						var rules_id = data.data.rules_id;
						var rules_Introduction = data.data.rules_Introduction;
						var rules_KeyWords = data.data.rules_KeyWords;
						var rules_Rlease_time = data.data.rules_Release_time;
						var rules_context = data.data.rules_context;
						var rules_titile = data.data.rules_titile;
						var rules_status = data.data.rules_status;
						var rules_title_page = data.data.rules_title_page;
						
						newsid.value=rules_id;//新闻id
						newsTitle.value=rules_titile; //标题
						newsAbstract.value=rules_Introduction;//简介
						newsKeyWords.value=rules_KeyWords;//关键字
						newsDate.value=rules_Rlease_time;//发布日期
						newsTitle.value=rules_titile;//状态
						newscontext.setData(rules_context);//内容
						filename.value=rules_title_page;
						if(rules_status == "1"||rules_status == "2"){
							newsStatus[0].checked = true;
						}
						else if(rules_status == "0"){
							newsStatus[1].checked = true;
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
