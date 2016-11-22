//是否监听窗口缩放的标志,-1时不监听,0时为关闭fixedBox时的效果,1时为打开时的效果
var isBoxDisplay = -1;


/*这里是初始化窗口高度,宽度,浅显fixedBox*/
$(function fixHeight(){
	var h = document.documentElement.clientHeight;
	var w = document.documentElement.clientWidth;
	$('body').css('height', h);
	$('#fixedBox').css('width',w-2);
	$('#fixedBox').slideToggle(
		1000,
		function(){
			$('body').css('height', h-50-1);
			$('body').css('width', w);
			isBoxDisplay = 1;
			onresizeCheck();
		}
	);
});

/*监听窗体缩放*/
window.onresize = onresizeCheck;  
function onresizeCheck(myEvents){
	var h = document.documentElement.clientHeight;
	var w = document.documentElement.clientWidth;
	if(isBoxDisplay == -1){
	
	}else if (isBoxDisplay == 0){
		$('body').css('height', h);
		$('body').css('width', w);
		$('#fixedBox').css('width',w-2);
	}else{
		$('body').css('height', h-50-1);
		$('body').css('width', w);
		$('#fixedBox').css('width',w-2);
	}
}


/*关闭的函数*/
$(function fixClose(){
	var h = document.documentElement.clientHeight;
	var w = document.documentElement.clientWidth;	
	$('#fixedClose').click(function() {
		isBoxDisplay = -1;
		$('body').css('width',w);
		$('body').css('height',h);
		$('#fixedBoxBlank').css('display','none');
		$('#fixedBox').slideToggle(1000,function(){isBoxDisplay = 0;onresizeCheck();});
	});
});