<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="public.fm" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>领奖及发货记录列表</title>
<meta http-equiv="Cache-Control" content="no-store"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<link  href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
		<link rel="stylesheet" href="${resourcesPath}/css/reset.css">
		<link rel="stylesheet" href="${resourcesPath}/css/app.css">
		<link rel="stylesheet" href="${resourcesPath}/css/swiper.css">
		<script src="${resourcesPath}/js/swiper.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script> 

<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script> --%>
<style >
	.prievew_div {
			/* float: center; */
		    width: 70%;
			height: 70%;
		    position: fixed;
		    top: 50%;
		    left: 50%;
		    -webkit-transform: translateX(-50%) translateY(-50%);
		    z-index: 9999;
		    /* background-color: #0f6fcb; */
		    background-color: #eef1f5;
		    /* background-color: #c0cad4; */
		    opacity: 1;
		    /* border-radius: 0.3em; */
		    /* padding-top: 1.3em; */
		   	display: none; 
		    vertical-align:middle;
		}
</style>
<script type="text/javascript">
	//删除前提示
	 function delByid(id){
	 	if(confirm("是否要删除数据？\r\n删除后，数据不可恢复！")){
	 		jump("${pageContext.request.contextPath}/hs/deleteTHsAdvertisement.action?id="+id);
	 	}
	 }
	 //批量删除
	 function delAll(){
	 	var obj=document.getElementsByName("id");
	 	var checkedNum=0;
	 	for(var i=0;obj!=null&&i<obj.length;i++){
	 		if(obj[i].checked==true){
	 			checkedNum++;	 			
	 		}
	 	}
	 	if(checkedNum>0){
	 		if(confirm("您将删除"+checkedNum+"数据？\r\n删除后，数据不可恢复！")){
	 			document.form1.action="${pageContext.request.contextPath}/hs/deleteTHsAdvertisementAll.action";
	 			document.form1.submit();
	 		}
	 	}else{
	 		window.alert("您未选择数据！");
	 	}
	 }
	 
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
	 	jump("${pageContext.request.contextPath}/award_record/awardListByPage?currPage="+currPage);
	 }
	 
	 function fist(){
	 	jump("${pageContext.request.contextPath}/award_record/awardListByPage?currPage=1&pageSize="+document.getElementById("pageSize").value);
	 }
	 function next(){
		var currPage = ${p.currPage};
		var totalPage = ${p.totalPage};
		if(currPage == totalPage){
			return;
		}
	 	jump("${pageContext.request.contextPath}/award_record/awardListByPage?currPage=${p.nextPage }&pageSize="+document.getElementById("pageSize").value);
	 }
	 function pre(){
		var currPage = ${p.currPage};
		if(currPage == 1){
			return;
		}
	 	jump("${pageContext.request.contextPath}/award_record/awardListByPage?currPage=${p.prePage }&pageSize="+document.getElementById("pageSize").value);
	 }
	 function last(){
	 	jump("${pageContext.request.contextPath}/award_record/awardListByPage?currPage=${p.totalPage }&pageSize="+document.getElementById("pageSize").value);
	 }
	 
	 function entPageSize(pagesize){
	 	if (event.keyCode == 13) {
	 		var s=/^\d*$/;
		 	if(pagesize==""||!s.test(pagesize)){
		 		window.alert("请正确输入数子");
		 		document.getElementById("pageSize").value="";
		 		document.getElementById("pageSize").focus();
		 		return;
		 	}
	 		jump("${pageContext.request.contextPath}/hs/queryTHsAdvertisementList.action?pageSize="+pagesize);
	 	}
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
	
	//查看物流
	function searchEmsLostics(orderId){
		
		var url = '${pageContext.request.contextPath}/award_record/logisticsByOrderId';
		$.post(url, {
            'orderId':orderId
        }, function(ret) {
        	//var dataObj=eval("("+ret+")");//转换为json对象 
        	var success = ret['resultType'];
        	var arr = ret['vipTrackInfoVos'];
        	var html = '';
		    if(success == "success"){
		    	var vipTrackInfoVo = null;
		    	if(arr != null){
		    		var vipTrackInfoVo = arr[0];
		    	}
		    	
		    	html += '<div class="header">';
	    		html += '<span class="wb_arrow" onclick="returnBack()"></span>';
	    		html += '<span></span>';
	    		html += '<a href="javascript:;" class="gl-ico">';
	    		html += '<img onclick="returnBack()" style="margin-top: 12px;" src="${basePath}/weixin/images/ic_bdzh_csb.png" width="60%"></a>';
	    		html += '</div>';
	    		html += '<div class=" body">';
	    		html += '<div class="carousel">';
	    		html += '<div class="userInfo wl">';
	    		html += '<img src="${basePath}/weixin/images/ems.png" style="max-width:100%">';
	    		html += '<a class="user">';
	    		if(ret['ems_no'] == null){
	    			html += '<p class="name"><span class="col-999">快递单号：暂无</span></p>';
	    		}else{
	    			html += '<p class="name"><span class="col-999">快递单号：'+vipTrackInfoVo.ems_no+'</span></p>';
	    		}
	    		if(ret['ems_no'] == null){
	    			html += '<p class="name"><span class="col-999">承运人：暂无</span></p>';
	    		}else{
	    			html += '<p class="name"><span class="col-999">承运人：EMS</span></p>';
	    		}
	    		html += '</a>';
	    		html += '</div>';
	    		if(arr != null){
	    		html += '<div class="express">';
	    		html += '<ul>';
		    	for (var i = 0; i < arr.length; i++) {
		    		var ems = arr[i];
		    		if(i == 0){
		    			html += '<li class="flex-item-box active">';
		    		}else{
		    			html += '<li class="flex-item-box nomal">';
		    		}
		    		html += '<div class="circle"></div>';
		    		html += '<div class="conten">';
		    		html += '<p>'+ems.address+'&nbsp;&nbsp;&nbsp;&nbsp;'+ems.status_p+'</p>';
		    		html += '<p>'+ems.date+'</p>';
		    		html += '</div>';
		    		html += '</li>';
		    	}
		    	html += '</ul>';
		    	html += '</div>';
	    		}else{
	    			html+='<div style="float: left; width: 100%; text-align: center; margin-top: 1rem;">';
	    			html+='<p style=" font-size: 1em; padding: 0.5em 0; color: #333;">暂无相关信息</p>';
	    			html+='</div>';
	    		}
		    	html += '</div></div>';
		    	$('.flex').append(html)
		    	$("#searchEms").show();
		    }
		    if(success == "fail"){
		    	alert("查询失败");
		    }
        });
	}
	function returnBack(){
		$("#content").empty();
		$("#searchEms").hide();
	}
	
	//跳转编辑
	function edit(id){
		var currPage = ${p.currPage};
		var pageSize = ${p.pageSize};
		var state = "${state}";
		jump("${pageContext.request.contextPath}/award_record/toEditAwardRecord?&id="+id+"&currPage="+currPage+"&pageSize="+pageSize+"&state"+state);	 
	 }
	//删除
	function deleteById(id){
		var currPage = ${p.currPage};
		var pageSize = ${p.pageSize};
		var state = "${state}";
		if(state == ""){
			state = null;
		}
		if(confirm("确定要删除？")){
			var url = '${pageContext.request.contextPath}/award_record/deleteById';
			$.post(url, {
                'id':id
            }, function(ret) {
            	var success = ret['success'];
			    if(success == true){
			    	alert("删除成功");
			    	window.location.href = "${pageContext.request.contextPath}/award_record/awardListByPage?&currPage="+currPage+"&pageSize="+pageSize;
			    }
			    if(success == false){
			    	alert("删除失败");
			    } 
            });
		}
	}
	//按条件导出
	function exportExcle(){
		var phone = $("#phone").val();
		var state = $("#state").val();
		window.location.href = "${pageContext.request.contextPath}/award_record/exportAwardRecord?state="+state+"&phone="+phone;
		//jump("${pageContext.request.contextPath}/award_record/exportAwardRecord");
	}
	//批量导出
	function exportExcleSelected(){
		var obj=document.getElementsByName("id");
	 	var checkedNum=0;
	 	var idStr = "";
	 	for(var i=0;obj!=null&&i<obj.length;i++){
	 		if(obj[i].checked==true){
	 			var id = obj[i].defaultValue;
		 		idStr += id+",";
	 			checkedNum++;	 			
	 		}
	 	}
	 	if(checkedNum>0){
	 		if(confirm("您将导出"+checkedNum+"条数据？")){
	 			window.location.href = "${pageContext.request.contextPath}/award_record/exportAwardRecordBySelected?ids="+idStr;
	 		}
	 	}
	}
	//单个发货
	function toDeliveryLostics(id){
		var url = '${pageContext.request.contextPath}/award_record/sendOrderIdToEms';
			$.post(url, {
	            'id': id
	        }, function(ret) {
	        	var success = ret['resultType'];
	        	if(success == "success"){
	        		alert("发货成功");
	        		window.location.href = "${pageContext.request.contextPath}/award_record/awardListByPage";
	        	}
	        	if(success == "fail"){
			    	alert("发货失败");
			    	window.location.href = "${pageContext.request.contextPath}/award_record/awardListByPage";
			    }
	        });
	 }
	//批量发货
	 function batchDeliveryLostics(){
		/* var currPage = ${p.currPage};
     	var pageSize = ${p.pageSize};
     	var state = "${state}";
     	if(state == ""){
     		state = null;
     	} */
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
	 		if(confirm("您将发货"+checkedNum+"条数据？")){
	 			var url = '${pageContext.request.contextPath}/award_record/batchDeliveryLostics';
	 			$.post(url, {
	 	            'ids': idStr
	 	        }, function(ret) {
	 	        	var success = ret['resultType'];
	 	        	if(success == "success"){
	 	        		alert("发货成功");
	 	        		window.location.href = "${pageContext.request.contextPath}/award_record/awardListByPage";
	 	        	}
	 	        	if(success == "fail"){
	 			    	alert("发货失败");
	 			    	window.location.href = "${pageContext.request.contextPath}/award_record/awardListByPage";
	 			    }
	 	        });
	 			//window.location.href = "${pageContext.request.contextPath}/award_record/batchDeliveryLostics?ids="+ids;
	 		}
	 	}else{
	 		alert("您未选择数据！");
	 	}
	 }
	
	//批量获取邮件号码
	 function getEmsNoByOrderId(){
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
	 		if(confirm("您将发货"+checkedNum+"条数据？")){
	 			var url = '${pageContext.request.contextPath}/award_record/getEmsNoByOrderId';
	 			$.post(url, {
	 	            'ids': idStr
	 	        }, function(ret) {
	 	        	var success = ret['resultType'];
	 	        	if(success == "success"){
	 	        		alert("操作成功");
	 	        		window.location.href = "${pageContext.request.contextPath}/award_record/awardListByPage";
	 	        	}
	 	        	if(success == "fail"){
	 			    	alert("操作失败");
	 			    	window.location.href = "${pageContext.request.contextPath}/award_record/awardListByPage";
	 			    }
	 	        });
	 			//window.location.href = "${pageContext.request.contextPath}/award_record/batchDeliveryLostics?ids="+ids;
	 		}
	 	}else{
	 		alert("您未选择数据！");
	 	}
	 }
	</script>
</head>

<body class="bgcolor_mainbody">
<table align="center" border="0" cellpadding="0" cellspacing="0" width="98%">
  <tbody><tr>
    <td background="${pageContext.request.contextPath}/images/wsoa_window_002.gif" width="1"></td>
    <td background="${pageContext.request.contextPath}/images/wsoa_window_002.gif"><table border="0" cellpadding="0" cellspacing="0">
      <tbody><tr>
        <td align="center" background="${pageContext.request.contextPath}/images/wsoa_window_002.gif" width="10"><img src="${pageContext.request.contextPath}/images/center_19.gif"/></td>
        <td align="center" background="${pageContext.request.contextPath}/images/wsoa_window_002.gif"><span class="tfont12"><label id="functiontitle"><strong>领奖发货记录列表</strong></label></span></td>
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
		 <form name="form2" action="${pageContext.request.contextPath}/award_record/awardListByPage" method="post">
		 	<input type="hidden" name="currrPage" value="${p.currPage }"/>
		 	<input type="hidden" name="pageSize" value="${p.pageSize }"/>
		  	&nbsp;&nbsp;手机号 <input id="phone" name="phone" value="${phone }"/>		
		    &nbsp;&nbsp;状态	<select name="state" id="state">
		    				<option value="">请选择</option>
		    				<option value="0" <c:if test="${state == '0'}">selected</c:if>>未发货</option>
		    				<option value="1" <c:if test="${state == '1'}">selected</c:if>>已发货</option>
					</select>
		   &nbsp;&nbsp;<input type="submit" class="button_02" value="查询"/>&nbsp;&nbsp;
		 	<input class="button_02" value="批量导出" type="button" onclick="exportExcleSelected()"/>&nbsp;&nbsp;
		 	<input class="button_02" value="条件导出" type="button" onclick="exportExcle()"/>&nbsp;&nbsp;
		 	<input class="button_02" value="批量发货" type="button" onclick="batchDeliveryLostics()"/>&nbsp;&nbsp;	
		 	<!-- 
		 	<input style="BACKGROUND-COLOR: #0069ac;cursor:pointer;width:110px;padding-top:2px; border:0.1; color:#DDD; height:23px;border-color: #DDD" value="批量获取快递单号" type="button" onclick="getEmsNoByOrderId()"/>&nbsp;
		 	 -->
		 </form>
		  </td>
		  </tr>
		  <!-- <tr>
			 <td align="right"><input name="add" class="button_03"  value="增加" type="button" onclick="add();"/> &nbsp;
			  <input name="edit" class="button_03"  value="修改" type="button" onclick="editByChecked()"/>&nbsp;	  
			  <input id="form:delete" name="form:delete" value="删除"  class="button_03" type="button" onclick="delAll()"/></td>
		  </tr>	 -->
		</tbody>
	 </table>
	 <table style="width:100%" align="center" border="0">
		 <tbody><tr><td>
		 		<form name="form1" method="post" action="#"> 
				<table id="form:data" class="table5" border="1" width="100%" bordercolor="#999999">
					<thead id="form:data:thead">
						<tr class="table5title">
							<th width="25" align="center"><input type="checkbox" name="checked_all" id="_checked_all" value="" onclick="checkedAll()" /></th>
							<th>订单id</th>
							<th>众筹id</th>
							<th>领奖人id</th>
							<th>领奖人</th>
							<th>奖品名称</th>
							<th width="15%">收货地址</th>
							<th width="5.5%">状态</th>
							<th width="5.5%">快递公司</th>
							<th>快递单号</th>
							<th width="5.5%">发货类型</th>
							<th>手机号</th>
							<th>创建时间</th>
							<th width="140">操作</th>
						</tr>
				  </thead>
				 <tbody>
				 <c:if test="${list != null}">
				 <c:forEach items="${list}" var="awardRecord" varStatus="status">
					<tr <c:if test="${status.index%2==0 }">class="evenRow"</c:if><c:if test="${status.index%2==1}">class="oddRow"</c:if>>
						<td align="center"><input name="id" type="checkbox" id="id" value="${awardRecord.id}" onclick="checkedOrNot()"/></td>
						<td align="center">${awardRecord.orderId}</td>
						<td align="center">${awardRecord.raiseId}</td>
						<td align="center">${awardRecord.userId}</td>
						<td align="center">${awardRecord.userNick}</td>
						<td align="center">${awardRecord.productName}</td>
						<td align="center">${awardRecord.deliveryAddress}</td>
						<td align="center">
							<c:if test="${awardRecord.deliveryStatus == '0'}">未发货</c:if>
							<c:if test="${awardRecord.deliveryStatus == '1'}">已发货</c:if>
						</td>
						<td align="center">${awardRecord.courierName}</td>
						<td align="center">${awardRecord.courierNo}</td>
						<td align="center">
							<c:if test="${awardRecord.deliveryType == '0'}">EMS发货</c:if>
							<c:if test="${awardRecord.deliveryType == '1'}">京东发货</c:if>
						</td>
						<td align="center">${awardRecord.deliveryPhone}</td>
						<td align="center"><fmt:formatDate value="${awardRecord.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td align="center">
						<c:if test="${awardRecord.deliveryType == '0'}">
							<c:if test="${awardRecord.deliveryStatus == '0'}">
								<a onclick="toDeliveryLostics(${awardRecord.id})"><span style="color: blue;">发货</span></a>&nbsp;&nbsp;&nbsp;
							</c:if>
							<c:if test="${awardRecord.deliveryStatus == '1'}">
								<a onclick="searchEmsLostics(${awardRecord.orderId})"><span style="color: blue;">查看物流</span></a>&nbsp;&nbsp;&nbsp;
							</c:if>
						</c:if>
							<a onclick="edit(${awardRecord.id})"><span style="color: blue;">编辑</span></a>&nbsp;&nbsp;&nbsp;
							<a onclick="deleteById(${awardRecord.id})"><span style="color: red;">删除</span></a>
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

<div id="searchEms" class="prievew_div">
	<div id="content" class="flex">
	</div>
</div>
</body>
</html>
