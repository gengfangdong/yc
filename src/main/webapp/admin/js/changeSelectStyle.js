//删除
function isDelete(obj){
	var sText = obj.innerHTML;
	if(sText=='删除'){
		layer.confirm('您是否确定删除该对象？', {
			btn: ['是', '否'] //可以无限个按钮
		}, 
		function(index){
		  	layer.confirm('删除成功', {
				btn: ['好的'] //可以无限个按钮
			});
		  	time:1000;
		}, 
		function(index){
		  //按钮【按钮二】的回调
		});
	}
}