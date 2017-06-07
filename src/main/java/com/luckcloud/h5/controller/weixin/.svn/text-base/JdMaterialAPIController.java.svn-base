package com.luckcloud.h5.controller.weixin;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.Consts;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.conn.tsccm.ThreadSafeClientConnManager;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;
import com.luckcloud.h5.dto.RaiseEntityDto;
import com.luckcloud.h5.dto.zlProductShow.ZlProductListDto;
import com.luckcloud.h5.model.Raise;
import com.luckcloud.h5.util.HttpUtils;
import com.luckcloud.h5.util.MD5Util;
import com.luckcloud.h5.util.PropertyUtil;
import com.luckcloud.h5.util.WriteUtil;

import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/jd")
public class JdMaterialAPIController {
	HttpUtils httpUtils = new HttpUtils();
    private final Logger logger = Logger.getLogger(getClass());

    /**
     * 通过jd物料接口跳转jd领奖页面
     */
    @RequestMapping(value = "/toReceiveAward",method = { RequestMethod.GET , RequestMethod.POST })
	public void toReceiveAward(HttpServletRequest request,  HttpServletResponse response, 
			ModelMap model, @RequestParam(value = "orderId", required = false) String orderId) throws Exception {
    	logger.error("-----------调用京东物料接口，成功返回领奖url------------");
    	RaiseEntityDto dto = null;
    	Raise raise = null;
    	String type = null;
    	String returnDataJson = httpUtils.post(PropertyUtil.getString("select_raise_ByOrderId_url"),orderId) ;
		logger.info("returnDataJson="+returnDataJson);
		if(returnDataJson != null){
			dto = JSON.parseObject(returnDataJson,RaiseEntityDto.class);
			raise = dto.getRaise();
			if(raise != null){
				type = raise.getPrizeType();
			}
		}
    	//物料接口url
//    	String url = "http://lywl.v-qr.com/Interface/IFAddV4.ashx";//测试地址
    	//String url = "http://lywl.zl88.cn/Interface/IFAddV4.ashx";//正式地址
    	String url = PropertyUtil.getString("get_jd_award_url");
    	String oid = PropertyUtil.getString("order_prefix")+orderId; //"zl2017zc20170504"
    	logger.error("-----------订单id="+oid+"------------");
    	String returnJson = "";
    	Map<String,String> map = new HashMap<String,String>();
    	try {
    		//post请求获取物料接口URL
    		if(type != null){
    			returnJson = post2Server_toReceiveAward(url,oid,"0",type);
    			JSONObject jsonObj = JSONObject.fromObject(returnJson);
    			logger.error(returnJson);
    			if(jsonObj.get("AIAPI_Res_Code").equals("0")){
    				String touUrl = jsonObj.get("URL").toString();
    				map.put("url", touUrl);
    				map.put("sucess", "true");
    				map.put("message", "请求成功");
    			}else{
    				map.put("sucess", "false");
    				map.put("message", jsonObj.get("AIAPI_Res_Error").toString());
    			}
    		}else{
    			map.put("sucess", "false");
				map.put("message", "找不到该订单所对应的众筹活动，或者众筹活动里没有奖品类型");
				logger.error("调用京东物料领奖接口：找不到该订单所对应的众筹活动，或者众筹活动里没有奖品类型");
    		}
		} catch (Exception e) {
			e.printStackTrace();
		}
    	WriteUtil.outObject(response, JSONObject.fromObject(map).toString());
    }
    
    /**
     * 调用京东物料接口,成功返回查询物流url
     * @throws Exception
     */
    @RequestMapping(value = "/toSearchJdLogistics",method = { RequestMethod.GET , RequestMethod.POST })
	public void toSearchJdLogistics(HttpServletRequest request,  HttpServletResponse response,
			@RequestParam(value = "orderId", required = false) String orderId) throws Exception {
    	logger.error("-----------调用京东物料接口，成功返回查询物流url------------");
    	RaiseEntityDto dto = null;
    	Raise raise = null;
    	String type = null;
    	String returnDataJson = httpUtils.post(PropertyUtil.getString("select_raise_ByOrderId_url"),orderId) ;
		logger.info("returnDataJson="+returnDataJson);
		if(returnDataJson != null){
			dto = JSON.parseObject(returnDataJson,RaiseEntityDto.class);
			raise = dto.getRaise();
			if(raise != null){
				type = raise.getPrizeType();
			}
		}
    	
    	//物料接口url
//    	String url = "http://lywl.v-qr.com/interface/ifgetv3.ashx";//测试地址
    	//String url = "http://lywl.zl88.cn/interface/ifgetv3.ashx";//正式地址
    	String url = PropertyUtil.getString("get_jd_logistics_information_url");
    	String oId = PropertyUtil.getString("order_prefix")+orderId;
    	logger.error("-----------订单id="+oId+"------------");
    	String returnJson = "";
    	Map<String,String> map = new HashMap<String,String>();
    	try {
    		//post请求获取物料接口URL
    		if(type != null){
    			returnJson = post2Server_toReceiveAward(url,oId,"1",type);
    			JSONObject jsonObj = JSONObject.fromObject(returnJson);
    			if(jsonObj.get("AIAPI_Res_Code").equals("0")){
    				String touUrl = jsonObj.get("URL").toString();
    				map.put("url", touUrl);
    				map.put("sucess", "true");
    				map.put("message", "请求成功");
    			}else{
    				map.put("sucess", "false");
    				map.put("message", jsonObj.get("AIAPI_Res_Error").toString());
    			}
    		}else{
    			map.put("sucess", "false");
				map.put("message", "找不到该订单所对应的众筹活动，或者众筹活动里没有奖品类型");
				logger.error("调用京东物料接口查询物流：找不到该订单所对应的众筹活动，或者众筹活动里没有奖品类型");
    		}
		} catch (Exception e) {
			e.printStackTrace();
		}
    	logger.error("调用京东物料接口返回数据：");
    	logger.error(returnJson);
    	WriteUtil.outObject(response, JSONObject.fromObject(map).toString());
    }
    
    /**
     * 
     * @param url
     * @param orderId
     * @param postType 0:获取物料接口；1:查询接口
     * @return
     * @throws ClientProtocolException
     * @throws IOException
     */
    public static String post2Server_toReceiveAward(String url, String orderId, String postType, String type) throws ClientProtocolException, IOException{
		DefaultHttpClient httpclient = new DefaultHttpClient(/*httpclient 4.2.3版本*/
				new ThreadSafeClientConnManager());
		httpclient.getParams().setBooleanParameter(
				"http.protocol.expect-continue", false);
		HttpPost httpost = new HttpPost(url);
		httpost.addHeader("Connection", "close");
		List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String aiapi_timestamp = df.format(new Date());
		SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = df2.format(new Date());
		
		nvps.add(new BasicNameValuePair("aiapi_appid", PropertyUtil.getString("aiapi_appid")));//应用id
		nvps.add(new BasicNameValuePair("aiapi_source", PropertyUtil.getString("aiapi_source")));//
		nvps.add(new BasicNameValuePair("aiapi_sign", getMd5String(orderId,aiapi_timestamp,time,type)));//数字签名md5加密
		nvps.add(new BasicNameValuePair("aiapi_timestamp", aiapi_timestamp));//客户端时间
		nvps.add(new BasicNameValuePair("aiapi_sign_method", "md5"));
		nvps.add(new BasicNameValuePair("Id", orderId));//订单id
//		nvps.add(new BasicNameValuePair("Type", PropertyUtil.getString("type")));//提供的礼品类型值type
		nvps.add(new BasicNameValuePair("Type", type));
		nvps.add(new BasicNameValuePair("qrcode", orderId));//二维码
		if(postType.equals("0")){
			nvps.add(new BasicNameValuePair("time", time));//
//			nvps.add(new BasicNameValuePair("OpenID", null));
		}
		if(postType.equals("1")){
//			nvps.add(new BasicNameValuePair("name", null));
//			nvps.add(new BasicNameValuePair("phone", null));
			nvps.add(new BasicNameValuePair("time", time));//扫码时间,如20141114142239
		}


		httpost.setEntity(new UrlEncodedFormEntity(nvps, Consts.UTF_8));

		HttpResponse response = httpclient.execute(httpost);
		HttpEntity entity = response.getEntity();
		InputStream inputStream = entity.getContent();
		// -------------------------------------------------------------------

		BufferedReader br = new BufferedReader(new InputStreamReader(inputStream,
				"UTF-8"));
		String resource = "";
		String temp;
		while ((temp = br.readLine()) != null) {
			resource += temp;
		}
		EntityUtils.consume(entity);
		
		return resource;
	}
    
    /**
	 * MD5加密
	 * @return
	 */
    public static String getMd5String(String id, String aiapi_timestamp, String time, String type) {
		String aiapi_appid = PropertyUtil.getString("aiapi_appid");
		String aiapi_source = PropertyUtil.getString("aiapi_source");
		String signStr = aiapi_appid + aiapi_source + aiapi_timestamp + id + id + type + time;
	
		return MD5Util.encode2hex(signStr).toUpperCase();
	}
    
//    @RequestMapping(value = "/test",method = { RequestMethod.GET , RequestMethod.POST })
//   	public void test(HttpServletRequest request,  HttpServletResponse response1) throws Exception {
//       	DefaultHttpClient httpclient = new DefaultHttpClient(/*httpclient 4.2.3版本*/
//				new ThreadSafeClientConnManager());
//		httpclient.getParams().setBooleanParameter(
//				"http.protocol.expect-continue", false);
//		
//		String url = "http://127.0.0.1:8080/raise4wx/receiveJdReturnData";//测试地址
////		String url = "http://zl.haiyunzy.com/crowdweb/raise4wx/receiveJdReturnData";//测试地址
//		HttpPost httpost = new HttpPost(url);
//		httpost.addHeader("Connection", "close");
//		List<NameValuePair> nvps = new ArrayList<NameValuePair>();		
//		
//		nvps.add(new BasicNameValuePair("ID", "zl2017zc127"));//应用id
//		nvps.add(new BasicNameValuePair("QRCode", PropertyUtil.getString("qrcode")));//zl2017zc
////		nvps.add(new BasicNameValuePair("QRCode", "zl2017zc"));
//		nvps.add(new BasicNameValuePair("Name", "testname"));//数字签名md5加密
//		nvps.add(new BasicNameValuePair("Phone", "13669423757"));//客户端时间
//		nvps.add(new BasicNameValuePair("Type", "Z"));
//		nvps.add(new BasicNameValuePair("OrderTime", "2017-05-05 13:00:00"));							
//		String sign = "zl2017zc127"+PropertyUtil.getString("qrcode")+"testname"+"13669423757"+"Z"+"2017-05-05 13:00:00"+PropertyUtil.getString("jdReturnDataKey");
//		logger.error(sign);
//		nvps.add(new BasicNameValuePair("Sign", MD5Util.encode2hex(sign).toUpperCase()));
//		nvps.add(new BasicNameValuePair("State", "sucess"));
//
//		httpost.setEntity(new UrlEncodedFormEntity(nvps, Consts.UTF_8));
//
//		HttpResponse response = httpclient.execute(httpost);
//		HttpEntity entity = response.getEntity();
//		InputStream inputStream = entity.getContent();
//		// -------------------------------------------------------------------
//
//		BufferedReader br = new BufferedReader(new InputStreamReader(inputStream,
//				"UTF-8"));
//		String resource = "";
//		String temp;
//		while ((temp = br.readLine()) != null) {
//			resource += temp;
//		}
//		EntityUtils.consume(entity);
//		
//		WriteUtil.outObject(response1, resource);
//    }
   
//    @RequestMapping(value = "/getUUID",method = { RequestMethod.GET , RequestMethod.POST })
//    public void getUUID(HttpServletRequest request,  HttpServletResponse response1) {  
//        UUID uuid = UUID.randomUUID();  
//        String str = uuid.toString();  
//        // 去掉"-"符号  
//        String temp = str.substring(0, 8) + str.substring(9, 13) + str.substring(14, 18) + str.substring(19, 23) + str.substring(24);  
//        logger.error(str+","+temp); 
//    } 
}
