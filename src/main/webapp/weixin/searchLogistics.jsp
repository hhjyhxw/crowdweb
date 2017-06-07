<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="public.fm" %>	
<%-- <%
      String path=request.getContextPath();
      String basePath=request.getScheme() + "://" 
      + request.getServerName() + ":" + request.getServerPort() 
      + path +"/";
%>	 --%>	
<!DOCTYPE html>
<html class="flex-layout">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />

		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">

		<title></title>
		<link rel="stylesheet" href="${resourcesPath}/css/reset.css">
		<link rel="stylesheet" href="${resourcesPath}/css/app.css">
		<link rel="stylesheet" href="${resourcesPath}/css/swiper.css">
		<script src="${resourcesPath}/js/swiper.min.js"></script>
	</head>
<script type="text/javascript">
	function turnBack(){
		window.history.go(-1);
	}

</script>
	<body>
		<div class="flex">
			<div class="header">
				<span class="wb_arrow" onclick="turnBack()"></span>
				<span>物流详情</span>
				<a href="javascript:;" onclick="turnBack()" class="gl-ico">
					<img src="${basePath}/weixin/images/home.png" width="60%">
				</a>
			</div>

			<div class=" body">
				<div class="carousel">
					<div class="userInfo wl">
						<img src="${basePath}/weixin/images/ems.png" style="max-width:100%">
						<a class="user">
						<c:if test="${ems_no == null}">
							<p class="name"><span class="col-999">快递单号：暂无</span></p>
							<p class="name"><span class="col-999">承运人：暂无</span></p>
						</c:if>
						<c:if test="${ems_no != null}">
							<p class="name"><span class="col-999">快递单号：${ems_no}</span></p>
							<p class="name"><span class="col-999">承运人：EMS</span></p>
						</c:if>
						</a>
					</div>
					<c:if test="${vipTrackInfoVos != null}">
					<div class="express">
						<ul>
							<!-- <li class="flex-item-box active">
								<div class="circle"></div>
								<div class="conten">
									<p>已签收，感谢使用顺丰快递</p>
									<p>2017-4-7 10:55:52</p>
								</div>
							</li> -->
							<c:forEach items="${vipTrackInfoVos}" var="ems" varStatus="status">
							<li <c:if test="${status.index==0 }">class="flex-item-box active"</c:if><c:if test="${status.index!=0 }">class="flex-item-box nomal"</c:if>>
								<div class="circle"></div>
								<div class="conten">
									<p>${ems.address}&nbsp;&nbsp;&nbsp;&nbsp;${ems.status_p}</p>
									<p>${ems.date}</p>
								</div>
							</li>
							</c:forEach>
						</ul>
					</div>
					</c:if>
					<!-- 无订单记录显示 -->
					<c:if test="${vipTrackInfoVos == null}">
					<div style="float: left; width: 100%; text-align: center; margin-top: 1rem;">
						<%-- <img src="<%=basePath%>jsp/weixin/zlMember/lbs/img/comment-empty.png" style=" width:25%;"> --%>
						<p style=" font-size: 1em; padding: 0.5em 0; color: #333;">暂无相关信息</p>
					</div>
					</c:if>
				</div>

			</div>

		</div>
	
	</body>

</html>