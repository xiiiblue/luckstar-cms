/*DOM的Onload初始化*/
$(function onLoad(){
	openHide();//显示隐藏表单项
	prepareForms();//input点击内容消失
	//添加验证
	validator("proname_cn");
	validator("proname_en");
	validator("prooutline_cn");
	validator("prooutline_en");
	validator("proparameter_cn");
	validator("proparameter_en");
	validator2();
	valiTextNumber("proname_cn",50);
	valiTextNumber("proname_en",50);
	valiTextNumber("prooutline_cn",500);
	valiTextNumber("prooutline_en",500);
	valiTextNumber("proparameter_cn",500);
	valiTextNumber("proparameter_en",500);
	listStyle();
});

/*表单字数提示*/
function valiTextNumber(inputId,maxLength){
	$("#"+inputId).keyup(function(){
		var textContent = $("#"+inputId).attr("value");
		var textLength
		if (textContent == null){
			textLength = 0;
		}else{
			textLength = textContent.length;
		}
		
		if (textLength == 0){
			$("#"+inputId+"_tip").hide(0);
		}else{
			if(textLength >=maxLength){
				$("#"+inputId+"_tip").html("字数己达上限");
				$("#"+inputId+"_tip").show(0);
				var textLimit = textContent.substring(0,maxLength);
				$("#"+inputId).attr("value",textLimit);
			}else{
				$("#"+inputId+"_tip").html("己输入"+textLength+"字,最多"+maxLength+"字");
				$("#"+inputId+"_tip").show(0);
			}
		}
	});
}


/*检测表单*/
function validator(inputId){
	var valueBak = $("#"+inputId).attr("value");
	$("#"+inputId).blur(function(){
		if($("#"+inputId).attr("value") == valueBak){
			$("#"+inputId+"_err").fadeIn(1000);
		}
	});	
	$("#"+inputId).click(function(){
		$("#"+inputId+"_err").fadeOut(1000);
	});	
}
function validator2(){
	$("#proclassid").click(function(){
		$("#proclassid_err").fadeOut(1000);
	});	
}

/*隐藏内容显示*/
function openHide(){
	//产品型号栏目
	$("#hasParameter1").click(function(){
		$("#Parameter").show(1000);
	});	
	$("#hasParameter0").click(function(){
		$("#Parameter").hide(1000);
	});	
	$("#openParameter").click(function(){
		$("#Parameter").toggle(1000);
		return false;
	});	
	
	//产品描述栏目
	$("#hasOutline1").click(function(){
		$("#Outline").show(1000);
	});	
	$("#hasOutline0").click(function(){
		$("#Outline").hide(1000);
	});	
	$("#openOutline").click(function(){
		$("#Outline").toggle(1000);
		return false;
	});	
	
	//产品图片栏目
	$("#hasPic0").click(function(){
		$("#upPic").hide(1000);
	});	
	$("#hasPic1").click(function(){
		$("#upPic").show(1000);
	});	
	$("#hasPic2").click(function(){
		$("#upPic").show(1000);
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
/*表格鼠标悬停效果*/
function listStyle(){
	//$("table.classList tr:even").addClass("trOdd");
	$("table.proAddList tr").hover(function(){$(this).addClass("trHover");},function(){$(this).removeClass("trHover");});
	$("input:text").addClass("coolInput");
}