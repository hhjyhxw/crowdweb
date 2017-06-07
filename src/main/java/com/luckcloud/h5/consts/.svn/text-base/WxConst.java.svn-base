package com.luckcloud.h5.consts;

public class WxConst {

	public final static String appid="wxccb43a09acc5a5c8";
	public final static String appsecret="4ec7b99d2e30af34c51696c6b2e7febb";
	
	//用于加密openid的key 值
	public final static String openidkey="alpjafjlajfeillakjfjafjafjlalvmpdoenvlde";
	
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
	 * 获取用户基本信息
	 */
	public final static String USER_INFO = "https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN";
}
