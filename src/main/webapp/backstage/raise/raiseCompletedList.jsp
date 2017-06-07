<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>已开奖的小豆夺宝列表</title>
<meta http-equiv="Cache-Control" content="no-store"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<link  href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.js"></script> 
<script type="text/javascript">
var pageNum = ${p.currPage };
var totalPage = ${p.totalPage };
var pageSize = ${p.pageSize};
var raiseName = '${raise.raiseName}';
var period = '${raise.currentPeriod}';
var currentNum = '${raise.currentNum}';
var productName = '${raise.productName}';
function first(){
	$("#FYcurrPage").val("1");
	document.form2.submit();
}

function pre(){
	var num = pageNum-1;
	num = num>0?num:1;
	$("#FYcurrPage").val(num);
	document.form2.submit();
}

function next(){
	var num = pageNum+1;
	num = num<totalPage?num:totalPage;
	$("#FYcurrPage").val(num);
	document.form2.submit();
}

function last(){
	$("#FYcurrPage").val(totalPage);
	document.form2.submit();
}

function entPageSize(pageSize){
	if (event.keyCode == 13) {
		if(pageSize == ''){
			alert("请输入页面大小！");
			return;
		}
		if(!/^\d+$/.test(pageSize)){
			alert("页面大小必须输入数字！");
			return;
		}
		$("#FYcurrPage").val("1");
		$("#FYpageSize").val(pageSize);
		document.form2.submit();
	}
}

function goToPage(){
	var num = document.getElementById("currPage").value;
	if(num == ''){
		alert("请输入页码！");
		return;
	}
	if(!/^\d+$/.test(num)){
		alert("页码必须输入数字！");
		return;
	}
	if(num < 1)
		num = 1;
	else if(num > totalPage)
		num = totalPage;
	$("#FYcurrPage").val(num);
	document.form2.submit();
}

window.onload=function(){
		 var obj=document.getElementById("form:data");
		 var classStyle="";
		 for(var i=1;i<obj.rows.length;i++){  //循环表格行设置鼠标事件
		   obj.rows[i].onmouseover=function(){classStyle=this.className;this.className="activityRow";};
		   obj.rows[i].onmouseout=function(){this.className=classStyle; };
		 }
	};
</script>
</head>

<body class="bgcolor_mainbody">
<table align="center" border="0" cellpadding="0" cellspacing="0" width="98%">
  <tbody><tr>
    <td background="${pageContext.request.contextPath}/images/wsoa_window_002.gif" width="1"></td>
    <td background="${pageContext.request.contextPath}/images/wsoa_window_002.gif"><table border="0" cellpadding="0" cellspacing="0">
      <tbody><tr>
        <td align="center" background="${pageContext.request.contextPath}/images/wsoa_window_002.gif" width="10"><img src="${pageContext.request.contextPath}/images/center_19.gif"/></td>
        <td align="center" background="${pageContext.request.contextPath}/images/wsoa_window_002.gif"><span class="tfont12"><label id="functiontitle"><strong>已开奖的小豆夺宝列表</strong></label></span></td>
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
		 		<form id ="queryFormId" name="form2" action="${pageContext.request.contextPath}/raise/raiseCompletedList"  method="post"  onsubmit="return onSubmitAction();">
				  	&nbsp;&nbsp;名称 :
				  		<input id="_raiseNameHidden" name="raiseName"  value="${raise.raiseName}"/>
				  		<input id="_raiseName"    value="${raise.raiseName}" type="hidden"/>
					&nbsp;&nbsp;期数:
						<input id="_currentPeriodHidden" name="currentPeriod" value="${raise.currentPeriod}" />
						<input id="_currentPeriod"         value="${raise.currentPeriod}" type="hidden"/>
					&nbsp;&nbsp;号数	:
						<input id="_currentNumHidden"   name="currentNum"   value="${raise.currentNum}" />	
						<input id="_currentNum"           value="${raise.currentNum}" type="hidden"/>	
					&nbsp;&nbsp;商品名称:
						<input id="_productNameHidden"  name="productName"  value="${raise.productName}" />		
						<input id="_productName"        value="${raise.productName}" type="hidden"/>		
				   &nbsp;&nbsp;<input type="submit" value="查询"/>
				   <input type="hidden" id="FYcurrPage" name="currPage" value=""/>
				   <input type="hidden" id="FYpageSize" name="pageSize" value="${p.pageSize }"/>
				   
		 		</form>
		  	</td>
		  </tr>
		</tbody>
	 </table>
	 <table style="width:100%" align="center" border="0">
		 <tbody><tr><td>
		 		<form name="form1" method="post" action="#"> 
				<table id="form:data" class="table5" border="1" width="100%" bordercolor="#999999">
					<thead id="form:data:thead">
						<tr class="table5title">
							<th>活动名称</th>
							<th>商品名称</th>
							<th>商品价格</th>
							<th>活动期数</th>
							<th>活动号数</th>
							<th>开始时间</th>
							<th>结束时间</th>
							<th>开奖时间</th>
							<th>活动状态</th>							
							<th width="120">操作</th>
						</tr>
				  </thead>
				 <tbody>
				 	 <c:if test="${list != null}">
						 <c:forEach items="${list }" var="m" varStatus="status">
							<tr id="${m.id}" <c:if test="${status.index%2==0 }">class="evenRow"</c:if>
							    <c:if test="${status.index%2==1 }">class="oddRow"</c:if>>
								<td>${m.raiseName }</td>
								<td>${m.productName }</td>
								<td>${m.productPrice }</td>
								<td align="center">${m.currentPeriodStr }</td>
								<td align="center">${m.currentNum }</td>
								<td>${m.startDateStr }</td>
								<td>${m.endDateStr }</td>
								<td>${m.outTimeStr }</td>
								<td align=center>
									<c:choose>
										<c:when test="${m.currentStatus=='0'}">即将开始</c:when>
										<c:when test="${m.currentStatus=='1'}">正在进行中</c:when>
										<c:when test="${m.currentStatus=='2'}">已截止待开奖</c:when>
										<c:when test="${m.currentStatus=='3'}">已完成</c:when>
									</c:choose>								
								</td>									
								<td align=center>
									<img src="${pageContext.request.contextPath}/images/view_icon.png" width="16" height="16" />
									<a href="${pageContext.request.contextPath}/raise/raiseDetail?id=${m.id}">查看</a>
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
	   跳转<input id="currPage" name="currPage" value="" size="3" style="width:25px"  type="text" onkeydown="entCurrPage(this.value)">页 &nbsp;<input  value=""class="button_goto" type="button" onclick="goToPage()"/></td>
       <td align="right" width="40%">
	   <table>
	      <tbody>
		  <tr>
			 <td><input type="button" class="button_02" value="首页" onclick="first();"></td>
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
