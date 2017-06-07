<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK"/>
<title>编辑</title>
<meta http-equiv="Cache-Control" content="no-store"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<link  href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.js"></script> 
<script type="text/javascript">	 
	function save(){
		if(!check()){
			return;
		}
		var currPage = ${currPage};
		var pageSize = ${pageSize};
		var state = "${state}";
		if(state == null || state == ''){
			state = null;
		}
		$.ajax({
			url : "${pageContext.request.contextPath}/award_record/updateAwardRecord",
			type: "post",
		    dataType: "html",
		    data: $('#actionForm').serialize(),
			success : function (data) {	
				var obj = JSON.parse(data);      
			    var success = obj['success'];
			    if(success == true){
			    	alert("修改成功");
			    	window.location.href = "${pageContext.request.contextPath}/award_record/awardListByPage?&currPage="+currPage+"&pageSize="+pageSize;
			    }
			    if(success == false){
			    	alert("修改失败");
			    	window.location.href = "${pageContext.request.contextPath}/award_record/awardListByPage?&currPage="+currPage+"&pageSize="+pageSize;
			    }   
			}
		});
	 }
	function turnBack(){
		window.history.go(-1); 
	}
	function check(){
		var reg=/^\d+$/;
		var userNick = $("#userNick").val();
		var deliveryAddress = $("#deliveryAddress").val();
		var deliveryStatus = $("#deliveryStatus").val();
		var courierName = $("#courierName").val();
		var courierNo = $("#courierNo").val();
		var deliveryPhone = $("#deliveryPhone").val();
		var productName = $("#productName").val();
		if(userNick == null || userNick == ""){
			alert("领奖人不能为空");
			return false;
		}
		/* if(productName == null || productName == ""){
			alert("请输入奖品名称");
			return false;
		} */
		/* if(deliveryAddress == null || deliveryAddress == ""){
			alert("收货地址不能为空");
			return false;
		} */
		if(deliveryStatus == null || deliveryStatus == ""){
			alert("请选择发货状态");
			return false;
		}
		/* if(courierName == null || courierName == ""){
			alert("请输入快递公司名称");
			return false;
		}
		if(courierNo == null || courierNo == ""){
			alert("请输入快递单号");
			return false;
		} */
		if(deliveryPhone == null || deliveryPhone == ""){
			alert("请输入手机号");
			return false;
		}
		if(deliveryPhone&&deliveryPhone.search(reg)==-1){
			alert("手机号码只能为数字，请输入正确的手机号码");
			return false;
		}
		if(deliveryPhone.length != 11){
			alert("手机号码格式不对，请输入正确的位手机号码");
			return false;
		}
		return true;
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
			<td align="left" background="${pageContext.request.contextPath}/images/wsoa_window_002.gif"><span class="tfont12"><label id="functiontitle"><strong>编辑</strong> </label></td>
			<td align="right"> <a  href="" onclick="turnBack()"><strong>返回列表</strong></a></td>
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
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">领奖人：&nbsp;</td>
							<td align="left" class="table5">
							<input type="text" style="height:99%;width:99%;" id="userNick" name="userNick" value="${awardRecord.userNick }"/>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">奖品名称：&nbsp;</td>
							<td align="left" class="table5">
							<input type="text" style="height:99%;width:99%;" id="productName" name="productName" value="${awardRecord.productName }"/>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">收货地址：&nbsp;</td>
							<td align="left" class="table5">
								<input type="text" style="height:99%;width:99%;" id="deliveryAddress" name="deliveryAddress" value="${awardRecord.deliveryAddress }"/>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">状态：&nbsp;</td>
							<td align="left" class="table5">
								<select id="deliveryStatus" name="deliveryStatus" style="height:99%;width:99.5%;">
				    				<option value="0" <c:if test="${awardRecord.deliveryStatus == '0'}">selected</c:if>>未发货</option>
				    				<option value="1" <c:if test="${awardRecord.deliveryStatus == '1'}">selected</c:if>>已发货</option>
								</select>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">快递公司：&nbsp;</td>
							<td align="left" class="table5">
								<input type="text" style="height:99%;width:99%;" id="courierName" name="courierName" value="${awardRecord.courierName }"/>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">快递单号：&nbsp;</td>
							<td align="left" class="table5">
								<input type="text" style="height:99%;width:99%;" id="courierNo" name="courierNo" value="${awardRecord.courierNo }"/>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">手机号：&nbsp;</td>
							<td align="left" class="table5">
								<input type="text" style="height:99%;width:99%;" id="deliveryPhone" name="deliveryPhone" value="${awardRecord.deliveryPhone }"/>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">创建时间：&nbsp;</td>
							<td align="left" class="table5">
								<input type="text" style="height:99%;width:99%;" name="createDateStr" value="${awardRecord.createDateStr}" readonly="readonly"/>
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
						<!-- <input type="reset" class='button_03' id="cancel" name="cancel" value="重置" /> -->
						<input type="button" value="返回" class="button_03" onclick="turnBack()" />
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
