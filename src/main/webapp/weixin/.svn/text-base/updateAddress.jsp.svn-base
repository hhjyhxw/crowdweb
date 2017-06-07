<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="public.fm" %>	
<%-- <%
      String path=request.getContextPath();
      String basePath=request.getScheme() + "://" 
      + request.getServerName() + ":" + request.getServerPort() 
      + path;
%>	 --%>	
<!DOCTYPE html>
<html class="flex-layout">

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<meta name="format-detection" content="telephone=no">
		<title>个人信息修改</title>
		<link rel="stylesheet" href="${resourcesPath}/css/app_ld.css" />
		<link rel="stylesheet" href="${resourcesPath}/css/reset_ld.css" />
	<style type="text/css">
	.modal-comfirm {
	    position: fixed;
	    z-index: 9999;
	    top: 0;
	    left: 0;
	    right: 0;
	    bottom: 0;
	    background-color: rgba(0, 0, 0, 0.6);
	}
	.modal-comfirm .content {
	    font-size: 1em;
	    padding: 1.5rem;
	    width: 80%;
	    box-sizing: border-box;
	    position: absolute;
	    left: 10%;
	    top: 30%;
	    vertical-align: middle;
	    background-color: #fff;
	    border-radius: 5px;
	}
	.modal-comfirm .content .btn-agree {
	    font-size: 1.1em;
	    display: inline-block;
	    /* width: 48%; */
	    height: 3rem;
	    line-height: 3rem;
	    margin-top: 1.5rem;
	    float: right;
	    text-align: center;
	    background-color: #137bd7;
	    color: #fff;
	    border-radius: 4px;
	}
	</style>
	</head>
	<script src="${resourcesPath}/js/jquery-2.1.4.js"></script>
	<%-- <script type="text/javascript" src="${resourcesPath}/js/date/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="${resourcesPath}/js/date/date.js"></script>
	<script type="text/javascript" src="${resourcesPath}/js/date/iscroll.js"></script>
	<link rel="stylesheet" href="${resourcesPath}/js/date/date-style.css" /> --%>
	<!-- <script type="text/javascript">
		$(function() {
			$('#birthday').date();
		});
	</script> -->
	<script type="text/javascript">
	function save(){
		if(!checkParam()){
			return false;
		}
		$.ajax({
			url : "${basePath}/wxFans/updateWxFansAddress",
			type: "post",
		    dataType: "html",
		    data: $('#actionForm').serialize(),
			success : function (data) {	
				var obj = JSON.parse(data);      
			    var success = obj['resultType'];
			    var openid = obj['openid'];
			    if(success == "success"){
			    	//alert("修改成功");
			    	$("#warningContext").html("修改成功！");
					$("#warningBox").show();
					window.location.href = "${basePath}/raisewxOrder/myRecord?openid="+openid;
			    }
			    if(success == "fail"){
			    	//alert("修改失败");
			    	$("#warningContext").html("修改失败！");
					$("#warningBox").show();
			    }   
			}
		});
		//actionForm.action="${basePath}/wxFans/updateWxFansAddress";
		//actionForm.submit();
	}
	
	function checkParam(){
		var reg=/^\d+$/;
		var reallyName = $("#reallyName").val();
		var sex = $("#sex").val();
		var phone = $("#phone").val();
		var birthday = $("#birthday").val();
		var deliveryAddress = $("#deliveryAddress").val();
		
		if(reallyName == null || reallyName == ""){
     		//alert("请输入姓名！ ");
     		$("#warningContext").html("请输入姓名！");
			$("#warningBox").show();
     		return false;
     	}
		if(phone == null || phone == ""){
     		//alert("手机号不能为空！ ");
     		$("#warningContext").html("手机号不能为空！");
			$("#warningBox").show();
     		return false;
     	}
		if(phone&&phone.search(reg)==-1){
			//alert("手机号码只能为数字，请输入正确的手机号码");
			$("#warningContext").html("手机号码只能为数字！");
			$("#warningBox").show();
			return false;
		}
		if(phone.length != 11){
			//alert("手机号码格式不对，请输入正确的位手机号码");
			$("#warningContext").html("手机号码格式错误！");
			$("#warningBox").show();
			return false;
		}
		/* if(birthday == null || birthday == ""){
     		alert("请选择生日！ ");
     		return false;
     	} */
		if(deliveryAddress == null || deliveryAddress == ""){
     		//alert("请输入收货地址！ ");
     		$("#warningContext").html("请输入收货地址！");
			$("#warningBox").show();
     		return false;
     	}
		return true;
	}
	
	function goBack(){
		window.history.go(-1); 
	}
	function closeWarningBox(){
		$("#warningBox").hide();
	}
	</script>

	<body class="center">
		<div class="banner-top">
	 	<p class="tit"></p>
	    <a href="#" onclick="goBack()" class="fl" style="top: 14px;"><img src="${basePath}/weixin/images/top-arr.png" width="70%"></a>
	    <a href="#" onclick="goBack()" class="fr" style="top: 14px;"><img src="${basePath}/weixin/images/home.png" width="70%"></a>
  </div>
		<div class="flex">
			<div class="content10 body">
				<div class="carousel">
					<div class=" userInfo2">
						<img src="${basePath}/weixin/images/home.png" alt="头像" style="max-width:100%; ">
						<a class="user">
							<p class="name">${wxFans.nickName}</p>
						</a>
					</div>
				</div>
				<form action="" class="form" name="actionForm" id="actionForm">
					<input type="hidden" name="perfectStatus" value="1">
					<input type="hidden" name="id" value="${wxFans.id}">
					<div class="form-area mg-t1">
						<div class="form-item">
							<div class="label">
								<label for="diqu">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</label>
							</div>
							<div class="input">
								<input type="text" id="reallyName" placeholder="姓名" name="reallyName" value="${wxFans.reallyName}">
							</div>
						</div>

						<div class="form-item">
							<div class="label">
								<label for="city">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</label>
							</div>
							<div class="input">
								<select name="sex" id="sex">
									<option value="0" <c:if test="${wxFans.sex == 0}">selected</c:if>>女</option>
									<option value="1" <c:if test="${wxFans.sex == 1}">selected</c:if>>男</option>
								</select>
							</div>
						</div>
						<div class="form-item">
							<div class="label">
								<label for="diqu">手机号码</label>
							</div>
							<div class="input">
								<input type="text" id="phone" placeholder="请输入您的手机号码" name="phone" value="${wxFans.phone}">
							</div>
						</div>

						<%-- <div class="form-item">
							<div class="label">
								<label for="diqu">生&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</label>
							</div>
							<div class="input">
								<p>
									<input type="text" placeholder="请输入您的生日" id="birthday" name="birthday" value="<fmt:formatDate value="${wxFans.birthday }" pattern="yyyy-MM-dd"/>">
								</p>
							</div>
						</div> --%>
					</div>

					<div class="form-area">
						<div class="form-item" style="padding: 1rem 1.4rem 6rem 1.4rem;">
							<div class="label">
								<label for="dizhi">收货地址</label>
							</div>
							<div class="input">
								<textarea class="textarea align-left col-999" style="padding: 10px;" id="deliveryAddress" name="deliveryAddress" placeholder="请输入您的收货地址(省+市+区+街道+小区+门牌号)">${wxFans.deliveryAddress}</textarea>
							</div>
						</div>
					</div>
					<div class="form-btn padding-lr2 mg-b1 ">

						<button type="button" class="form-submit" onclick="save();">提 交</button>
					</div>
				</form>
			</div>
		</div>
		<div id="datePlugin"></div>
		
		<!-- div提示弹窗 -->
		<div id="warningBox" class="modal-comfirm" style="display: none;">
			<div class="content">
				<p style="text-align:center;font-size: 1.1em;" id="warningContext">提示弹窗</p>
			    <a href="javascript:void(0)" class="btn-agree" onclick="closeWarningBox()" style="width: 100%;">确 认</a>
			</div>
		</div>
	</body>

</html>