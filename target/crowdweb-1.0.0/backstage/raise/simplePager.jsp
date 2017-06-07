<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form method="get" name="pageForm" id="pageForm" >
     <span>  共  ${page.totalCount} 条  ${page.pageCount} 页 ┇ 当前第 ${page.pageNo} 页  ┇
       每页</span>
       <input type="text" id="pageSize" name="pageSize" size="5" value='${page.pageSize}' onchange="changePage('changeSize')" style="border:1px #999 solid; width:25px">
        条 		
		┇<c:choose><c:when test="${page.pageNo>1}"><a href="javascript:changePage('first');void(0)">首页</a></c:when><c:otherwise>首页</c:otherwise></c:choose>
		┇<c:choose><c:when test="${page.pageNo>1}"><a href="javascript:changePage('piror');void(0)">上一页</a></c:when><c:otherwise>上一页</c:otherwise></c:choose>
		┇<c:choose><c:when test='${page.pageNo<page.pageCount}'><a href="javascript:changePage('next');void(0)">下一页</a></c:when><c:otherwise>下一页</c:otherwise></c:choose>
		┇<c:choose><c:when test='${page.pageNo<page.pageCount}'><a href="javascript:changePage('last');void(0)">尾页</a></c:when><c:otherwise>尾页</c:otherwise></c:choose>
         跳到第<input type="text" id="pageNo" name="pageNo" size="5" value='${page.pageNo}' onchange="goPage(this)" style="border:1px #999 solid; width:25px">页

       <input name="pageCount" type="hidden" id="pageCount" value='${page.pageCount}'>        
  </form>
  <script type="text/javascript">
var thisPageLocation = window.location.href;
function changePage(type){
  var pageNo=document.getElementById("pageNo");
  var pageCount=document.getElementById("pageCount");
  if(type=="first"){
    if(pageNo.value=='1'){
	  alert("已经是第一页！");
	  return;
	}
    pageNo.value='1';
  }
  else if(type=="piror"){
    if(pageNo.value=='1'){
	  alert("已经是第一页！");
	  return;
	}
	pageNo.value=parseInt(pageNo.value)-1;
  }
  else if(type=="next"){
    if(pageNo.value==pageCount.value){
	  alert("已经是最后一页！");
	  return;
	}
	pageNo.value=parseInt(pageNo.value)+1;
  }
  else if(type=="last"){
    if(pageNo.value==pageCount.value){
	  alert("已经是最后一页！");
	  return;
	}
	pageNo.value=pageCount.value;
  }
  else if(type=="changeSize"){
    pageNo.value=1;
  }
  
  //有参数要去掉
  if(thisPageLocation.indexOf("?")!=-1){
    thisPageLocation = thisPageLocation.substring(0,thisPageLocation.indexOf("?"));
  }
  stockpagetwo();
}

function goPage(obj){

  var page = obj.value;
  var pageCount = document.getElementById("pageCount").value;
  if(page*1 > pageCount*1 ) page = pageCount;
  document.getElementById("pageNo").value = page;
  
  //有参数要去掉
  if(thisPageLocation.indexOf("?")!=-1){
    thisPageLocation = thisPageLocation.substring(0,thisPageLocation.indexOf("?"));
  }
  
  stockpagetwo();
}
function stockpagetwo(){
	var goodsname= document.getElementById("brandname1").value;
	 var url = "${basePath}/raise/raiseList";
	  $.ajax({
		url:url,
	    type:"GET",
	    data:$('#pageForm').serialize(),
	    error : function(msg) {
	             alert("数据错误！");   
	        },  
	        success :function(msg) {
	        	 $("#sample-table-1").html($(msg).find("#sample-table-1").html());
		          $('#pageCount').val($(msg).find("#pageCount").val());
		          $('#pageForm').html($(msg).find("#pageForm").html());
	            // 重新加载style.js
	            call1('${basePath}/backstage/ui_lib/js/style.js');
	            setTimeout(table("sample-table-1"), 100); 
	            call1('${basePath}/backstage/ui_lib/js/dictionaryInit.js'); 
	      }
	  });
	}


	function call1(url){
	    $.getJSON(url + '?callback=?');
	}
</script>