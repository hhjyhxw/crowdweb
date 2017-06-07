<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="public.fm" %>	
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
		<link rel="stylesheet" href="${resourcesPath}/css/reset.css">
		<link rel="stylesheet" href="${resourcesPath}/css/app.css">
		<link rel="stylesheet" href="${resourcesPath}/css/swiper.css">
		<script src="${resourcesPath}/js/jquery-2.1.4.js"></script>
		<script src="${resourcesPath}/js/swiper.min.js"></script>
		<style>
			.border-bottoms{
					border-bottom: solid 1px #e5e5e5;
    				height: 39px;
			}
		
		.modal-comfirm2 {
		    position: fixed;
		    z-index: 9999;
		    top: 0;
		    left: 0;
		    right: 0;
		    bottom: 0;
		    background-color: rgba(0, 0, 0, 0.6);
		}
		.modal-comfirm2 .content2 {
		    -webkit-transform: translateX(-50%) translateY(-50%);
		    float: left;
		    width: 80%;
		    background: white;
		    position: fixed;
		    top: 50%;
		    left: 50%;
		    border-radius: 0.3em;
		    text-align: center;
		}
		.modal-comfirm2 .content2 .bordr-top2 {
		     display: flex; 
		    display: -webkit-flex;
		    flex-direction: row;
		    justify-content: flex-start;
		    width: 100%;
		}
		.modal-comfirm2 .content2 .btn-item {
		    width: 50%;
		    height: auto;
		    -webkit-align-items: center;
		    -webkit-justify-content: center;
		    align-items: center;
		    justify-content: center;
		    color: #033333;
		    text-align: center;
		    margin: 1rem 0 0 0;
		}

		.bordr-right {
		    border-right: solid 1px #e5e5e5;
		}
	</style>
	</head>
	<body>
	
	
		<!-- 活动开始时间  -->
		<input id="startDate" type="hidden" value="${data.startDate}">
		<!-- 结束时间 -->
		<input id="endDate" type="hidden" value="${data.endDate}">
		<!-- 活动状态 -->
		<input id="currentStatus" type="hidden" value="${data.currentStatus}">
		<!-- 活动id -->
		<input id="id" type="hidden" value="${data.id}">
		<div class="flex">
		<div class="header">
			<span class="wb_arrow" onclick="javascript:goback()"></span>
			<span>小豆夺宝</span>
			<a href="javascript:toScoreStrategy()" class="gl-ico">
				<span class="circle-font">
         			<i>?</i>
    			</span>攻略</a>
		</div>
		
		<div class="body detail-box">
				<div class="banner">
					 <div class="swiper-container">
     					 <div class="swiper-wrapper">
           					 <div class="swiper-slide"> <img src="${basePath}/${data.raiseIcon}"></div>
        				</div>
       					 <div class="swiper-pagination"></div>
   					 </div>
				</div>
				<div class="detail-tit">
					<c:if test="${data.currentStatus=='0'}">
						<span class="tip live">即将开始</span> 
					 </c:if>
					 <c:if test="${data.currentStatus=='1'}">
						<span class="tip live">进行中</span>
					 </c:if>
					<strong>${data.raiseName }</strong>
				</div>
				<div class="col-999 mg-t1">第${data.currentPeriod }期${data.currentNum }号</div>
				
				<p class="t-time" id="t-time">结束时间：${data.endDate}</p>
				<p class="info-tip" style="text-indent:0;">
				1.当天上午10:00至当晚23:30，第二天7:30至本期开奖前都可以参与本期夺宝，每名用户每场仅限参与一次活动，每次消耗${data.eachLedou }枚乐豆，次日上午10点开奖。<br/>
				2.请中奖者30日内领取奖品，逾期未领，则视为自动放弃。<br/>
				3.若领奖时出现当地京东库存为零，中奖商品自动升级为等价值礼品。
				<%-- 1.每位用户每场夺宝只可参与一次，参与成功后即扣减${data.eachLedou }枚乐豆，开奖时间为次日上午10点。<br/>
				2.请抢中宝物的用户30日内领取奖品，按要求填写正确的收货地址，确认完毕后，我们会尽快给您发货；若逾期未领取，则视为用户自动放弃当期中奖商品。<br/>
				3.若领奖时出现当地京东库存为零，奖品则自动升级为等价值礼品。 --%>
				</p>
				<div class="detail-info tab border-bottoms">
					<nav class="tab-nav border-bottoms">
						<a href="#" class="tab-title active bordr-right" name="tap" id="tab-title_0">商品详情</a>
						<a href="#" class="tab-title " name="tap" id="tab-title_1">规格参数</a>
					</nav>
					<main class="tab-main body">
				<section class="tab-cont " style="display: block;" id="tap_0">
					${data.productDetails}
				</section>
				<section class="tab-cont" id="tap_1">
					<div>
						&nbsp;&nbsp;&nbsp;${data.productSpecifications}
						<%-- <img src="${resourcesPath}/weixin/images/demo2.png"> --%>
					</div>
				</section>
			</main>
				</div>
		</div>
		
		<footer class="footer">
			<div class="footer-main">
				 <div class="item otherrecord">
				 	<label class="ico ico1"></label>
				 	<b>参与记录</b>
				 </div>
				 <div class="item footer-center-btn">
				 	<!-- 灰色按钮 用btn-gray-->
				 	<c:if test="${data.currentStatus=='0'}">
						<a href="#" class="btns btn-gray ">我要夺宝</a>
					 </c:if>
					 <c:if test="${data.currentStatus=='2'}">
						<a href="#" class="btns btn-gray ">我要夺宝</a>
					 </c:if>
				 	<c:if test="${data.currentStatus=='1'}">
						<a href="#" class="btns btn-red ">我要夺宝</a>
					 </c:if>
				 </div>
				 <!-- <div class="item record">
				 	<label class="ico ico2"></label>
				 	<b>参与记录</b>
				 </div> -->
			  </div>
		</footer>
		</div>
		
		
		<!-- 自定义comfirm提示弹窗HTML -->
<div class="modal-comfirm" style="display:none;">
  <div class="content">
  	<p class="mg-t1 showimg"><img src="${resourcesPath}/images/success.png" width="30%"></p>
    <p style="text-align:center" class="font-15em">参与成功</p>
    <p style="text-align:center" class="des orange"></p>
    <div class="bordr-top mg-bt1">
	    <a href="javascript:void(0)" style="width: 100%;" class="btn-item"><span class="blue">确定</span></a>
    </div>
  </div>
</div>
		<!-- 自定义comfirm提示弹窗HTML -->
<div class="modal-comfirm2" id="modal-comfirm2" style="display:none;">
  <div class="content2">
  	<p class="bean-img"><img src="${resourcesPath}/images/bean.png" width="40%"></p>
    <p style="text-align:center">确认消耗<span class="orange">${data.eachLedou}</span>个乐豆</p>
    <p style="text-align:center">参与本次活动</p>
    <div class="bordr-top2 mg-bt1">
	    <a href="javascript:void(0)" class="btn-item bordr-right">否</a>
	    <a href="javascript:hideComfirm2()" class="btn-item"><span class="blue">是</span></a>
    </div>
  </div>
</div>
		
<script type="text/javascript">

	var id = $("#id").val();//'${data.id}';
	//设置每一秒调用一次倒计时函数
	var startDate = getNewDate($("#startDate").val());//'${data.startDate}';
	var endDate = getNewDate($("#endDate").val());//'${data.endDate}';
	var currentStatus = $("#currentStatus").val();// '${data.currentStatus}';
	// 设定活动开始时间
	start_time = startDate.getTime();
	
	if(currentStatus=='0'){
		setInterval("count_down()",1000);
	}
	function count_down(){
		// 获取当前时间
		nowtime = new Date().getTime();
		// 时间差：活动结束时间减去当前时间  
		var leftTime = start_time - nowtime;  
		//定义变量 d,h,m,s保存倒计时的时间
           var d,h,m,s;
           if (leftTime>0) {
               d = Math.floor(leftTime/1000/60/60/24);
               h = Math.floor(leftTime/1000/60/60%24);
               m = Math.floor(leftTime/1000/60%60);
               s = Math.floor(leftTime/1000%60);
               //把天换成小时
               h = d*24+h;
               if(s<10){
               	s='0'+s;
               }
               if(m<10){
                  m='0'+m;
               }
               if(h<10){
                 h='0'+h;
               }
               var times = h+":"+m+":"+s;
               var matchtime ='开始倒计时 '+ times;
               //var t-time = document.getElementById('t-time');
               document.getElementById('t-time').innerHTML=matchtime;
               //$(".t-time").html(matchtime);
               if('00:00:00'==times){
            	   changeStatus(id,currentStatus);
            	   setTimeout(function(){
            		   window.location.href="${basePath}/raisewx/raiseDetail?id="+id;
            	   }, 1000)
               }
           }
           
	}
	
	 //更新活动状态
	 function changeStatus(id,currentStatus){
		$.ajax({ 
			url: "${basePath}/raisewx/changeStatus",
			type: "POST",
			data:{"id":id,"currentStatus":currentStatus},
			async:false,
			success: function(data){
				  console.log('修改成功');
			},
			error : function(data){
				console.log('修改失败');
			}
		});
    }
	 //点击夺宝
	 $(".btn-red").click(function(){
		 if( $(".btns").hasClass('btn-gray')){
			 return;
		 }
		 $(".modal-comfirm2").css("display","block");
	 });
	 //确认弹框 点击 是
	 function hideComfirm2(){
		 //$(".detail-box").addClass('loading-after');
		 $(".banner").addClass('loading-after');
		 $(".modal-comfirm2").hide();
		 setTimeout(function(){
			 toOrder();
  	   }, 500)
	 }
	 //下单
	 function toOrder(){
		    $(".btns").addClass('btn-gray');
			var url =  "${basePath}/raisewxOrder/order";
			 $.ajax({ 
					url: url,
					type: "POST",
					data:{"raiseId":"${data.id}"},
					dataType: "json", 
					async:false,
					success: function(data){
						if(data==null || data==''){
							$(".font-15em").text('');
							$(".des").text("参与失败");
							$(".font-15em").addClass('green');
							$(".showimg").html('<img src="${resourcesPath}/images/failed.png" width="30%">');
							$(".modal-comfirm").show();
							$(".content2").css("display","block");
							$(".modal-comfirm2").css("display","none");
							$(".banner").removeClass('loading-after');
							return;
						}
						if(data.resultCode=='10000'){
							$(".font-15em").text("");
							$(".des").text("参与成功");
							$(".showimg").html('<img src="${resourcesPath}/images/success.png" width="30%">');
							$(".font-15em").removeClass('green').addClass('orange')
							$(".btns").removeClass('btn-red').addClass('btn-gray');
							$(".content2").css("display","block");
							$(".modal-comfirm2").css("display","none");
							$(".modal-comfirm").show();
						}else{
							$(".des").text(data.errorMsg)
							$(".font-15em").text("参与失败");
							$(".font-15em").removeClass('orange').addClass('green');
							$(".showimg").html('<img src="${resourcesPath}/images/failed.png" width="30%">');
							$(".content2").css("display","block");
							$(".modal-comfirm2").css("display","none");
							$(".modal-comfirm").show();
						}
						$(".banner").removeClass('loading-after');
					},
					error : function(data){
						$(".banner").removeClass('loading-after');
						$(".des").text(data.errorMsg)
						$(".font-15em").text("网络异常,请稍后");
						$(".font-15em").removeClass('orange').addClass('green');
						$(".showimg").html('<img src="${resourcesPath}/images/failed.png" width="30%">');
						$(".content2").css("display","block");
						$(".modal-comfirm2").css("display","none");
						$(".modal-comfirm").show();
					}
				});
		 }
	 
	  //切换tab
	  $('#tab-title_0').click(function(){
		 $("#tap_0").show();
		 $("#tap_1").hide();
		 $('#tab-title_0').addClass("active");
		 $('#tab-title_1').removeClass("active");
		 
	 });
	  $('#tab-title_1').click(function(){
		  $("#tap_0").hide();
		  $("#tap_1").show();
		  $('#tab-title_1').addClass("active");
		  $('#tab-title_0').removeClass("active");
	  });
	 //关闭弹窗
	 $('.btn-item').click(function(){
		 $(".modal-comfirm").hide();
		 $(".modal-comfirm2").hide();
	 });
	 
	 //参与记录
	  $('.record').click(function(){
		 window.location.href='${basePath}/raisewxOrder/record?raiseId=${data.id}';
	 });
	 
	  //往期记录记录
	  $('.otherrecord').click(function(){
		 window.location.href='${basePath}/raisewx/pastList';
	 });
	 

		 //积分攻略
		function toScoreStrategy(){
	        window.location.href="${basePath}/raisewx/scoreStrategy";
	    }
		 
		 
		//将字符串转换为js的时间对象，  字符串格式yyyyMMddHHssmm     
		/* function stringToJsTime(time) {     
		    var y = time.substring(0,4);     
		    var m = time.substring(4,6)-1;     
		    var d = time.substring(6,8);     
		    var h = time.substring(8,10);     
		    var mm = time.substring(10,12);     
		    var ss = time.substring(12,14);     
		    var date = new Date(y,m,d,h,mm,ss,0);     
		    return date;     
		}  
 		*/	
 		/*ios 时间兼容性问题解决*/	
 		function getNewDate(date){
	 		var arr = date.split(/[- : \/]/);
	 		date = new Date(arr[0], arr[1]-1, arr[2], arr[3], arr[4], arr[5]);
	 		document.write(date);
	 		return date;
 		}

		//将字符串转换为js的时间对象，  字符串格式yyyy-MM-dd HH:ss:mm     
		function stringToJsTime(time) { 
			time = time +"";
		    var y = time.substring(0,4);     
		    var m = time.substring(6,8)-1;     
		    var d = time.substring(9,11);     
		    var h = time.substring(13,15);     
		    var mm = time.substring(17,19);     
		    var ss = time.substring(21,23);   
		    //new Date(y+"/"+);
		    var date = new Date(y,m,d,h,mm,ss,0);     
		    return date;     
		}  
		 
		function goback(){ 
			window.location.href = document.referrer;
		} 
	 </script>	 
	</body>

</html>