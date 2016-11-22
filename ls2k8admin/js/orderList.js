$(function onLoad(){
	listStyle();
});



//斑马线
function listStyle(){
	$("table.proList:even").addClass("tbOdd");
	$("table.proList").hover(function(){$(this).addClass("tbHover");},function(){$(this).removeClass("tbHover");});
	
}

