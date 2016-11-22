$(function showupload(){
	$("body").append("<iframe id='showuploadframe' name='showuploadframe'  style='display:none;'></iframe>");
	$("#showupload").attr("target","showuploadframe");
	$("#showupload").submit(
		function() {
			$("#loading").show();
		}
	);
});

function closewaiting(){
	$("#loading").hide();
}