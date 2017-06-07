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

		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">

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
			<span class="wb_arrow" onclick="history.go(-1)"></span>
			<span>参与记录</span>
		</div>
		<div class="flex">
			<div class="my_crowd2">
				<div class="my_crowd_list flex-item-box" style="background: #eef1f5;">
					<div class="my_crowd_left2" style="width:42%;">
						<p>参与时间(时间取值)</p>
					</div>
					<div class="my_crowd2_right">
						<p class="font-12em">用户昵称</p>
					</div>
					<div class="my_crowd2_right">
						<p class="font-12em">众筹商品名称</p>
					</div>
				</div>
			</div>
			<div class="my_crowd2 body" style="margin-bottom: 4rem;">
				<c:forEach items="${list}" var="list" varStatus="status">
						<div class="my_crowd_list flex-item-box">
							<div class="my_crowd_left2">
								<p class="col-999"><fmt:formatDate value="${list.createDate}"  type="date" pattern="yyyy/MM/dd"/></p>
								<p class="col-333"><fmt:formatDate value="${list.createDate}" type="time" timeStyle="default"/>:${list.luckyNo}</p>
								<p class="red">
									><fmt:formatDate value="${list.createDate}"  type="time" pattern="HHmmssSSS"/>${list.luckyNo}
								</p>
								
							</div>
							<div class="my_crowd2_right box">
								<p class="col-333">${list.nickName}</p>
							</div>
							<div class="my_crowd2_right ">
								<p class="col-999 font-15">[第${list.currentPeriod}期${list.currentNum}号]</p>
								<p class="col-000">${list.productName}</p>
							</div>
						</div>
				</c:forEach>
			</div>
		</div>
		<script src="${resourcesPath}/js/jquery-2.1.4.js"></script>
		<%-- <script src="${basePath}/js/jquery-1.7.2.js"></script> --%>
		<script src="${basePath}/js/orgindateutil.js"></script>
		
		<script>
		// 滚动到底部加载更多
		window.canLoad = true;
		window.maxScrollY = $(document).height() - $(window).height() - 50;
		$(".body").on('scroll touchmove', function(event) {
			if(window.scrollY >= maxScrollY && window.canLoad) {
				window.canLoad = false;
				//'.maidarif'为加载数据的父容器
				$('.body').addClass('loading-after');
				setTimeout(function() {
					//当前页码
					var pageNum = document.getElementById("pageNum").value;
					//下一页页码
					pageNum = parseInt(pageNum) + 1;
					var totalPage = document.getElementById("totalPage").value;
					if(totalPage==null || totalPage==''){
						$('.body').removeClass('loading-after');
						return false;
					}
					if (pageNum > parseInt(totalPage)) {
						$('.body').removeClass('loading-after');
						return false;
					}
					$("#pageNum").val(pageNum);
					$.ajax({ 
						url: 'recordJson',
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
		                            	htmlStr += '	<div class="my_crowd_list flex-item-box">';
		                            	htmlStr += '		<div class="my_crowd_left2">';
		                            	htmlStr += '			<p class="col-999">'+getDateTime(arr[i].createDate,'yyyy/MM/dd')+'</p>';
		                            	htmlStr += '			<p class="col-333">'+getDateTime(arr[i].createDate,'HH:mm:ss')+':'+arr[i].luckyNo+'</p>';
		                                htmlStr += '  			<p class="red">>'+getDateTime(arr[i].createDate,'HHmmss')+''+arr[i].luckyNo+'</p>';
		                                htmlStr += '		</div>';
		                                htmlStr += '		<div class="my_crowd2_right box">';
		                                htmlStr += '			<p class="col-333">'+arr[i].nickName+'</p>';
		                                htmlStr += '		</div>';
		                                htmlStr += '		<div class="my_crowd2_right">';
		                                htmlStr += '			<p class="col-999 font-15">[第'+arr[i].currentPeriod+'期]</p>';
		                                htmlStr += '			<p class="col-000">'+arr[i].productName+'</p>';
		                                htmlStr += '		</div>';
		                                htmlStr += '	</div>';
		                            }
		                        }
			                    $('.body').append(htmlStr).removeClass('loading-after');
			                    window.canLoad = true;
			                    window.maxScrollY = $(document).height() - $(window).height() - 50;
							}
	                    });
				}, 2000)
			};
		});
		</script>
	</body>
</html>