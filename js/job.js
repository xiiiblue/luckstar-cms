$(function onLoad(){
	openHide();
});




/*隐藏内容显示*/
function openHide(){
	var length =$(".viewMore").length;
	$(".viewMore").click(function(){
		var index = $(".viewMore").index(this);
		var url = this.href;
		$(".applyContent").eq(index).toggle(1000);
		return false;
	});	
}

