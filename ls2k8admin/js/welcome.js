/*DOM的Onload初始化*/
$(function onLoad(){
	//ajaxLoad("adminLogList.asp");
	openHide();
	//easydrag();
});

//ajax提交函数
function ajaxPost(url){
	$.post(
		url
		,{}
		,function(txt){
			ajaxLoad();
		}
	);
}

function ajaxLoad(url){
	//读入内容
	$("#logList").load(url, {},
		function() {
			$("#logList a").click(function(){var sendUrl = this.getAttribute("href");ajaxLoad(sendUrl);return false;});
		}
	);
}
/*隐藏内容显示*/
function openHide(){
	$("#viewLog").click(function(){		  
		if ($("#logList").css("display") == "none"){						 
			$("#logList").show(1000);
			$("#viewLog").html("<strong style=\"color:red\">关闭</strong>");
			ajaxLoad("adminLogList.asp");	 
			return false;
		}else{
			$("#logList").hide(1000);
			$("#viewLog").html("<strong>查看</strong>");
			return false;
		}
	});	
}

function easydrag(){
	$("#logList").easydrag();
}