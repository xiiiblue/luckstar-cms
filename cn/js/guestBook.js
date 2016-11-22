$(function onLoad(){
	listStyle();
	//openHide();
	prepareForms();
});


//斑马线
function listStyle(){
	$("table.proList:even").addClass("tbOdd");
	$("table.proList").hover(function(){$(this).addClass("tbHover");},function(){$(this).removeClass("tbHover");});
	
}

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

/*点击input,文字消失*/
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

