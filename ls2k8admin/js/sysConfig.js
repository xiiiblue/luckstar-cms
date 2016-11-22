$(function onLoad(){
	listStyle();
});
function listStyle(){
	$("input:text").addClass("coolInput");
	$("input:password").addClass("coolInput");
    $("input[@type='text'], input[@type='password'], textarea").css({background: "transparent"}).focus(function(){$(this).css({background:"#fff"})}).blur(function(){$(this).css({background: "transparent"})});
}