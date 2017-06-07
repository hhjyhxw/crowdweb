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
    <link rel="stylesheet" href="skip/skip.css">
    <style>
   
    .context {
	    padding-top: 1px;
	    margin: 1px;
       }

     .context {
       text-align: center;
       }

    .context .left {
	    float: left;
      }

     .context .center {
	    display: inline;
      }

     .context .right {
	      float: right;
      }
   </style>
  </head>
  <body>
    <!-- Status bar overlay for fullscreen mode-->
    <div class="statusbar-overlay"></div>
    <!-- Panels overlay-->
    <!-- Views-->
    <div class="views">
      <!-- Your main view, should have "view-main" class-->
      <div class="view view-main">
        <!-- Top Navbar-->
        <div class="navbar">
          <!-- Index Retrieve Password Page-->
          <div data-page="index" class="navbar-inner">   
            <div class="left"> <a href="#" class="link" id="btnBack"> <i class="icon icon-back"></i> <span>登录</span></a></div> 
            <div class="center sliding">找回密码</div>
            <div class="right"> <a href="#verification" class="link" id="btnBack"><span>下一步</span></a></div> 
          </div>
          
          <!-- SMS Verification page-->
          <div data-page="verification" class="navbar-inner cached">
            <div class="left sliding"><a href="#index" class="back link"><i class="icon icon-back"></i><span>返回</span></a></div>
            <div class="center sliding">短信验证</div>
            <div class="right"> <a href="#resetPassword" class="link" id="btnBack"><span>下一步</span></a></div> 
          </div>
          
          <!-- Reset Password page-->
          <div data-page="resetPassword" class="navbar-inner cached">
            <div class="left sliding"><a href="#verification" class="back link"><i class="icon icon-back"></i><span>返回</span></a></div>
            <div class="center sliding">重置密码</div>  
            <div class="right"> <a href="#resetPasswordSuccess" class="" id="retrievePasswordOperate"><span>保存</span></a></div> 

          </div>
          
          <!-- Reset Password Success page-->
          <div data-page="resetPasswordSuccess" class="navbar-inner cached">
            <div class="center sliding">找回密码成功</div>
          </div>
  
        </div>

        <div class="pages navbar-through toolbar-through">
          <!-- Index Retrieve Password Page-->
          <div data-page="index" class="page">
          
            		<div class="list-block">
							<ul>
								<li>
									<div class="item-content">
										<div class="item-inner">
											<div align="left"
												style="margin-top: 5px; margin-bottom: 5px;">
												<img src="images/user-alt@3x.png" width="30" height="25">
											</div>
											<div align="center" class="item-input">
												<input type="tel" id="phone" name="phone" placeholder="请输入手机号码">
											</div>
										</div>
								</div>
						</li>
					 </ul>
				</div>
          </div>
         
          <!-- SMS Verification page-->
				<div data-page="verification" class="page cached">
					<div class="list-block">
						<ul>
							<li>
								<div class="item-content">
									<div class="item-inner">
										<div align="left" style="margin-top: 5px; margin-bottom: 5px;">
											<img src="images/iPhone@3x.png" width="30" height="25">
										</div>
										<div class="left" class="item-input">
											<input type="tel" name="name" placeholder="请输入短信验证码">
										</div>
										<div class="right">
										  <a href="#" class="" id="gainsms"><span>获取验证码</span> </a>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
 
           <!-- Reset Password page-->
           		<div data-page="resetPassword" class="page cached">
                   <div class="list-block">
                     <ul>
                        <li>
                           <div class="item-content">
                               <div class="item-inner">
                                     <div class="item-title label">新密码</div>
							          <div class="item-input">
							            <input type="password" id="newPassword" name="newPassword" placeholder="请输入新密码">
							          </div>
                               </div>
                           </div>
                        </li>
                     </ul>
                     <ul>
                        <li>
                           <div class="item-content">
                               <div class="item-inner">
                                     <div class="item-title label">确认新密码</div>
							          <div class="item-input">
							            <input type="password" id="newPassword1" name="newPassword1" placeholder="请再次输入新密码">
							          </div>
                               </div>
                           </div>
                        </li>
                     </ul>
                   </div> 
				</div>
          
          <!-- Reset Password Success page-->
             <div data-page="resetPasswordSuccess" class="page cached">
				  <div class="list-block">
					 <div align="center" style="margin-top: 60px; margin-bottom: -22px;">
                       <img src="images/com-checkbox@3x.png" width="124" height="118">
                     </div>		
							
					     <div align="center" class="page-content">
							 <div class="content-block">
								<p><font size="5px">成功找回密码</font><br>您已成功找回密码，请重新登录</p>
							  </div>
						 </div> 			
					</div>
						
				  <div class="content-block">
					<p><a href="login.jsp" class="button button-big button-round active" >重新登录</a></p>
				 </div>					
				</div>
          	
		</div>
      </div>
    </div>
    <script type="text/javascript" src="ui_lib/js/framework7.min.js"></script>
    <script type="text/javascript" src="ui_lib/js/jquery.min.js"></script>
    <script type="text/javascript" src="skip/skip.js"></script>
    <script type="text/javascript" src="memberInfo/retrievePassword.js"></script>
        
        
    <script type="text/javascript">
    var myApp = new Framework7({
    	modalButtonOk : "确定"
    });
    var $$ = Dom7; 
    
    $("#gainsms").bind("click",function(){
    	
    	phone = $("#phone").val();
    	
    	$.ajax({
    		type:"post",
    		url:"gain_sms",
    		data:{"phone":phone},
    		success:function(data){
    			if(data == "succ"){
    				myApp.alert("发送短信成功", "");
    			}
    			if(data == "fail"){
    				myApp.alert("发送短信失败", "");
    			}
    		}
    	});
    });
    
    $("#retrievePasswordOperate").bind("click",function(){
    	
    	newPassword = $("#newPassword").val();
    	
    	$.ajax({
    		type:"post",
    		url:"retrieve_password_operate",
    		data:{"newPassword":newPassword},
    		success:function(data){
    			if(data == "succ"){
    				myApp.alert("找回密码成功", "");
    			}
    			if(data == "fail"){
    				myApp.alert("找回密码失败", "");
    			}
    		}
    	});
    });
   </script>
  </body>
</html>