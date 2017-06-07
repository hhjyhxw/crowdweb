function instance(){
	CKEDITOR.on('instanceReady', function (e) {
		var rows= $("#"+e.editor.name).attr("rows");
		if(rows==null){
			rows=document.getElementById(e.editor.name).rows;
		}
		if(rows!=null&&rows!=""){
			$("#cke_contents_"+e.editor.name).css("height",rows*18+"px");
		}	
		});
}
$(document).ready(function(){instance();});