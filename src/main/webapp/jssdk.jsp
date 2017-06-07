<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title>祥云出行</title>
    <link rel="stylesheet" href="ui_lib/css/framework7.ios.min.css">
    <link rel="stylesheet" href="ui_lib/css/framework7.ios.colors.min.css">
  </head>
  <body>
    <%@ include file="_include/_jssdk.jsp" %>
	<div class="statusbar-overlay"></div>
    <div class="panel-overlay"></div>
    
   <%@ include file="_include/_userTree.jsp" %>
    
    <div class="views">
      <div class="view view-main">
      
          <div class="content-block">
		    <p><a href="#" class="button button-big button-round active" id="getLocation">获取位置</a></p>
		  
		     <p><a href="#" class="button button-big button-round active" id="openLocation">使用微信内置地图查看位置接口</a></p>
		     
		     
		     <p><a href="#" class="button button-big button-round active" id="onMenuShareTimeline">分享到朋友圈</a></p>
		     <p><a href="#" class="button button-big button-round active" id="onMenuShareAppMessage">分享给朋友</a></p>
		     <p><a href="#" class="button button-big button-round active" id="onMenuShareQQ">分享到QQ</a></p>
		     <p><a href="#" class="button button-big button-round active" id="onMenuShareQZone">分享到QQ空间</a></p>
		     <p><a href="#" class="button button-big button-round active" id="onMenuShareWeibo">分享到腾讯微博</a></p>
		     
		     
		     <p><a href="#" class="button button-big button-round active" id="checkJsApi">checkJsApi</a></p>
		  </div>
      
        
      </div>
    </div>
    <script type="text/javascript" src="ui_lib/js/framework7.min.js"></script>
    
    
  </body>
</html>              