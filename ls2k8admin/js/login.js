$(function onLoad(){
	listStyle();
	loginAnime();
});

function listStyle(){
    $("input[@type='text'], input[@type='password'], textarea").css({background: "transparent", border: "1px solid #ccc"}).focus(function(){$(this).css({background:"#D1E0E7", border:"1px solid #39c"})}).blur(function(){$(this).css({background: "transparent", border: "1px solid #ccc"})});
}

function loginAnime(){
	$("#loginTb").fadeIn(2000);
	$("#loginIntro").fadeIn(2000);
}
