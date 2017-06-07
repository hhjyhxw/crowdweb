package com.luckcloud.h5.controller.weixin;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.conn.tsccm.ThreadSafeClientConnManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;
import com.luckcloud.h5.dto.BaseDto;
import com.luckcloud.h5.dto.RaiseOrderItemsDto;
import com.luckcloud.h5.model.AwardRecord;
import com.luckcloud.h5.model.RaiseOrder;
import com.luckcloud.h5.util.EmsUtil;
import com.luckcloud.h5.util.HttpUtils;
import com.luckcloud.h5.util.MD5Util;
import com.luckcloud.h5.util.PropertyUtil;
import com.luckcloud.h5.util.WriteUtil;
import com.luckcloud.h5.vo.VipTrackInfoVo;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/raise4wx")
public class AwardRecord4WxController {
	HttpUtils httpUtils = new HttpUtils();
    private final Logger logger = Logger.getLogger(getClass());
    
    /**
     * 查看物流接口(通过快递单号查询)
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "/logisticsByEmsNo",method = { RequestMethod.GET , RequestMethod.POST })
	public String searchLogistics(HttpServletRequest request,  HttpServletResponse response, 
			ModelMap model, @RequestParam(value = "courierNo", required = false) String courierNo) throws Exception {
    	//查询物流的url(通过物流编号查询)
//    	String url = "http://120.76.25.35/qjlup/batchTrackInfoServlet";
    	String url = PropertyUtil.getString("search_ems_logistics_information_by_emsNo_url");
		//物流编号
//    	String mailcodeList = "1109841540708";
    	String mailcodeList = courierNo;
    	
    	String returnDataJson;
		try {
			returnDataJson = EmsUtil.post2Server_GetJsonDataByEmsNo(url, mailcodeList);
			
			//处理查询异常
	    	if(returnDataJson.contains("message")){
	    		model.addAttribute("vipTrackInfoVos", null);
	    		model.addAttribute("ems_no", null);
	    	}else{
	    		//无异常情况
	    		//转换成Json数组对象
	        	JSONArray jsonArray=JSONArray.fromObject(returnDataJson);
	    		List<VipTrackInfoVo> vipTrackInfoVos = new ArrayList<VipTrackInfoVo>();
	    		for(int i = jsonArray.size()-1; i>=0; i--){
	    			Object o=jsonArray.get(i);
	    			JSONObject jsonObject2=JSONObject.fromObject(o);
	    			VipTrackInfoVo vipTrackInfoVo=(VipTrackInfoVo) JSONObject.toBean(jsonObject2, VipTrackInfoVo.class);
	    			vipTrackInfoVos.add(vipTrackInfoVo);
	    		}
	    		//获取邮件编号
	    		Object obj1=jsonArray.get(0);
	    		JSONObject jsonObj=JSONObject.fromObject(obj1);
				VipTrackInfoVo vipTrackInfoVo=(VipTrackInfoVo) JSONObject.toBean(jsonObj, VipTrackInfoVo.class);
				String ems_no = vipTrackInfoVo.getEms_no();
				
				model.addAttribute("vipTrackInfoVos", vipTrackInfoVos);
	    		model.addAttribute("ems_no", ems_no);
	    	}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
//    	WriteUtil.outObject(response, returnDataJson);
    	return "forward:/weixin/searchLogistics.jsp";
    }
    
    /**
     * 查看物流接口(通过订单号)
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "/logisticsByOrderId",method = { RequestMethod.GET , RequestMethod.POST })
	public String searchLogisticsByOrderId(HttpServletRequest request,  HttpServletResponse response, 
			ModelMap model, @RequestParam(value = "orderId", required = false) String orderId) throws Exception {
    	//查询物流的url(通过订单号查询)
//    	String url = "http://120.76.25.35/qjlup/batchTrackInfoByOrdernoServlet";
    	String url = PropertyUtil.getString("search_ems_logistics_information_by_orderNo_url");
		//物流编号(加前缀预防和EMS系统的订单冲突)
    	String ordernoList = PropertyUtil.getString("order_prefix") + orderId;
//    	String ordernoList = "20170420001";
    	
    	String returnDataJson;
		try {
			returnDataJson = EmsUtil.post2Server_GetJsonDataByOrderId(url, ordernoList);
			
			//处理查询异常
	    	if(returnDataJson.contains("message")){
	    		model.addAttribute("vipTrackInfoVos", null);
	    		model.addAttribute("ems_no", null);
	    	}else{
	    		//无异常情况
	    		//转换成Json数组对象
	        	JSONArray jsonArray=JSONArray.fromObject(returnDataJson);
	    		List<VipTrackInfoVo> vipTrackInfoVos = new ArrayList<VipTrackInfoVo>();
	    		for(int i = jsonArray.size()-1; i>=0; i--){
	    			Object o=jsonArray.get(i);
	    			JSONObject jsonObject2=JSONObject.fromObject(o);
	    			VipTrackInfoVo vipTrackInfoVo=(VipTrackInfoVo) JSONObject.toBean(jsonObject2, VipTrackInfoVo.class);
	    			vipTrackInfoVos.add(vipTrackInfoVo);
	    		}
	    		//获取邮件编号
	    		Object obj1=jsonArray.get(0);
	    		JSONObject jsonObj=JSONObject.fromObject(obj1);
				VipTrackInfoVo vipTrackInfoVo=(VipTrackInfoVo) JSONObject.toBean(jsonObj, VipTrackInfoVo.class);
				String ems_no = vipTrackInfoVo.getEms_no();
				
				model.addAttribute("vipTrackInfoVos", vipTrackInfoVos);
	    		model.addAttribute("ems_no", ems_no);
	    	}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
//    	WriteUtil.outObject(response, returnDataJson);
    	return "forward:/weixin/searchLogistics.jsp";
    }
    
    @RequestMapping(value = "/receiveJdReturnData",method = { RequestMethod.GET , RequestMethod.POST })
	public void receiveJdReturnData(HttpServletRequest request,  HttpServletResponse response
			, @RequestParam(value = "ID", required = true) String ID
			, @RequestParam(value = "QRCode", required = true) String QRCode
			, @RequestParam(value = "Name", required = true) String Name
			, @RequestParam(value = "Phone", required = true) String Phone
			, @RequestParam(value = "Type", required = true) String Type
			, @RequestParam(value = "OrderTime", required = true) String OrderTime
			, @RequestParam(value = "Sign", required = true) String Sign
			, @RequestParam(value = "State", required = false) String State) throws Exception {
    	
    	logger.error("-----------京东物料接口领奖成功回推数据------------");
    	boolean flag = true;
    	if(ID.equals("") || ID == null){
    		flag = false;
    	}
    	if(QRCode.equals("") || QRCode == null){
    		flag = false;
    	}
    	if(Name.equals("") || Name == null){
    		flag = false;
    	}
    	if(Phone.equals("") || Phone == null){
    		flag = false;
    	}
    	if(Type.equals("") || Type == null){
    		flag = false;
    	}
    	if(Sign.equals("") || Sign == null){
    		flag = false;
    	}
    	
    	String[] sourceStrArray = ID.split("zl2017zc");
    	String orderId = sourceStrArray[1];
    	logger.error("----------orderId="+orderId+"----------");
    	logger.error("----------ID="+ID+"----------");
    	logger.error("----------QRCode="+QRCode+"----------");
    	logger.error("----------Name="+Name+"----------");
    	logger.error("----------Phone="+Phone+"----------");
    	logger.error("----------Type="+Type+"----------");
    	logger.error("----------OrderTime="+OrderTime+"----------");
    	logger.error("----------Sign="+Sign+"----------");
    	logger.error("----------State="+State+"----------");
    	
    	Map<String,Object> map = new HashMap<String,Object>();
    	Map<String,String> paramMap = new HashMap<String,String>();
    	paramMap.put("ID", ID);
    	paramMap.put("QRCode", QRCode);
    	paramMap.put("Name", Name);
    	paramMap.put("Phone", Phone);
    	paramMap.put("Type", Type);
    	paramMap.put("OrderTime", OrderTime);
    	paramMap.put("State", State);
    	String signStr = ID+QRCode+Name+Phone+Type+OrderTime+PropertyUtil.getString("jdReturnDataKey");
    	String signCreate = MD5Util.encode2hex(signStr).toUpperCase();
    	paramMap.put("Sign", signCreate);
    	
    	if(signCreate.equals(Sign)){
    		if(flag){
        		//1.根据id查询领奖信息
            	RaiseOrderItemsDto dto = null;
            	
            	String returnDataJson = httpUtils.post(PropertyUtil.getString("get_order_by_order_id_url"),orderId) ;
            	dto = JSON.parseObject(returnDataJson,RaiseOrderItemsDto.class);
            	RaiseOrder record = dto.getRaiseOrder();
            	
            	AwardRecord awardRecord = new AwardRecord();
            	if(record != null){
            		logger.error("-------接受回推数据并保存领奖记录-------");
            		//2.生成领奖记录发货状态以及其他信息
            		awardRecord.setOrderId(record.getId());
            		awardRecord.setRaiseId(record.getRaiseId());
            		awardRecord.setUserId(record.getUserId());
            		awardRecord.setUserNick(Name);//收件人姓名
            		awardRecord.setDeliveryPhone(Phone);//发货电话
            		awardRecord.setCourierName("京东");//
            		awardRecord.setDeliveryStatus("1");//发货状态 0：未发货，1：已发货
            		awardRecord.setCreateDate(new Date());
                	//执行新增操作
                	String returnDataJson2 = httpUtils.post(PropertyUtil.getString("addAwardRecord_url"),com.alibaba.fastjson.JSONObject.toJSONString(awardRecord));
                	logger.error("-------returnDataJson2-------");
                	BaseDto basedto = JSON.parseObject(returnDataJson2,RaiseOrderItemsDto.class);
                	if(basedto.getResultType().equals("success")){
                		logger.error("-------添加领奖记录成功-------");
                	}else{
                		logger.error("-------添加领奖记录失败--------");
                	}
            	}
            	map.put("Code", "0");
        		map.put("Content", "接收成功");
        		map.put("ParamJson", paramMap);
        	}
    		if(!flag){
    			map.put("Code", "1");
        		map.put("Content", "缺少参数");
        		map.put("ParamJson", paramMap);
    		}
    		
    	}else{
    		map.put("Code", "1");
    		map.put("Content", "签名错误");
    		map.put("ParamJson", paramMap);
    	}
    	
    	String str = JSONObject.fromObject(map).toString();
    	WriteUtil.outObject(response, JSONObject.fromObject(map).toString());
    }
    
}
