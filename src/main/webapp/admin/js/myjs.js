function Goto() {
}
function deleteCurrentRow(obj) {
	var tr = obj.parentNode.parentNode;
	var tbody = tr.parentNode;
	tbody.removeChild(tr);
}

$(function() {
	// 点击表格行变色
	$('table tr')
			.click(
					function() {
						if ((this.style.backgroundColor == '')
								|| (this.style.backgroundColor == 'rgb(255, 255, 255)')) {
							this.style.cssText = 'background-color:#f5f5f5';
						} else {
							this.style.cssText = 'background-color:#fff';
						}
					})

});

$(function() {
	$(".btn_remove").click(function() {
		$(".no-print").hide();

	})
})

$(function() {
	var navLi = $(".menu_all .nav_heng li");
	navLi.mouseover(function() {
		$(this).find("a").addClass("current");
		$(this).find(".box").stop().slideDown(200);
	})
	navLi.mouseleave(function() {
		$(this).find("a").removeClass("current");
		$(this).find(".box").stop().slideUp(200);
	})
});

$(".piaochecked").on(
		"click",
		function() {
			$(this).hasClass("on_check") ? $(this).removeClass("on_check") : $(
					this).addClass("on_check");
			// 或者这么写
			// $(this).toggleClass( "on_check" );
		})

$(".check_all").on(
		"click",
		function() {
			$(this).hasClass("on_check1") ? $(this).removeClass("on_check1")
					: $(this).addClass("on_check1");
			// 或者这么写
			// $(this).toggleClass( "on_check" );
		})

layui.use('tree', function() {
	var tree = layui.tree({
		elem : '#demo1', // 指定元素，生成的树放到哪个元素上
		check : 'checkbox', // 勾选风格
		skin : 'as', // 设定皮肤
		drag : true,// 点击每一项时是否生成提示信息
		checkboxName : 'authority',// 复选框的name属性值
		checkboxStyle : "",// 设置复选框的样式，必须为字符串，css样式怎么写就怎么写
		click : function(item) { // 点击节点回调
			console.log(item)
		},
		nodes : [ // 节点
		{
			name : '总公司',
			// id: 2,
			checked : true,
			spread : true,
			checkboxValue : 990,
			children : [ {
				name : '公司一部',
				// id: 21,
				checked : true,
				checkboxValue : 4,
				spread : true,
				children : [ {
					name : '张飞',
					// id: 212,
					checked : false,
					checkboxValue : 9
				}, {
					name : '李伟',
					// id: 213,
					checked : false,
					checkboxValue : 10
				}, {
					name : '周彤',
					// id: 213,
					checked : false,
					checkboxValue : 11
				} ]
			}, {
				name : '公司名称2',
				// id: 22,
				checked : true,
				checkboxValue : 11,
				children : [ {
					name : '张建',
					// id: 221,
					checked : true,
					checkboxValue : 12
				}, {
					name : '刘云',
					// id: 222,
					checked : true,
					checkboxValue : 13
				}, {
					name : '李丽',
					// id: 223,
					checked : true,
					checkboxValue : 14
				} ]
			} ]
		} ]
	});
});

function showDiv() {
	document.getElementById('cknr').style.display = 'block';
}
function hiddenDiv() {
	document.getElementById('cknr').style.display = 'none';
}
