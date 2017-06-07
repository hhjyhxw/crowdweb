<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<!DOCTYPE html>
<html><head>
        <meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" media="all">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/home-menu-2.css" media="all">
		<title>系统测试中</title>		
        <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
		<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">        
        <!-- Mobile Devices Support @begin -->
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
            <meta content="no-cache,must-revalidate" http-equiv="Cache-Control">
            <meta content="no-cache" http-equiv="pragma">
            <meta content="0" http-equiv="expires">
            <meta content="telephone=no, address=no" name="format-detection">
            <meta name="apple-mobile-web-app-capable" content="yes"> <!-- apple devices fullscreen -->
            <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
	  <!-- Mobile Devices Support @end -->
 
      <style type="text/css">
.tj{ display:block;margin:0 auto;border-bottom: 3px solid  #aaa;background-color: #fff;padding: 5px 7px;display: block;font-size: 18px;text-decoration: none;text-align: center; color:#000; width:120px;overflow:hidden;border-radius: 5px;box-shadow: 0px 1px 1px #aaa;border: 1px solid #aaa;}
.csmk {
    border-radius: 5px;
    background-color: #FFF;
    border: 1px solid #aaa;
    margin: 5px 0px 4px;
    padding: 5px 10px;
}

</style>
      </head>
    <body onselectstart="return true;" ondragstart="return false;">
        <div style="top: 0px;" id="header">
       <div class="gohome radius20"><a  href="${pageContext.request.contextPath}/shopIndex/showProductByClass.action"><img src="${pageContext.request.contextPath}/images/home.png" alt="" title=""></a></div>
	   <div class="gomenu1 radius20"><a  >系统测试中</a></div>
    <div class="gomenu radius20"><a  href="${pageContext.request.contextPath}/shopIndex/queryUserShopcart.action"><img src="${pageContext.request.contextPath}/images/car1.png" alt="" title=""></a></div>
  </div>


<div class="bodycar">
	<br><br><header></header>           

	<section>
            <ul class="songlist_ul">
				<div class="itemDetail">
		<div class="itemDetailInner">
		<c:if test="${_testUser != 'hsTest@awkj' }">
		<form name="form1" action="${pageContext.request.contextPath}/common/csym.jsp" method="post">
			<div class="itemDetailTitle" style="text-align:center"><img src="${pageContext.request.contextPath}/images/ReportServer.png" height="128" width="128"></div>
			  <div  style="text-align:center; color:#FF0000 "><span >系统正在测试,请稍候访问</span></div>
			<div style="text-align:center" ><span  ><input class="csmk" value="" name="testUser" placeholder="请输入您的测试码" type="text"></span></div>
			<div style="text-align:center" ><span class="tj" onclick="document.form1.submit()">确定</span><span></span></div>
		</form></c:if>
		<c:if test="${_testUser == 'hsTest@awkj' }">
		 <div  style="text-align:center; color:#FF0000 "><span><br><br>欢迎参与系统测试,请按要求测试</span></div>
		</c:if>
				  </div>			
	</div>
             </ul>
			</section>
		<br>
<br>


		  
</div>



</body></html>