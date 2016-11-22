$(function onLoad(){
	openHide();
});


/*隐藏内容显示*/
function openHide(){
	$(".detailViewA").click(function(){
		var index = $(".detailViewA").index(this);
		$(".detailA").eq(index).toggle(1000);
		return false;
	});	
	$(".detailViewB").click(function(){
		var index = $(".detailViewB").index(this);
		$(".detailB").eq(index).toggle(1000);
		return false;
	});	
}
