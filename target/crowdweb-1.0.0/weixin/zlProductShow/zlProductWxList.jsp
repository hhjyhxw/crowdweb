<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

		<title>真龙产品展示</title>
		<link rel="stylesheet" href="${resourcesPath}/zlProductShow/css/reset.css">
		<link rel="stylesheet" href="${resourcesPath}/zlProductShow/css/app.css">
		<link rel="stylesheet" href="${resourcesPath}/zlProductShow/css/swiper.css">
		<script src="${resourcesPath}/zlProductShow/js/jquery-2.1.4.js"></script>
		<script src="${resourcesPath}/zlProductShow/js/swiper.min.js"></script>
	<style type="text/css">
	.DivSelect
	{
	    position: relative;
	    background-color: transparent;
	    border-width:0px;
	    border: none; 
	}
	</style>
	</head>
	<script type="text/javascript">
		function toDetail(detailLogo){
			window.location.href = "${basePath}/zl_product4wx/toDetail?productDeatailLogo="+detailLogo;
		}
		
		function search(param,typeVal){
			var type = "5";
			var tarContentPre = $("#tarContent").val();
			var priceOrderTypePre = $("#priceOrderType").val();
			if(param == "2"){
				if(tarContentPre == "0" || tarContentPre == ""){
					$("#tarContent").val("1");
				}
				if(tarContentPre == "1"){
					$("#tarContent").val("0");
				}
				var typeValue = $("#type").val();
				var tarContent = $("#tarContent").val()==""?"0":$("#tarContent").val();
				window.location.href = "${basePath}/zl_product4wx//listByPage4Wx?type="+typeValue+"&tarContent="+tarContent;
			}
			if(param == "3"){
				if(priceOrderTypePre == "0" || priceOrderTypePre == ""){
					//$("#priceStyle").addClass('arr_t a3');//设置Id为的class属性。
					$("#priceOrderType").val("1");
				}
				if(priceOrderTypePre == "1"){
					//$("#priceStyle").addClass('arr_t a2');//设置Id为的class属性。
					$("#priceOrderType").val("0");
				}
				var typeValue = $("#type").val();
				var priceOrderType = $("#priceOrderType").val()==""?"0":$("#priceOrderType").val();
				window.location.href = "${basePath}/zl_product4wx//listByPage4Wx?type="+typeValue+"&priceOrderType="+priceOrderType;
			}
			if(param == "1"){
				if(typeVal == "type0"){type=0}
				if(typeVal == "type1"){type=1}
				if(typeVal == "type2"){type=2}
				if(typeVal == "type3"){type=3}
				if(typeVal == "type4"){type=4}
				$("#type").val(type);
				var priceOrderType = $("#priceOrderType").val()==""?"0":$("#priceOrderType").val();
				window.location.href = "${basePath}/zl_product4wx//listByPage4Wx?type="+type+"&priceOrderType="+priceOrderType;
			}			
		}
	</script>
	<body>
		<input type="hidden" id="curpage" value="1"/>
		<div class="flex">
			<main class="body">
				<div class="banner">
					<!-- Swiper -->
					<div class="swiper-container">
						<div class="swiper-wrapper">
							<div class="swiper-slide"><img src="${resourcesPath}/zlProductShow/images/q1.jpg"></div>
							<div class="swiper-slide"><img src="${resourcesPath}/zlProductShow/images/q2.jpg"></div>
							<div class="swiper-slide"><img src="${resourcesPath}/zlProductShow/images/q3.jpg"></div>
						</div>
						<!-- Add Pagination -->
						<div class="swiper-pagination"></div>
					</div>
					
				</div>
				<div class="detail-info tab">
						<nav class="tab-nav ">
							<span class="tab-title active" name="tap" onclick="showWin()">
								<c:if test="${empty type || type == '5'}">全部</c:if>
								<c:if test="${type == '0'}">特色嘴棒</c:if>
								<c:if test="${type == '1'}">低焦卷烟</c:if>
								<c:if test="${type == '2'}">细支卷烟</c:if>
								<c:if test="${type == '3'}">扫码得龙币</c:if>
								<c:if test="${type == '4'}">扫码得乐豆</c:if>
							<i class="arr_t a1"></i></span>
							<input type="hidden" name="type" id="type" value="${type }">
							<input type="hidden" name="tarContent" id="tarContent" value="${tarContent }">
							<input type="hidden" name="priceOrderType" id="priceOrderType" value="${priceOrderType }">
							<span class="tab-title " name="tap" class="tab-title " onclick="search('2',null)">焦油<label>
							<c:if test="${tarContent == '0' || tarContent == null}"><i id="tarContentStyle" class="arr_t a2"></i></c:if>
							<c:if test="${tarContent == '1'}"><i id="priceStyle" class="arr_t a3"></i></c:if>
							</label></span>
							<span class="tab-title " name="tap" class="tab-title " onclick="search('3',null)">价格<label>
							<c:if test="${priceOrderType == '0' || priceOrderType == null}"><i id="priceStyle" class="arr_t a2"></i></c:if>
							<c:if test="${priceOrderType == '1'}"><i id="priceStyle" class="arr_t a3"></i></c:if>
							</label></span>
						</nav>
						
						<div class="up_comtainer" style="display: none;">
	                        <div class="up_box">
				                <p class="select selected"><label>
				                	<input type="radio" class="option-input radio" onclick="search('1','typeAll')">全部
				                </label></p>
				                <p class="select"><label>
				                	<input type="radio" class="option-input radio" onclick="search('1','type0')">特色嘴棒
				                </label></p>
								<p class="select"><label>
									<input type="radio" class="option-input radio" onclick="search('1','type1')">低焦卷烟
								</label></p>
				                <p class="select"><label>
				                	<input type="radio" class="option-input radio" onclick="search('1','type2')">细支卷烟
				                </label></p>
				                <p class="select"><label>
				                	<input type="radio" class="option-input radio" onclick="search('1','type3')">扫码得龙币
				                </label></p>
				                <p class="select"><label>
				                	<input type="radio" class="option-input radio" onclick="search('1','type4')">扫码得乐豆
				                </label></p>
	                        </div>
	                    </div>
						
					</div>
				<div class="good-list">
				<c:forEach items="${list}" var="zlProduct" varStatus="status">
					<div class="wrap">
						<div class="goods">
							<a class="good-a" href="javascript:void(0)">
								<c:if test="${zlProduct.productType == '1'}">
									<span class="item-tit new">最新</span>
								</c:if>
								<c:if test="${zlProduct.productType == '2'}">
									<span class="item-tit hot">人气</span>
								</c:if>
								<c:if test="${zlProduct.productType != '2' && zlProduct.productType != '1'}">
									<span class="item-tit"></span>
								</c:if>
								<div class="img">
									<img src="${pageContext.request.contextPath}/${zlProduct.productLogo}" alt="商品图片">
								</div>
								<div class="index-padding">
									<h4 class="font-15 col-000">${zlProduct.productName}</h4>
									<p class="result-font" onclick="toDetail('${zlProduct.productDetailLogo}')">详细内容<i></i></p>
								</div>
							</a>
						</div>
					</div>
					</c:forEach>
				</div>
				<!-- 无记录显示 -->
				<c:if test="${fn:length(list)<=0}">
					<div style=" float: left; width: 100%; text-align: center; margin-top: 1rem;">
					<img src="${resourcesPath}/zlProductShow/images/order_emprty.png" style=" width:25%;">
					<p style="font-size: 1em; padding: 1rem 0; color: #333;">暂无相关记录</p>
					</div>
				</c:if>
				<div id="loadEnd" style="text-align:center; display:none">
				~已经到底了
				</div>
			</main>
		</div>
		
		
		<script>
			$(function () {
		        $(".select").each(function (i) {
		            $(this).click(function () {
		                $(this).addClass("selected").siblings().removeClass("selected");
		            })
		        })
		    })
			
			//show 弹窗口
			function showWin(){
				$(".up_comtainer").show();
				var h =$('.good-list').height();
				$(".up_comtainer").css({"height":h})
			}
			var swiper = new Swiper('.swiper-container', {
				loop: true,
				autoplay: 3000,
				pagination: '.swiper-pagination',
				paginationClickable: true
			});
			// 滚动到底部加载更多
			var totalPage = ${totalPage};//通过第一次查询得到总页数
			window.canLoad = true;
			window.maxScrollY = $(document).height() - $(window).height() - 50;
			$(".body").on('scroll touchmove', function(event) {
				if(window.scrollY >= maxScrollY && window.canLoad) {
					window.canLoad = false;
					//'.maidarif'为加载数据的父容器
					$('.body .good-list').addClass('loading-after');
					var curpage = document.getElementById("curpage").value;
					if(totalPage == 0){
						$('.body .good-list').append(htmlStr).removeClass('loading-after');
						return;
					}
					if((parseInt(curpage) + 1) > totalPage){
						$('.body .good-list').append(htmlStr).removeClass('loading-after');
						$("#loadEnd").show();
						return;
					}
					
					var htmlStr = '';
					setTimeout(function() {
						var type = $("#type").val()==""?"5":$("#type").val();
						var tarContent = $("#tarContent").val()==""?"":$("#type").val();
						var priceOrderType = $("#priceOrderType").val()==""?"":$("#priceOrderType").val();
						//下一页页码
						curpage = parseInt(curpage) + 1;
						document.getElementById("curpage").value = curpage;
						if (curpage > parseInt(totalPage)) {
							return false;
						}
						
						var url = '${basePath}/zl_product4wx/listByPageJson';
						$.post(url, {
			            		'currPage':curpage,
			            		'totalCount':${totalCount},
			            		'type':type,
			            		'tarContent':tarContent,
			            		'priceOrderType':priceOrderType
			            }, function(ret) {
			            	if(ret != null && ret != ""){
			                    var proList = ret['zlProducts'];
			                    for(var i = 0; i < proList.length; i++){
			                    	var product = proList[i];

			                    	htmlStr += '		<div class="wrap">';
			    					htmlStr += '	<div class="goods">';
			    					htmlStr += '		<a class="good-a" href="javascript:void(0)">';
			    					if(product.productType == '1'){
			    						htmlStr += '				<span class="item-tit new">最新</span>';
			    					}
			                    	if(product.productType == '2'){
			    						htmlStr += '				<span class="item-tit hot">人气</span>';
			    					}
			                    	if(product.productType != '2' && product.productType != '1'){
			    						htmlStr += '				<span class="item-tit"></span>';
			    					}
			    					htmlStr += '			<div class="img">';
			    					htmlStr += '				<img src="${pageContext.request.contextPath}/'+product.productLogo+'" alt="商品图片">';
			    					htmlStr += '			</div>';
			    					htmlStr += '			<div class="index-padding">';
			    					htmlStr += '				<h4 class="font-15 col-000">'+product.productName+'</h4>';
			    					//htmlStr += "<p class='result-font' onclick='toDetail("+product.productDetailLogo+")'>查看结果<i></i></span></p>"
			    					htmlStr += '				<p class="result-font" onclick="toDetail(\''+product.productDetailLogo+'\')">查看结果<i></i></span></p>';
			    					htmlStr += '			</div>';
			    					htmlStr += '		</a>';
			    					htmlStr += '	</div>';
			    					htmlStr += '</div>';
			                    } 
			                    $('.body .good-list').append(htmlStr).removeClass('loading-after');
			            	}
			            });
						
						
						window.canLoad = true;
						window.maxScrollY = $(document).height() - $(window).height() - 50;

					}, 2000)
				};
			});
		</script>
	</body>

</html>