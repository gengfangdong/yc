$(function(){
	//显示账号提示
	$('#login_passname').blur(function(){
		var text_value = $(this).val();
		if(text_value==""){
			$('#login_showname').show();
			$('#login_passname').hide();
			
		}
	});
	$('#login_showname').focus(function(){
		var text_value = $(this).val();
		if(text_value==""){
			
			$('#login_showname').hide();
			$('#login_passname').show();
			$('#login_passname').css("color","#000000");
		}
	});

	//显示密码提示
	$('#login_passPwd').blur(function(){
		var text_value = $(this).val();
		if(text_value==""){
			$('#login_showPwd').show();
			$('#login_passPwd').hide();
			
		}
	});
	$('#login_showPwd').focus(function(){
		var text_value=$(this).val();
		if(text_value==this.defaultValue){
			$('#login_showPwd').hide();
			$('#login_passPwd').show();
			$('#login_passPwd').css("color","#000000");
		}
	});
});

