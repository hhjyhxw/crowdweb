<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@ include file="public.fm" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
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
		<script type="text/javascript">
			 //积分攻略
			function toScoreStrategy(){
	         	window.location.href="${basePath}/raisewx/scoreStrategy";
	   		}
		 
			//总页数:${p.totalPage}&nbsp;当前页:${p.currPage}&nbsp;页大小:${p.pageSize}&nbsp;总记录:${p.totalNum}
			var currPage = parseInt("${p.currPage}");
			var totalPage = parseInt("${p.totalPage}");
			var pageSize = parseInt("${p.pageSize}");
			//预存储众筹开奖记录数据
			var arizeRecordArr = new Array();
			var index =0;
			$(document).ready(function(){
				//显示或隐藏幸运用户弹窗
				$(".close-x").click( function () { 
					$(".modal-comfirm").toggle();
				});	
				//显示幸运用户弹窗
				$(".check_luck").click( function () {
					if("${raise.luckyNum==0}"=="false"){
						$.ajax({
							   type: "POST",
							   url: "${basePath}//prizewx/prizelistAjax",
							   data: "raiseId="+$(this).attr("lang"),
							   dataType:"json",
							   success: function(date){
								   var recordMsg = "";
								   for (var i in date){
										recordMsg +='<tr class="bg-white">';
										recordMsg +='	<td class="col1">';
										recordMsg +='		<span class="num">'+date[i].luckyNo+'</span>';
										recordMsg +='	</td>';
										recordMsg +='	<td>'+date[i].userNick+'</td>';
										recordMsg +='</tr>';							   
								   }
								   $("#recordShowId").html(recordMsg);
								   $(".modal-comfirm").show();
							   },
							   error: function(date){
								   alert( "异步请求失败!");
							   }
						});							
					}										
				});				
			});	
		</script>
	</head>
	<body>	
		<div class="header">
			<span class="wb_arrow" onclick="javascript:history.go(-1);"></span>
			<span>我的夺宝</span>
			<a href="javascript:toScoreStrategy();" class="gl-ico">
				<span class="circle-font">
         			<i>?</i>
    			</span>攻略</a>
		</div>
		<!-- 
			<p> <input type="button" value="异步加载分页!" onclick="ajaxFY()"/> </p>
		 -->
		<main class="flex">
			<c:forEach items="${dtoList}" var="raise" varStatus="status">
				<div class="my_crowd">
					<div class="left_bottom" style="line-height: 2em;">
						<b class="blue">[第${raise.currentPeriodStr}期${raise.currentNum}号] </b>
						<span class="col-999 fr">开奖时间：${raise.outTimeStr}  </span>
					</div>
					<div class="my_crowd_list flex-item-box bordr-top2">
						<div class="my_crowd_left">
							<p class="my_crowd_img border">
								<c:choose>
									<c:when test="${empty raise.raiseIcon}">
										<img src="${resourcesPath}/images/demo3.png" />
									</c:when>
									<c:otherwise>
										<img src="${pageContext.request.contextPath}/${raise.raiseIcon}" />
									</c:otherwise>
								</c:choose>							
							</p>
						</div>
						<div class="my_crowd_right">
							<p class="font-12em"><b>${raise.raiseName}</b> </p>
							
							<!-- 
								<p class="orange mg-t05">价值：${raise.productPrice}0元</p>
								<p class="col-999">总计 ${raise.totalShare}人次</p>
							 -->
							<p>
								幸运用户: <span class="blue">${raise.luckyNum}</span>
								名
								<span class="fr blue check_luck" lang="${raise.id}"
								<c:if test="${raise.luckyNum==0}">
									style="color:#999;"
								</c:if>
								>查看<i class="wb_arrow_right"></i></span>
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</main>
		<!-- 自定义comfirm提示弹窗HTML -->
		<div class="modal-comfirm" style="display:none;">
			<div class="content" >
				<div class="modal-tit">幸运用户</div>
				<span class="close-x"><i>x</i></span>
				<div class="rank-list" style="height: 200px;overflow-y:auto;">
					<table cellspacing="0" cellpadding="0">
						<tbody id="recordShowId">
						</tbody>
					</table>
				</div>
			</div>
		</div>		
	</body>
</html>