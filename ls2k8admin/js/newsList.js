$(function onLoad(){
	listStyle();
	spinButtonFix();
});


function unselectall(){
	if(document.formProList.chkAll.checked){
		document.formProList.chkAll.checked = document.formProList.chkAll.checked&0;
	} 	
}

function CheckAll(form){
	for (var i=0;i<form.elements.length;i++){
		var e = form.elements[i];
		if (e.Name != "chkAll")
		e.checked = form.chkAll.checked;
	}
}
function fromProListSubmit1(){
	$("#formProListAction").attr("value","del");
	if(confirm("确定要删除吗?")){
		$("#formProList").submit();
	}else{
		return false;
	}
}
function fromProListSubmit2(){
	$("#formProListAction").attr("value","move");
	if(confirm("确定要移动吗?")){
		$("#formProList").submit();
	}else{
		return false;
	}
}
function fromProListSubmit3(){
	$("#formProListAction").attr("value","order");
	if(confirm("确定要更改吗?")){
		$("#formProList").submit();
	}else{
		return false;
	}
}


function listStyle(){
	$("table.proList:even").addClass("tbOdd");
	$("table.proList").hover(function(){$(this).addClass("tbHover");},function(){$(this).removeClass("tbHover");});
	
}

function spinButtonFix() {
		$("input.suSpinButton").SpinButton({min:0});//初始化spinButton
		$("input.suSpinButton").keyup(function(){
			this.value=this.value.replace(/\D/gi,"");
		});
}
