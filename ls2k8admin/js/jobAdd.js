/*DOM的Onload初始化*/
$(function onLoad(){
	$("#jobdate").datepicker();//日历初始化
	prepareForms();//input点击内容消失
	//添加验证
	validator("jobname_cn");
	validator("jobname_en");
	validator("jobaddress_cn");
	validator("jobaddress_en");
	validator("jobduties_cn");
	validator("jobduties_en");
	validator("jobcontent_cn");
	validator("jobcontent_en");
	validator("jobdate");
	validator("jobnumber");
	validator("jobpay");
	valiTextNumber("jobname_cn",50);
	valiTextNumber("jobname_en",50);
	valiTextNumber("jobaddress_cn",500);
	valiTextNumber("jobaddress_en",500);
	valiTextNumber("jobduties_cn",500);
	valiTextNumber("jobduties_en",500);
	valiTextNumber("jobcontent_cn",500);
	valiTextNumber("jobcontent_en",500);
	
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
	$("table.proAddList tr:even").addClass("trOdd2");
	$("table.proAddList tr").hover(function(){$(this).addClass("trHover");},function(){$(this).removeClass("trHover");});
	$("input:text").addClass("coolInput");
}