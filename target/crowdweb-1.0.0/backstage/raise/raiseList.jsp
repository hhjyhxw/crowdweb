<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>众筹活动列表</title>
<meta http-equiv="Cache-Control" content="no-store"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<link  href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.js"></script> 
<script  type="text/javascript" src="${pageContext.request.contextPath}/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	var  clickSearch = true;//单机的是"查询"按钮,而不是上一页下一页等
	//删除前提示
	 function delByid(state,id){
		 if(parseInt(state)>0){
			 alert("只有'即将开始'状态才能删除众筹数据");
			 return;
		 }		
	 	if(confirm("是否要删除数据？\r\n删除后，数据不可恢复！")){	
            $.ajax({  
                type:'post',      
                url:'${pageContext.request.contextPath}/raise/raiseDelOne?id='+id, 
                cache:false,  
                dataType:'text',  
                success:function(data){  
                	if("SUCCESS"==data){
                		//JS动态删除
                		var obj=document.getElementById(id);
                		$(obj).detach();
                	}else{
                		alert("删除失败!");
                	}
                },
                error:function(data){  
                	alert("删除失败!");
                }
            });             
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
	 //编辑
	 function edit(state,id){
		 if(parseInt(state)>0){
			 alert("只有'即将开始'状态才能修改众筹数据");
			 return;
		 }
		 window.location.href="${pageContext.request.contextPath}/raise/raiseUpdate?id="+id;
	 
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
	 	var s=/^\d*$/;
	 	//1.数字校验
	 	if(currPage==""||!s.test(currPage)){
	 		window.alert("请正确输入页面");
	 		document.getElementById("currPage").value="";
	 		document.getElementById("currPage").focus();
	 		return;
	 	}
	 	//2.不能大于总页数,也不能小于1
	 	if(parseInt(currPage)<1 || parseInt(currPage) >parseInt("${p.totalPage }")){
	 		window.alert("跳转页不能大于总页数${p.totalPage},且不能小于1!");
	 		document.getElementById("currPage").value="";
	 		document.getElementById("currPage").focus();
	 		return;	 		
	 	}
	 	
	 	//end.设置当前页和页码
		$("#FYcurrPage").val(currPage);	
	 	//3.分页数校验
	 	var pageSize = $("#pageSize").val();
	 	if(! isNumCheck(pageSize)){
	 		window.alert("每页大小是无效字符");
	 		$("#pageSize").focus();
	 		return false;	 		
	 	}
		$("#FYpageSize").val($("#pageSize").val());
		//提交
	 	$("#queryFormId").submit();
	 }
	 
	 function add(){
	 	jump("${pageContext.request.contextPath}/raise/raiseAdd");
	 }
	 
	 function fist(){
		 clickSearch = false;
	 	//1.分页数校验
	 	var pageSize = $("#pageSize").val();
	 	if(! isNumCheck(pageSize)){
	 		window.alert("每页大小是无效字符");
	 		$("#pageSize").focus();
	 		return false;	 		
	 	}
	 	//end.设置当前页和页码
		$("#FYcurrPage").val("1");	
		$("#FYpageSize").val(pageSize);	
		
		//提交
	 	$("#queryFormId").submit();
	 }
	 function next(){
	 	//1.分页数校验
	 	clickSearch = false;
	 	var pageSize = $("#pageSize").val();
	 	if(! isNumCheck(pageSize)){
	 		window.alert("每页大小是无效字符");
	 		$("#pageSize").focus();
	 		return false;	 		
	 	}
	 	//2.是否达到尾页校验
	 	if("${p.totalPage }"=="${p.currPage}"){
	 		window.alert("当前已经是尾页");
	 		return false;	 		
	 	}	 	
	 	//end.设置当前页和页码
		$("#FYcurrPage").val("${p.nextPage}");	
		$("#FYpageSize").val(pageSize);	
		
		//提交
	 	$("#queryFormId").submit();			
	 }
	 function pre(){
		 clickSearch = false;
	 	//1.分页数校验
	 	var pageSize = $("#pageSize").val();
	 	if(! isNumCheck(pageSize)){
	 		window.alert("每页大小是无效字符");
	 		$("#pageSize").focus();
	 		return false;	 		
	 	}
	 	//2.是否达到首页校验
	 	if("1"=="${p.currPage}"){
	 		window.alert("当前已经是首页");
	 		return false;	 		
	 	}	 	
	 	//end.设置当前页和页码
		$("#FYcurrPage").val("${p.prePage}");	
		$("#FYpageSize").val(pageSize);	
		
		//提交
	 	$("#queryFormId").submit();		
	 }
	 function last(){
		 clickSearch = false;
	 	//1.分页数校验
	 	var pageSize = $("#pageSize").val();
	 	if(! isNumCheck(pageSize)){
	 		window.alert("每页大小是无效字符");
	 		$("#pageSize").focus();
	 		return false;	 		
	 	}
	 	//end.设置当前页和页码
		$("#FYcurrPage").val("${p.totalPage}");	
		$("#FYpageSize").val(pageSize);	
		
		//提交
	 	$("#queryFormId").submit();
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
	
	 var reg = new RegExp("^[1-9][0-9]*$"); 
	 //纯数字校验
	 function isNumCheck(numStr){
 	     if(!reg.test(numStr)){  
 	        return false;
 	     }
 	     return true;
	 }	
	function onSubmitAction(){
	 	//02当期期数
	 	if($("#_currentPeriodHidden").val()!=""  ){
	         var obj = document.getElementById("_currentPeriodHidden");
 	         if(! isNumCheck(obj.value)){
 	        	window.alert("当期期数:请输正确数值!");
 		 		$("#_currentPeriodHidden").focus();
 		 		return false; 
 	         }
 	    }
	 	
	 	//03当期号数
	 	if($("#_currentNumHidden").val()!=""  ){
	         var obj = document.getElementById("_currentNumHidden");
 	         if(! isNumCheck(obj.value)){
 	        	window.alert("当期号数:请输正确数值!！");
 		 		$("#_currentNumHidden").focus();
 		 		return false;
 	         }
	 	} 
	 	if(clickSearch){
		 	//进行真正的赋值
		 	$("#_currentPeriod").val($("#_currentPeriodHidden").val());
		 	$("#_currentNum").val($("#_currentNumHidden").val());
		 	
		 	$("#_raiseName").val($("#_raiseNameHidden").val());
		 	$("#_productName").val($("#_productNameHidden").val());
		 	$("#_currentStatus").val($("#_currentStatusHidden").val());	 		
	 	}
	 	clickSearch = true;
	 	return true;
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
        <td align="center" background="${pageContext.request.contextPath}/images/wsoa_window_002.gif"><span class="tfont12"><label id="functiontitle"><strong>众筹活动列表</strong></label></span></td>
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
		 		<form id ="queryFormId" name="form2" action="${pageContext.request.contextPath}/raise/raiseList"  method="post"  onsubmit="return onSubmitAction();">
				  	&nbsp;&nbsp;众筹名称 :
				  		<input id="_raiseNameHidden"  value="${raise.raiseName}"/>
				  		<input id="_raiseName"        name="raiseName" value="${raise.raiseName}" type="hidden"/>
					&nbsp;&nbsp;期数:
						<input id="_currentPeriodHidden"  value="${raise.currentPeriod}" />
						<input id="_currentPeriod"        name="currentPeriod" value="${raise.currentPeriod}" type="hidden"/>
					&nbsp;&nbsp;号数	:
						<input id="_currentNumHidden"     value="${raise.currentNum}" />	
						<input id="_currentNum"           name="currentNum" value="${raise.currentNum}" type="hidden"/>	
					&nbsp;&nbsp;商品名称:
						<input id="_productNameHidden"  value="${raise.productName}" />		
						<input id="_productName"        name="productName" value="${raise.productName}" type="hidden"/>		
				    &nbsp;&nbsp;活动状态:
					    <select  id="_currentStatusHidden">
					    	<option value="">请选择</option>
							<option value="0" <c:if test="${raise.currentStatus == '0' }">selected="selected"</c:if>>即将开始</option>
							<option value="1" <c:if test="${raise.currentStatus == '1' }">selected="selected"</c:if>>正在众筹</option>
							<option value="2" <c:if test="${raise.currentStatus == '2' }">selected="selected"</c:if>>已截止待开奖</option>
							<option value="3" <c:if test="${raise.currentStatus == '3' }">selected="selected"</c:if>>已完成</option>					    	
						</select>
						<input type="hidden" name="currentStatus" id="_currentStatus" />
						
				   &nbsp;&nbsp;<input class="button_03" type="submit" value="查询"/>
				   &nbsp;&nbsp;
				   
				   <input type="hidden" id="FYcurrPage" name="currPage" value=""/>
				   <input type="hidden" id="FYpageSize" name="pageSize" value=""/>
				   <input  class="button_03"  value="增加" type="button" onclick="add();"/>
		 		</form>
		 		
		  	</td>
		  </tr>
		  <!-- 
		  <tr>
			  <td align="right"> &nbsp;
			  <input id="form:delete" name="form:delete" value="删除"  class="button_03" type="button" onclick="delAll()"/></td>
		  </tr>			  
		   -->
		</tbody>
	 </table>
	 <table style="width:100%" align="center" border="0">
		 <tbody><tr><td>
		 		<form name="form1" method="post" action="#"> 
				<table id="form:data" class="table5" border="1" width="100%" bordercolor="#999999">
					<thead id="form:data:thead">
						<tr class="table5title">
							<th width="25" align="center"><input type="checkbox" name="checked_all" id="_checked_all" value="" onclick="checkedAll()" /></th>
							<th>活动名称</th>
							<th>商品名称</th>
							<th>商品价格</th>
							<th>期数号数</th>
							<th>开始时间</th>
							<th>结束时间</th>
							<th>开奖时间</th>
							<th>活动状态</th>							
							<th>发货类型</th>							
							<th width="220">操作</th>
						</tr>
				  </thead>
				 <tbody>
				 	 <c:if test="${list != null}">
						 <c:forEach items="${list }" var="m" varStatus="status">
							<tr id="${m.id}" <c:if test="${status.index%2==0 }">class="evenRow"</c:if>
							    <c:if test="${status.index%2==1 }">class="oddRow"</c:if>>
								<td align="center">
									<input name="id" type="checkbox" id="id" value="${m.id }" onclick="checkedOrNot()"/>
								</td>
								<td>${m.raiseName }</td>
								<td>${m.productName }</td>
								<td>${m.productPrice }</td>
								<td align="center">${m.currentPeriodStr }期${m.currentNum}号</td>
								<td>${m.startDateStr }</td>
								<td>${m.endDateStr }</td>
								<td>${m.outTimeStr }</td>
								<td>
									<c:choose>
										<c:when test="${m.deliveryType=='0'}">EMS发货</c:when>
										<c:when test="${m.deliveryType=='1'}">京东发货</c:when>
									</c:choose>									
								</td>
								<td>
									<c:choose>
										<c:when test="${m.currentStatus=='0'}">即将开始</c:when>
										<c:when test="${m.currentStatus=='1'}">正在众筹</c:when>
										<c:when test="${m.currentStatus=='2'}">已截止待开奖</c:when>
										<c:when test="${m.currentStatus=='3'}">已完成</c:when>
									</c:choose>								
								</td>									
								<td>
									<img src="${pageContext.request.contextPath}/images/edt.gif" width="16" height="16" />
									<a href="${pageContext.request.contextPath}/raise/raiseAdd?id=${m.id}">克隆</a>
									&nbsp; &nbsp;
									<img src="${pageContext.request.contextPath}/images/edt.gif" width="16" height="16" />
									<a href="javascript:void(0)" onclick="edit(${m.currentStatus},${m.id})">编辑</a>
									&nbsp; &nbsp;
									<img src="${pageContext.request.contextPath}/images/del.gif" width="16" height="16" />
									<a href="javascript:delByid(${m.currentStatus},${m.id})">删除</a>
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
	   &nbsp;每页&nbsp;${p.pageSize }&nbsp;条
       <input type="hidden" id="pageSize" name="pageSize" value="${p.pageSize }" maxlength="3" style="width:25px"  type="text" onkeydown="entPageSize(this.value);"/>
       /共<font style="color:red;font-weight:bold;"> ${p.totalNum }</font>条&nbsp;&nbsp;
	      跳转<input id="currPage" name="currPage" value="" size="3" style="width:25px"  type="text" onkeydown="entCurrPage(this.value)">页 &nbsp;<input  value=""class="button_goto" type="button" onclick="goToPage()"/></td>
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
