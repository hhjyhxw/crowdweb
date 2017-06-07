<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK"/>
<title>发货</title>
<meta http-equiv="Cache-Control" content="no-store"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<link  href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.js"></script> 
<script type="text/javascript">	 
	 function save(){
		/* actionForm.action = "${pageContext.request.contextPath}/award_record/updateAwardRecord";
		actionForm.submit(); */
		var currPage = ${currPage};
		var pageSize = ${pageSize};
		var state = "${state}";
		if(state == null || state == ''){
			state = null;
		}
		
		$.ajax({
			url : "${pageContext.request.contextPath}/award_record/updateAwardRecord",
			type: "post",
		    dataType: "text",
		    data: $('#actionForm').serialize(),
			success : function (data) {	
				//var obj = JSON.parse(data); 
				var obj = eval("(" + data + ")");
			    var success = obj['success'];
			    if(success == true){
			    	alert("发货成功");
			    	window.location.href = "${pageContext.request.contextPath}/award_record/awardListByPage?&currPage="+currPage+"&pageSize="+pageSize+"&state="+state;
			    }
			    if(success == false){
			    	alert("发货失败");
			    	window.location.href = "${pageContext.request.contextPath}/award_record/awardListByPage?&currPage="+currPage+"&pageSize="+pageSize+"&state="+state;
			    }     
			}
		});
	 }
</script>
</head>
<body>
<form action="" method="post" name="actionForm" id="actionForm">
<input name="id" type="hidden" id="id" value="${awardRecord.id }"/>
<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="1" background="${pageContext.request.contextPath}/images/wsoa_window_002.gif"></td>
    <td background="${pageContext.request.contextPath}/images/wsoa_window_002.gif">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		  <tr>
			<td width="10" align="center" background="${pageContext.request.contextPath}/images/wsoa_window_002.gif"><img src="${pageContext.request.contextPath}/images/center_19.gif"></td>
			<td align="left" background="${pageContext.request.contextPath}/images/wsoa_window_002.gif"><span class="tfont12"><label id="functiontitle"><strong>编辑皇氏广告</strong> </label></td>
			<td align="right"> <a  href="${pageContext.request.contextPath}/hs/queryTHsAdvertisementList.action"><strong>返回列表</strong></a></td>
			</tr>
		</table>
	</td>
    <td width="1" background="${pageContext.request.contextPath}/images/wsoa_window_002.gif"></td>
  </tr>
  <tr>
    <td width="1" height="10px" background="${pageContext.request.contextPath}/images/wsoa_window_010.gif"></td>
    <td valign="top" height="10px"></td>
    <td width="1" height="10px" background="${pageContext.request.contextPath}/images/wsoa_window_006.gif"></td>
  </tr>
  <tr>
    <td width="1" background="${pageContext.request.contextPath}/images/wsoa_window_010.gif">&nbsp;</td>
    <td valign="top">
		<table border="0" style="width:100%" align="center" >	
			<tr>
				<td>
					<table border="0" style="width:80%" align="center" class="table5">
						<tr align="center">
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">id：&nbsp;</td>
							<td align="left" class="table5" >${awardRecord.id }</td>
						</tr>
						<tr align="center">
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">订单id：&nbsp;</td>
							<td align="left" class="table5" >
								<input type="text" style="height:99%;width:99%;" name="orderId" value="${awardRecord.orderId }" readonly="readonly"/>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">众筹id：&nbsp;</td>
							<td align="left" class="table5">
								<input type="text" style="height:99%;width:99%;" name="raiseId" value="${awardRecord.raiseId }" readonly="readonly"/>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">领奖人id：&nbsp;</td>
							<td align="left" class="table5">
								<input type="text" style="height:99%;width:99%;" name="userId" value="${awardRecord.userId }" readonly="readonly"/>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">领奖人昵称：&nbsp;</td>
							<td align="left" class="table5">
							<input type="text" style="height:99%;width:99%;" name="userNick" value="${awardRecord.userNick }" readonly="readonly"/>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">收货地址：&nbsp;</td>
							<td align="left" class="table5">
								<input type="text" style="height:99%;width:99%;" name="deliveryAddress" value="${awardRecord.deliveryAddress }" readonly="readonly"/>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">状态：&nbsp;</td>
							<td align="left" class="table5">
								<input type="hidden" name="deliveryStatus" value="1"/>
								<c:if test="${awardRecord.deliveryStatus == '0'}">未发货</c:if>
								<c:if test="${awardRecord.deliveryStatus == '1'}">已发货</c:if>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">快递公司：&nbsp;</td>
							<td align="left" class="table5">
								<input type="text" style="height:99%;width:99%;" name="courierName" value="${awardRecord.courierName }"/>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">快递单号：&nbsp;</td>
							<td align="left" class="table5">
								<input type="text" style="height:99%;width:99%;" name="courierNo" value="${awardRecord.courierNo }"/>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">手机号：&nbsp;</td>
							<td align="left" class="table5">
								<input type="text" style="height:99%;width:99%;" name="deliveryPhone" value="${awardRecord.deliveryPhone }" readonly="readonly"/>
							</td>
						</tr>
					</table>
				</td>
			</tr>		
		<tr>
			<td><table  border="0" style="width:100%">			 		
				<tr>
					<td height="30" align="center" valign="bottom">
						<input type="button" value="保存(s)" class="button_03" onclick="save()" />&nbsp;	
						<input type="reset" class='button_03' id="cancel" name="cancel" value="重置" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
	</td>
    <td width="1" background="${pageContext.request.contextPath}/images/wsoa_window_006.gif">&nbsp;</td>
  </tr>
  <tr>
    <td width="1" height="1"><img src="${pageContext.request.contextPath}/images/wsoa_window_009.gif" width="14" height="16"></td>
    <td height="1" background="${pageContext.request.contextPath}/images/wsoa_window_008.gif"></td>
    <td width="1" height="1"><img src="${pageContext.request.contextPath}/images/wsoa_window_007.gif" width="12" height="16"></td>
  </tr>
</table>
</form>
<br>
</body>
</html>
