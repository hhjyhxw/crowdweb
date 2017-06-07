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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
<!-- 配置文件 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/uedit_utf8_jsp/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/uedit_utf8_jsp/ueditor.all.js"></script>
<script type="text/javascript">	
	 var reg = new RegExp("^[1-9][0-9]*$"); 
	 //纯数字校验
	 function isNumCheck(numStr){
 	     if(!reg.test(numStr)){  
 	        return false;
 	     }
 	     return true;
	 }
	 //yyyy-MM-DD HH:mm:ss转换成Date日期对象
	 //-中划线用_下划线代替
	 //空格用0代替
	 //:用1代替
	 // / 斜线用2代替
	 function STRyyyy_MM_dd0HH1mm1ssChangeToDate(yyyy_MM_dd0HH1mm1ss){
		 //1.切分空格
		 //2.切分中划线
		 //3.切分冒号:
		 //4.创建日期对象并返回
		 //一.中划线转斜线/
		 var yyyy2MM2dd0HH1mm1ss = yyyy_MM_dd0HH1mm1ss.replace("-","/");
	 	 //二.创建对象并返回
	 	 return new Date(yyyy2MM2dd0HH1mm1ss);
	 }
	 function onSubmitAction(){
		 
		 //01众筹名称
	 	if($("#_raiseName").val()==""){
	 		window.alert("众筹名称:不能为空！");
	 		$("#_raiseName").focus();
	 		return false;
	 	}

	 	//02当期期数
	 	if($("#_currentPeriod").val()==""  ){
	 		window.alert("当期期数:不能为空！");
	 		$("#_currentPeriod").focus();
	 		return false;
	 	}else{
 	         var obj = document.getElementById("_currentPeriod");
 	         if(! isNumCheck(obj.value)){
 	        	window.alert("当期期数:请输正确数值!！");
 		 		$("#_currentPeriod").focus();
 		 		return false; 
 	         }  
	 	}
	 	//03当期号数
	 	if($("#_currentNum").val()==""  ){
	 		window.alert("当期号数:不能为空！");
	 		$("#_currentNum").focus();
	 		return false;
	 	}else{
 	         var obj = document.getElementById("_currentNum");
 	         if(! isNumCheck(obj.value)){
 	        	window.alert("当期号数:请输正确数值!！");
 		 		$("#_currentNum").focus();
 		 		return false;
 	         }  
	 	}	 	
	 	//04总份额数
	 	/*
	 	if($("#_totalShare").val()==""  ){
	 		window.alert("总份额数:不能为空！");
	 		$("#_totalShare").focus();
	 		return false;
	 	}else{
 	         var obj = document.getElementById("_totalShare");
 	         if(! isNumCheck(obj.value)){
 	        	window.alert("总份额数:请输正确数值!！");
 		 		$("#_totalShare").focus();
 		 		return false;
 	         }  
	 	}*/	
	 	//05每人最多可购买份数
	 	if($("#_maxSare").val()==""  ){
	 		window.alert("每人最多可购买份数:不能为空！");
	 		$("#_maxSare").focus();
	 		return false;
	 	}else{
 	         var obj = document.getElementById("_maxSare");
 	         if(! isNumCheck(obj.value)){
 	        	window.alert("每人最多可购买份数:请输正确数值!！");
 		 		$("#_maxSare").focus();
 		 		return false;
 	         }  
	 	}	 
	 	//06每份所需乐豆数
	 	if($("#_eachTotal").val()==""  ){
	 		window.alert("每份所需乐豆数:不能为空！");
	 		$("#_eachTotal").focus();
	 		return false;
	 	}else{
 	         var obj = document.getElementById("_eachTotal");
 	         if(! isNumCheck(obj.value)){
 	        	window.alert("每份所需乐豆数:请输正确数值!！");
 		 		$("#_eachTotal").focus();
 		 		return false;
 	         }  
	 	}	
	 	//07开始时间
	 	if($("#_startDateStr").val()==""  ){
	 		window.alert("开始时间:不能为空！");
	 		$("#_startDateStr").focus();
	 		return false;
	 	}
	 	//08截至时间
	 	if($("#_endDateStr").val()==""  ){
	 		window.alert("截至时间:不能为空！");
	 		$("#_endDateStr").focus();
	 		return false;
	 	}else{
 			//结束时间不能小于开始时间
 			var endDate   = STRyyyy_MM_dd0HH1mm1ssChangeToDate($("#_endDateStr").val());
 			var startDate = STRyyyy_MM_dd0HH1mm1ssChangeToDate($("#_startDateStr").val());
 			if(startDate.getTime()>=endDate.getTime()){
 		 		window.alert("截至时间不能小于开始时间！");
 		 		$("#_endDateStr").focus(); 				
 				return false;
 			}else if($("#_endDateStr").val().indexOf("09:59:00")==-1){
 		 		window.alert("截至时间只能是每天的09:59:00！");
 		 		$("#_endDateStr").focus(); 				
 				return false;	
 			}	
	 	}
	 	//09计划开奖时间
	 	if($("#_outTimeStr").val()==""  ){
	 		window.alert("计划开奖时间:不能为空！");
	 		$("#_outTimeStr").focus();
	 		return false;
	 	}else{
 			//结束时间不能小于开始时间
 			var endDate   = STRyyyy_MM_dd0HH1mm1ssChangeToDate($("#_endDateStr").val());
 			var outTime   = STRyyyy_MM_dd0HH1mm1ssChangeToDate($("#_outTimeStr").val());
 			if(endDate.getTime()>outTime.getTime()){
 		 		window.alert("开奖时间不能小于截至时间！");
 		 		$("#_outTimeStr").focus(); 				
 				return false;
 			}else if($("#_outTimeStr").val().indexOf("10:00:00")==-1){
 		 		window.alert("开奖时间只能是每天的10:00:00！");
 		 		$("#_outTimeStr").focus(); 				
 				return false;	
 			}		
	 	}
	 	//
	 	if($("#_deliveryType").val()==""){
	 		window.alert("请选择发货类型");
	 		$("#_deliveryType").focus();
	 		return false;
	 	}
	 	//10当前状态:不需要小燕
	 	//11商品名称
	 	if($("#_productName").val()==""){
	 		window.alert("商品名称:不能为空！");
	 		$("#_productName").focus();
	 		return false;
	 	}	 	
	 	//12商品价格
	 	if($("#_productPrice").val()==""){
	 		window.alert("商品价格:不能为空！");
	 		$("#_productPrice").focus();
	 		return false;
	 	}else{
	 		var regFloat = new RegExp("^[1-9][0-9]*\\.?\\d{0,2}$");
	 	     if(! regFloat.test($("#_productPrice").val())){  
	 	 		window.alert("商品价格:请输入正确的商品价格(最多两位小数)！");
		 		$("#_productPrice").focus();
		 		return false; 
	 	     } 
	 	} 	
	 	//13众筹商品详情
	 	if( bytelength(UE.getEditor('_productDetails').getContent())>10000 ){
	 		window.alert("众筹商品详情:不能大于10000字节！");
	 		$("#_productDetails").focus();
	 		return false;
	 	}
	 	//14众筹商品规格
	 	if( bytelength(UE.getEditor('_productSpecifications').getContent())>4000 ){
	 		window.alert("众筹商品规格:不能大于4000字节！");
	 		$("#_productSpecifications").focus();
	 		return false;
	 	}	 	
	 	//15奖品数量
	 	if($("#_prizeAmount").val()==""  ){
	 		window.alert("奖品数量:不能为空！");
	 		$("#_prizeAmount").focus();
	 		return false;
	 	}else{
 	         var obj = document.getElementById("_prizeAmount");
 	         if(! isNumCheck(obj.value)){
 	        	window.alert("奖品数量:请输正确数值!");
 		 		$("#_prizeAmount").focus();
 		 		return false; 
 	         }  
	 	}
	 	//15奖品类型值
	 	if($("#_prizeType").val()==""  ){
	 		window.alert("奖品类型值:不能为空！");
	 		$("#_prizeType").focus();
	 		return false;
	 	}
	
	 	//16.众筹图标不能为空
	 	if("${! empty raise}"=="true"){
	 		//当"众筹"为克隆是,不用进行图片校验
	 	}else if(""==fileExt){
	 		alert("众筹图标:不能为空!");
	 		return false; 
	 	}else{
	        if(!checkFileExt(fileExt)){
	        	alert("图片的格式只能是jpg|png|gif");
	        	return false; 
	        }	 		
	 	}
	 	//17.乐豆总是不用校验
	 	//18.id不用校验
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
		function bytelength(str){
			　　var byteLen=0,len=str.length;
			　　if(str){
			　　　　for(var i=0; i<len; i++){
			　　　　　　if(str.charCodeAt(i)>255){
			　　　　　　　　byteLen += 2;
			　　　　　　}
			　　　　　　else{
			　　　　　　　　byteLen++;
			　　　　　　}
			　　　　}
			　　　　return byteLen;
			　　}
			　　else{
			　　　　return 0;
			　　}
		}
	</script>
</head>
<body>
<form action="${pageContext.request.contextPath}/raise/raiseAddDo" method="post" name="form1" id="form1" onsubmit="return onSubmitAction();" enctype="multipart/form-data">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="1" background="${pageContext.request.contextPath}/images/wsoa_window_002.gif"></td>
    <td background="${pageContext.request.contextPath}/images/wsoa_window_002.gif">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		  <tr>
			<td width="10" align="center" background="${pageContext.request.contextPath}/images/wsoa_window_002.gif"><img src="${pageContext.request.contextPath}/images/center_19.gif"></td>
			<td align="left" background="${pageContext.request.contextPath}/images/wsoa_window_002.gif"><span class="tfont12"><label id="functiontitle"><strong>添加众筹活动</strong> </label></td>
			<td align="right"> <a  href="javascript:history.go(-1);"><strong>返回列表</strong></a></td>
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
							<td align="right" class="table5 bgcolor5" width="15%">众筹名称：&nbsp;</td>
							<td align="left" class="table5" colspan="2">&nbsp;<input name="raiseName" class="input" id="_raiseName"  style="width:50%" value="${raise.raiseName}" /></td>
						</tr>
						<tr>
							<td align="right" class="table5 bgcolor5" width="15%">当前期数：&nbsp;</td>
							<td align="left" class="table5" colspan="2">&nbsp;<input name="currentPeriod" class="input" id="_currentPeriod"  style="width:50%" value="${raise.currentPeriod}" /></td>
						</tr>
						<tr>
							<td align="right" class="table5 bgcolor5" width="15%">当期号数：&nbsp;</td>
							<td align="left" class="table5" colspan="2">&nbsp;<input name="currentNum" class="input" id="_currentNum"  style="width:50%" value="${raise.currentNum}" /></td>
						</tr>
						<!-- 
							<tr>
								<td align="right" class="table5 bgcolor5" width="15%">总份额数：&nbsp;</td>
								<td align="left" class="table5" colspan="2">&nbsp;<input name="totalShare" class="input" id="_totalShare"  style="width:50%" value="" /></td>
							</tr>						
						 -->
						 <input type="hidden" name="totalShare" class="input" id="_totalShare"  style="width:50%" value="1000000000" />
						<tr>
							<td align="right" class="table5 bgcolor5" width="15%">每人最多可购买份数：&nbsp;</td>
							<td align="left" class="table5" colspan="2">&nbsp;<input name="maxSare" class="input" id="_maxSare"  style="width:50%" value="${raise.maxSare}" /></td>
						</tr>
						<tr>
							<td align="right" class="table5 bgcolor5" width="15%">每份所需乐豆数：&nbsp;</td>
							<td align="left" class="table5" colspan="2">&nbsp;<input name="eachTotal" class="input" id="_eachTotal"  style="width:50%" value="${raise.eachTotal}" /></td>
						</tr>
						<tr>
							<td align="right" class="table5 bgcolor5" width="15%">开始时间：&nbsp;</td>
							<td align="left" class="table5" colspan="2">
								&nbsp;<input name="startDateStr" id="_startDateStr"  style="width:50%"  value="${raise.startDateStr}" onfocus="WdatePicker({skin:'whyGreen',startDate:'%y-%M-%d %H:%m:00',dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<td align="right" class="table5 bgcolor5" width="15%">截至时间：&nbsp;</td>
							<td align="left" class="table5" colspan="2">
								&nbsp;<input name="endDateStr" id="_endDateStr"  style="width:50%"  value="${raise.endDateStr}" onfocus="WdatePicker({skin:'whyGreen',startDate:'%y-%M-%d 09:59:00',dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<td align="right" class="table5 bgcolor5" width="15%">计划开奖时间：&nbsp;</td>
							<td align="left" class="table5" colspan="2">
								&nbsp;<input name="outTimeStr" id="_outTimeStr"  style="width:50%"  value="${raise.outTimeStr}" onfocus="WdatePicker({skin:'whyGreen',startDate:'%y-%M-%d 10:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<td align="right" class="table5 bgcolor5" width="15%">发货类型：&nbsp;</td>
							<td align="left" class="table5" colspan="2">
								<select name="deliveryType" class="input" id="_deliveryType"  style="width:50.3%;margin-left:4px;">
									<option value="" >---请选择---</option>
									<option value="0" <c:if test="${raise.deliveryType == '0' }">selected="selected"</c:if>>EMS发货</option>
									<option value="1" <c:if test="${raise.deliveryType == '1' }">selected="selected"</c:if>>京东发货</option>
								</select>
							</td>
						</tr>
						<tr>
							<td align="right" class="table5 bgcolor5" width="15%">当前状态：&nbsp;</td>
							<td align="left" class="table5" colspan="2">
								<select name="currentStatus" class="input" id="_currentStatus"  style="width:50.3%;margin-left:4px;">
									<option value="0" <c:if test="${raise.currentStatus == '0' }">selected="selected"</c:if> >即将开始</option>
									<option value="1" <c:if test="${raise.currentStatus == '1' }">selected="selected"</c:if>>正在众筹</option>
									<option value="2" <c:if test="${raise.currentStatus == '2' }">selected="selected"</c:if>>已截止待开奖</option>
									<option value="3" <c:if test="${raise.currentStatus == '3' }">selected="selected"</c:if>>已完成</option>
								</select>
							</td>
						</tr>
						<tr>
							<td align="right" class="table5 bgcolor5" width="15%">商品名称：&nbsp;</td>
							<td align="left" class="table5" colspan="2">&nbsp;<input name="productName" class="input" id="_productName"  style="width:50%" value="${raise.productName}" /></td>
						</tr>
						<tr>
							<td align="right" class="table5 bgcolor5" width="15%">商品价格：&nbsp;</td>
							<td align="left" class="table5" colspan="2">&nbsp;<input name="productPrice" class="input" id="_productPrice"  style="width:50%" value="${raise.productPrice}" /></td>
						</tr>
						<tr>
							<td align="right" class="table5 bgcolor5" width="15%">奖品类型值：&nbsp;</td>
							<td align="left" class="table5" colspan="2">&nbsp;<input name="prizeType" class="input" id="_prizeType" style="width:50%" value="${raise.prizeType}" />
							<span>奖品类型值参数（type）由酷码提供</span>
							</td>
						</tr>
						<tr>
							<td align="right" class="table5 bgcolor5" width="15%">奖品数量：&nbsp;</td>
							<td align="left" class="table5" colspan="2">&nbsp;<input name="prizeAmount" class="input" id="_prizeAmount"  style="width:50%" value="${raise.prizeAmount}" /></td>
						</tr>						
						<tr>
							<td align="right" class="table5 bgcolor5" width="15%">众筹商品详情：&nbsp;</td>
							<td align="left" class="table5" colspan="2">
						    <!-- 加载编辑器的容器 -->
						    <script id="_productDetails" name="productDetails" type="text/plain">${raise.productDetails}</script>
						    <script type="text/javascript">
						        var productDetails = UE.getEditor('_productDetails',{    
					                //关闭字数统计  
					                wordCount:false,  
					                //关闭elementPath  
					                elementPathEnabled:false,  
					                //默认的编辑区域高度  
					                initialFrameHeight:150,
					                initialFrameWidth:900,
					                //防止div转变成p标签
					                allowDivTransToP: false
					                //更多其他参数，请参考ueditor.config.js中的配置项  
					            });   
						    </script>							
							</td>
						</tr>
						<tr>
							<td align="right" class="table5 bgcolor5" width="15%">众筹商品规格：&nbsp;</td>
							<td align="left" class="table5" colspan="2" width="550">
							    <!-- 加载编辑器的容器 -->
							    <script id="_productSpecifications" name="productSpecifications" type="text/plain" style="width:100%;height:500px;">${raise.productSpecifications}</script>	
							    <!-- 实例化编辑器 -->
							    <script type="text/javascript">
 						            var productSpecifications = UE.getEditor('_productSpecifications',{     
						                //关闭字数统计  
						                wordCount:false,  
						                //关闭elementPath  
						                elementPathEnabled:false,  
						                //默认的编辑区域高度  
						                initialFrameHeight:150,
						                initialFrameWidth:900,
						                //防止div转变成p标签
						                allowDivTransToP: false
						                //更多其他参数，请参考ueditor.config.js中的配置项  
						            });   
							    </script>
							</td>
						</tr>						
						<tr>
							<td align="right" class="table5 bgcolor5" width="15%">众筹图标：&nbsp;</td>
							<td align="left" class="table5">&nbsp;
								<!-- onchange="ajaxFileUpload(this)" -->
								<input type="file" name="file" id="_file" multiple="multiple" style="width:150px;" onchange="javascript:setImagePreview();">
								<input type="hidden" name="raiseIcon" id="_raiseIcon" value="${raise.raiseIcon}"/>
							</td>							
							<td>
								<div style="width:100px; height:100px; overflow:hidden; border:1px solid;">      
					                <div id="imgDiv" >
	                             		<img id="preview" src="${pageContext.request.contextPath}/${raise.raiseIcon}" width="100" height="100" style="display: block;" />
	                        		</div>
								</div>建议：预览图像素约为1980px × 450px。										
							</td>
						</tr>																						
					</table>
				</td>
			</tr>		
		<tr>
			<td><table  border="0" style="width:100%">			 		
				<tr>
					<td height="30" align="center" valign="bottom">
						<input type="submit" value="保存(s)"class="button_03"  />
						&nbsp;	
						<input type="reset" class='button_03' id="cancel" name="cancel" value="重置" />
						<!--input type="button" value="复合表单异步提交失败" onclick="formAjax()"    /--->
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
	<!-- 上传图片并预览 -->
	<script type="text/javascript">
			var fileExt = "";
			var extArr = ["jpg","png","gif"];
            //下面用于图片上传预览功能
            function setImagePreview(avalue) {
            	//获取文件的扩展名
            	var fileName = document.getElementById("_file").value+"";
                var lastIndex  = fileName.lastIndexOf(".");
                    fileExt = fileName.substring(lastIndex+1);
                if(!checkFileExt(fileExt)){//如果图片格式校验格式不通过
                	alert("图片的格式只能是jpg|png|gif");
                	document.getElementById("_file").value="";
                	return;
                }
				//input
                var docObj = document.getElementById("_file");
				//img
                var imgObjPreview = document.getElementById("preview");
                //div
                var divs = document.getElementById("imgDiv");
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
                $("#_raiseIcon").val("");
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
            //复合表单异步提交
            function formAjax(){
            	if( !onSubmitAction() ){
            		return ;
            	}else{
                    var formParam = $("#form1").serialize();//序列化表格内容为字符串  
                    $.ajax({  
                        type:'post',      
                        url:'${pageContext.request.contextPath}/raise/raiseAddDo',  
                        data:formParam,  
                        cache:false,  
                        dataType:'json',  
                        success:function(data){  
                        	alert("成功");
                        },
                        error:function(data){  
                        	alert("失败");
                        }
                    });            		
            	}
            }
    </script>	
</body>
</html>
