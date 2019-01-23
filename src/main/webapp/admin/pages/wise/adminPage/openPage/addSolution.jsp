<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="entity.IUser" %>
<%
	IUser user = (IUser)session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>领税教育网</title>
		<link rel="icon" href="../../../../image/logo.ico" type="image/x-icon"/>
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
								<table id="solutionTable" class="table table-bordered table-hover example1_x">
									<tbody>
										<tr>
											<td class="leftTd">标题:</td>
											<td class="rightTd" colspan="2">
												<input type="text" id="solutionTitle" style=" border: none; border: 1px solid #ccc; border-radius: 5px; width: 100%;height:23px;"/>
											</td>
										</tr>
										<tr>
											<td class="leftTd">封面:</td>
											<td class="rightTd">
												<div class="layui-upload-list">
												  <img class="layui-upload-img" id="demo1" style="width:150px;">
												  <p id="demoText"></p>
												</div>注：请上传1024*600以上尺寸的图片
											</td>
											<td style="width: 20%;">
												<button type="button" class="layui-btn lay_btn" id="test1" style="width: 95px;background:#1e9fff;">
												  <i class="layui-icon">&#xe67c;</i>浏览
												</button>
											</td>
										</tr>
										<tr>
											<td class="leftTd">简介:</td>
											<td class="rightTd" colspan="2">
												<input type="text" placeholder="请输入50字以下文字" id="solutionAbstract" style=" border: none; border: 1px solid #ccc; border-radius: 5px; width: 100%;height:23px;"/>
											</td>
										</tr>
										<tr>
											<td class="leftTd">关键字:</td>
											<td class="rightTd" colspan="2">
												<input type="text" placeholder="请输入5个以内关键字，用逗号隔开" id="solutionKeyWords" style=" border: none; border: 1px solid #ccc; border-radius: 5px; width: 100%;height:23px;"/>
											</td>
										</tr>
										<!--<tr>
											<td class="leftTd">类别:</td>
											<td class="rightTd">
												<input type="text" id="solutionCategory" />
											</td>
										</tr>-->
										<tr>
											<td class="leftTd">发布日期:</td>
											<td class="rightTd" colspan="2">
												<input id="solutionDate" name="solutionDate"  autocomplete="off" placeholder="YYYY-MM-DD" type="text" style=" border: none; border: 1px solid #ccc; border-radius: 5px; width: 257px;height:23px;" />
											</td>
										</tr>
										<tr>
											<td class="leftTd">状态:</td>
											<td class="rightTd" colspan="2">
												<input type="radio" value="发布" name="solutionStates" class="solutionStates" style="margin-right: 5px;" /><span>发布</span>
												<input type="radio" value="保存" name="solutionStates" class="solutionStates" style="margin-right: 5px;margin-left: 10px;" /><span>保存</span>
											</td>
										</tr>
										
										<tr>
											<td class="leftTd" style="vertical-align: middle;">内容:</td>
											<td class="rightTd" colspan="2">
												<textarea name="description" id="solutionDescription"/></textarea>
											</td>
										</tr>
									</tbody>
								</table>
								<div style="text-align: center;">
									<button class="solutionSave saveBtn" id="solutionSave" onclick="save();">保存</button>
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
		<script src="../../ckfinder/ckfinder.js"></script>
		<script type="text/javascript">
			layui.use('element', function(){
			  	var element = layui.element;
			  
			  	//一些事件监听
			  	element.on('tab(demo)', function(data){
			    	console.log(data);
			  	});
			});
			layui.use('laydate', function(){
			  	var laydate = layui.laydate;
			  
			  //执行一个laydate实例
			  	laydate.render({
			    	elem: '#solutionDate' //指定元素
					,type:'datetime'
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
			    url: '<%=request.getContextPath()%>/Solution/saveSolutionandFile',
			    auto:false,
			    bindAction: '#solutionSave',
			    /*data:{
           		 		Solution_Title:document.getElementById("solutionTitle").value,
						Solution_Introduction:solutionAbstract,
						Solution_KeyWords:solutionKeyWords,
						Solution_Release_time:solutionDate,
						Solution_status:solution_status//,
						//Solution_context:solution_context
        		},*/
			    choose: function(obj){
			      //预读本地文件示例，不支持ie8
			      obj.preview(function(index, file, result){
			        $('#demo1').attr('src', result); //图片链接（base64）
			      });
			    },
			    before:function(obj){
			    	var solutionStatus = document.getElementsByName("solutionStates");
			    	var solution_status="";
					for(var i=0;i<solutionStatus.length;i++){
						if(solutionStatus[i].checked == true){
							if("发布"==solutionStatus[i].value){
								solution_status = '1';
							}
							else
								solution_status = '0';
							//solution_status = solutionStatus[i].value;
							break;
						}
					}
			    	this.data={
			    	"Solution_Title": document.getElementById("solutionTitle").value,
			    	"Solution_Introduction":document.getElementById("solutionAbstract").value,
					"Solution_KeyWords":document.getElementById("solutionKeyWords").value,
					"Solution_Release_time":document.getElementById("solutionDate").value,
					"Solution_status":solution_status,
					"Solution_context":CKEDITOR.instances.solutionDescription.getData()
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
				  		layer.confirm('保存成功!', { title:'提示'}, function(index){
							  
							window.parent.location.reload();
							var index1 = parent.layer.getFrameIndex(window.name);
							parent.layer.close(index1);
						});
									
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
			function solutionSave(){
				/* var solutionCategoryLen = document.getElementById('solutionCategory').value.length;
				if(solutionCategoryLen>10){
					alert('类别字数过长，请输入10个字以内字数！');
					return;
				} */
				var solution_context = CKEDITOR.instances.solutionDescription.getData();
				var solutionTitle = document.getElementById("solutionTitle").value;
				var solutionAbstract = document.getElementById("solutionAbstract").value;
				var solutionKeyWords = document.getElementById("solutionKeyWords").value;
				var solutionDate = document.getElementById("solutionDate").value;
				var solutionStatus = document.getElementsByName("solutionStates");
				var solution_status="";
				for(var i=0;i<solutionStatus.length;i++){
					if(solutionStatus[i].checked == true){
						solution_status = solutionStatus[i].value;
						break;
					}
				}
	           /*  if (solution_context.length == 0)
	            {
	                alert("空白");
	            }
	            else
	            {
	                alert(solution_context); 
	            }
	            alert(solutionTitle+"\n"+solutionAbstract+"\n"+solutionKeyWords+"\n"+solutionDate+"\n"+solution_status+"\n"+solution_context); */
	            
				
			}
		</script>
		<script>
			function save(){
				//debugger;
				var solutionTitle = $('#solutionTitle').val();
				var solutionAbstract = $("#solutionAbstract").val();
				var solutionKeyWords = $("#solutionKeyWords").val();
				var solutionDate = $("#solutionDate").val();
				var solutionStates = $(".solutionStates");
				var solutionDescription = CKEDITOR.instances.solutionDescription.getData();
				if(solutionTitle == "") {
					layer.alert("请填写标题！");
					return;
				}
				if(solutionAbstract == "") {
					layer.alert("请填写简介！");
					return;
				}
				if(solutionKeyWords == "") {
					layer.alert("请填写关键字！");
					return;
				}
				if(solutionDate == "") {
					layer.alert("请选择日期！");
					return;
				}
				if(solutionDescription.length == "") {
					layer.alert("请填写内容！");
					return;
				}
				if(solutionStates[0].checked == true) {
// 					var sex = "0";
				} else if(solutionStates[1].checked == true) {
// 					var sex = "1";
				} else {
					layer.alert("请选择状态！");
					return;
				}
				
				var s=$("#demo1").attr("src");
				if(s==undefined){
					layer.alert("请选择封面!");
				}
			}
		</script>
		<script type="text/javascript">
			 window.onload = function(){
        		CKEDITOR.replace('solutionDescription');
   	 		};
		</script>
		
	</body>
</html>
