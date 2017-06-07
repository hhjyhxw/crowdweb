<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK"/>
<title>添加众筹活动</title>
<meta http-equiv="Cache-Control" content="no-store"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<link  href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.js"></script> 
<script  type="text/javascript" src="${pageContext.request.contextPath}/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">	 
	 function onSubmitAction(){
	 	if($("#_title").val()==""){
	 		window.alert("标题不能为空！");
	 		$("#_title").focus();
	 		return false;
	 	}
	 	if($("#_descriptor").val()==""){
	 		window.alert("描述不能为空！");
	 		$("#_descriptor").focus();
	 		return false;
	 	}
	 	if($("#_picture").val()==""){
	 		window.alert("图片不能为空！");
	 		$("#_picture").focus();
	 		return false;
	 	}
	 	if($("#_vistUrl").val()==""){
	 		window.alert("访问url不能为空！");
	 		$("#_vistUrl").focus();
	 		return false;
	 	}
	 	if($("#_state").val()==""){
	 		window.alert("状态，1正常，2失效不能为空！");
	 		$("#_state").focus();
	 		return false;
	 	}
	 	if($("#_validDate").val()==""){
	 		window.alert("生效日期不能为空！");
	 		$("#_validDate").focus();
	 		return false;
	 	}
	 	if($("#_expiredDate").val()==""){
	 		window.alert("失效日期不能为空！");
	 		$("#_expiredDate").focus();
	 		return false;
	 	}
	 	if($("#_createDate").val()==""){
	 		window.alert("上传日期不能为空！");
	 		$("#_createDate").focus();
	 		return false;
	 	}
	 	/* if($("#_bmsUserId").val()==""){
	 		window.alert("发布人不能为空！");
	 		$("#_bmsUserId").focus();
	 		return false;
	 	} */
	 	return true;
	 }
	 
	function jump(url){
		var e = document.createElement("a");
		e.href = url;
		document.body.appendChild(e);
		e.click();
	}
	//ajax保存图片
function ajaxFileUpload(obj){
	  //判断图片格式是否有效 	
	 	var objvalue = obj.value;
 		if(!objvalue.substr(objvalue.lastIndexOf("."),objvalue.length).match( /.jpg|.cdr|.psd|.eps|.ai/i ) ){   
	        alert("图片格式非法！");
	        $("#_file").focus(); 
	        return false;   
		}
	 	
	 	var urls ="${pageContext.request.contextPath}/hs/addAdsPictureAjax.action";
   		$.ajaxFileUpload({
               url:urls, //用于文件上传的服务器端请求地址
               secureuri: false, //一般设置为false
               fileElementId:"_file", //文件上传空间的id属性  <input type="file" id="file" name="file" />
               dataType:"json", //返回值类型 一般设置为json
               success:function(data){
				   if(data=="1"){
				   		alert("图片格式非法！");
				   }else if(data=="2"){
				   		alert("图片预览失败！");
				   }else{
				    	$("#_picture").val(data);
				    	$("#imgDiv").html("<img src=\"${pageContext.request.contextPath}/"+data+"\" width=\"396\" />"); 
				    	
				   }
				},
			  }); 
       
} 
	</script>
</head>
<body>
<form action="${pageContext.request.contextPath}/hs/addTHsAdvertisement.action" method="post" name="form1" onsubmit="return onSubmitAction();">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="1" background="${pageContext.request.contextPath}/images/wsoa_window_002.gif"></td>
    <td background="${pageContext.request.contextPath}/images/wsoa_window_002.gif">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		  <tr>
			<td width="10" align="center" background="${pageContext.request.contextPath}/images/wsoa_window_002.gif"><img src="${pageContext.request.contextPath}/images/center_19.gif"></td>
			<td align="left" background="${pageContext.request.contextPath}/images/wsoa_window_002.gif"><span class="tfont12"><label id="functiontitle"><strong>录入皇氏广告</strong> </label></td>
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
					<table border="0" style="width:100%" align="center" class="table5">
						<tr>
							<td align="right" class="table5 bgcolor5" width="15%">标题：&nbsp;</td>
							<td align="left" class="table5" colspan="2">&nbsp;<input name="title" class="input" id="_title"  style="width:50%" value="" /></td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" width="15%">描述：&nbsp;</td>
							<td align="left" class="table5" colspan="2">&nbsp;<textarea name=descriptor id="_descriptor" rows="6" style="width:50%"></textarea></td>
						</tr>
						
						<tr>	
							<td align="right" class="table5 bgcolor5" width="15%">访问url：&nbsp;</td>
							<td align="left" class="table5" colspan="2">&nbsp;<input name="vistUrl" id="_vistUrl"  style="width:50%"  value="" /></td>
						</tr>
						<tr>
							<td align="right" class="table5 bgcolor5" width="15%">状态：&nbsp;</td>
							<td align="left" class="table5" colspan="2">
							<select name="state" class="input" id="_state"  style="width:50.3%;margin-left:4px;">
								<option value="1" <c:if test="${m.state == '1' }">selected="selected"</c:if>> 正常</option>
								<option value="2" <c:if test="${m.state =='2' }">selected="selected"</c:if>>失效</option>
							</select></td>
						</tr>
						<tr>	
							<td align="right" class="table5 bgcolor5" width="15%">生效日期：&nbsp;</td>
							<td align="left" class="table5" colspan="2">&nbsp;<input name="validDate" id="_validDate"  style="width:50%"  value="" onfocus="WdatePicker({skin:'whyGreen',startDate:'%y-%M-%d 23:59:59',dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly"/></td>
						</tr>
						<tr>
							<td align="right" class="table5 bgcolor5" width="15%">失效日期：&nbsp;</td>
							<td align="left" class="table5" colspan="2">&nbsp;<input name="expiredDate" class="input" id="_expiredDate"  style="width:50%" value="" onfocus="WdatePicker({skin:'whyGreen',startDate:'%y-%M-%d 23:59:59',dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly"/></td>
						</tr>
						<tr>
							<td align="right" class="table5 bgcolor5" width="15%">图片：&nbsp;</td>
							<td align="left" class="table5">&nbsp;
							<input type="file" name="file" id="_file" size="30" onchange="ajaxFileUpload(this)"/>
								<input type="hidden" name="picture" id="_picture"/></td>
							<td>
								<div style="width:396px; height:90px; overflow:hidden; border:1px solid red;">    
								<div id="imgDiv"> </div>   
								</div> 建议：预览图像素约为1980px × 450px。											
							</td>
						</tr>
					</table>
				</td>
			</tr>		
		<tr>
			<td><table  border="0" style="width:100%">			 		
				<tr>
					<td height="30" align="center" valign="bottom"><input type="submit" value="保存(s)"class="button_03"  />&nbsp;	<input type="reset" class='button_03' id="cancel" name="cancel" value="重置" /></td>
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
