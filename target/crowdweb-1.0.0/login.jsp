<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta property="qc:admins" content="25611037335631266727361771160454" />
    <title>祥云出行</title>
    <link rel="stylesheet" href="ui_lib/css/framework7.ios.min.css">
    <link rel="stylesheet" href="ui_lib/css/framework7.ios.colors.min.css">
    <style type="text/css">
/*     .list-block ul:before{content:'';position:absolute;left:0;top:0;bottom:auto;right:auto;height:1px;width:0;background-color:#c8c7cc;display:block;z-index:15;-webkit-transform-origin:50% 0;transform-origin:50% 0} */
    </style>
  </head>
  <body>
  
	<div class="statusbar-overlay"></div>
    <div class="panel-overlay"></div>
    
    <div class="views">
      <div class="view view-main">
      
      
<!--         \导航 -->
        <div class="navbar">
            <div class="navbar-inner">
               
<!--                <div class="left"> -->
<!--                    <a href="#" class="link" id="btnBack"> -->
<!-- 		                <i class="icon icon-back"></i> -->
<!-- 		                <span>返回</span> -->
<!-- 		            </a> -->
<!--                </div> -->
               
               
               <div class="center">
                                                   登录
               </div>
               
               
<!--                <div class="right"> -->
<!--                  <a href="#" class="link"> -->
<!--                    <i class="icon icon-bars"></i> -->
<!--                    <span>更多</span> -->
<!--                  </a> -->
<!--                </div> -->
               
            </div>
        </div>
        
        
        
        <div class="pages">
           <div data-page="loginPage" class="page">
               <div class="page-content">
                   
                   
<!--                    <div align="center" style="margin-top: 60px; margin-bottom: -22px;"> -->
<!--                      <img src="images/logo.png" width="124" height="118"> -->
<!--                    </div> -->
                   
                   
                   <div class="list-block">
                     <ul>
                        <li>
                           <div class="item-content">
                                     <div class="item-inner">
                                     <div class="item-media" style="margin-right: 10px;"><img src="images/user-alt.png" width="24" height="24"></div>
							          <div class="item-input">
							            <input type="tel" name="phone" id="phone" placeholder="手机号码">
							          </div>
                               </div>
                           </div>
                        </li>
                        <li>
                           <div class="item-content">
                               <div class="item-inner">
                                    <div class="item-media" style="margin-right: 10px;"><img src="images/lock.png" width="24" height="24"></div>
							          <div class="item-input">
							            <input type="password" name="password" id="password" placeholder="密码">
							          </div>
                               </div>
                           </div>
                        </li>
                     </ul>
                   </div>
                   
                   <div class="content-block">
					  <p><a href="#" class="button button-big button-round active" id="btnLogin">登录</a></p>
				  </div>
				  
				  <div class="content-block">
				     <div style="float: left;"><a href="">立即注册</a></div>
				     
				      <div style="float: right;"><a href="">忘记密码?</a></div>
				      <div style="clear: both;"></div>
				  </div>
				  
				  
				   <div align="center" style="margin:40px; color: #b6b6b6;"><div style="float:left;width: 20%;"><hr style="height:1px;border:none;border-top:1px dashed #E0E0E0;" /></div><div style="float:right;width: 20%;"><hr style="height:1px;border:none;border-top:1px dashed #E0E0E0;" /></div><div>其它方式登录</div></div>
				    
				    <div class="row">
					    <div class="col-33" align="center"><img width="40" height="40" src="images/tencent-wechat.svg.png" id="oauth2WeixinLoginImg"></div>
					    <div class="col-33" align="center"><img width="40" height="40" src="images/tencent-QQ.svg.png" id="oauth2QQLoginImg"></div>
					    <div class="col-33" align="center"><img  width="40" height="40" src="images/sina-weibo.svg.png" id="oauth2WeiboLoginImg"></div>
					</div>
				  
               </div>
           </div>
        </div>
        
        
      </div>
    </div>
    <script type="text/javascript" src="ui_lib/js/framework7.min.js"></script>
    <script type="text/javascript" src="ui_lib/js/jquery.min.js"></script>
    
    <script type="text/javascript">
    var myApp = new Framework7({
    	modalButtonOk : "确定"
    });
    var $$ = Dom7;
    
//     $("#phone").bind("focus",function(){
//     	var _phone = $("#phone").val();
//     	var _password = $("#password").val();
//     	if($.trim(_phone) != "" && $.trim(_password) != ""){
//     		$("#btnLogin").addClass("active");
//     	}else{
//     		$("#btnLogin").removeClass("active");
//     	}
//     });
    
//     $("#password").bind("focus",function(){
//     	var _phone = $("#phone").val();
//     	var _password = $("#password").val();
//     	if($.trim(_phone) != "" && $.trim(_password) != ""){
//     		$("#btnLogin").addClass("active");
//     	}else{
//     		$("#btnLogin").removeClass("active");
//     	}
//     });
    
//     $("#phone").bind("keypress",function(){
//     	var _phone = $("#phone").val();
//     	var _password = $("#password").val();
//     	if($.trim(_phone) != "" && $.trim(_password) != ""){
//     		$("#btnLogin").addClass("active");
//     	}else{
//     		$("#btnLogin").removeClass("active");
//     	}
//     });
    
//     $("#password").bind("keypress",function(){
//     	var _phone = $("#phone").val();
//     	var _password = $("#password").val();
//     	if($.trim(_phone) != "" && $.trim(_password) != ""){
//     		$("#btnLogin").addClass("active");
//     	}else{
//     		$("#btnLogin").removeClass("active");
//     	}
//     });

    $$("#oauth2WeixinLoginImg").on("click",function(){
    	window.location.href = "wx_oauth2_login";
    });
    
	$$("#oauth2QQLoginImg").on("click",function(){
		window.location.href = "https://graph.qq.com/oauth2.0/authorize?response_type=code&client_id=101310087&redirect_uri=https%3A%2F%2Fh5.xcloudtrip.com%2Fqq_oauth2_login&state=QQ_STATE&scope=get_user_info";	
	});
	    
	$$("#oauth2WeiboLoginImg").on("click",function(){
		window.location.href = "https://api.weibo.com/oauth2/authorize?client_id=4019288314&redirect_uri=https%3a%2f%2fh5.xcloudtrip.com%2fweibo_oauth2_login";
	});

    $$("#btnLogin").on("click",function(){
    	//myApp.alert("登录....", "温馨提示");
    	var _phone = $("#phone").val();
    	if($.trim(_phone) == ""){
    		myApp.alert("请正确填写登录手机号码", "温馨提示");
    		return;
    	}
    	var _password = $("#password").val();
    	if($.trim(_password) == ""){
    		myApp.alert("请正确填写登录密码", "温馨提示");
    		return;
    	}
    	$.ajax({
    		type:"post",
    		url:"wx_login",
    		data:{phone:_phone,password:_password},
    		success:function(data){
    			if(data == "succ"){
    				document.location.href="h5_index";
    			}else if(data == "fail"){
    				myApp.alert("登录失败", "温馨提示");
    			}else{
    			  myApp.alert(data, "温馨提示");
    			}
    		}
    	});
    });
    
    </script>
    
  </body>
</html>              