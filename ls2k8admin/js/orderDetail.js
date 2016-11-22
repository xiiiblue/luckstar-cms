$(function onLoad(){
	priceCal();
	catchKeyup();
});

function priceCal(){
	var totalPrice=0;
	var length = $(".goodsnumber").length;
	var price = 0;
	var number = 0;
	for(var i=0;i<length;i++){
		price = $(".goodsprice").eq(i).attr("value");
		number = $(".goodsnumber").eq(i).attr("value");
		totalPrice += price*number;
	}
	$("#totalPrice").attr("value",totalPrice);
}
function catchKeyup() {
	$("input.goodsnumber").keyup(function(){
		this.value=this.value.replace(/\D/gi,"");
		priceCal();
	});
}

