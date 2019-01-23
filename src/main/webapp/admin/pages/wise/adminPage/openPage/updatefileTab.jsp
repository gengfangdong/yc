<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="entity.IUser" %>
<%
	IUser user = (IUser)session.getAttribute("user");
	String file_id = request.getParameter("file_id");
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
			#download{
				color:#FFFFFF;
			}
			#download:hover{
				color:#FFFFFF!important;
			}
		</style>
	</head>
	<body>
		<div>
			<div class="row" >
				<div class="col-sm-12 col-md-12 layui-tab layui-tab-card">
			    	<div class="row">
						<div class="col-sm-12 col-md-12">
							<div class="table-responsive table-responsive_vis" id="sample-table-1" style="padding-left: 10px;padding-right: 10px;height:270px;">
								<table id="newsTable" class="table table-bordered table-hover example1_x">
									<tbody>
										<tr>
											<td class="leftTd">名字:</td>
											<td class="rightTd" colspan="3">
												<input type="text" id="newsTitle" style="width:100%;"/>
												<input type="text" id="filenew" hidden="hidden"/>
											</td>
										</tr>
										<tr>
											<td class="leftTd">文件:</td>
											<td class="rightTd" >
												<input type="text" id="demoText" style="width:100%;border-radius:5px;border:1px solid #ccc; " readOnly="readOnly"/>
											</td>
											<td style="min-width: 100px;">
											<button type="button" class="layui-btn lay_btn" style="width: 95px;background:#1e9fff;">
												  <i class="layui-icon">&#xe67c;</i><a href="" id="download">下载</a>
												</button>
											</td>
											<td style="min-width: 100px;">
												
												<button type="button" class="layui-btn lay_btn" id="test1" style="width: 95px;background:#1e9fff;">
												  <i class="layui-icon">&#xe67c;</i>上传
												</button>
											</td>
										</tr>
								</table>
								<div style="text-align: center;margin-top:156px;">
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
		<script src="../../ckfinder/ckfinder.js"></script>
		
		<script>
		
		window.onload=function(){
			$.ajax({
				url:'<%=request.getContextPath()%>/Filetab/getDetailByid',
				type:'POST',
				data:{
					fileid:'<%=file_id%>'
				},
				success:function(data){
					if(data.success == false){
						if(data.message == "0"){
							layer.alert("未登录!");
	
						}else if(data.message == "1"){
							layer.alert("未获取附件信息");
	
						}else if(data.message == "2"){
							layer.alert("获取附件信息失败!");
	
						}
					}
					else if(data.success == true){
						var filename = document.getElementById("newsTitle");
						var fileold = document.getElementById("demoText");
						var filenew = document.getElementById("filenew");
						filename.value = data.file.filename;
						fileold.value = data.file.fileold;
						filenew.value = data.file.filenew;
						
						$('#download').attr("href","<%=request.getContextPath()%>/Common/download/"+data.file.filenew);
					}
				},error:function(data){
					layer.alert("错误!");
				}
			});
		}
		var filelist;
		layui.use('upload', function(){
			  var $ = layui.jquery,
			  upload = layui.upload;
			  
			  //普通图片上传
			  var uploadInst = upload.render({
			    elem: '#test1' ,
			    auto:false,
			    accept: 'file',
			    choose: function(obj){
			      //预读本地文件示例，不支持ie8
			      obj.preview(function(index, file, result){
			        document.getElementById('demoText').value=file.name;
			        filelist = file;
			        document.getElementById("filenew").value="";
			      });
			     
			    },
			    before:function(obj){
				    obj.preview(function(index, file, result){
				        $('#demo1').attr('src', result); //图片链接（base64）
				    });
			    },
			    done: function(res){
			    },
			    error: function(res){
			    
			    }
			  });
		 });
		function save(){
			var filename = document.getElementById('newsTitle').value;
			if(filename == ""){
				layer.alert("请填写名字!");
				return;
			}
			if(filelist==null&&document.getElementById("filenew").value==""){
				layer.alert("请选择文件!");
				return;
			}
			var fd = new FormData();
			fd.append("filename",filename);
			fd.append("fileid",'<%=file_id%>');
			if(filelist!=null)
				fd.append("file",filelist);
			fd.append("fileoldid",document.getElementById("filenew").value);
			$.ajax({
				url:'<%=request.getContextPath()%>/Filetab/updatefileTab',
				type:'POST',
				encType: 'multipart/form-data', //表明上传类型为文件
				processData: false,  //tell jQuery not to process the data
    			contentType: false,  //tell jQuery not to set contentType
				data:fd,
				success:function(data){
					if(data.success == false){
						if(data.message == "0"){
							layer.alert("未登录!");
	
						}else if(data.message == "1"){
							layer.alert("文件为空!");
	
						}else if(data.message == "2"){
							layer.alert("实体不存在!");
	
						}else if(data.message == "3"){
							layer.alert("修改失败!");
	
						}else if(data.message == "4"){
							layer.alert("上传失败!");
	
						}
					}
					else if(data.success == true){
						if(data.message == "5"){
							layer.confirm('修改成功!', { title:'提示'}, function(index){
								  
								window.parent.location.reload();
								var index1 = parent.layer.getFrameIndex(window.name);
								parent.layer.close(index1);
							});
						}
					}
				},error:function(data){
					layer.alert("错误!");
				}
			})
		}
		</script>		
	</body>
</html>
