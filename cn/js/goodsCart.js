var submitOk=0;
var numOk=0;
$(function onLoad(){
	//listStyle();
	priceCal();
	prepareForms();
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

/*µã»÷input,ÎÄ×ÖÏûÊ§*/
function resetFields(whichform) {
	for(var i=0;i<whichform.elements.length;i++) {
		var element=whichform.elements[i]
		if(element.type=="submit") continue;
		if(element.type=="radio") continue;
		if(element.type=="checkbox") continue;
		if(!element.defaultValue) continue;
		element.onfocus=function(){
			if(this.value==this.defaultValue) {
				this.value="";
			}
		}
		element.onblur=function() {
			if(this.value==""){
				this.value=this.defaultValue;
			}
		}
	}
}
function prepareForms() {
	for(var i=0;i<document.forms.length;i++) {
		var thisform=document.forms[i];
		resetFields(thisform)
	}
}

function listStyle(){
	$("input").addClass("coolInput");
}

