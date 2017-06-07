<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>真龙产品列表</title>
<meta http-equiv="Cache-Control" content="no-store"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<link  href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.js"></script> 
<script  type="text/javascript" src="${pageContext.request.contextPath}/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"> 
	 //全选
	 function checkedAll(){
	 	var obj=document.getElementsByName("id");
	 	if(document.getElementById("_checked_all").checked==true){	 		
	 		for(var i=0;obj!=null&&i<obj.length;i++){
	 			obj[i].checked=true;
	 		}
	 	}else{
	 		for(var i=0;obj!=null&&i<obj.length;i++){
	 			obj[i].checked=false;
	 		}
	 	}	 
	 }
	 //去除或增加全选
	 function checkedOrNot(){
	 	var obj=document.getElementsByName("id");
		var isChecked=true;
	 	for(var i=0;obj!=null&&i<obj.length;i++){
	 		if(obj[i].checked==false){
	 			isChecked=false;
	 			break;
	 		}
	 	}
	 	if(isChecked){
	 		document.getElementById("_checked_all").checked=true;
	 	}else{
	 		document.getElementById("_checked_all").checked=false;
	 	}
	 }
	 //转到第几页
	 function goToPage(){
	 	var currPage=document.getElementById("currPage").value;
	 	var totalPage = ${p.totalPage};
	 	var s=/^\d*$/;
	 	if(currPage==""||!s.test(currPage)){
	 		window.alert("请正确输入页面");
	 		document.getElementById("currPage").value="";
	 		document.getElementById("currPage").focus();
	 		return;
	 	}
	 	if(totalPage < currPage){
	 		window.alert("您输入的页数超过了总页数");
	 		return;
	 	}
	 	jump("${pageContext.request.contextPath}/zl_product/listByPage?currPage="+currPage);
	 }
	 
	 function fist(){
	 	jump("${pageContext.request.contextPath}/zl_product/listByPage?currPage=1&pageSize="+document.getElementById("pageSize").value);
	 }
	 function next(){
		var currPage = ${p.currPage};
		var totalPage = ${p.totalPage};
		if(currPage == totalPage){
			return;
		}
	 	jump("${pageContext.request.contextPath}/zl_product/listByPage?currPage=${p.nextPage }&pageSize="+document.getElementById("pageSize").value);
	 }
	 function pre(){
		var currPage = ${p.currPage};
		if(currPage == 1){
			return;
		}
	 	jump("${pageContext.request.contextPath}/zl_product/listByPage?currPage=${p.prePage }&pageSize="+document.getElementById("pageSize").value);
	 }
	 function last(){
	 	jump("${pageContext.request.contextPath}/zl_product/listByPage?currPage=${p.totalPage }&pageSize="+document.getElementById("pageSize").value);
	 }
	 
	 function entCurrPage(currPage){
	 	if (event.keyCode == 13) {
	 		goToPage();
	 	}
	 }
	 
	function jump(url){
		var e = document.createElement("a");
		e.href = url;
		document.body.appendChild(e);
		e.click();
	}
	
	window.onload=function(){
		var obj=document.getElementById("form:data");
		 var classStyle="";
		 for(var i=1;i<obj.rows.length;i++){  //循环表格行设置鼠标事件
		   obj.rows[i].onmouseover=function(){classStyle=this.className;this.className="activityRow";};
		   obj.rows[i].onmouseout=function(){this.className=classStyle; };
		 }
	};
	//删除
	function deleteById(id){
		var currPage = ${p.currPage};
		var pageSize = ${p.pageSize};
		/* var state = "${state}";
		if(state == ""){
			state = null;
		} */
		if(confirm("确定要删除？")){
			var url = '${pageContext.request.contextPath}/zl_product/deleteById';
			$.post(url, {
                'id':id
            }, function(ret) {
            	var success = ret['success'];
			    if(success == true){
			    	alert("删除成功");
			    	window.location.href = "${pageContext.request.contextPath}/zl_product/listByPage?&currPage="+currPage+"&pageSize="+pageSize;
			    }
			    if(success == false){
			    	alert("删除失败");
			    } 
            });
		}
	}
	//批量删除
	 function deletebyIds(){
	 	var obj=document.getElementsByName("id");
	 	var checkedNum=0;
	 	var ids = [];
	 	var idStr = "";
	 	for(var i=0;obj!=null&&i<obj.length;i++){
	 		if(obj[i].checked==true){
	 			var id = obj[i].defaultValue;
		 		idStr += id+",";
		 		ids.push(id);
		 		
	 			checkedNum++;	 			
	 		}
	 	}
	 	if(checkedNum>0){
	 		if(confirm("您将删除"+checkedNum+"条数据？\r\n删除后，数据不可恢复！")){
	 			var url = '${pageContext.request.contextPath}/zl_product/deleteAll';
	 			$.post(url, {
	 	            'ids': idStr
	 	        }, function(ret) {
	 	        	var success = ret['resultType'];
	 	        	if(success == "success"){
	 	        		alert("删除操作成功");
	 	        		window.location.href = "${pageContext.request.contextPath}/zl_product/listByPage";
	 	        	}
	 	        	if(success == "fail"){
	 			    	alert("删除·操作失败");
	 			    	window.location.href = "${pageContext.request.contextPath}/zl_product/listByPage";
	 			    }
	 	        });
	 		}
	 	}else{
	 		alert("您未选择数据！");
	 	}
	 }
	//跳转新增
	function add(){
		window.location.href = "${pageContext.request.contextPath}/zl_product/toAdd";
	}
	//跳转修改
	function edit(id){
		window.location.href = "${pageContext.request.contextPath}/zl_product/toUpdateProduct?id="+id;
	}
	</script>
	<style type="text/css">
	.buttonClass {
	border-radius:4px;
	-webkit-border-radius: 4px;
    cursor: pointer;
    padding-top: 2px;
    width: 40px;
    height: 23px;
    border: 1;
    color: #DDD;
    background: #0069ac;
	</style>
</head>

<body class="bgcolor_mainbody">
<table align="center" border="0" cellpadding="0" cellspacing="0" width="98%">
  <tbody><tr>
    <td background="${pageContext.request.contextPath}/images/wsoa_window_002.gif" width="1"></td>
    <td background="${pageContext.request.contextPath}/images/wsoa_window_002.gif"><table border="0" cellpadding="0" cellspacing="0">
      <tbody><tr>
        <td align="center" background="${pageContext.request.contextPath}/images/wsoa_window_002.gif" width="10"><img src="${pageContext.request.contextPath}/images/center_19.gif"/></td>
        <td align="center" background="${pageContext.request.contextPath}/images/wsoa_window_002.gif"><span class="tfont12"><label id="functiontitle"><strong>真龙产品列表</strong></label></span></td>
        <td></td>
        </tr>
    </tbody></table></td>
    <td background="${pageContext.request.contextPath}/images/wsoa_window_002.gif" width="1"></td>
  </tr>
  <tr>
    <td background="${pageContext.request.contextPath}/images/wsoa_window_010.gif" height="10px" width="1"></td>
    <td height="10px" valign="top"></td>
    <td background="${pageContext.request.contextPath}/images/wsoa_window_006.gif" height="10px" width="1"></td>
  </tr>
  <tr>
    <td background="${pageContext.request.contextPath}/images/wsoa_window_010.gif" width="1">&nbsp;</td>
    <td valign="top">	

	  <table style="width:100%" align="center" border="0">
		<tbody>
		 <tr>
		 <td>
		 <form name="form2" action="${pageContext.request.contextPath}/zl_product/listByPage" method="post">
		 	<input type="hidden" name="currrPage" value="${p.currPage }"/>
		 	<input type="hidden" name="pageSize" value="${p.pageSize }"/>
		  	&nbsp;&nbsp;产品名称 <input id="productName" name="productName" value="${productName }"/>		
		    &nbsp;&nbsp;商品类型	<select name="type" id="type" style="height: 21px;width: 150px;">
		    				<option value="">全部</option>
		    				<option value="0" <c:if test="${type == '0'}">selected</c:if>>特色嘴棒</option>
			    			<option value="1" <c:if test="${type == '1'}">selected</c:if>>细支卷烟</option>
			    			<option value="2" <c:if test="${type == '2'}">selected</c:if>>低焦卷烟</option>
			    			<option value="3" <c:if test="${type == '3'}">selected</c:if>>扫码得龙币</option>
			    			<option value="4" <c:if test="${type == '4'}">selected</c:if>>扫码得乐豆</option>
					</select> 
		   &nbsp;&nbsp;<input type="submit" class="button_02" value="查询"/>&nbsp;&nbsp;
		 	<!-- <input class="button_02" value="批量导出" type="button" onclick="exportExcleSelected()"/>&nbsp;&nbsp;
		 	<input class="button_02" value="条件导出" type="button" onclick="exportExcle()"/>&nbsp;&nbsp;
		 	<input class="button_02" value="批量发货" type="button" onclick="batchDeliveryLostics()"/>&nbsp;&nbsp;	 
		 	-->
		 </form>
		  </td>
		  </tr>
		  <tr>
			 <td align="right"><input name="add" class="button_03"  value="增加" type="button" onclick="add();"/> &nbsp; 
			  <input id="form:delete" name="form:delete" value="删除"  class="button_03" type="button" onclick="deletebyIds()"/></td>
		  </tr>
		</tbody>
	 </table>
	 <table style="width:100%" align="center" border="0">
		 <tbody><tr><td>
		 		<form name="form1" method="post" action="#"> 
				<table id="form:data" class="table5" border="1" width="100%" bordercolor="#999999">
					<thead id="form:data:thead">
						<tr class="table5title">
							<th width="25" align="center"><input type="checkbox" name="checked_all" id="_checked_all" value="" onclick="checkedAll()" /></th>
							<th>产品名称</th>
							<th>卷烟类型</th>
							<th>投产时间</th>
							<th>产地</th>
							<th>包装形式</th>
							<th>烟支规格</th>
							<th>焦油量</th>
							<th>烟气烟碱量</th>
							<th>烟气一氧化碳量</th>
							<!-- <th>件条形码</th>
							<th>条条形码</th>
							<th>盒条形码</th> -->
							<th>价类</th>
							<th>建议零售价</th>
							<th>创建时间</th>
							<th width="100px;" align="center" style="text-align:center;vertical-align:middle;">操作</th>
						</tr>
				  </thead>
				 <tbody>
				 <c:if test="${list != null}">
				 <c:forEach items="${list}" var="zlProduct" varStatus="status">
					<tr <c:if test="${status.index%2==0 }">class="evenRow"</c:if><c:if test="${status.index%2==1}">class="oddRow"</c:if>>
						<td align="center"><input name="id" type="checkbox" id="id" value="${zlProduct.id}" onclick="checkedOrNot()"/></td>
						<td align="center">${zlProduct.productName}</td>
						<td align="center">${zlProduct.cigaretteType}</td>
						<td align="center">
						<c:if test="${!empty zlProduct.intoOperationTime}">
							<fmt:formatDate value="${zlProduct.intoOperationTime}" pattern="yyyy"/>年
						</c:if>
						</td>
						<td align="center">${zlProduct.productionPlace}</td>
						<td align="center">${zlProduct.packType}</td>
						<td align="center">${zlProduct.cigaretteSpecification}</td>
						<td align="center">${zlProduct.tarContent}</td>
						<td align="center">${zlProduct.nicotineContent}</td>
						<td align="center">${zlProduct.carbonMonoxideContent}</td>
						<%-- <td align="center">${zlProduct.pieceBarcode}</td>
						<td align="center">${zlProduct.cartonBarcode}</td>
						<td align="center">${zlProduct.boxBarcode}</td> --%>
						<td align="center">${zlProduct.priceType}</td>
						<td align="center">${zlProduct.price}</td>
						<td align="center"><fmt:formatDate value="${zlProduct.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td width="100px;" style="text-align:center;vertical-align:middle;">
							<input value="修改" type="button" class="buttonClass" onclick="edit(${zlProduct.id});"/> &nbsp;
							<input value="删除" type="button" class="buttonClass" onclick="deleteById(${zlProduct.id});"/> &nbsp;
						</td>
					</tr>
					</c:forEach>
					</c:if>
				</tbody>
		</table>
		</form>
		<table width="100%"><tbody></tbody></table>
 		</td>
		</tr>
		</tbody>     
        </table>
       <table width="100%"><tbody><tr><td align="left" width="60%">&nbsp;&nbsp;第<font style="color:red;font-weight:bold;">${p.currPage }</font>页/共<font style="color:red;font-weight:bold;">${p.totalPage }</font>页&nbsp;
	   &nbsp;<span>每页</span><input id="pageSize" name="pageSize" value="${p.pageSize }" maxlength="3" style="width:25px"  type="text" onkeydown="entPageSize(this.value);"/>条/共<font style="color:red;font-weight:bold;"> ${p.totalNum }</font>条&nbsp;&nbsp;
	   跳转<input id="currPage" name="currrentPage" value="" size="3" style="width:25px"  type="text" onkeydown="entCurrPage(this.value)">页 &nbsp;<input  value=""class="button_goto" type="button" onclick="goToPage()"/></td>
       <td align="right" width="40%">
	   <table>
	      <tbody>
		  <tr>
			 <td><input type="button" class="button_02" value="首页" onclick="fist();"></td>
			 <td><input type="button" value="上页" class="button_02" onclick="pre()"></td>
			 <td><input type="button" value="下页" class="button_02" onclick="next()"></td>
			 <td><input type="button" value="末页" class="button_02" onclick="last()"/></td>
		 </tr>
		 </tbody>
		</table>
		</td>
		</tr>
		</tbody>
  </table> 	
</td>
    <td background="${pageContext.request.contextPath}/images/wsoa_window_006.gif" width="1">&nbsp;</td>
  </tr>
  <tr>
    <td height="1" width="1"><img src="${pageContext.request.contextPath}/images/wsoa_window_009.gif" height="16" width="14"></td>
    <td background="${pageContext.request.contextPath}/images/wsoa_window_008.gif" height="1"></td>
    <td height="1" width="1"><img src="${pageContext.request.contextPath}/images/wsoa_window_007.gif" height="16" width="12"></td>
  </tr>
</tbody></table>
<br>

</body>
</html>
