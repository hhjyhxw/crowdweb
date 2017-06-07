<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ include file="public.fm" %>	
<!DOCTYPE html>
<html class="flex-layout">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta http-equiv="Expires" CONTENT="0">
		<meta http-equiv="Cache-Control" CONTENT="no-cache">
		<meta http-equiv="Pragma" CONTENT="no-cache">
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">

		<title>小豆夺宝</title>
		<link rel="stylesheet" href="${resourcesPath}/css/reset.css">
		<link rel="stylesheet" href="${resourcesPath}/css/app.css">
		<%-- <script src="${basePath}/weixin/js/jquery-2.1.4.js"></script> --%>
		<script src="${basePath}/js/jquery-1.7.2.js"></script>
		
	</head>

	<body>
		<!-- 当前页码 -->
		<input id="pageNum" type="hidden" value="1">
		<!-- 总页数 活动列表只取一页 -->
		<input id="totalPage" type="hidden" value="1">
		<div class="flex">
			<div class="header">
				<span class="wb_arrow" onclick="javascript:goback()"></span>
				<span>小豆夺宝</span>
				<a href="javascript:toScoreStrategy()" class="gl-ico">
					<span class="circle-font">
	         			<i>?</i>
	    			</span>攻略</a>
			</div>
		<main class="body">
			<div class="good-list">
			 <c:forEach items="${list}" var="list" varStatus="status">
				<div class="wrap">
					<div class="goods">
						<a class="good-a" href="${basePath}/raisewx/raiseDetail?id=${list.id}">
							<div>
								 <span class="item-tit">${list.currentPeriod}期<br/>${list.currentNum}号 
			      				<!-- <label class="arrow-down">
							    向下的三角
								</label> --></span>
								
								<c:if test="${list.currentStatus=='3'}"><span class="time" id="${list.id}">已开奖</span></c:if>
								<c:if test="${list.currentStatus!='3'}"><span class="time" id="${list.id}"></span></c:if>
							</div>
							<div class="img">
								<c:if test="${list.currentStatus=='0'}"><span class="status status_orange"><i>即将开始</i></span></c:if>
								<c:if test="${list.currentStatus=='1'}"><span class="status status_green"><i>进行中</i></span></c:if>
								<c:if test="${list.currentStatus=='3'}"><span class="status status_red"><i>活动结束</i></span></c:if>
								<c:if test="${list.currentStatus=='2'}"><span class="status status_red"><i>等待开奖</i></span></c:if>
								
									<img src="${basePath}/${list.raiseIcon}" alt="商品图片">
								
								<c:if test="${list.currentStatus=='0'}">
									<div class="open-time" style="width:100%;text-align: center;"><fmt:formatDate value="${list.startDate}" pattern="yyyy-MM-dd HH:mm" type="both" /> 活动开始</div>
								</c:if>
								<c:if test="${list.currentStatus=='2' || list.currentStatus=='3'}">
									<div class="open-time" style="width:100%;text-align: center;">开奖时间<fmt:formatDate value="${list.outTime}" pattern="yyyy-MM-dd HH:mm" type="both" /></div>
								</c:if>
							</div>
							<div class="index-padding">
								<h4 class="font-15 col-000">${list.productName }</h4>
								<p class="col-666" style="color:red;">
								</p>
								
								<c:if test="${list.currentStatus=='2' || list.currentStatus=='3'}">
									<p class="result-font"><span>查看结果<i class="wb_arrow_right"></i></span></p>
								</c:if>
							</div>
						</a>
					</div>
				</div>
				</c:forEach>
			</div>
		</main>
		
		<div class="header myrecord" style="height:5rem;line-height:5rem;">
			<span>我的夺宝中心</span>
		</div>
	</div>
		<script>
			// 滚动到底部加载更多
			window.canLoad = true;
			window.maxScrollY = $(document).height() - $(window).height() - 50;
			$(".body").on('scroll touchmove', function(event) {
				if(window.scrollY >= maxScrollY && window.canLoad) {
					window.canLoad = false;
					//'.maidarif'为加载数据的父容器
					$('.body .good-list').addClass('loading-after');
					setTimeout(function() {
						//当前页码
						var pageNum = document.getElementById("pageNum").value;
						//下一页页码
						pageNum = parseInt(pageNum) + 1;
						var totalPage = document.getElementById("totalPage").value;
						if(totalPage==null || totalPage==''){
							$('.body .good-list').removeClass('loading-after');
							return false;
						}
						if (pageNum > parseInt(totalPage)) {
							$('.body .good-list').removeClass('loading-after');
							return false;
						}
						$("#pageNum").val(pageNum);
						$.ajax({ 
							url: 'raiseCenterJson',
							type: "POST",
							data:{"pageNum":pageNum},
							dataType: "json", 
							async:false,
							success: function(data){
								var arr = null;
								if(data!=null){
									arr = data.raiseList
								}
		                        if(arr != null && arr.length>0){
		                        	var htmlStr = '';
		                            for (var i = 0; i < arr.length; i++) {
		                            	htmlStr += '	<div class="wrap">';
		                            	htmlStr += '	<div class="goods">';
		                            	htmlStr += '		<a class="good-a" href="${basePath}/raisewx/raiseDetail?id='+arr[i].id+'">';
		                            	htmlStr += '			<div>';
		                            	htmlStr += '<span class="item-tit">'+arr[i].currentPeriod+'期<br/>'+arr[i].currentNum+'号';
		                                htmlStr += '						</span>';
		                                if(arr[i].currentStatus=='3'){
		                                	htmlStr += '<span class="time" id="'+arr[i].id+'">已开奖</span>';
		                                }else{
		                                	htmlStr += '<span class="time" id="'+arr[i].id+'"></span>';
		                                }
		                        		htmlStr += '</div>';
		                        		htmlStr += '<div class="img">';
		                        		
		                        		if(arr[i].currentStatus=='0'){
			                                	htmlStr += '<span class="status status_orange"><i>即将开始</i></span>';
		                                }else if(arr[i].currentStatus=='1'){
		                                	htmlStr += '<span class="status status_green"><i>进行中</i></span>';
		                                }else if(arr[i].currentStatus=='2'){
		                                	htmlStr += '<span class="status status_red"><i>等待开奖</i></span>';
		                                }else{
		                                	htmlStr += '<span class="status status_red"><i>活动结束</i></span>';
		                                }
		                        		
		                        		if(arr[i].raiseIcon !=null && arr[i].raiseIcon !='' ){
		                        			htmlStr += '<img src="${basePath}/'+arr[i].raiseIcon+'" alt="商品图片">';
		                                }else{
		                                	htmlStr += '<img src="" alt="商品图片">';
		                                }
		                        	                        		
	                        		   if(arr[i].currentStatus=='0'){
		                                	htmlStr += '<div class="open-time" style="width:100%;">'+getDateTime(arr[i].outTime,'yyyy-MM-dd HH:mm')+'活动开始</div>';
		                               }else{
		                            	   htmlStr += '<div class="open-time" style="width:100%;">开奖时间 '+getDateTime(arr[i].outTime,'yyyy-MM-dd HH:mm')+'</div>';
		                               }
	                        		   htmlStr += '</div>';
	                				   htmlStr += '<div class="index-padding">';
	                				   htmlStr += '<h4 class="font-15 col-000">'+arr[i].productName+'</h4>'
                					   htmlStr += '<p class="col-666" style="color:red;">'
                					   htmlStr += '</p>'
                					  
                					   if(arr[i].currentStatus=='2' || arr[i].currentStatus=='3'){
                						   htmlStr += '<p class="result-font"><span>查看结果<i class="wb_arrow_right"></i></span></p>';
   		                               }
                					    htmlStr += '</div>';
            							htmlStr += '</a>';
            							htmlStr += '</div>';
            							htmlStr += '</div>';
		                            }
		                        }
			                        $('.body .good-list').append(htmlStr).removeClass('loading-after');
			                        window.canLoad = true;
			                        window.maxScrollY = $(document).height() - $(window).height() - 50;
								}
		                    });
					}, 2000)
				};
			});
		</script>
		
		
 <script type="text/javascript">
 
	//设置每一秒调用一次倒计时函数
	setInterval("count_down()",1000);
	var data = JSON.parse('${jsonlist}');
	function count_down(){
		if(data!=null){
			for (var i = 0; i< data.length; i++) {
				if(data[i].currentStatus=='3' || data[i].currentStatus=='0'){
					continue;
				}
				if(data[i].outTime==null || data[i].outTime==''){
					continue;
				}
				
				// 设定活动结束结束时间
				var time_end = new Date(data[i].outTime);  
				time_end = time_end.getTime();
				// 获取当前时间
				var time_now = new Date().getTime(); 
				// 时间差：活动结束时间减去当前时间  
				var leftTime = time_end - time_now;  
				
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
	                var matchtime ='<label>'+ h+":"+m+":"+s+'</label>';
	                document.getElementById(data[i].id).innerHTML=matchtime;
	            }else if(leftTime==0){
	            	//更新为正在众筹
	                changeStatus(data[i].id);
	            	document.getElementById(data[i].id).innerHTML='进行中';
	            }
			}
		}
	}
	
	 //更新活动状态
	 function changeStatus(id){
        
		$.ajax({ 
			url: "${basePath}/raisewx/changeStatus",
			type: "POST",
			data:{"id":id,"currentStatus":"1"},
			async:false,
			success: function(data){
				
			},
			error : function(data){
				
			}
		});
    }
	 
	 //
	 function getDateTime(date,fomat){
		 
		 var myDate = new Date(date);
		 myDate.getYear();        //获取当前年份(2位)
		 myDate.getFullYear();    //获取完整的年份(4位,1970-????)
		 myDate.getMonth();       //获取当前月份(0-11,0代表1月)
		 myDate.getDate();        //获取当前日(1-31)
		 myDate.getDay();         //获取当前星期X(0-6,0代表星期天)
		 myDate.getTime();        //获取当前时间(从1970.1.1开始的毫秒数)
		 myDate.getHours();       //获取当前小时数(0-23)
		 myDate.getMinutes();     //获取当前分钟数(0-59)
		 myDate.getSeconds();     //获取当前秒数(0-59)
		 myDate.getMilliseconds();    //获取当前毫秒数(0-999)
		 myDate.toLocaleDateString();     //获取当前日期
		 var mytime=myDate.toLocaleTimeString();     //获取当前时间
		 myDate.toLocaleString( );        //获取日期与时间
		
		 if(fomat=='yyyy-MM-dd HH:mm'){
			 return myDate.getFullYear()+"-"+ (myDate.getMonth()+1)+"-"+myDate.getDate()+" "
			 +myDate.getHours()+":"+ myDate.getMinutes();
		 }
		 if(fomat=='yyyy-MM-dd HH:mm:ss'){
			 var s = myDate.getMilliseconds();
			 if(s<10){
				 s+='0'+s;
			 }
			 return myDate.getFullYear()+"-"+ (myDate.getMonth()+1)+"-"+myDate.getDate()+" "
			 +myDate.getHours()+":"+ myDate.getMinutes()+":"+s;
		 }
		 if(fomat=='h：m：s'){
			 return myDate.getHours()+":"+ myDate.getMinutes()+":"+myDate.getMilliseconds();
		 }
		 if(fomat=='mm-dd hh:mm:ss'){
			 return  (myDate.getMonth()+1) +"月"+ myDate.getDate()+"日 "+ myDate.getHours()+""+ myDate.getMinutes()+":"+myDate.getMilliseconds();
		 }
		 return (myDate.getMonth()+1) +"-"+ myDate.getDate()+" "+ myDate.getHours()+""+ myDate.getMinutes()+":"+myDate.getMilliseconds();
     }
	 
	 //积分攻略
	 function toScoreStrategy(){
        window.location.href="${basePath}/raisewx/scoreStrategy";
    }
	 
	//我的夺宝中心
	  $('.myrecord').click(function(){
		 window.location.href='${basePath}/raisewxOrder/myRecord';
	 });
	 
	 function goback(){ 
			window.location.href = document.referrer;
	 } 
   </script>
	</body>

</html>