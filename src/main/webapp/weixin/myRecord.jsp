<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ include file="public.fm" %>		
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />

		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no,"/>
	
		<title>小豆夺宝</title>
		<link rel="stylesheet" href="${resourcesPath}/css/reset.css">
		<link rel="stylesheet" href="${resourcesPath}/css/app.css">
	</head>

	<body>
		<!-- 当前页码 -->
		<input id="pageNum" type="hidden" value="1">
		<!-- 总页数 -->
		<input id="totalPage" type="hidden" value="${totalPage}">
		<div class="header">
			<span class="wb_arrow" onclick="javascript:goback()"></span>
			<span>小豆夺宝</span>
			<a href="javascript:toScoreStrategy()" class="gl-ico">
				<span class="circle-font">
         			<i>?</i>
    			</span>攻略</a>
		</div>
		<div class="flex">
			<div class="forpage">
			<c:forEach items="${list}" var="list" varStatus="status">
				<div class="my_crowd">
					<div class="my_crowd_list flex-item-box">
						<div class="my_crowd_left">
							<p class="my_crowd_img"><img src="${basePath}/${list.raiseIcon}" /></p>
						</div>
						<div class="my_crowd_right">
							<p class="font-12em">[第${list.currentPeriod}期${list.currentNum}号] ${list.productName} </p>
							<p class="blue mg-bt05">我的抽奖号：${list.luckyNo}</p>
							<p>抽奖结果：
								<span class="orange">
									<c:if test="${list.currentStatus=='1'}">
										活动进行中
									</c:if>
									<c:if test="${list.winStatus==0 && list.currentStatus=='2'}">
										等待开奖
									</c:if>
									<c:if test="${list.winStatus==0 && list.currentStatus=='3'}">
										未中奖
									</c:if>
									<c:if test="${list.winStatus!=0 && (list.currentStatus=='2' || list.currentStatus=='3')}">
										恭喜中奖
									</c:if>
								</span>
							</p>
						</div>
					</div>
					
					<div class="left_bottom bordr-top2 mg-t1 lh-3em mg-t1 mg-t1">	
						<span class="col-999"><fmt:formatDate value="${list.createDate}" type="both" /></span>
							<span id="button_span_${list.orderId }">
								<c:if test="${list.winStatus!=0 && list.deliveryStatus=='no' && (list.currentStatus=='2' || list.currentStatus=='3')}">
									<a href="javascript:getPrize('${list.raiseId }', '${list.orderId }', '${list.userId }', '${list.userName }', '${list.phone }', '${list.deliveryAddress }', '${list.deliveryType }','${list.outTimeStr}')" class="my_crowd_btn  btn-red">
									领奖
									</a>
								</c:if>
								<c:if test="${list.winStatus!=0 && list.deliveryStatus=='0' && (list.currentStatus=='2' || list.currentStatus=='3')}">
									<a href="#" onclick="notifyDelivery('${list.orderId}','${list.raiseId}','${list.userId}')" class="my_crowd_btn btn-orange">
									提醒发货
									</a>
								</c:if>
								<c:if test="${list.deliveryStatus=='1' && (list.currentStatus=='2' || list.currentStatus=='3')}">
									<a href="#" onclick="searchLogisticsByOrderId('${list.orderId}','${list.deliveryType }')" class="my_crowd_btn  btn-green">
									查看物流
									</a>
								</c:if>
							</span>
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
		<!-- 自定义comfirm提示弹窗HTML -->
		<div class="modal-comfirm" style="display:none">
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
		<script src="${resourcesPath}/js/jquery-2.1.4.js?v=122"></script>
		<%-- <script src="${basePath}/js/jquery-1.7.2.js"></script> --%>
		<script src="${basePath}/js/orgindateutil.js"></script>
		
		<script>
		// 滚动到底部加载更多
		window.canLoad = true;
		window.maxScrollY = $(document).height() - $(window).height() - 50;
		$(".forpage").on('scroll touchmove', function(event) {
			
			if(maxScrollY >= maxScrollY && window.canLoad) {
				window.canLoad = false;
				//'.maidarif'为加载数据的父容器
				$('.forpage').addClass('loading-after');
				setTimeout(function() {
					//当前页码
					var pageNum = document.getElementById("pageNum").value;
					//下一页页码
					pageNum = parseInt(pageNum) + 1;
					var totalPage = document.getElementById("totalPage").value;
					if(totalPage==null || totalPage==''){
						$('.forpage').removeClass('loading-after');
						return false;
					}
					if (pageNum > parseInt(totalPage)) {
						$('.forpage').removeClass('loading-after');
						return false;
					}
					$("#pageNum").val(pageNum);
					$.ajax({ 
						url: 'myRecordJson',
						type: "POST",
						data:{"pageNum":pageNum},
						dataType: "json", 
						async:false,
						success: function(data){
								var arr = null;
								if(data!=null){
									arr = data.recordVoList;
								}
		                        if(arr != null && arr.length>0){
		                        	var htmlStr = '';
		                            for (var i = 0; i < arr.length; i++) {
		                            	htmlStr += '<div class="my_crowd">';
		                            	htmlStr += '	<div class="my_crowd_list flex-item-box">';
		                            	htmlStr += '		<div class="my_crowd_left">';
		                            	htmlStr += '			<p class="my_crowd_img"><img src="${basePath}/'+arr[i].raiseIcon+'"/></p>';
		                                htmlStr += '  		</div>';
		                                htmlStr += '		<div class="my_crowd_right">';
		                                htmlStr += '			<p class="font-12em">[第'+arr[i].currentPeriod+'期'+arr[i].currentNum+'号]'+arr[i].productName+'</p>';
		                                htmlStr += '			<p class="blue mg-bt05">我的抽奖号：'+arr[i].luckyNo+'</p>';
		                                htmlStr += '			<p>抽奖结果';
		                                htmlStr += '				<span class="orange">';
		                                
		                                if(arr[i].currentStatus=='1'){
		                                	htmlStr += '活动进行中';
		                                }
		                                if(arr[i].winStatus==0 && arr[i].currentStatus=='2'){
		                                	htmlStr += '等待开奖';
		                                }
										 if(arr[i].winStatus==0 && arr[i].currentStatus=='3'){
					                     	htmlStr += '未中奖';
					                     }
		                                if(arr[i].winStatus!=0 && (arr[i].currentStatus=='2' || arr[i].currentStatus=='3')){
		                                	htmlStr += '恭喜中奖';
		                                }
		                                htmlStr += '				</span>';
		                                htmlStr += '			</p>';
		                                htmlStr += '		</div>';
		                                htmlStr += '	</div>';
		                                htmlStr += '	<div class="left_bottom bordr-top2 mg-t1 lh-3em mg-t1 mg-t1">';
		                                htmlStr += '		<span class="col-999">'+getDateTime(arr[i].createDate,'yyyy-MM-dd HH:mm:ss')+'</span>';
		                                htmlStr += '			<span id="button_span_'+arr[i].orderId+'">'
		                                
										if(arr[i].winStatus!=0 && ((arr[i].deliveryStatus+'')==("no"+'')) && (arr[i].currentStatus=='2' || arr[i].currentStatus=='3')){
											htmlStr += '<a href="javascript:getPrize(\''+arr[i].raiseId+'\',\''+arr[i].orderId+'\',\''+ arr[i].userId+'\',\''+arr[i].nickName+'\',\''+ arr[i].phone+'\',\''+ arr[i].deliveryAddress+'\',\''+arr[i].deliveryType+'\',\''+ arr[i].outTimeStr+'\')" class="my_crowd_btn  btn-red">领奖</a>';
											//htmlStr += '<a href="#" onclick="getPrize()" class="my_crowd_btn  btn-red">领奖</a>';
		                                }
										if(arr[i].winStatus!=0 && arr[i].deliveryStatus=='0' && (arr[i].currentStatus=='2' || arr[i].currentStatus=='3')){
		                                	htmlStr += '<a href="#" onclick="notifyDelivery('+arr[i].orderId+','+arr[i].raiseId+','+arr[i].userId+')" class="my_crowd_btn  btn-orange">提醒发货</a>';
		                                }
		                                if(arr[i].winStatus!=0 && arr[i].deliveryStatus=='1' && (arr[i].currentStatus=='2' || arr[i].currentStatus=='3')){
		                                	htmlStr += '<a href="#" onclick="searchLogisticsByOrderId('+arr[i].orderId+','+arr[i].deliveryType+')" class="my_crowd_btn   btn-green">查看物流</a>';
		                                }
		                               
		                                htmlStr += '             </span>'
		                                htmlStr += '	</div>';
		                                htmlStr += '</div>';
		                            }
		                        }
								
			                    $('.forpage').append(htmlStr).removeClass('loading-after');
			                    window.canLoad = true;
			                    window.maxScrollY = $(document).height() - $(window).height() - 50;
							}
	                    });
				}, 2000)
			};
		});
		
		 //积分攻略
		function toScoreStrategy(){
	        window.location.href="${basePath}/raisewx/scoreStrategy";
	    }
		//查看物流
		function searchLogisticsByOrderId(orderId,deliveryType){
			//查看京东物流
			if(deliveryType == "1"){
				$.ajax({
		    		type: "POST",
		            url: '${pageContext.request.contextPath}/jd/toSearchJdLogistics',
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
		                    alert("查询失败");
		                }
		            },
		            error: function (XMLHttpRequest, textStatus, errorThrown) { 
			            alert("网络异常！"); 
			    	}
		       	});
			}
			//查看EMS物流
			if(deliveryType == "0"){
				window.location.href="${basePath}/raise4wx/logisticsByOrderId?orderId="+orderId;
			}
		}
		//提醒发货
		function notifyDelivery(orderId,raiseId,userId){
			var url = "${basePath}/raise4wx/notify"
			$.ajax({ 
				url: url,
				type: "POST",
				data:{"orderId":orderId,
					  "raiseId":raiseId,
					  "userId":userId},
				dataType: "json", 
				async:false,
				success: function(data){
					var success = data['success'];
					if(success == true){
	 	        		alert("提醒成功");
	 	        	}
	 	        	if(success == false){
	 			    	alert("提醒失败");
	 			    }
				}
			});
		}
		
		function getPrize(raiseId, orderId, userId, nickName, phone, deliveryAddress, deliveryType, outTimeStr){
			
			if(outTimeStr == null){
				alert("参数错误！");
				return;
			}
			
			if(checkIsTimeOut(outTimeStr)){
				alert("已经超过30天规定的领奖时间，无法领取奖品！");
				return;
			}
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
				$("#hidden_raise_id").val(raiseId);
				$("#hidden_order_id").val(orderId);
				$("#hidden_user_id").val(userId);
				$("#label_user_name").html(nickName);
				$("#label_delivery_address").html(deliveryAddress);
				$("#label_phone_number").html(phone);
				$("#modal_comfirm_error").hide();
				$(".modal-comfirm").show();
			}
		}
		
		$(function(){
			$("#close_modal_confirm").click(function(){
				$(".modal-comfirm").hide();
			});
			
			$(".changeADD").click(function(){
				window.location.href = '${pageContext.request.contextPath}'+'/wxFans/findWxFansByOpenid';
			});
			
			$("#submit_get_prize").click(function(){
				if($("#label_user_name").html() == ''
						|| $("#label_delivery_address").html() == ''
						|| $("#label_phone_number").html() == ''){
					$("#modal_comfirm_error").show();
					return;
				}
				
				var raise_id = $("#hidden_raise_id").val();
				var order_id = $("#hidden_order_id").val();
				var user_id = $("#hidden_user_id").val();
				var user_name = $("#label_user_name").html();
				var deliveryAddress = $("#label_delivery_address").html();
				var phone = $("#label_phone_number").html();
				
				$.ajax({
			               type: "POST",
			               url: '${pageContext.request.contextPath}/raisewxOrder/getPrize',
			               data : {
							    "raiseId":raise_id,
								"orderId":order_id,
								"userId":user_id,
								"userName":user_name,
								"deliveryAddress":deliveryAddress,
								"phone":phone
						   },
			               dataType : 'json',
			               async:false,
			               success: function(data){
			                    if(data.resultCode == "10000"){
			                    	$("#button_span_"+order_id).empty();
			                    	$("#button_span_"+order_id).html("<a href='#' onclick='notifyDelivery("+order_id+","+raise_id+","+user_id+")' class='my_crowd_btn btn-orange'>提醒发货</a>");
			                    	$(".modal-comfirm").hide();
			                    }else{
			                    	alert("领取失败，请检查是否重复领取。");
			                    }
			               },
			               error: function (XMLHttpRequest, textStatus, errorThrown) { 
				            	alert("网络异常！"); 
				    	   }
			       });
				
			})
		});
		
		 function goback(){ 
				window.location.href = document.referrer;
		 } 
		 
		 function checkIsTimeOut(outTimeStr){		//检查是否超过领奖时间
		 	var outTime;
			if(outTimeStr != null){
				outTime = Date.parse(new Date(outTimeStr))/1000;
			}else
				return false;
			var nowTime = parseInt(new Date().getTime()/1000, 10);	//当前时间
			var timeTmp = (nowTime - outTime)/(24*60*60);	//计算当前时间与开奖时间相差的天数
			if(timeTmp > 30)
				return true;
			return false;
		}
		</script>
	</body>
</html>