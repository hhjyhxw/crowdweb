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
<input name="id" type="hidden" id="id" value="${zlProduct.id }"/>
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
							<td align="left" class="table5" >${zlProduct.id }</td>
						</tr>
						<tr align="center">
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">产品名称：&nbsp;</td>
							<td align="left" class="table5" >
								<input type="text" value="${zlProduct.productName }" id="productName" name="productName" style="height:99%;width:99%;"/>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">产品类型：&nbsp;</td>
							<td align="left" class="table5">
								<select id="productType" name="productType" style="height:99%;width:99.5%;">
				    				<%-- <option value="0" <c:if test="${zlProduct.productType == '0'}">selected</c:if>>普通</option> --%>
				    				<option value="" <c:if test="${zlProduct.productType == ''}">selected</c:if>>--请选择--</option>
				    				<option value="1" <c:if test="${zlProduct.productType == '1'}">selected</c:if>>新品</option>
				    				<option value="2" <c:if test="${zlProduct.productType == '2'}">selected</c:if>>人气</option>
				    				<option value="3" <c:if test="${zlProduct.productType == '3'}">selected</c:if>>成熟</option>
								</select>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">类型：&nbsp;</td>
							<td align="left" class="table5">
								<select id="type" name="type" style="height:99%;width:99.5%;">
				    				<%-- <option value="0" <c:if test="${zlProduct.productType == '0'}">selected</c:if>>普通</option> --%>
				    				<option value="0" <c:if test="${zlProduct.type == '0'}">selected</c:if>>特色嘴棒</option>
				    				<option value="1" <c:if test="${zlProduct.type == '1'}">selected</c:if>>低焦卷烟</option>
				    				<option value="2" <c:if test="${zlProduct.type == '2'}">selected</c:if>>细支卷烟</option>
				    				<option value="3" <c:if test="${zlProduct.type == '3'}">selected</c:if>>扫码得龙币</option>
				    				<option value="4" <c:if test="${zlProduct.type == '4'}">selected</c:if>>扫码的乐豆</option>
								</select>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">卷烟类型：&nbsp;</td>
							<td align="left" class="table5">
								<input type="text" name="cigaretteType" value="${zlProduct.cigaretteType }" id="cigaretteType" style="height:99%;width:99%;"/>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">投产时间：&nbsp;</td>
							<td align="left" class="table5">
								<input type="text" value="${zlProduct.intoOperationTime }" name="intoOperationTime" id="intoOperationTime" style="height:99%;width:99%;"/>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">产地：&nbsp;</td>
							<td align="left" class="table5">
							<input type="text" value="${zlProduct.productionPlace }" id="productionPlace" name="productionPlace" style="height:99%;width:99%;"/>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">包装形式：&nbsp;</td>
							<td align="left" class="table5">
							<input type="text" value="${zlProduct.packType }" id="packType" name="packType" style="height:99%;width:99%;"/>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">烟支规格：&nbsp;</td>
							<td align="left" class="table5">
								<input type="text" value="${zlProduct.cigaretteSpecification }"  id="cigaretteSpecification" name="cigaretteSpecification" style="height:99%;width:99%;"/>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">焦油量：&nbsp;</td>
							<td align="left" class="table5">
								<input type="text" value="${zlProduct.tarContent }" id="tarContent" name="tarContent" style="height:99%;width:99%;"/>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">烟气烟碱量：&nbsp;</td>
							<td align="left" class="table5">
								<input type="text" value="${zlProduct.nicotineContent }" id="nicotineContent" name="nicotineContent" style="height:99%;width:99%;"/>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">烟气一氧化碳量：&nbsp;</td>
							<td align="left" class="table5">
								<input type="text" value="${zlProduct.carbonMonoxideContent }" id="carbonMonoxideContent" name="carbonMonoxideContent" style="height:99%;width:99%;"/>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">件条形码：&nbsp;</td>
							<td align="left" class="table5">
								<input type="text" value="${zlProduct.pieceBarcode }" id="pieceBarcode" name="pieceBarcode" style="height:99%;width:99%;"/>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">条条形码：&nbsp;</td>
							<td align="left" class="table5">
								<input type="text" value="${zlProduct.cartonBarcode }" id="cartonBarcode" name="cartonBarcode" style="height:99%;width:99%;"/>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">盒条形码：&nbsp;</td>
							<td align="left" class="table5">
								<input type="text" value="${zlProduct.boxBarcode }" id="boxBarcode" name="boxBarcode" style="height:99%;width:99%;"/>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">价类：&nbsp;</td>
							<td align="left" class="table5">
								<input type="text" value="${zlProduct.priceType }" id="priceType" name="priceType" style="height:99%;width:99%;"/>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">建议零售价：&nbsp;</td>
							<td align="left" class="table5">
								<input type="text" value="${zlProduct.price }" id="price" name="price" style="height:99%;width:99%;"/>
							</td>
						</tr>
						<%-- <tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">创建时间：&nbsp;</td>
							<td align="left" class="table5">
								<input type="text" style="height:99%;width:99%;" name="createDateStr" value="${zlProduct.createDateStr}" readonly="readonly"/>
							</td>
						</tr> --%>
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
