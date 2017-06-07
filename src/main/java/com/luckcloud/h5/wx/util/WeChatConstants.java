package com.luckcloud.h5.wx.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 微信api常量
 * 
 * @author tiangai
 * @since 2014-06-30 Am 11:54
 * @version 1.0
 */
public class WeChatConstants {
	/**
	 * 日志文件
	 */
	public final static Logger log = LoggerFactory
			.getLogger(WeChatConstants.class);
	public final static String TEST_APPID="wxa31efec35fc29c46";
	public final static String TEST_APPSECRET="07bd8ed038b008e230633a15f54ee360";
	public final static String TEST_USER="ob7Nbt8Aa9dEdfsXSTU0mea3B-NI";
	/**
	 * 接收消息类型：文本
	 */
	public final static String RECRIVE_TEXT = "text";
	/**
	 * 接收消息类型：图片
	 */
	public final static String RECRIVE_IMAGE = "image";
	/**
	 * 接收消息类型：语音
	 */
	public final static String RECRIVE_VOICE = "voice";
	/**
	 * 接收消息类型：视频
	 */
	public final static String RECRIVE_VIDEO = "video";
	/**
	 * 接收消息类型：地理位置
	 */
	public final static String RECRIVE_LOCATION = "location";
	/**
	 * 接收消息类型：链接
	 */
	public final static String RECRIVE_LINK = "link";
	/**
	 * 接收消息类型：推送
	 */
	public final static String RECRIVE_EVENT = "event";

	/**
	 * 回复消息类型：文本
	 */
	public final static String REQUEST_TEXT = "text";
	/**
	 * 回复消息类型：图片
	 */
	public final static String REQUEST_IMAGE = "image";
	/**
	 * 回复消息类型：语音
	 */
	public final static String REQUEST_VOICE = "voice";
	/**
	 * 回复消息类型：视频
	 */
	public final static String REQUEST_VIDEO = "video";
	/**
	 * 回复消息类型：音乐
	 */
	public final static String REQUEST_MUSIC = "music";
	/**
	 * 回复消息类型：图文
	 */
	public final static String REQUEST_NEWS = "news";

	/**
	 * 事件类型：subscribe(订阅)
	 */
	public final static String EVENT_SUBSCRIBE = "subscribe";
	/**
	 * 事件类型：unsubscribe(取消订阅)
	 */
	public final static String EVENT_UNSUBSCRIBE = "unsubscribe";
	/**
	 * 事件类型：LOCATION(上报地理位置事件)
	 */
	public final static String EVENT_LOCATION = "LOCATION";
	/**
	 * 事件类型：CLICK(自定义菜单点击事件)
	 */
	public final static String EVENT_CLICK = "CLICK";
	/**
	 * 群发消息完成后的回调事件
	 */
	public final static String EVENT_MASS = "MASSSENDJOBFINISH";

	/**
	 * 扫描带参数二维码事件 用户扫描带场景值二维码时，可能推送以下两种事件：
	 * 1.如果用户还未关注公众号，则用户可以关注公众号，关注后微信会将带场景值关注事件推送给开发者。
	 * 2.如果用户已经关注公众号，则微信会将带场景值扫描事件推送给开发者。
	 */
	/**
	 * 事件类型：subscribe(用户未关注时，进行关注后的事件推送)
	 */
	public final static String EVENT_QRCODE_SUBSCRIBE = "subscribe";
	/**
	 * 事件类型：scan(用户已关注时的事件推送)
	 */
	public final static String EVENT_QRCODE_SCAN = "SCAN";

	/**
	 * 获取access_token的接口地址（GET） 限200（次/天）
	 */
	//public final static String GET_ACCESS_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";
	/**
	 * 开发者可通过OpenID来获取用户基本信息 url
	 */
	public final static String GET_PERSONALINF_URL = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN";
	/**
	 * 通过OpenID获取查询用户所在分组url
	 */
	public final static String GET_PERSONGROUPID_URL = "https://api.weixin.qq.com/cgi-bin/groups/getid?access_token=ACCESS_TOKEN";
	/**
	 * OAuth2.0引导关注者打开 用户同意授权，获取code页面url.<br/>
	 * 1.scope的设置为：snsapi_base（不弹出授权页面，直接跳转，只能获取用户openid）snsapi_userinfo（弹出授权页面)<br/>
	 * 2.redirect_uri：授权后重定向的回调链接地址，请使用urlencode对链接进行处理<br/>
	 * 方法再commonutil的urlEncodeUTF8()<br/>
	 */
	public final static String FANS_GET_CODE = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=REDIRECT_URI&response_type=code&scope=SCOPE&state=STATE#wechat_redirect";
	/**
	 * OAuth2.0通过code换取网页授权access_token
	 */
	public final static String OAUTH2_ACCESSTOKEN_URL = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
	/**
	 * OAuth2.0刷新access_token
	 */
	public final static String REFRESH_ACCESSTOKEN_URL = "https://api.weixin.qq.com/sns/oauth2/refresh_token?appid=APPID&grant_type=refresh_token&refresh_token=REFRESH_TOKEN";
	/**
	 * OAuth2.0拉取用户信息(需scope为 snsapi_userinfo)
	 */
	public final static String OAUTH2_USERINFO_URL = "https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN";
	/**
	 * 主动发送客服消息url
	 */
	public final static String SEND_CUSTOM_URL = "https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=ACCESS_TOKEN";
	/**
	 * 生成临时二维码url
	 */
	public final static String TEMPORARY_QRCODE_URL = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=ACCESS_TOKEN";
	/**
	 * 生成永久二维码url
	 */
	public final static String PERMANENT_QRCODE_URL = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=ACCESS_TOKEN";
	/**
	 * 换取二维码url
	 */
	public final static String GET_QRCODE_URL = "https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=TICKET";
	/**
	 * 获取关注者列表url
	 */
	public final static String GET_USERLIST_URL = "https://api.weixin.qq.com/cgi-bin/user/get?access_token=ACCESS_TOKEN&next_openid=NEXT_OPENID";

	/**
	 * 获取所有分组信息url
	 */
	public final static String GET_GROUPS_URL = "https://api.weixin.qq.com/cgi-bin/groups/get?access_token=ACCESS_TOKEN";
	/**
	 * 创建分组url
	 */
	public final static String CREATE_GROUPS_URL = "https://api.weixin.qq.com/cgi-bin/groups/create?access_token=ACCESS_TOKEN";
	/**
	 * 修改分组url
	 */
	public final static String UPDATE_GROUPS_URL = "https://api.weixin.qq.com/cgi-bin/groups/update?access_token=ACCESS_TOKEN";
	/**
	 * 移动用户分组url
	 */
	public final static String REMOVE_MEMBER_URL = "https://api.weixin.qq.com/cgi-bin/groups/members/update?access_token=ACCESS_TOKEN";

	/**
	 * 上传多媒体文件url
	 */
	public final static String UPLOAD_MEDIA_URL = "http:/**file.api.weixin.qq.com/cgi-bin/media/upload?access_token=ACCESS_TOKEN&type=TYPE";
	/**
	 * 下载多媒体文件url
	 */
	public final static String DOWNLOAD_MEDIA_URL = "http:/**file.api.weixin.qq.com/cgi-bin/media/get?access_token=ACCESS_TOKEN&media_id=MEDIA_ID";

	/**
	 * 菜单创建（POST） 限100（次/天）
	 */
	public final static String CREATE_MENU_URL = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN";
	/**
	 * 菜单查询（GET）
	 */
	public final static String GET_MENU_URL = "https://api.weixin.qq.com/cgi-bin/menu/get?access_token=ACCESS_TOKEN";
	/**
	 * 菜单删除（GET）
	 */
	public final static String DELETE_MENU_URL = "https://api.weixin.qq.com/cgi-bin/menu/delete?access_token=ACCESS_TOKEN";
	/**
	 * 上传图文消息素材 (高级群发接口)
	 */
	public final static String UPLOAD_NEWS_URL = "https://api.weixin.qq.com/cgi-bin/media/uploadnews?access_token=ACCESS_TOKEN";
	/**
	 * 根据分组进行群发 (高级群发接口)
	 */
	public final static String SEND_MASS_MSG_URL = "https://api.weixin.qq.com/cgi-bin/message/mass/sendall?access_token=ACCESS_TOKEN";
	/**
	 * 上传视频(高级群发接口)
	 */
	public final static String UPLOAD_VIDEO_URL = "https://file.api.weixin.qq.com/cgi-bin/media/uploadvideo?access_token=ACCESS_TOKEN";
	/**
	 * 根据OpenID列表群发
	 */
	public final static String SEND_MASS_MSG_OPENID_URL = "https://api.weixin.qq.com/cgi-bin/message/mass/send?access_token=ACCESS_TOKEN";
	/**
	 * 删除群发(高级群发接口)<br/>
	 * 请注意，只有已经发送成功的消息才能删除删除消息只是将消息的图文详情页失效，<br/>
	 * 已经收到的用户，还是能在其本地看到消息卡片。<br/>
	 * 另外，删除群发消息只能删除图文消息和视频消息，其他类型的消息一经发送，无法删除。
	 */
	public final static String DELETE_MASS_MSG_URL = "https://api.weixin.qq.com//cgi-bin/message/mass/delete?access_token=ACCESS_TOKEN";
	/**
	 * 开发者可以通过该接口对指定用户设置备注名，该接口暂时开放给微信认证的服务号
	 */
	public final static String SET_USER_REMARK_URL = "https://api.weixin.qq.com/cgi-bin/user/info/updateremark?access_token=ACCESS_TOKEN";
	/**
	 * 获取预支付订单
	 */
	public final static String CREATE_ORDER_URL = "https://api.mch.weixin.qq.com/pay/unifiedorder";
	/**
	 *jsapi_ticket是公众号用于调用微信JS接口的临时票据。正常情况下，jsapi_ticket的有效期为7200秒，通过access_token来获取。
	 */
	//public final static String JSAPI_TICKET_URL ="https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi";
	
	/**
	 * 发送模板消息
	 * */
	public final static String   SEND_TEMPLATE_MESSAGE_URL = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=ACCESS_TOKEN";

	/**
	 * 微信支付预支付
	 * */
	public final static String  PRE_ORDER_URL = "https://api.mch.weixin.qq.com/pay/unifiedorder";
	/**
	 * 查询订单支付情况
	 * */
	public final static String ORDER_QUERY_URL = "https://api.mch.weixin.qq.com/pay/orderquery";
	
	/**
	 * 关闭交易订单
	 * */
	public final static String CLOSE_ORDER_URL = "https://api.mch.weixin.qq.com/pay/closeorder";
	
	/**
	 * 退款
	 * */
	public final static String REFUND_URL = "https://api.mch.weixin.qq.com/secapi/pay/refund";
	/**
	 * 查询退款
	 * *
	 */
	public final static String REFUND_URL_QUERY = "https://api.mch.weixin.qq.com/pay/refundquery";
	
	/**
	 * 下载对账单
	 * */
	public final static String DOWNLOAD_BILL_URL = "https://api.mch.weixin.qq.com/pay/downloadbill";
	
	/**
	 * 发起企业付款URL
	 */
	public final static String  TRANSFERS_URL="https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers";
	
	/**
	 * 查询企业付款URL
	 */
	public final static String TRANSFERS_QUERY_URL = "https://api.mch.weixin.qq.com/mmpaymkttransfers/gettransferinfo";
	
	/**
	 * 摇一摇周边
	 * 申请设备ID
	 */
	public final static String APPLY_DEVICE_ID_URL = "https://api.weixin.qq.com/shakearound/device/applyid?access_token=ACCESS_TOKEN";
	
	/**
	 * 摇一摇周边
	 * 查询设备列表
	 */
	public final static String SEARCH_DEVICE_URL ="https://api.weixin.qq.com/shakearound/device/search?access_token=ACCESS_TOKEN";

	/**
	 * 摇一摇周边
	 * 新增页面
	 */
	public final static String PAGE_ADD_URL = "https://api.weixin.qq.com/shakearound/page/add?access_token=ACCESS_TOKEN";

	/**
	 * 摇一摇周边
	 * 编辑页面信息
	 */
	public final static String PAGE_UPDATE_URL = "https://api.weixin.qq.com/shakearound/page/update?access_token=ACCESS_TOKEN";
	
	/**
	 * 摇一摇周边
	 * 查询页面列表
	 */
	public final static String PAGE_SEARCH_URL = "https://api.weixin.qq.com/shakearound/page/search?access_token=ACCESS_TOKEN";

	/**
	 * 摇一摇周边
	 * 删除页面
	 */
	public final static String PAGE_DELETE_URL = "https://api.weixin.qq.com/shakearound/page/delete?access_token=ACCESS_TOKEN";
	
	/**
	 * 摇一摇周边
	 * 配置设备与页面的关联关系
	 */
	public final static String DEVICE_BINDPAGE_URL = "https://api.weixin.qq.com/shakearound/device/bindpage?access_token=ACCESS_TOKEN";
	
	/**
	 * 摇一摇周边
	 * 获取摇周边的设备及用户信息
	 */
	public final static String USER_GETSHAKEINFO_URL = "https://api.weixin.qq.com/shakearound/user/getshakeinfo?access_token=ACCESS_TOKEN";
	

	
	
	
	
}
