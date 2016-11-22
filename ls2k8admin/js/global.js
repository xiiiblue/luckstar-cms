$(function onLoad(){
	menuFix();
});
/*晕,这都要修正...*/
function menuFix(){
	$(".menucontainer").hover(function(){$("select").css("visibility","hidden");},function(){$("select").css("visibility","visible");});
}