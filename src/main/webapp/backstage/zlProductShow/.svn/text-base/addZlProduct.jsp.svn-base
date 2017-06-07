<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK"/>
<title>新增</title>
<meta http-equiv="Cache-Control" content="no-store"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<link  href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.js"></script>
<script  type="text/javascript" src="${pageContext.request.contextPath}/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">	
function check(saveType){
	var productName = $("#productName").val();
	var productType = $("#productType").val();
	var type = $("#type").val();
	var cigaretteType = $("#cigaretteType").val();
	var intoOperationTime = $("#intoOperationTime").val();
	var productionPlace = $("#productionPlace").val();
	var packType = $("#packType").val();
	var cigaretteSpecification = $("#cigaretteSpecification").val();
	var tarContent = $("#tarContent").val();
	var nicotineContent = $("#nicotineContent").val();
	var carbonMonoxideContent = $("#carbonMonoxideContent").val();
	var pieceBarcode = $("#pieceBarcode").val();
	var cartonBarcode = $("#cartonBarcode").val();
	var boxBarcode = $("#boxBarcode").val();
	var priceType = $("#priceType").val();
	var price = $("#price").val();
	var productLogo = "";
	var productDetailLogo = "";
	if(saveType == "add"){
		productLogo = $("#plFile").val();
		productDetailLogo = $("#pdlFile").val();
	}
	if(saveType == "update"){
		productLogo = $("#productLogo").val();
		productDetailLogo = $("#productDetailLogo").val();
	}
	
	if(productName == null || productName == ""){
		alert("请输入产品名称");
		return false;
	}
	if(productType == null || productType == ""){
		alert("请选择产品类型");
		return false;
	}
	if(type == null || type == ""){
		alert("请选择类型");
		return false;
	}
	/* if(cigaretteType == null || cigaretteType == ""){
		alert("请输入卷烟类型");
		return false;
	} */
	if(intoOperationTime == null || intoOperationTime == ""){
		alert("请输入投产时间");
		return false;
	}
	/* if(productionPlace == null || productionPlace == ""){
		alert("请输入产地");
		return false;
	} */
	/* if(packType == null || packType == ""){
		alert("请输包装类型");
		return false;
	} */
	/* if(cigaretteSpecification == null || cigaretteSpecification == ""){
		alert("请输入烟支规格");
		return false;
	} */
	if(tarContent == null || tarContent == ""){
		alert("请输入焦油量");
		return false;
	}
	/* if(nicotineContent == null || nicotineContent == ""){
		alert("请输入烟气烟碱量");
		return false;
	}
	if(carbonMonoxideContent == null || carbonMonoxideContent == ""){
		alert("请输入烟气一氧化碳量");
		return false;
	}
	if(pieceBarcode == null || pieceBarcode == ""){
		alert("请输入件条形码");
		return false;
	}
	if(cartonBarcode == null || cartonBarcode == ""){
		alert("请输入条条形码");
		return false;
	}
	if(boxBarcode == null || boxBarcode == ""){
		alert("请输入盒条形码");
		return false;
	}
	if(priceType == null || priceType == ""){
		alert("请输入价类");
		return false;
	} */
	if(price == null || price == ""){
		alert("请输入建议零售价");
		return false;
	}
	if(saveType == "add"){
		if(productLogo == null || productLogo == ""){
			alert("请上传商品图片");
			return false;
		}
		if(productDetailLogo == null || productDetailLogo == ""){
			alert("请上传商品详情图片");
			return false;
		}
	}

	return true;
}
	function update(){
		if(!check('update')){
			return;
		}
		actionForm.action = "${pageContext.request.contextPath}/zl_product/saveUpdateProduct";
		actionForm.submit(); 
	}
	function turnBack(){
		window.history.go(-1); 
	}
</script>
<script type="text/javascript">
	var fileExt = "";
	var extArr = ["jpg","png","gif"];
	//下面用于图片上传预览功能
	function setImagePreviewPl() {
		//获取文件的扩展名
		var fileName = document.getElementById("plFile").value+"";
		var imagSize =  document.getElementById("plFile").files[0].size;
		/* if(imagSize > 505000){
			alert("您选择的图片大小超过规定大小，请重新选择");
			document.getElementById("plFile").value="";
			return false;
		} */
	    var lastIndex  = fileName.lastIndexOf(".");
	        fileExt = fileName.substring(lastIndex+1);
	    if(!checkFileExt(fileExt)){//如果图片格式校验格式不通过
	    	alert("图片的格式只能是jpg|png|gif");
	    	document.getElementById("plFile").value="";
	    	return;
	    }
		//input
	    var docObj = document.getElementById("plFile");
		//img
	    var imgObjPreview = document.getElementById("previewPl");
	    //div
	    var divs = document.getElementById("imgDivPl");
	    if (docObj.files && docObj.files[0]) {
	        //火狐下，直接设img属性
	        imgObjPreview.style.display = 'block';
	        imgObjPreview.style.width = '100px';
	        imgObjPreview.style.height = '100px';
	        //imgObjPreview.src = docObj.files[0].getAsDataURL();
	        //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
	       imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
	    } else {
	        //IE下，使用滤镜
	        docObj.select();
	        var imgSrc = document.selection.createRange().text;
	        var localImagId = document.getElementById("localImag");
	        //必须设置初始大小
	        localImagId.style.width = "100px";
	        localImagId.style.height = "100px";
	        //图片异常的捕捉，防止用户修改后缀来伪造图片
	        try {
	            localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
	            localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
	        } catch(e) {
	            alert("您上传的图片格式不正确，请重新选择!");
	            return false;
	        }
	        imgObjPreview.style.display = 'none';
	        document.selection.empty();
	    }
	    //当图片校验通过时,清空原有的图片路径
	    $("#productLogo").val("");
	    return true;
	}
	function setImagePreviewPdl() {
		//获取文件的扩展名
		var fileName = document.getElementById("pdlFile").value+"";
		var imagSize =  document.getElementById("pdlFile").files[0].size;
		/* if(imagSize > 505000){
			alert("您选择的图片大小超过规定大小，请重新选择");
			document.getElementById("pdlFile").value="";
			return false;
		} */
	    var lastIndex  = fileName.lastIndexOf(".");
	        fileExt = fileName.substring(lastIndex+1);
	    if(!checkFileExt(fileExt)){//如果图片格式校验格式不通过
	    	alert("图片的格式只能是jpg|png|gif");
	    	document.getElementById("pdlFile").value="";
	    	return;
	    }
		//input
	    var docObj = document.getElementById("pdlFile");
		//img
	    var imgObjPreview = document.getElementById("previewPdl");
	    //div
	    var divs = document.getElementById("imgDivPdl");
	    if (docObj.files && docObj.files[0]) {
	        //火狐下，直接设img属性
	        imgObjPreview.style.display = 'block';
	        imgObjPreview.style.width = '100px';
	        imgObjPreview.style.height = '100px';
	        //imgObjPreview.src = docObj.files[0].getAsDataURL();
	        //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
	       imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
	    } else {
	        //IE下，使用滤镜
	        docObj.select();
	        var imgSrc = document.selection.createRange().text;
	        var localImagId = document.getElementById("localImag");
	        //必须设置初始大小
	        localImagId.style.width = "100px";
	        localImagId.style.height = "100px";
	        //图片异常的捕捉，防止用户修改后缀来伪造图片
	        try {
	            localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
	            localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
	        } catch(e) {
	            alert("您上传的图片格式不正确，请重新选择!");
	            return false;
	        }
	        imgObjPreview.style.display = 'none';
	        document.selection.empty();
	    }
	    //当图片校验通过时,清空原有的图片路径
	    $("#productDetailLogo").val("");
	    return true;
	}
	//校验文件的扩展名
	function checkFileExt(fileExt){
		 var flag = false;
		 //循环比较
		 for(var i=0;i<extArr.length;i++){
	    	 if(extArr[i]==fileExt){
	    	   flag = true; //一旦找到合适的，立即退出循环
	    	   break;
	    	 }
		 }	
		 return flag;
	}
	function checkEvent(){
		var obj=document.getElementsByName("typeSeq");
	 	var types = "";
	 	for(var i=0;obj!=null&&i<obj.length;i++){
	 		if(obj[i].checked==true){
	 			var typeSeq = obj[i].defaultValue;
	 			types += typeSeq+",";			
	 		}else{
	 			types += "null"+",";
	 		}
	 	}
		$("#type").val(types);
	}
</script>
</head>
<body>
<form action="${pageContext.request.contextPath}/zl_product/saveAddProduct" method="post" onsubmit="return check('add');" name="actionForm" id="actionForm" enctype="multipart/form-data">
<input type="hidden" name="id" value="${zlProduct.id }"/>
<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="1" background="${pageContext.request.contextPath}/images/wsoa_window_002.gif"></td>
    <td background="${pageContext.request.contextPath}/images/wsoa_window_002.gif">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		  <tr>
			<td width="10" align="center" background="${pageContext.request.contextPath}/images/wsoa_window_002.gif"><img src="${pageContext.request.contextPath}/images/center_19.gif"></td>
			<td align="left" background="${pageContext.request.contextPath}/images/wsoa_window_002.gif"><span class="tfont12"><label id="functiontitle"><strong>新增/编辑</strong> </label></td>
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
					<table border="0" style="width:85%" align="center" class="table5">
						<tr align="center">
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="25%" height="25px">产品名称：&nbsp;</td>
							<td align="left" class="table5" colspan="2">
								<input type="text" value="${zlProduct.productName }" id="productName" name="productName" style="height:99%;width:60%;"/>
								<span style="color:red;">*</span>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">产品类型：&nbsp;</td>
							<td align="left" class="table5" colspan="2">
								<select id="productType" name="productType" style="height:99%;width:60.8%;">
				    				<option value="" <c:if test="${zlProduct.productType == ''}">selected</c:if>>----请选择----</option>
				    				<option value="1" <c:if test="${zlProduct.productType == '1'}">selected</c:if>>新品</option>
				    				<option value="2" <c:if test="${zlProduct.productType == '2'}">selected</c:if>>人气</option>
				    				<%-- <option value="3" <c:if test="${zlProduct.productType == '3'}">selected</c:if>>成熟</option> --%>
								</select>
								<span style="color:red;">*</span>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="125px">类型：&nbsp;</td>
							<td align="left" class="table5" colspan="2">
								<input type="hidden" id="type" name="type" value="${zlProduct.type}"/>
								<c:if test="${!empty zlProduct.type}">
								<c:forEach var="type" items="${fn:split(zlProduct.type, ',')}" varStatus="status">
									<c:if test="${status.index == '0' && type == '0'}">
										<input type="checkbox" id="typeSeq" name="typeSeq" value="0" checked="checked"/><span style="width:40%;">特色嘴棒</span></br>
									</c:if>
									<c:if test="${status.index == '0' && type == 'null'}">
										<input type="checkbox" id="typeSeq" name="typeSeq" value="0"/><span style="width:40%;">特色嘴棒</span></br>
									</c:if>
									
									<c:if test="${status.index == '1' && type == 'null'}">
										<input type="checkbox" id="typeSeq" name="typeSeq" value="1"/><span style="width:40%;">低焦卷烟</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red;">*</span><span style="">低于8mg的香烟都属于低焦卷烟</span></br>
									</c:if>
									<c:if test="${status.index == '1' && type == '1'}">
										<input type="checkbox" id="typeSeq" name="typeSeq" value="1"  checked="checked"/><span style="width:40%;">低焦卷烟</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red;">*</span><span style="">低于8mg的香烟都属于低焦卷烟</span></br>
									</c:if>
									
									<c:if test="${status.index == '2' && type == 'null'}">
										<input type="checkbox" id="typeSeq" name="typeSeq" value="2"/><span style="width:40%;">细支卷烟</span></br>
									</c:if>
									<c:if test="${status.index == '2' && type == '2'}">
										<input type="checkbox" id="typeSeq" name="typeSeq" value="2"  checked="checked"/><span style="width:40%;">细支卷烟</span></br>
									</c:if>
									
									<c:if test="${status.index == '3' && type == 'null'}">
										<input type="checkbox" id="typeSeq" name="typeSeq" value="3"/><span style="width:40%;">扫码得龙币</span></br>
									</c:if>
									<c:if test="${status.index == '3' && type == '3'}">
										<input type="checkbox" id="typeSeq" name="typeSeq" value="3"  checked="checked"/><span style="width:40%;">扫码得龙币</span></br>
									</c:if>
									
									<c:if test="${status.index == '4' && type == 'null'}">
										<input type="checkbox" id="typeSeq" name="typeSeq" value="4"/><span style="width:40%;">扫码得龙币</span></br>
									</c:if>
									<c:if test="${status.index == '4' && type == '4'}">
										<input type="checkbox" id="typeSeq" name="typeSeq" value="4"  checked="checked"/><span style="width:40%;">扫码得龙币</span></br>
									</c:if>
								</c:forEach>
								</c:if>
								<c:if test="${empty zlProduct.type}">
									<input type="checkbox" id="typeSeq" name="typeSeq" value="0" onclick="checkEvent()"/><span style="width:40%;">特色嘴棒</span></br>
									<input type="checkbox" id="typeSeq" name="typeSeq" value="1" onclick="checkEvent()"/><span  style="width:40%;">低焦卷烟</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red;">*</span><span style="">低于8mg的香烟都属于低焦卷烟</span></br>
									<input type="checkbox" id="typeSeq" name="typeSeq" value="2" onclick="checkEvent()"/><span  style="width:40%;">细支卷烟</span></br>
									<input type="checkbox" id="typeSeq" name="typeSeq" value="3" onclick="checkEvent()"/><span>扫码得龙币</span></br>
									<input type="checkbox" id="typeSeq" name="typeSeq" value="4" onclick="checkEvent()"/><span>扫码得乐豆</span>
								</c:if>
								<!-- <input type="checkbox" id="type0" value="0"/><span style="width:40%;">特色嘴棒</span></br>
								<input type="checkbox" id="type1" value="1"/><span  style="width:40%;">低焦卷烟</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red;">*</span><span style="">低于8mg的香烟都属于低焦卷烟</span></br>
								<input type="checkbox" id="type2" value="2"/><span  style="width:40%;">细支卷烟</span></br>
								<input type="checkbox" id="type3" value="3"/><span>扫码得龙币</span></br>
								<input type="checkbox" id="type4" value="4"/><span>扫码得乐豆</span></br> -->
								<%-- <select id="type" name="type" style="height:99%;width:60.8%;">
									<option value="" <c:if test="${zlProduct.type == ''}">selected</c:if>>----请选择----</option>
				    				<option value="0" <c:if test="${zlProduct.type == '0'}">selected</c:if>>特色嘴棒</option>
				    				<option value="1" <c:if test="${zlProduct.type == '1'}">selected</c:if>>低焦卷烟</option>
				    				<option value="2" <c:if test="${zlProduct.type == '2'}">selected</c:if>>细支卷烟</option>
				    				<option value="3" <c:if test="${zlProduct.type == '3'}">selected</c:if>>扫码得龙币</option>
				    				<option value="4" <c:if test="${zlProduct.type == '4'}">selected</c:if>></option>
								</select> --%>
								<!-- <span style="color:red;">*</span><span>低于8mg的香烟都属于低焦卷烟</span> -->
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">卷烟类型：&nbsp;</td>
							<td align="left" class="table5" colspan="2">
								<input type="text" value="${zlProduct.cigaretteType }" id="cigaretteType" name="cigaretteType" style="height:99%;width:60%;"/>
								<!-- <span style="color:red;">*</span> --><span>例：烤烟型</span>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">投产年份：&nbsp;</td>
							<td align="left" class="table5" colspan="2">
								<input value="${zlProduct.intoOperationTimeStr}" name="intoOperationTimeStr" id="intoOperationTime"  style="height:99%;width:60%;" onfocus="WdatePicker({skin:'whyGreen',startDate:'%y',dateFmt:'yyyy'})" readonly="readonly"/>
								<!-- <input type="text" value="" name="intoOperationTime" id="intoOperationTime" style="height:99%;width:99%;"/> -->
								<span style="color:red;">*</span>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">产地：&nbsp;</td>
							<td align="left" class="table5" colspan="2">
								<input type="text" value="${zlProduct.productionPlace }" id="productionPlace" name="productionPlace" style="height:99%;width:60%;"/>
								<!-- <span style="color:red;">*</span> -->
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">包装形式：&nbsp;</td>
							<td align="left" class="table5" colspan="2">
								<input type="text" value="${zlProduct.packType }" id="packType" name="packType" style="height:99%;width:60%;"/>
								<!-- <span style="color:red;">*</span> --><span>条盒硬盒等</span>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">烟支规格：&nbsp;</td>
							<td align="left" class="table5" colspan="2">
								<input type="text" value="${zlProduct.cigaretteSpecification }"  id="cigaretteSpecification" name="cigaretteSpecification" style="height:99%;width:60%;"/>
								<!-- <span style="color:red;">*</span> --><span>例：84(30+54)mmx24.5mm</span>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">焦油量：&nbsp;</td>
							<td align="left" class="table5" colspan="2">
								<input type="text" value="${zlProduct.tarContent }" id="tarContent" name="tarContent" style="height:99%;width:60%;" 
								onKeyPress="if((event.keyCode<48 || event.keyCode>57) && event.keyCode!=46 || /\.\d\d$/.test(value))event.returnValue=false"
								onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')"/>
								<span style="color:red;">*</span><span>单位：mg</span>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">烟气烟碱量：&nbsp;</td>
							<td align="left" class="table5" colspan="2">
								<input type="text" value="${zlProduct.nicotineContent }" id="nicotineContent" name="nicotineContent" style="height:99%;width:60%;"
								onKeyPress="if((event.keyCode<48 || event.keyCode>57) && event.keyCode!=46 || /\.\d\d$/.test(value))event.returnValue=false"
								onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')"/>
								<!-- <span style="color:red;">*</span> --><span>单位：mg</span>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">烟气一氧化碳量：&nbsp;</td>
							<td align="left" class="table5" colspan="2">
								<input type="text" value="${zlProduct.carbonMonoxideContent }" id="carbonMonoxideContent" name="carbonMonoxideContent" style="height:99%;width:60%;"
								onKeyPress="if((event.keyCode<48 || event.keyCode>57) && event.keyCode!=46 || /\.\d\d$/.test(value))event.returnValue=false"
								onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')"/>
								<!-- <span style="color:red;">*</span> --><span>单位：mg</span>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">件条形码：&nbsp;</td>
							<td align="left" class="table5" colspan="2">
								<input type="text" value="${zlProduct.pieceBarcode }" id="pieceBarcode" name="pieceBarcode" style="height:99%;width:60%;"/>
								<!-- <span style="color:red;">*</span> -->
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">条条形码：&nbsp;</td>
							<td align="left" class="table5" colspan="2">
								<input type="text" value="${zlProduct.cartonBarcode }" id="cartonBarcode" name="cartonBarcode" style="height:99%;width:60%;"/>
								<!-- <span style="color:red;">*</span> -->
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">盒条形码：&nbsp;</td>
							<td align="left" class="table5" colspan="2">
								<input type="text" value="${zlProduct.boxBarcode }" id="boxBarcode" name="boxBarcode" style="height:99%;width:60%;"/>
								<!-- <span style="color:red;">*</span> -->
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">价类：&nbsp;</td>
							<td align="left" class="table5" colspan="2">
								<input type="text" value="${zlProduct.priceType }" id="priceType" name="priceType" style="height:99%;width:60%;"/>
								<!-- <span style="color:red;">*</span> -->
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="25px">建议零售价：&nbsp;</td>
							<td align="left" class="table5" colspan="2">
								<input type="text" value="${zlProduct.price }" id="price" name="price" style="height:99%;width:60%;"
								onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')"
								onKeyPress="if((event.keyCode<48 || event.keyCode>57) && event.keyCode!=46 || /\.\d\d$/.test(value))event.returnValue=false"/>
								<span style="color:red;">*</span><span>单位：元</span>
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="100px">商品图片：&nbsp;</td>
							<td align="left" class="table5">
								<input type="file" name="plFile" id="plFile" multiple="multiple" style="width:150px;" onchange="javascript:setImagePreviewPl();">
								<input type="hidden" name="productLogo" id="productLogo" value="${zlProduct.productLogo}"/>
								<span style="color:red;">*</span>
							</td>
							<td align="left" class="table5">
								<div style="width:100px; height:100px; overflow:hidden; border:1px solid;">      
					                <div id="imgDivPl" >
					                	<c:if test="${!empty zlProduct.productLogo}">
	                             			<img id="previewPl" src="${pageContext.request.contextPath}/${zlProduct.productLogo}" width="100" height="100" style="display: block;" />
	                        			</c:if>
	                        			<c:if test="${empty zlProduct.productLogo}">
	                             			<img id="previewPl" src="" width="100" height="100" style="display: block;" />
	                        			</c:if>
	                        		</div>
								</div><!-- 建议：预览图像素约为1980px × 450px。 -->										
							</td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" style="font-size: 15px;" width="30%" height="100px">商品详情图片：&nbsp;</td>
							<td align="left" class="table5">
								<input type="file" name="pdlFile" id="pdlFile" multiple="multiple" style="width:150px;" onchange="javascript:setImagePreviewPdl();">
								<input type="hidden" name="productDetailLogo" id="productDetailLogo" value="${zlProduct.productDetailLogo}"/>
								<span style="color:red;">*</span>
							</td>
							<td align="left" class="table5">
								<div style="width:100px; height:100px; overflow:hidden; border:1px solid;">      
					                <div id="imgDivPdl" >
					                	<c:if test="${empty zlProduct.productDetailLogo}">
					                		<img id="previewPdl" src="" width="100" height="100" style="display: block;" />
					                	</c:if>
					                	<c:if test="${!empty zlProduct.productDetailLogo}">
	                             			<img id="previewPdl" src="${pageContext.request.contextPath}/${zlProduct.productDetailLogo}" width="100" height="100" style="display: block;" />
	                        			</c:if>
	                        		</div>
								</div><!-- 建议：预览图像素约为1980px × 450px。 -->										
							</td>
						</tr>
					</table>
				</td>
			</tr>		
		<tr>
			<td><table  border="0" style="width:100%">			 		
				<tr>
					<td height="30" align="center" valign="bottom">
						<c:if test="${empty zlProduct.id}">
							<input type="submit" value="保存(s)" class="button_03" />&nbsp;	
						</c:if>
						<c:if test="${!empty zlProduct.id}">
							<input type="button" value="保存(s)" class="button_03" onclick="update()" />&nbsp;	
						</c:if>
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
