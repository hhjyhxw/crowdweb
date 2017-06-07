<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>已开奖的小豆夺宝详情</title>
<meta http-equiv="Cache-Control" content="no-store"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<link  href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.js"></script>
<style>
main {
  background: #FFF;
}
p {
  font-size: 13px;
}
.input_radio, section {
  clear: both;
  padding-top: 10px;
  display: none;
}
label:hover {
  cursor: pointer;
  text-decoration: underline;
}
#tab1:checked ~ #content1, #tab2:checked ~ #content2, #tab3:checked ~ #content3, #tab4:checked ~ #content4 {
  display: block;
}
input:checked + label {
  border-top-color: #A0CBEC;
  border-right-color: #DDD;
  border-left-color: #DDD;
  border-bottom-color: transparent;
  text-decoration: none;
}
.label_tab {
  font-weight: bold;
  font-size: 14px;
  display: block;
  float: left;
  padding: 10px 30px;
  border-top: 2px solid transparent;
  border-right: 1px solid transparent;
  border-left: 1px solid transparent;
  border-bottom: 1px solid #DDD;
}
</style>
<script type="text/javascript">
var basePath = '${pageContext.request.contextPath}';
var id = '${param["id"]}';
var aleadyShowMemberTab = false;
var aleadyShowLuckyNoTab = false;
var member_pageNum;
var member_totalPage;
$(function(){
	$(".label_tab").click(function(){
		var forStr = $(this).attr("for");
		$("#member_table").hide();
		var checked_tab = "";
		var tabs = document.getElementsByName("tabs");
		for(var i=0,len=tabs.length; i<len; i++){
			if(tabs[i].checked){
				checked_tab = tabs[i].value;
				break;
			}
		}
		if(forStr == "tab2" 
					&& forStr != checked_tab){
			$("#member_table").show();
			if(!aleadyShowMemberTab)
				getMemberList(1);
		}else if(forStr == "tab3" 
					&& forStr != checked_tab
					&& !aleadyShowLuckyNoTab){
			getLuckyNo();
		}
	});
	
	$("#label_tab_member").click();
	
	$("#search_bt").click(function(){
		searchFunc();
	});
});

function searchFunc(){
	var luckyNo = $("#luckyNo_input").val();
	if(luckyNo != '' && !/^\d+$/.test(luckyNo)){
		alert("幸运号码只能输入数字！");
		return;
	}
	getMemberList(1);
}

function getMemberList(pageNum){
	 var nickName = $("#nickName_input").val();
	 var luckyNo = $("#luckyNo_input").val();
	 $.ajax({
               type: "POST",
               url: basePath+"/raise/raiseMemberList",
               data : {
				  "id": id,
				  "pageNum": pageNum,
				  "nickName": nickName,
				  "luckyNo": luckyNo
			   },
               dataType : 'json',
               async:false,
               success: function(data){
                    if(data.resultCode == "10000"){
                    	aleadyShowMemberTab = true;
                    	$("#content2_tbody").empty();
                    	member_pageNum = data.pageNum;
                    	member_totalPage = data.totalPage;
                    	montageOption(member_pageNum, member_totalPage)
                    	var htmlStr = "";
                    	var raiseOrderList = data.raiseVoList;
                    	if(null != raiseOrderList){
                    		$("#totalCount").html("参与人数："+data.totalCount+"人");
                    		for(var i=0,len=raiseOrderList.length; i<len; i++){
                    			htmlStr += "<tr><td align=center>" + raiseOrderList[i].userId + "</td>";
                    			htmlStr += "<td align=center>" + (null!=raiseOrderList[i].nickName?raiseOrderList[i].nickName:"") + "</td>";
                    			htmlStr += "<td align=center>" + raiseOrderList[i].luckyNo + "</td>";
                    			htmlStr += "<td align=center>" + raiseOrderList[i].createDateStr + "</td></tr>";
                    		}
                    		$("#content2_tbody").append(htmlStr);
                    	}
                    }else{
                    	alert(data.errorMsg);
                    }
               },
               error: function (XMLHttpRequest, textStatus, errorThrown) { 
	            	alert("网络异常！"); 
	    	   }
     });
}

function getLuckyNo(){
	 $.ajax({
               type: "POST",
               url: basePath+"/raise/raiseLuckyNo",
               data : {
				  "id": id
			   },
               dataType : 'json',
               async:false,
               success: function(data){
                    if(data.resultCode == "10000"){
                    	aleadyShowLuckyNoTab = true;
                    	var htmlStr = "";
                    	var prizeRecordList = data.prizeRecordList;
                    	if(null != prizeRecordList){
                    		for(var i=0,len=prizeRecordList.length; i<len; i++){
                    			htmlStr += "<tr><td align=center>" + prizeRecordList[i].luckyNo + "</td></tr>";
                    		}
                    		$("#content3_table").append(htmlStr);
                    	}
                    }else{
                    	alert(data.errorMsg);
                    }
               },
               error: function (XMLHttpRequest, textStatus, errorThrown) { 
	            	alert("网络异常！"); 
	    	   }
     });
}

function montageOption(pageNum, totalPage){
	var htmlStr = "";
	for(var i=1; i<=totalPage; i++){
		if(i==pageNum){
			htmlStr += "<option selected value='"+i+"'>"+i+"</option>";
		}else{
			htmlStr += "<option value='"+i+"'>"+i+"</option>";
		}
	}
	$("#member_select").empty();
	$("#member_select").append(htmlStr);
}

function memberSelectChange(pageNum){
	getMemberList(pageNum);
}

function first(){
	getMemberList(1);
}

function pre(){
	var num = member_pageNum-1;
	num = num>0?num:1;
	getMemberList(num);
}

function next(){
	var num = member_pageNum+1;
	num = num<member_totalPage?num:member_totalPage;
	getMemberList(num);
}

function last(){
	getMemberList(member_totalPage);
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
        <td align="center" background="${pageContext.request.contextPath}/images/wsoa_window_002.gif"><span class="tfont12"><label id="functiontitle"><strong>已开奖的小豆夺宝详情</strong></label></span></td>
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
		 <tr><td>
		 <main>
  <!-- <input id="tab1" class="input_radio" type="radio" name="tabs" value="tab1" checked>
  <label class="label_tab" for="tab1">众筹详细信息</label> -->
  <input id="tab2" class="input_radio" type="radio" name="tabs" value="tab2">
  <label class="label_tab" id="label_tab_member" for="tab2">参与小豆夺宝的会员</label>
  <input id="tab3" class="input_radio" type="radio" name="tabs" value="tab3">
  <label class="label_tab" id="label_tab_no" for="tab3">中奖号码</label>
  <%-- <section id="content1">
    <table id="form:data" class="table5" border="1" width="400" bordercolor="#999999">
    	<thead id="form:data:thead">
						<tr class="table5title">
							<th colspan=2>众筹信息</th>
						</tr>
				  </thead>
    	<tbody>
    		<tr>
    			<td>众筹名称：</td>
    			<td>${raise.raiseName }</td>
    		</tr>
    		<tr>
    			<td>当前期数：</td>
    			<td>${raise.currentPeriod }</td>
    		</tr>
    		<tr>
    			<td>当前期号：</td>
    			<td>${raise.currentNum }</td>
    		</tr>
    		<tr>
    			<td>商品名称：</td>
    			<td>${raise.productName }</td>
    		</tr>
    		<tr>
    			<td>商品价格：</td>
    			<td>${raise.productPrice }</td>
    		</tr>
    		<tr>
    			<td>奖品数量：</td>
    			<td>${raise.prizeAmount }</td>
    		</tr>
    		<tr>
    			<td>开始时间：</td>
    			<td>${raise.startDate }</td>
    		</tr>
    		<tr>
    			<td>截止时间：</td>
    			<td>${raise.endDate }</td>
    		</tr>
    		<tr>
    			<td>开奖时间：</td>
    			<td>${raise.outTimeStr }</td>
    		</tr>
    		<tr>
    			<td>当前状态：</td>
    			<td>
    				<c:if test="${raise.currentStatus==0 }">
    					即将开始
    				</c:if>
    				<c:if test="${raise.currentStatus==1 }">
    					正在众筹
    				</c:if>
    				<c:if test="${raise.currentStatus==2 }">
    					已截止待开奖
    				</c:if>
    				<c:if test="${raise.currentStatus==3 }">
    					已完成
    				</c:if>
    			</td>
    		</tr>
    	</tbody>
    </table>
  </section> --%>
  <section id="content2">
  	 <table style="width:100%" align="center" border="0">
		<tbody>
		 <tr>
		 	<td>
		 		<form id ="queryFormId" name="form2" action="${pageContext.request.contextPath}/raise/raiseCompletedList"  method="post"  onsubmit="return onSubmitAction();">
				  	&nbsp;&nbsp;用户昵称 :
				  		<input id="nickName_input" name="nickName"  value=""/>
					&nbsp;&nbsp;幸运号码:
						<input id="luckyNo_input" name="luckyNo" value="" />
				   &nbsp;&nbsp;<input type="button" value="查询" id="search_bt" />
		 		</form>
		  	</td>
		  </tr>
		</tbody>
	 </table>
	<table id="form:data" class="table5" border="1" width="600" bordercolor="#999999">
				<thead id="form:data:thead">
						<tr class="table5title">
							<th>用户ID</th>
							<th>用户昵称</th>
							<th>幸运号码</th>
							<th>参与时间</th>
						</tr>
				  </thead>
				 <tbody id="content2_tbody">
				 <c:if test="${list != null}">
				 <c:forEach items="${list }" var="m" varStatus="status">
					<tr <c:if test="${status.index%2==0 }">class="evenRow"</c:if><c:if test="${status.index%2==1 }">class="oddRow"</c:if>>
						<td align="center"><input name="id" type="checkbox" id="id" value="${m.id }" onclick="checkedOrNot()"/></td>
						<td>${m.raiseName }</td>
						<td>${m.currentPeriod }</td>
						<td><img src="${pageContext.request.contextPath}/images/edt.gif" width="16" height="16" /><a href="${pageContext.request.contextPath}/hs/queryTHsAdvertisement.action?id=">编辑</a>&nbsp; &nbsp;<img src="${pageContext.request.contextPath}/images/del.gif" width="16" height="16" /><a href="javascript:delByid()">删除</a></td>
					</tr>
					</c:forEach>
					</c:if>
				</tbody>
	</table>
	
  </section>
  <section id="content3">
	<table id="content3_table" class="table5" border="1" width="200" bordercolor="#999999">
				<thead id="form:data:thead">
						<tr class="table5title">
							<th>幸运号码</th>
						</tr>
				  </thead>
				 <tbody>
				 <c:if test="${list != null}">
				 <c:forEach items="${list }" var="m" varStatus="status">
					<tr <c:if test="${status.index%2==0 }">class="evenRow"</c:if><c:if test="${status.index%2==1 }">class="oddRow"</c:if>>
						<td align="center"><input name="id" type="checkbox" id="id" value="${m.id }" onclick="checkedOrNot()"/></td>
						<td>${m.raiseName }</td>
						<td>${m.currentPeriod }</td>
						<td><img src="${pageContext.request.contextPath}/images/edt.gif" width="16" height="16" /><a href="${pageContext.request.contextPath}/hs/queryTHsAdvertisement.action?id=">编辑</a>&nbsp; &nbsp;<img src="${pageContext.request.contextPath}/images/del.gif" width="16" height="16" /><a href="javascript:delByid()">删除</a></td>
					</tr>
					</c:forEach>
					</c:if>
				</tbody>
			</table>
		  </section>
			</main>
		  </td>
		  </tr>
		</tbody>
	 </table>
	 <table width="600" id="member_table" style="display:none"><tbody>
	   <tr>
       <td align="right" width="40%">
       <span id="totalCount" style="float:left"></span>
	   <table style="float:right">
	      <tbody>
		  <tr>
			 <td><input type="button" class="button_02" value="首页" onclick="first();"></td>
			 <td><input type="button" value="上页" class="button_02" onclick="pre()"></td>
			 <td>
			 	<select id="member_select" onChange="memberSelectChange(this.value)">
			 	</select>
			 </td>
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
