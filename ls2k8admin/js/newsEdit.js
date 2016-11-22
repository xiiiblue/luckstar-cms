/*DOM的Onload初始化*/
$(function onLoad(){
	openHide();//显示隐藏表单项
	listStyle();
	validator("proname_cn");
	validator("proname_en");
	validator("prooutline_cn");
	validator("prooutline_en");
	validator("proparameter_cn");
	validator("proparameter_en");
	ajaxLoad();
});


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

/*隐藏内容显示*/
function openHide(){
	//编辑状态是否打开隐藏选项
	if($("#hasParameter1").attr("checked")==true){
		$("#Parameter").show(1000);
	}
	if($("#hasOutline1").attr("checked")==true){
		$("#Outline").show(1000);
	}
	if($("#hasPic1").attr("checked")==true){
		$("#picList").show(1000);
	}
	if($("#hasPic2").attr("checked")==true){
		$("#picList").show(1000);
	}
	
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
		$("#picList").hide(1000);
	});	
	$("#hasPic1").click(function(){
		$("#picList").show(1000);
	});	
	$("#hasPic2").click(function(){
		$("#picList").show(1000);
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

//ajax提交函数
function ajaxPost(url){
	$.post(
		url
		,{}
		,function(txt){
			ajaxLoad();
		}
	);
}

function ajaxLoad(){
	//读入内容
	var productId = $("#imgList").attr("productId");
	var url = "newsPicList.asp?proid="+productId
	$("#imgList").load(url, {},
		function() {
			JT_init(); //初始化Jtip悬停提示!
			$("#imgList a.ajaxOrder").click(function(){var sendUrl = this.getAttribute("href");ajaxPost(sendUrl);return false;});
			$("#imgList a.ajaxDel").click(function(){
				if(confirm('确定要删除吗?')){
					var sendUrl = this.getAttribute("href");
					//alert(sendUrl);
					ajaxPost(sendUrl);
					return false;
				}
				return false;
			});
		}
	);
}

/*表格鼠标悬停效果*/
function listStyle(){
	//$("table.classList tr:even").addClass("trOdd");
	$("table.proAddList tr").hover(function(){$(this).addClass("trHover");},function(){$(this).removeClass("trHover");});
	$("input:text").addClass("coolInput");
}