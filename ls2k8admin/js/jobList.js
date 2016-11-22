$(function onLoad(){
	listStyle();
	openHide();
	//prepareForms();
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

function fromProListSubmit3(){
	$("#formProListAction").attr("value","order");
	if(confirm("确定要更改吗?")){
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

function ajaxLoad(url,index){
	//读入内容
	$(".jobApplyList").eq(index).load(url, {},
		function() {
			$(".jobApplyList .splitPage a").click(function(){
				var sendUrl = this.getAttribute("href");
				ajaxLoad(sendUrl,index);
				return false;
			});
			tb_init('a.thickbox, area.thickbox, input.thickbox');//thickbox初始化
		}
	);
	
}
/*隐藏内容显示*/
function openHide(){
	var length =$(".viewList").length;
	$(".viewList").click(function(){	  
		var index = $(".viewList").index(this);
		var url = this.href;
		if ($(".jobApplyList").eq(index).css("display") == "none"){
			$(".jobApplyList").eq(index).show(1000);
			ajaxLoad(url,index);
			$(".viewList").eq(index).html("<strong style=\"color:red\">关闭</strong>");
			return false;
		}else{
			$(".jobApplyList").eq(index).hide(1000);
			$(".viewList").eq(index).html("<strong>查看</strong>");
			return false;
		}

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

//排序文本框按钮始初化以及只允许输入数字
function spinButtonFix() {
		$("input.suSpinButton").SpinButton({min:0});//初始化spinButton
		$("input.suSpinButton").keyup(function(){
			this.value=this.value.replace(/\D/gi,"");
		});

}