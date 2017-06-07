<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>小豆夺宝中奖列表</title>
<meta http-equiv="Cache-Control" content="no-store"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<link  href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
var pageNum = ${data.pageNum };
var totalPage = ${data.totalPage };
var pageSize = ${data.pageSize};
var currentPeriod = '${data.currentPeriod}';
function first(){
	window.location.href = "?pageSize="+pageSize+"&period="+currentPeriod+"&pageNum=1";
}

function pre(){
	var num = pageNum-1;
	num = num>0?num:1;
	window.location.href = "?pageSize="+pageSize+"&period="+currentPeriod+"&pageNum="+num;
}

function next(){
	var num = pageNum+1;
	num = num<totalPage?num:totalPage;
	window.location.href = "?pageSize="+pageSize+"&period="+currentPeriod+"&pageNum="+num;
}

function last(){
	window.location.href = "?pageSize="+pageSize+"&period="+currentPeriod+"&pageNum="+totalPage;
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
		window.location.href = "?pageSize="+pageSize+"&period="+currentPeriod+"&pageNum=1";
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
	window.location.href = "?pageSize="+pageSize+"&period="+currentPeriod+"&pageNum="+num;
}

function searchFunc(){
	var period = document.getElementById("currentPeriod").value;
	window.location.href = "?pageSize="+pageSize+"&period="+period+"&pageNum=1";
}

function exportExcel(){
	window.location.href = "${pageContext.request.contextPath}/raise/exportPrizeRecord?period="+currentPeriod;
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
        <td align="center" background="${pageContext.request.contextPath}/images/wsoa_window_002.gif"><span class="tfont12"><label id="functiontitle"><strong>小豆夺宝中奖列表</strong></label></span></td>
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
		   &nbsp;&nbsp;期数	<select name="state" id="currentPeriod">
		   						<option value="">全部</option>
		   						<c:if test="${data.raisePeriodList != null}">
		   							<c:forEach items="${data.raisePeriodList }" var="m" varStatus="status">
		   								<option value="${m }" <c:if test="${m==data.currentPeriod }">selected</c:if> >${m }期</option>
		   							</c:forEach>
		   						</c:if>
		   					</select>
		   &nbsp;&nbsp;<input type="button" onClick="searchFunc()" value="查询" style="margin-left:10px"/>
		   &nbsp;&nbsp;<input type="button" onClick="exportExcel()" value="导出" style="margin-left:20px"/>
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
							<th>期数</th>
							<th>期号</th>
							<th>幸运号</th>
							<th>用户昵称</th>
							<th>开奖时间</th>
							<th>领奖状态</th>
						</tr>
				  </thead>
				 <tbody>
				 <c:if test="${data.prizeRecordList != null}">
				 <c:forEach items="${data.prizeRecordList }" var="m" varStatus="status">
					<tr <c:if test="${status.index%2==0 }">class="evenRow"</c:if><c:if test="${status.index%2==1 }">class="oddRow"</c:if>>
						<td>${m.currentPeriod }</td>
						<td>${m.currentNum }</td>
						<td>${m.luckyNo }</td>
						<td>${m.userNick }</td>
						<td>${m.outTimeStr }</td>
						<td>
							<c:if test="${m.arId==null }">未领奖</c:if>
							<c:if test="${m.arId!=null }">已领奖</c:if>
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
       <table width="100%"><tbody><tr><td align="left" width="60%">&nbsp;&nbsp;第<font style="color:red;font-weight:bold;">${data.pageNum }</font>页/共<font style="color:red;font-weight:bold;">${data.totalPage }</font>页&nbsp;
	   &nbsp;<span>每页</span><input id="pageSize" name="pageSize" value="${data.pageSize }" maxlength="3" style="width:25px"  type="text" onkeydown="entPageSize(this.value);"/>条/共<font style="color:red;font-weight:bold;"> ${data.totalCount }</font>条&nbsp;&nbsp;
	   跳转<input id="currPage" name="currPage" value="" size="3" style="width:25px"  type="text">页 &nbsp;<input  value=""class="button_goto" type="button" onclick="goToPage()"/></td>
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
