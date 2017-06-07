<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html class="flex-layout">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />

		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">

		<title>小豆夺宝</title>
		<link rel="stylesheet" href="<%=basePath %>weixin/css/reset.css">
		<link rel="stylesheet" href="<%=basePath %>weixin/css/app.css">
		<link rel="stylesheet" href="<%=basePath %>weixin/css/swiper.css">
		<script src="<%=basePath %>weixin/js/jquery-2.1.4.js"></script>
		
		<style>
			.border-bottoms{
					border-bottom: solid 1px #e5e5e5;
    				height: 39px;
			}
			
			.detail-box .info-tip-content{
				width: 100%;
				line-height: 1.5em;
				padding: 0.8em 0.5em;
				background: #f5f5f5;
				color: #999;
				text-align: left;
				font-size: 1em;
				margin: 1rem 0;
			}
		</style>
	</head>
	<body>
		<div class="flex">
		<div class="header">
			<span class="wb_arrow" onclick="history.go(-1)"></span>
			<span>小豆夺宝</span>
		</div>
		
		<div class=" body detail-box">
				<div class="banner">
					<!-- Swiper -->
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide"><img src="<%=basePath %>${data.raiseIcon}"></div>
        </div>
        <!-- Add Pagination -->
        <div class="swiper-pagination"></div>
    </div>
				</div>
				<div class="detail-tit">
					<span class="tip end">活动结束</span>
					<strong>${data.raiseName }</strong>
				</div>
				<div class="col-999 mg-t1">第${data.currentPeriod }期${data.currentNum }号</div>
				<div class="my_crowd crowd_end">
				<div class="my_crowd_list flex-item-box">
					<div class="my_crowd_left" style="width: 25%;">
						<p class="my_crowd_img "><img src="<%=basePath %>weixin/images/winner-img.png"></p>
					</div>
					<div class="my_crowd_right">
						<%-- <c:if test="${fn:length(data.luckyOnes)==1}">
						<p class="font-28 blue2 mg-t05"><b>185****1382</b> </p>
						</c:if> --%>
						<p class="col-000 mg-t05" style="font-size:20px">活动结束</p>
						<p class="col-000 mg-t05" style="font-size:20px">开奖时间：<br/>${data.outTimeStr }</p>
						<%-- <p class="col-999">本次参与人数: ${data.totalNum }人</p> --%>

					</div>
				</div>
			</div>
				<c:if test="${fn:length(data.luckyOnes)==1}">
				<p class="t-time">幸运号码：${data.luckyOnes[0].luckyNo }
					<c:if test="${fn:length(data.luckyOnes)>0}">
						<span class="fr font-20" id="button_show_luckyOnesDiv">查看<i class="wb_arrow_right arrow-white"></i></b></span>
					</c:if>
				</p>
				</c:if>
				<c:if test="${fn:length(data.luckyOnes)>1 || fn:length(data.luckyOnes)==0}">
				<p class="t-time">幸运用户：${fn:length(data.luckyOnes)}名
					<c:if test="${fn:length(data.luckyOnes)>0}">
						<span class="fr font-20 " id="button_show_luckyOnesDiv">查看<i class="wb_arrow_right arrow-white"></i></b></span>
					</c:if>
				</p>
				</c:if>
				<p class="info-tip-content">
				1.当天上午10:00至当晚23:30，第二天7:30至本期开奖前都可以参与本期夺宝，每名用户每场仅限参与一次活动，每次消耗${data.eachLedou }枚乐豆，次日上午10点开奖。<br/>
				2.请中奖者30日内领取奖品，逾期未领，则视为自动放弃。<br/>
				3.若领奖时出现当地京东库存为零，中奖商品自动升级为等价值礼品。
				<%-- 1.每位用户每场夺宝只可参与一次，参与成功后即扣减${data.eachLedou }枚乐豆，开奖时间为次日上午10点。<br/>
				2.请抢中宝物的用户30日内领取奖品，按要求填写正确的收货地址，确认完毕后，我们会尽快给您发货；若逾期未领取，则视为用户自动放弃当期中奖商品。<br/>
				3.若领奖时出现当地京东库存为零，奖品则自动升级为等价值礼品。 --%>
				</p>
				<div class="detail-info tab border-bottoms">
					<nav class="tab-nav ">
						<a href="#" class="tab-title active bordr-right" name="tap">商品详情</a>
						<a href="#" class="tab-title " name="tap">规格参数</a>
					</nav>
					<main class="tab-main body">
				<section class="tab-cont " style="display: block;" id="tap_0">
					${data.productDetails }
				</section>
				<section class="tab-cont" id="tap_1">
					${data.productSpecifications }
				</section>
			</main>
				</div>
		</div>
		
		<footer class="footer">
			<div class="footer-main">
				 <div class="item otherrecord" style="width:26%">
				 	<label class="ico ico1"></label>
				 	<b>参与记录</b>
				 </div>
				 <div class="item footer-center-btn">
				 	<!-- 灰色按钮 用btn-gray-->
				 	<a href="#" class="btns btn-gray ">我要夺宝</a>
				 </div>
			  </div>
		</footer>
		<!-- 自定义comfirm提示弹窗HTML -->
		
		<div class="modal-comfirm" style="display:none" id="luckyOnesDiv">
			<div class="content" >
				<div class="modal-tit">幸运用户</div>
				<span class="close-x" id="button_hide_luckyOnesDiv"><i>x</i></span>
				<div class="rank-list" style="height: 200px;overflow-y:auto;">
					<table cellspacing="0" cellpadding="0">
						<tbody><tr>
							<th></th>
							<th></th>
						</tr>
						</tbody><tbody>
						<c:forEach items="${data.luckyOnes }" var="luckyOne">
							<tr class="bg-white">
								<td class="col1">
									<span class="num">${luckyOne.luckyNo }</span>
								</td>
								<td>
									${luckyOne.userNick }
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- 自定义comfirm提示弹窗JS -->
		
		<!-- 自定义comfirm提示弹窗HTML -->
		<div class="modal-comfirm" style="display:none" id="prizeDiv">
			<div class="content">
				<div class="modal-tit">提示</div>
				<span class="close-x" id="button_hide_prizeDiv"><i>x</i></span>
					<table cellspacing="0" cellpadding="0" style="margin:10px 15px 10px 15px">
						<tbody>
						<tr>
							<th id=prizeText></th>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- 自定义comfirm提示弹窗JS -->
		
		<!-- 自定义comfirm提示弹窗HTML -->
		<div class="modal-comfirm" style="display:none" id="getPrizeDiv">
			<div class="content address-info">
				<div class="modal-tit">领奖兑换信息确认</div>
				<p class="mg-t1"><span>姓名：</span><label id="label_user_name"></label></p>
				<p><span>地址：</span><label id="label_delivery_address"></label></p>
						<p><span>电话：</span><label id="label_phone_number"></label></p>
				<p id="modal_comfirm_error" style="text-align:center;color:red;display:none">请点击“修改信息”按钮,补全你的信息后进行领奖。</p>
		        <div class="mg-b1"><a href="#" class="changeADD">修改信息</a></div>
				<div class="bordr-top mg-bt1">
					<a href="javascript:void(0)" class="btn-item bordr-right" id="close_modal_confirm">取消</a>
					<a href="javascript:void(0)" class="btn-item" id="submit_get_prize"><span class="blue">确定</span></a>
				</div>
			</div>
			<input type="hidden" id="hidden_raise_id" />
			<input type="hidden" id="hidden_order_id" />
			<input type="hidden" id="hidden_user_id" />
		</div>
		<!-- 自定义comfirm提示弹窗JS -->
		
		<script>
		var raiseId = '${data.id}';
		var userId;
		var orderId;
		var nickName;
		var phone;
		var deliveryAddress;
		var deliveryType = '${data.deliveryType}';
		var outTimeStr = '${data.outTimeStr }';	//开奖时间
		var outTime;
		if(outTimeStr != ''){
			outTime = Date.parse(new Date(outTimeStr))/1000;
		}
		
    $(function () {
        $("[name=tap]").each(function (i) {
            $(this).click(function () {
                $("[name=tap]").addClass("active");
                $(this).addClass("active");
                 $(this).siblings().removeClass("active");
                $("[id^=tap_]").hide();
                $("#tap_" + i).show();
            })
        });
        
        $("#button_show_luckyOnesDiv").click(function(){
        	$("#luckyOnesDiv").show();
        });
        $("#button_hide_luckyOnesDiv").click(function(){
        	$("#luckyOnesDiv").hide();
        });
        $("#button_hide_prizeDiv").click(function(){
        	$("#prizeDiv").hide();
        });
        
        //参与记录
	  	$('.record').click(function(){
		 	window.location.href='<%=basePath%>raisewxOrder/record?raiseId=${data.id}';
	 	});
	 
	  	//往期记录记录
	  	$('.otherrecord').click(function(){
			window.location.href='<%=basePath%>raisewx/pastList';
	 	});
	 	
	 	$("#close_modal_confirm").click(function(){
			$(".modal-comfirm").hide();
		});
		
		$(".changeADD").click(function(){
			window.location.href = '${pageContext.request.contextPath}'+'/wxFans/findWxFansByOpenid';
		});
	 	
	 	$.ajax({
               type: "POST",
               url: "<%=basePath%>raisewx/getUserPrizeInfo",
               data : {
				  "raiseId": '${data.id}'
			   },
               dataType : 'json',
               success: function(data){
                    if(data.resultCode == "10000"){
						if(!data.isAlert){
							if(data.isPrize)
								$("#prizeText").html("恭喜！您的幸运号"+data.luckyNo+"获得本次活动的幸运用户 。<br/><a style='text-decoration:underline;font-size:18px;color:red' href='javascript:getUserInfo()'>领奖！</a>");
	                    	else
	                    		$("#prizeText").html("很遗憾，您未能中奖，您的幸运号是"+data.luckyNo+"。");
	                    	$("#prizeDiv").show();
                    	}
                    }else{
                    	//alert(data.errorMsg);
                    }
               },
               error: function (XMLHttpRequest, textStatus, errorThrown) { 
	            	alert("网络异常！"); 
	    	   }
     	});
     	
     	$("#submit_get_prize").click(function(){
     		if($("#label_user_name").html() == ''
						|| $("#label_delivery_address").html() == ''
						|| $("#label_phone_number").html() == ''){
					$("#modal_comfirm_error").show();
					return;
			}
     		getEMSPrize();
     	});
		
    });
    
    //获取用户信息
    function getUserInfo(){
    		if(outTimeStr == '' || outTime == null){
    			alert("参数错误！");
    			return;
    		}
    		
    		if(checkIsTimeOut()){
    			alert("已经超过30天规定的领奖时间，无法领取奖品！");
    		}else{
    				$.ajax({
			               type: "POST",
			               url: '${pageContext.request.contextPath}/wxFans/findWxFansInRaise',
			               data : {
							    "raiseId":'${data.id}'
						   },
			               dataType : 'json',
			               async:false,
			               success: function(data){
			                    if(data.resultCode == "10000"){
			                    	userId = data.userId;
									orderId = data.orderId;
									nickName = data.nickName;
									phone = data.phone;
									deliveryAddress = data.deliveryAddress;
									getPrize();
			                    }
			               },
			               error: function (XMLHttpRequest, textStatus, errorThrown) { 
				            	alert("网络异常！"); 
				    	   }
			       });
			 }
    }
    
    //EMS领奖
    function getEMSPrize(){
    			$.ajax({
			               type: "POST",
			               url: '${pageContext.request.contextPath}/raisewxOrder/getPrize',
			               data : {
							    "raiseId":raiseId,
								"orderId":orderId,
								"userId":userId,
								"userName":nickName,
								"deliveryAddress":deliveryAddress,
								"phone":phone
						   },
			               dataType : 'json',
			               async:false,
			               success: function(data){
			                    if(data.resultCode == "10000"){
			                    	$("#getPrizeDiv").hide();
			                    	alert("领取成功！");
			                    	
			                    }else{
			                    	alert("领取失败，请检查是否重复领取。");
			                    }
			               },
			               error: function (XMLHttpRequest, textStatus, errorThrown) { 
				            	alert("网络异常！"); 
				    	   }
			       });
    }
    
    //领奖
    function getPrize(){
			//京东发货
			if(deliveryType == "1"){
		       $.ajax({
	               type: "POST",
	               url: '${pageContext.request.contextPath}/jd/toReceiveAward',
	               data : {
						"orderId":orderId,
				   },
	               dataType : 'json',
	               async:false,
	               success: function(data){
	                    if(data.sucess == "true"){
	                    	var url = data.url;
	                    	window.location.href = url;
	                    }else{
	                    	alert("领奖失败："+data.message);
	                    }
	               },
	               error: function (XMLHttpRequest, textStatus, errorThrown) { 
		            	alert("网络异常！"); 
		    	   }
	       		}); 
				
			}
			//EMS发货
			if(deliveryType == "0"){
				$("#prizeDiv").hide();
				$("#label_user_name").html(nickName);
				$("#label_delivery_address").html(deliveryAddress);
				$("#label_phone_number").html(phone);
				$("#modal_comfirm_error").hide();
				$("#getPrizeDiv").show();
			}
		}
		
		function checkIsTimeOut(){		//检查是否超过领奖时间
			var nowTime = parseInt(new Date().getTime()/1000, 10);	//当前时间
			var timeTmp = (nowTime - outTime)/(24*60*60);	//计算当前时间与开奖时间相差的天数
			if(timeTmp > 30)
				return true;
			return false;
		}
</script>
</body>
</html>