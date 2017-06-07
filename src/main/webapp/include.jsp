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
  
	<div class="statusbar-overlay"></div>
    <div class="panel-overlay"></div>
    
   <%@ include file="_include/_userTree.jsp" %>
    
    <div class="views">
      <div class="view view-main">
      
      
<!--         导航 -->
        <div class="navbar">
            <div class="navbar-inner">
               
               <div class="left">
                     <%@ include file="_include/_leftUserIcon.jsp" %>
               </div>
               
               
               <div class="center">
                                                   登录
               </div>
               
               
               <div class="right">
               
                   <a href="#" class="link" >
		                <img src="images/phone.png" width="24" height="24">
		            </a>
		            
               
               </div>
               
            </div>
        </div>
        
        
      </div>
    </div>
    <script type="text/javascript" src="ui_lib/js/framework7.min.js"></script>
    
    <script type="text/javascript">
    
    <%@ include file="_include/_userClickAction.jsp" %>
    
 
    
    </script>
    
  </body>
</html>              