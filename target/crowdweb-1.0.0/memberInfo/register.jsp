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

    <div class="statusbar-overlay"></div>
    <!-- Panels overlay-->
    <!-- Views-->
    <div class="views">

      <div class="view view-main">
        <!-- Top Navbar-->
        <div class="navbar">
          <!-- Navbar inner for Index page-->
          <div data-page="index" class="navbar-inner">
            
            <div class="left"> <a href="#" class="link" id="btnBack"> <i class="icon icon-back"></i> <span>返回</span></a> 
            </div> 
            <div class="center sliding">注册</div>
          </div>
          
          <!-- Service Provision Page-->
          <div data-page="serviceProvision" class="navbar-inner cached">
            <div class="left sliding"><a href="#" class="back link"><i class="icon icon-back"></i><span>返回</span></a></div>
            <div class="center sliding">服务条款</div>
			<div class="right sliding"><a href="#" class="back link"><span>同意</span></a></div>
          </div>
  
        </div>
        <!-- Pages, because we need fixed-through navbar and toolbar, it has additional appropriate classes-->
        <div class="pages navbar-through toolbar-through">
          <!-- Index Page-->
          <div data-page="index" class="page">
            <!-- Scrollable page content-->
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
								<li>
									<div class="item-content">
										<div class="item-inner">
											<div align="left"
												style="margin-top: 5px; margin-bottom: 5px;">
												<img src="images/lock@3x.png" width="30" height="25">
											</div>
											<div class="item-input">
												<input type="password" name="name" placeholder="密码为手机号后六位">
											</div>
										</div>
									</div>
								</li>
								<li>
									<div class="item-content">
										<div class="item-inner">
											<div align="left"
												style="margin-top: 5px; margin-bottom: 5px;">
												<img src="images/iPhone@3x.png" width="30" height="25">
											</div>
											<div class="left" class="item-input">
												<input type="tel" id="phone" name="phone" placeholder="请输入短信验证码">
											</div>
										   <div class="right">
										     <a href="#" class="" id="gainsms"><span>获取验证码</span> </a>
										   </div>
										</div>
									</div>
								</li>
							</ul>
							
							<div class="item-content">
							<div class="context">
							 <div class="left" style="margin-top: 1px; margin-bottom: 1px;">
									<img src="images/checkbox2@3x.png" width="20" height="25">
								</div>
								<div class="right">
								   <span>同意</span>
									<a href="#serviceProvision" class="link" id="btnBack"> 
									<span>《会员服务条款》 </span>
									</a>								
								</div>
                              </div>
							</div>	
						</div>
              
 						<div class="content-block">
							<p><a href="#" class="button button-big button-round active" id="registerMember">注册</a></p>
						</div>	
						            
              <div class="content-block">
              </div>
          </div>
          
          <!-- Service Provision Page-->
          <div data-page="serviceProvision" class="page cached">
            <div class="page-content">
              <div class="content-block">
									<p>
										<B>“祥云交通科技有限公司”会员服务条款</B>
									</p>
									<p>您确认，在您注册成为“祥云交通科技有限公司（域名为www.xcloudstrip.com，以下简称为“祥云出行”）”会员并接受服务之前，您已充分阅读、理解并接受本条款全部内容，一旦您使用祥云出行服务，即表示您同意遵循本条款之所有约定。</p>
									<p>您同意，本公司有权随时对本条款内容进行单方面的变更，并以在祥云出行网站公告的方式予以公布，无需另行单独通知您；若您在本条款内容公告变更后继续使用本服务的，表示您已充分阅读、理解并接受修改后的条款内容，也将遵循修改后的条款内容使用本服务；若您不同意修改后的条款内容，您应停止使用本服务。</p>
									<p>您声明，您同意接受本条款并注册成为祥云出行会员。您是具有法律规定的完全民事权利能力和民事行为能力，能够独立承担民事责任的自然人。不具备前述条件的，您应立即终止注册或停止使用本服务。</p>
									<p>
										<B>1.定义</B><br>“会员”是指按照祥云出行的要求完成注册的祥云出行用户。用户可以通过手机注册成为祥云出行会员，享受祥云出行为会员提供的服务。
									</p>
									<p>
										<B>2.会员资格</B><br>2.1.凡年龄在18周岁（含）以上、持有国内有效驾驶执照，均可申请成为会员。<br>2.2.如果会员的驾照在任何时间被吊销、没收、失效或其状态发生变化，会员必须立即通知祥云出行,
										会员将不被批准使用或预订任何祥云出行车辆。<br>2.3.
										港澳台客户或外籍客户，首次租车时可提前一个工作日致电祥云出行呼叫中心，提交证件扫描件及客户资质详情,祥云出行将根据实际情况提供具体租车办法。
									</p>
									<p>
										<B>3．会员义务及权利</B><br>会员资格仅限会员本人使用。<br>3.1. 会员权利<br>会员享有使用祥云出行产品和服务的权益。<br>3.2.会员义务<br>3.2.1会员租车时需遵守祥云出行的产品和服务规定。<br>3.2.2会员的资料发生变更时，应及时通知祥云出行。
									</p>
									<p>
										<B>4.会员注册</B><br>用户下载祥云出行APP，按要求填写注册信息，上传相关证件照片，完成会员注册过程。
									</p>
									<p>
										<B>5.会员激活</B><br>用户资料一旦审核通过，用户将会在第一时间收到审核通过通知；若用户提交资料完整，但存在原因未审核通过，也将在第一时间收到未审核通过通知。
									</p>
									<p>
										<B>6.服务预订</B><br>会员登录手机客户端，根据提示预订车辆。
									</p>
									<p>
										<B>7.结算流程</B><br>7.1.会员预订车辆时，需充值押金和余额，租车费用结算时从余额中扣除。<br>7.2.会员车辆使用完毕后，请行至任一分时共享网点，并停放到“分时租赁专用车位”上，通过手机客户端按照要求完成还车操作即可。<br>7.3.充值押金和余额可选择支付宝、微信、银联、Apple
										Pay支付。
									</p>
									<p>
										<B>8.网点取车</B><br>会员可在预订后10分钟内需找到车辆并开门上车，否则订单将自动取消。租车费用将按您实际的用车时间和里程计算。<br>8.1.注意事项<br>8.1.1取车前确认车辆外观、内饰是否完好无损，若发现破损或划痕请立即拨打呼叫中心电话说明情况，以免造成您不必要的损失。<br>8.1.2车辆若正在充电，请根据充电桩使用须知进行操作。特别提醒先断电后再拔下充电桩线。<br>8.1.3确认车辆电量超过3格，若电量不足3格，请尽快联系呼叫中心，我们将尽快为您安排另一辆车，以免车辆无电影响您的行程。<br>8.1.4确认车辆驾驶无异常，确认车辆车灯、刹车、车窗等无问题，以保障您的用车安全。
									</p>
									<p>
										<B>9.费用项目</B><br>9.1.租金费用：车辆分时租赁费用，具体计费方式请浏览祥云出行APP。 <br>9.2.违约金：若会员存在违章，祥云出行客服人员电话/短信/邮件通知会员违章信息，并要求会员处理，自通知之日起，超过时限（25天）不处理则收取违约金200元/天。
									</p>
									<p>
										<B>10.使用限制</B><br>10.1.会员不得以任何方式将汽车提供给任何非授权驾驶人驾驶。<br>10.2.应遵守各项法律法规，不得将租赁车辆转卖、抵押、质押、转借、典当、转租租赁车辆及从事营利性营运，不得利用车辆从事不符合其功能的运输。<br>10.3.会员不得将汽车任何非法或粗鲁方式使用；或用于比赛或速度竞赛；或运送易燃易爆物品、化学品、易腐物品或其它有害原材料或任何种类和性质的污染物质。<br>10.4.任何服用酒精、麻醉品或药物的人员不得驾驶，无论其是否在医生的指导下使用上述物品。<br>10.5.会员不得将汽车行驶到任何没有铺设路面的土路上行驶或越野行驶，祥云出行以书面形式批准的除外。<br>10.6.汽车不得承载超出核定限乘人数以外的乘客。<br>10.7.会员不得拆除车内配备的任何物品。<br>10.8.会员违反使用限制，将承担因此而造成的全部法律责任和经济赔偿责任。祥云出行可在不向会员发出通知的情况下，终止其使用汽车的权利和会员资格。祥云出行保留法律规定的权利，包括但不限于不经过法律程序向会员发出通知而扣押汽车，会员有义务支付所有祥云出行将汽车追回所发生的费用。<br>10.9.如果会员在使用权利终止后继续使用汽车，祥云出行有权通知公安机关车辆被盗。
									</p>
									<p>
										<B>11.车辆使用</B><br>11.1.若发现车辆仪表盘出现任何警告信息或问题、请立即找到安全地点停车并拨打呼叫中心电话，将为您安排紧急救援。<br>11.2.请遵守交通规则，请勿超速行驶。（建议时速在40至60公里，匀速行驶）。<br>11.3.非特殊情况请勿打开远光灯。<br>11.4.车辆使用过程中，需将车辆停放时，请先熄火关门。<br>11.5.不对任何会员个人财物的损坏或丢失负责。车内承载、放置或遗留的任何个人财物均不对祥云出行构成任何委托责任。
									</p>
									<p>
										<B>12.还车支付</B><br>12.1.前往任一分时共享网点，将车辆停放到“分时租赁专用车位”上。<br>12.2.注意不要停在他人专属停车位上，不要停在属违章停车范畴的位置上，若因违规乱停造成的罚款，须自行负责。<br>12.3.关闭好车窗、车灯、电子设备及车门。<br>12.4.请点击手机客户端“还车”按钮，选择最优停车场，确定结束用车，并按提示完成支付。<br>12.5.只有通过手机客户端点击“还车”成功后，方才表示用车结束，并停止计费。否则，该车一直为计费状态。
									</p>
									<p>
										<B>13.交通违章及退款</B><br>13.1.违章<br>13.1.1会员租期内的违章及相关费用由会员自行承担。祥云出行将定期查询车辆违章情况,若存在违章,祥云出行客服人员电话/短信/邮件通知会员违章信息，并要求会员处理，自通知之日起，超过时限（25天）不处理则收取违约金200元/天。
										若会员要求代办，祥云出行将适情开展代办收费业务。<br>1)仅罚款，不扣分的：原则上要求会员自行办理。<br>2)罚款并扣分的：通过邮件、微信等方式传车辆行驶证至用户，会员自行办理。<br>13.2退款<br>13.2.1会员申请押金退还时，祥云出行将停止会员所有会员卡的使用功能。<br>13.2.2租车押金退还。<br>1）若会员在租车使用期间无违章，则在确定无违章日起7个工作日之内发起退款，实际到帐时间，以银行到帐期限为准。<br>2）若会员在租车使用期间有违章，则在违章处理完毕后7个工作日之内发起退款，实际到帐时间，以银行到帐期限为准。<br>13.2.3当会员存在违约行为，相关违约金，祥云出行有权直接扣除押金作为违约金，不足部分由会员补足。此外，由此给祥云出行造成的一切经济损失及法律责任均由会员承担。
									</p>
									<p>
										<B>14.交通事故和保险索赔</B><br>祥云出行已为出租车辆投保了交强险、车辆损失险、第三者责任险、盗抢险，投保额参见《保险费明细》。<br>14.1.发生包括但不限于交通意外事故及人员伤亡和车损等情况后，根据法定主管部门的事故认定意见，在保险公司索赔范围以外的责任与赔偿由会员自行承担。<br>14.2.如发生事故的，会员应协助祥云出行向保险公司进行理赔，会员应如实提供交通管理部门、保险公司出具的事故证明、责任裁定书、事故调解书、判决书等文件。<br>14.3.因会员使用租赁车辆导致的违章及罚款，由祥云出行定期查询车辆违章信息并电话通知会员，由会员自行处理，如逾期不处理造成的损失则由会员承担。
									</p>
									<p>
										<B>15.免责条款</B><br>15.1.有下列情况之一的，祥云出行不承担任何法律责任：<br>1)由于您将会员密码告知他人或与他人共享注册帐户，而导致的任何个人资料泄露。<br>2)任何由于计算机2000年问题、黑客攻击、计算机病毒侵入或发作、政府管制等造成的暂时性关闭，使网络无法正常运行而造成的个人资料泄露、丢失、被盗用或被窜改。<br>3)由于与本网站链接的其他网站所造成个人资料泄露及由此而导致的任何法律争议和后果。<br>4)因不可抗力而引起的任何后果。<br>15.2.根据《中华人民共和国宪法》和相关法律法规规定，在保护公民合法言论自由的同时，禁止利用互联网、通讯工具、媒体以及其他方式从事以下行为：<br>1)组织、煽动抗拒、破坏宪法和法律、法规实施的。<br>2)捏造或者歪曲事实，散布谣言，妨害社会管理秩序的。<br>3)组织、煽动非法集会、游行、示威、扰乱公共场所秩序的。<br>4)从事其他侵犯国家、社会、集体利益和公民合法权益的。管理部门将依法严加监管上述行为并予以处理；对构成犯罪的，司法机关将追究刑事责任。<br>5)我们将致力于保护您的个人信息，尽全力保证这些信息的安全。由于网上技术的发展突飞猛进，我们会随时更新我们的信息保密制度。所有的修订将在此站点公布。
									</p>
									<p>
										<B>16. 附则</B><br>16.1
										祥云出行有权在任何时候更改祥云出行会员服务计划的任何规定或终止当年会员服务计划，即使计划的修改或终止会影响会员积分累积，且不承担事先通知的义务。<br>16.2
										本章程由祥云出行制定，祥云出行拥有最终解释权。
									</p>              
              </div>
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
    
    $("#registerMember").bind("click",function(){
    	
    	phone = $("#phone").val();
    	
    	$.ajax({
    		type:"post",
    		url:"register_member",
    		data:{"phone":phone},
    		success:function(data){
    			if(data == "succ"){
    				myApp.alert("注册成功", "");
    			}
    			if(data == "fail"){
    				myApp.alert("注册失败", "");
    			}
    		}
    	});
    });    
    
    </script>
  </body>
</html>