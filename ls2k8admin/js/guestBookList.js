$(function onLoad(){
	listStyle();
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


//斑马线
function listStyle(){
	$("table.proList:even").addClass("tbOdd");
	$("table.proList").hover(function(){$(this).addClass("tbHover");},function(){$(this).removeClass("tbHover");});
	
}

