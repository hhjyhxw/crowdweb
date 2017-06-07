<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

    <div class="statusbar-overlay"></div>
    <div class="views">
      <div class="view view-main">
        <!-- Top Navbar-->
        <div class="navbar">
          <!-- Navbar inner for Index page-->
          <div data-page="index" class="navbar-inner">
            
            <div class="left"> <a href="#" class="link" id="btnBack"> <i class="icon icon-back"></i> <span>返回</span></a> 
            </div> 
            <div class="center sliding">个人信息</div>
          </div>
          
          <!--  Change Password Page-->
          <div data-page="changePassword" class="navbar-inner cached">
            <div class="left sliding"><a href="#" class="back link"><i class="icon icon-back"></i><span>取消</span></a></div>
            <div class="center sliding">修改密码</div> 
			<div class="right sliding"><a href="#index" class="" id="changePasswordOperate"><span>确认</span></a></div>
          </div>
        
        </div>
        
        <div class="pages navbar-through toolbar-through">
          <!-- Index Page-->
          <div data-page="index" class="page">

                   <div class="content-block">
					        <hr style="color:#EDEDED"/>
					        <div style="margin-top: 20px;color: #1b1b1b; ">
					            <div style="float: left;"><img src="images/avatar@3x.png" width="40" height="40"></div>
					            <div style="float: left;"><a href="#" class="back link"><span style="color:#000000;"><font size="4px">更换头像</font></span></a></div>
					            <div style="clear: both;"></div>
					        </div>
					        <hr style="color:#EDEDED"/>
					        <div style="margin-top: 30px;color: #1b1b1b; ">
					            <div style="float: left;"><span ><font size="4px">用户名</font></span></div>
					            <div style="float: right;"><span style="color:#000000;"><font size="4px">${name}</font></span></div>
					            <div style="clear: both;"></div>
					        </div>	
					        <hr style="color:#EDEDED"/>
					         <div style="margin-top: 30px;color: #1b1b1b; ">
					            <div style="float: left;"><span ><font size="4px">性别</font></span></div>
					            <div style="float: right;"><span style="color:#000000;"><font size="4px">${sex}</font></span></div>
					            <div style="clear: both;"></div>
					        </div>
					        <hr style="color:#EDEDED"/>
					        <div style="margin-top: 30px;color: #1b1b1b; ">
					            <div style="float: left;"><span ><font size="4px">手机号码</font></span></div>
					            <div style="float: right;"><a href="#changePhone1" class="link" id="btnBack"><span style="color:#000000;"><font size="4px">${phone}</font></span></a></div>
					            <div style="clear: both;"></div>
					        </div>
					        <hr style="color:#EDEDED"/>
					        <div style="margin-top: 30px;color: #1b1b1b; ">
					            <div style="float: left;"><span ><font size="4px">会员状态</font></span></div>
					            <div style="float: right;"><a href="#" class="back link"><span style="color:#000000;"><font size="4px">未审核</font></span><i><img src="images/list-arrow@2x.png" width="30" height="14"></i></a></div>
					            <div style="clear: both;"></div>
					        </div>
					        <hr style="color:#EDEDED"/>
					        <div style="margin-top: 30px;color: #1b1b1b; ">
					            <div style="float: left;"><span ><font size="4px">驾驶证号</font></span></div>
					            <div style="float: right;"><span style="color:#000000;"><font size="4px">${driverIdcard }</font></span></div>
					            <div style="clear: both;"></div>
					        </div>
					        <hr style="color:#EDEDED"/>
					        <div style="margin-top: 30px;color: #1b1b1b; ">
					            <div style="float: left;"><span ><font size="4px">修改密码</font></span></div>
					            <div style="float: right;"><a href="#changePassword" class="link" id="btnBack"><i><img src="images/list-arrow@2x.png" width="30" height="14"></i></a></div>				           
					            <div style="clear: both;"></div>
					        </div>
					        <hr style="color:#EDEDED"/>
				  </div>            		
          </div>
          

           <!--  Change Password Page-->
           		<div data-page="changePassword" class="page cached">
                   <div class="list-block">
                      <ul>
                        <li>
                           <div class="item-content">
                               <div class="item-inner">
                                     <div class="item-title label">原密码</div>
							          <div class="item-input">
							            <input type="password" id="oldPassword" name="oldPassword" placeholder="请输入新密码">
							          </div>
                               </div>
                           </div>
                        </li>
                     </ul>
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
  
  
       <!--  Change Phone Page 1-->     
             <div data-page="changePhone1" class="page cached">
                   <div class="list-block">
                     <ul>
                        <li>
                           <div class="item-content">
                               <div class="item-inner">
                                     <div class="item-title label">新手机号</div>
							          <div class="item-input">
							            <input type="tel" name="name" placeholder="请输入新的手机号">
							          </div>
                               </div>
                           </div>
                        </li>
                     </ul>
                  </div> 
			</div>      
 
       <!--  Change Phone Page 2-->     
 				<div data-page="changePhone2" class="page cached">
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
											<a href="#" class="link"><span>获取验证码</span> </a>
										</div>
									</div>
								</div>
							</li>
						</ul>
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
    
    $("#changePasswordOperate").bind("click",function(){
    	
    	oldPassword = $("#oldPassword").val();
    	newPassword = $("#newPassword").val();
    	
    	$.ajax({
    		type:"post",
    		url:"change_password_operate",
    		data:{"newPassword":newPassword,"oldPassword":oldPassword},
    		success:function(data){
    			if(data == "succ"){
    				myApp.alert("修改密码成功", "");
    			}
    			if(data == "fail"){
    				myApp.alert("修改密码失败", "");
    			}
    		}
    	});
    });
    
    </script>
  </body>
</html>