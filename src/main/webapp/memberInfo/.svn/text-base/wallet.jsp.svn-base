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
    <title>钱包</title>
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
          <!-- Index Balance Page-->
          <div data-page="index" class="navbar-inner">   
            <div class="left"> <a href="#index" class="link" id="btnBack"><span>余额</span></a></div>
            <div class="left"> <a href="#deposit" class="link" id="btnBack"><span style="color:#000000;">押金</span></a></div>
            <div class="right"> <a href="#coupon" class="link" id="btnBack"><span style="color:#000000;">优惠券</span></a></div>
            <div class="right"> <a href="#integral" class="link" id="btnBack"><span style="color:#000000;">积分</span></a></div>
          </div>
          
          <!-- Deposit Page-->
          <div data-page="deposit" class="navbar-inner cached">
            <div class="left"> <a href="#index" class="link" id="btnBack"><span style="color:#000000;">余额</span></a></div>
            <div class="left"> <a href="#deposit" class="link" id="btnBack"><span >押金</span></a></div>
            <div class="right"> <a href="#coupon" class="link" id="btnBack"><span style="color:#000000;">优惠券</span></a></div>
            <div class="right"> <a href="#integral" class="link" id="btnBack"><span style="color:#000000;">积分</span></a></div>
          </div>
          
          <!-- Coupon Page-->
          <div data-page="coupon" class="navbar-inner cached">
            <div class="left"> <a href="#index" class="link" id="btnBack"><span style="color:#000000;">余额</span></a></div>
            <div class="left"> <a href="#deposit" class="link" id="btnBack"><span style="color:#000000;">押金</span></a></div>
            <div class="right"> <a href="#coupon" class="link" id="btnBack"><span >优惠券</span></a></div>
            <div class="right"> <a href="#integral" class="link" id="btnBack"><span style="color:#000000;">积分</span></a></div>
          </div>
          
          <!-- Integral Page-->
          <div data-page="integral" class="navbar-inner cached">
            <div class="left"> <a href="#index" class="link" id="btnBack"><span style="color:#000000;">余额</span></a></div>
            <div class="left"> <a href="#deposit" class="link" id="btnBack"><span style="color:#000000;">押金</span></a></div>
            <div class="right"> <a href="#coupon" class="link" id="btnBack"><span style="color:#000000;">优惠券</span></a></div>
            <div class="right"> <a href="#integral" class="link" id="btnBack"><span >积分</span></a></div>
          </div>
  
           <!--Charge Balance Page-->
          <div data-page="chargeBalance" class="navbar-inner cached">
            <div class="left"> <a href="#index" class="link" id="btnBack"> <i class="icon icon-back"></i> <span>返回</span></a></div> 
            <div class="center sliding">充余额</div>
          </div> 
          
          <!--Charge Success Page-->
          <div data-page="chargeSuccess" class="navbar-inner cached" >
            <div class="center sliding">充值成功</div>
          </div>       
 
          <!--Charge Deposit Page-->
          <div data-page="chargeDeposit" class="navbar-inner cached">
            <div class="left"> <a href="#deposit" class="link" id="btnBack"> <i class="icon icon-back"></i> <span>返回</span></a></div> 
            <div class="center sliding">充押金</div>
          </div>
        
        <!--Charge Deposit Success Page--> 
          <div data-page="chargeDepositSuccess" class="navbar-inner cached" >
            <div class="center sliding">充值成功</div>
          </div>      
         
        <!--Refund Page-->
          <div data-page="refund" class="navbar-inner cached">
            <div class="left"> <a href="#deposit" class="link" id="btnBack"> <i class="icon icon-back"></i> <span>返回</span></a></div> 
            <div class="center sliding">退款</div>
          </div> 
          
        <!--Refund Success Page-->
          <div data-page="refundSuccess" class="navbar-inner cached">
            <div class="center sliding">申请退款成功</div>
          </div>  
       
       
        </div>

        
        <div class="pages navbar-through toolbar-through">
         
          <!-- Index Balance Page-->
		<div data-page="index" class="page">
				<div class="list-block">
						<div align="center"
							style="margin-top: 60px; margin-bottom: -22px;">
							<img src="images/icon-wallet-yue-@3x.png" width="124"
								height="124">
						</div>

						<div align="center" class="page-content">
							<div class="content-block">
								<p>账户余额</p>
								<p>
								 <font size="7px"><span>￥</span>${balance}</font>
								</p>
							</div>
						</div>
					</div>
					
				<div class="content-block">
				  <p><a href="#chargeBalance" class="button button-big button-round active">充值</a></p>
				</div>
			</div>

			<!-- Deposit page-->
			  <div data-page="deposit" class="page cached">
           
				  <div class="list-block">
					 <div align="center" style="margin-top: 60px; margin-bottom: -22px;">
                       <img src="images/-@3x.png" width="124" height="124">
                     </div>		
							
					     <div align="center" class="page-content">
							 <div class="content-block">
							    <p>押金</p>
								<p><font size="7px"><span>￥</span>${deposit}</font></p>
							  </div>
						 </div> 			
					</div>	
				  <div class="content-block">
					<p><a href="#chargeDeposit" class="button button-big button-round active">充值</a></p>
					<p><a href="#refund" class="button button-round button-big" >退款</a></p>
				 </div>	 
				</div>
 
           <!-- Coupon Page-->
           		<div data-page="coupon" class="page cached">
           <div class="page-content" style="padding: 0;background-color: #fafafa">          
            <div class="list-block" >
				     <ul>
                        <li>
                           <div class="item-content">
                               <div class="item-inner">
                               		<div class="left" class="item-input">
										<input type="text" id="couponNo" name="couponNo" placeholder="请输入优惠券">
									</div>
									<div class="right">
										<a href="#" class="button button-big button-round active" id="bindingCoupon">绑定</a>
									</div>
                               </div>
                           </div>
                        </li>
                     </ul>
				<ul>
					<%
					String code = (String)request.getAttribute("code");
					if("00".equals(code)){
						Map<String, Object> result = (Map<String, Object>)request.getAttribute("result");
						List<Map<String, Object>> list = (List<Map<String, Object>>) result.get("datas");
						if(list.size()>0){
						for(int i=0;i<list.size();i++){ 
							Map<String, Object> map = list.get(i);
							String costs = (String)map.get("cost");
							Double cost = Double.parseDouble(costs)/100;
					%>
				    <li class="swipeout" style="height: 120px;margin: 8px 1px 10px 1px;background-color: #fff">
					      <div class="swipeout-content item-content">
					        <div class="item-inner"  >
					        	<table style="width: 100%">
					        		<tr>
					        			<td style="font-size: 18px;color: #1b1b1b"><img src="images/user@2x (2).png" width="24px;" height="24px;" style="vertical-align: middle;"/><%=map.get("enterpriseMemberName") %></td>
					        			<td align="right" style="font-size: 18px;color: #1b1b1b"><%=cost %></td>
					        		</tr>
					        		<tr>
					        			<td style="font-size: 18px;color: #949494"><%=map.get("orderStartTime") %></td>
					        			<td align="right" style="font-size: 18px;color: #f2503a">
					        			<%if("checkSucc".equals(map.get("orderState"))){ %>
					        			已审核
					        			<%}else if("checkWait".equals(map.get("orderState"))){ %>
					        			待审核
					        			<%}else if("checkFail".equals(map.get("orderState"))){ %>
					        			已驳回
					        			<%}else if("checkWithout".equals(map.get("orderState"))){ %>
					        			无需审核
					        			<%}else{ %>
					        			已取消
					        			<%} %>
					        			</td>
					        		</tr>
					        		<tr>
					        			<td colspan="2" style="font-size: 14px;color: #727272"><%=map.get("startPoint") %>→<%=map.get("endPoint") %></td>
					        		</tr>
					        	</table>
					        </div>
					      </div>
                        <%if("checkWait".equals(map.get("orderState"))){ %>
				      <div class="swipeout-actions-right">
				        <a href="#" class="action1 bg-blue" id="action1" onclick="checkSuccess('<%=map.get("orderNo")%>')">通过</a>
				        <a href="#" class="action2 bg-orange" id="action2" onclick="checkFail('<%=map.get("orderNo")%>')">驳回</a>
				      </div>
				      <%}else{ %>
				      <div class="swipeout-actions-right">
				        <a href="#" class="action3 bg-gray" id="action3" >无需审核</a>
				      </div>
				      <%} %>
				    </li>
				    <%}}else{%>
				 	没有记录
				    <%}}else{%>
				   	 操作失败
				    <%} %>
	  			</ul>
            </div>
          </div>
				</div>
          
          <!-- Integral Page-->
             <div data-page="integral" class="page cached">
				  <div class="list-block">
					 <div align="center" style="margin-top: 60px; margin-bottom: -22px;">
                       <img src="images/icon-wallet@3x.png" width="124" height="124">
                     </div>		
							
					     <div align="center" class="page-content">
							 <div class="content-block">
							    <p>可用积分</p>
								<p><font size="7px">${integral}</font></p>
							  </div>
						 </div> 			
					</div>			
				  <div class="content-block">
					<p><a href="#" class="button button-big button-round active" id="btnLogin">购买积分</a></p>
				 </div>					
			</div>
        
         <!--Charge Balance page-->
         <div data-page="chargeBalance" class="page cached">
				 <div class="list-block">
							<ul>
							<li>
								<div class="item-content">
										<div class="item-inner">
											<div align="left"
												style="margin-top: 5px; margin-bottom: 5px;">
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
								<li>
									<div class="item-content">
										<div class="item-inner">
                                            <div class="item-title label">金额</div>
											<div align="center" class="item-input">
												<input type="tel" name="name" placeholder="请输入金额">
											</div>
										</div>
									</div>
								</li>
							<li>
							 <div class="item-content">
									<div class="item-inner">
										<div align="center" class="item-input">
										 <p><font size="2px">余额不可退,不可作为押金使用</font></p>	
										</div>
									</div>
							  </div>
							</li>
							
							</ul> 			
					</div>			
				 <div class="content-block">
					<p><a href="#chargeSuccess" class="button button-big button-round active" >充值</a></p>
			</div>					
		 </div>  
		 
         <!--Charge Success Page-->		  	
		 <div data-page="chargeSuccess" class="page cached">
           
				  <div class="list-block">	
						<div align="center" class="page-content">
							 <div class="content-block">
							    <p>充值金额</p>
								<p><font size="7px">￥1500.00</font></p>
							  </div>
						 </div> 			
					</div>	
				  <div class="content-block">
					<p><a href="#index" class="button button-big button-round active" >完成</a></p>
				 </div>	 
				</div>		

         <!--Charge Deposit Page-->		
        <div data-page="chargeDeposit" class="page cached">
				 <div class="list-block">
							<ul>
							<li>
								<div class="item-content">
										<div class="item-inner">
											<div align="left"
												style="margin-top: 5px; margin-bottom: 5px;">
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
								<li>
									<div class="item-content">
										<div class="item-inner">
                                            <div class="item-title label">金额</div>
											<div align="center" class="item-input">
												<input type="tel" name="name" placeholder="不需要重复充值押金">
											</div>
										</div>
									</div>
								</li>
							<li>
							 <div class="item-content">
									<div class="item-inner">
										<div align="center" class="item-input">
										 <p><font size="2px">余额不可退,不可作为押金使用</font></p>	
										</div>
									</div>
							  </div>
							</li>
							
							</ul> 			
					</div>			
				 <div class="content-block">
					<p><a href="#chargeDepositSuccess" class="button button-big button-round active" >充值</a></p>
			</div>					
		 </div>  

    <!--Charge Deposit Success Page--> 
    	<div data-page="chargeDepositSuccess" class="page cached">
           
				  <div class="list-block">	
						<div align="center" class="page-content">
							 <div class="content-block">
							    <p>充值金额</p>
								<p><font size="7px">￥1500.00</font></p>
							  </div>
						 </div> 			
					</div>	
				 <div class="content-block">
					<p><a href="#deposit" class="button button-big button-round active" >完成</a></p>
				</div>	 
			</div>
   
   
        <!--Refund Page-->		
        <div data-page="refund" class="page cached">
				 <div class="list-block">
						<ul>
							<li>
								<div class="item-content">
										<div class="item-inner">
                                            <div class="item-title label">姓名</div>
											<div align="center" class="item-input">
												<input type="text" name="name" placeholder="开户行姓名">
											</div>
										</div>
									</div>
								</li>
								<li>
								<div class="item-content">
										<div class="item-inner">
                                            <div class="item-title label">卡号</div>
											<div align="center" class="item-input">
												<input type="text" name="name" placeholder="银行卡号">
											</div>
										</div>
									</div>
								</li>
							   <li>
								<div class="item-content">
										<div class="item-inner">
                                            <div class="item-title label">开户行</div>
											<div align="center" class="item-input">
												<input type="text" name="name" placeholder="开户行名称">
											</div>
										</div>
									</div>
								</li>
							   <li>
								<div class="item-content">
										<div class="item-inner">
                                            <div class="item-title label">原因</div>
											<div align="center" class="item-input">
												<input type="text" name="name" placeholder="请输入15字以内的退款原因">
											</div>
										</div>
									</div>
								</li>							
							</ul> 			
					</div>			
				 <div class="content-block">
					<p><a href="#refundSuccess" class="button button-big button-round active" >退款</a></p>
			</div>					
		 </div>  

       <!--Refund Success Page-->		 		
    	<div data-page="refundSuccess" class="page cached">
           
				  <div class="list-block">	
						<div align="center" class="page-content">
							 <div class="content-block">
							    <p>退款金额</p>
								<p><font size="7px">￥1500.00</font></p>
							  </div>
						 	 <div class="content-block">
							    <div style="border-bottom:1px solid #000">退款提示</div>
							    <p>申请退款成功后，工作人员会在3个工作日内审核并处理,请您耐心等待。如有疑问，请拨打客服电话咨询详情,客户电话：<span style="color:#007aff;">400-8900-7890</span></p>
							 </div>
						 </div> 								
					</div>	
				 <div class="content-block">
					<p><a href="#deposit" class="button button-big button-round active" >完成</a></p>
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
    
    $("#bindingCoupon").bind("click",function(){
    	
    	couponNo = $("#couponNo").val();
    	
    	$.ajax({
    		type:"post",
    		url:"binding_coupon",
    		data:{"couponNo":couponNo},
    		success:function(data){
    			if(data == "succ"){
    				myApp.alert("绑定优惠券成功", "");
    			}else{
    				myApp.alert(data, "");	
    			}
    		}  	   	
    	});
    });
    
    </script>
  </body>
</html>