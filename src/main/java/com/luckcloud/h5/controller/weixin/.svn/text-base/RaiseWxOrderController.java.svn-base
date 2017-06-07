package com.luckcloud.h5.controller.weixin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.luckcloud.h5.dto.BaseDto;
import com.luckcloud.h5.dto.LuckyNoListDto;
import com.luckcloud.h5.dto.RecordDto;
import com.luckcloud.h5.form.BaseForm;
import com.luckcloud.h5.form.RecordForm;
import com.luckcloud.h5.util.HttpUtils;
import com.luckcloud.h5.util.PropertyUtil;
import com.luckcloud.h5.util.WriteUtil;



/**
 * 	
 * 类名称: RaiseWxOrderController
 * 类描述: 
 * 创建人: zdh
 * 创建时间:2017年4月17日 下午1:50:24
 */
@Controller
@RequestMapping(value = "/raisewxOrder")
public class RaiseWxOrderController{
	
	HttpUtils httpUtils = new HttpUtils();
    private final Logger logger = Logger.getLogger(getClass());
            
       /**
        * 获取众筹的参与记录 （按活动）
        * @author : zdh
        * @date : 创建时间：2017年4月13日 上午11:52:38  
        * @return
        *
        */	
        @RequestMapping(value = { "record" }, method = RequestMethod.GET)
    	public String record(HttpServletRequest request, HttpServletResponse response,ModelMap model,Long raiseId){
        	RecordDto recordDto = null;
    		try {
//    			BaseForm baseForm = (BaseForm) request.getSession().getAttribute("baseForm");
    			RecordForm recordForm = new RecordForm();
    			recordForm.setRaiseId(raiseId);
    			String returnDataJson = httpUtils.post(PropertyUtil.getString("pre_raise_order_record_url"),JSONObject.toJSONString(recordForm)) ;
    			logger.error("returnDataJson="+returnDataJson);
    			recordDto = JSON.parseObject(returnDataJson,RecordDto.class);
    		} catch (Exception e) {
    			 e.printStackTrace();
    		}
    		model.addAttribute("list", recordDto!=null?recordDto.getRecordVoList():null);
    		model.addAttribute("totalPage", recordDto!=null?recordDto.getTotalPage():0);
        	return "weixin/record";
        }
        
        /**
         * 获取众筹的参与记录 （按活动）(上滑加载)
         * @author : zdh
         * @date : 创建时间：2017年4月13日 上午11:52:38  
         * @return
         *
         */	
         @RequestMapping(value = { "recordJson" }, method = RequestMethod.POST)
     	public void recordJson(HttpServletRequest request, HttpServletResponse response,ModelMap model
     			,Long raiseId,Integer pageNum){
         	RecordDto recordDto = null;
     		try {
     			RecordForm recordForm = new RecordForm();
     			recordForm.setRaiseId(raiseId);
     			if(pageNum!=null){
     				recordForm.setPageNum(pageNum);
     			}
     			String returnDataJson = httpUtils.post(PropertyUtil.getString("pre_raise_order_record_url"),JSONObject.toJSONString(recordForm)) ;
     			logger.error("returnDataJson="+returnDataJson);
     			recordDto = JSON.parseObject(returnDataJson,RecordDto.class);
     		} catch (Exception e) {
     			 e.printStackTrace();
     		}
     		if(recordDto!=null){
    			WriteUtil.outObject(response, JSONObject.toJSONString(recordDto));
    		}else{
    			 BaseDto baseDto = new BaseDto("fail","10001","查询失败");
				 WriteUtil.outObject(response, JSONObject.toJSONString(baseDto));
    		}
     		return;
         }
         
        
        /**
         * 我参与的众筹列表
         */
        @RequestMapping(value = { "myRecord" }, method = RequestMethod.GET)
    	public String myRecord(HttpServletRequest request, HttpServletResponse response,ModelMap model){
        	RecordDto recordDto = null;
    		try {
    			BaseForm baseForm = (BaseForm) request.getSession().getAttribute("baseForm");
    			RecordForm recordForm = new RecordForm();
    			if(baseForm!=null){
    				recordForm.setOpenid(baseForm.getOpenid());
    			}
//    			recordForm.setOpenid("ooku7jiW2TwF3AS9Tr3lnEPp7DBY");
    			String returnDataJson = httpUtils.post(PropertyUtil.getString("pre_raise_order_record_url"),JSONObject.toJSONString(recordForm)) ;
    			logger.error("returnDataJson="+returnDataJson);
    			recordDto = JSON.parseObject(returnDataJson,RecordDto.class);
    		} catch (Exception e) {
    			 e.printStackTrace();
    		}
    		model.addAttribute("list", recordDto!=null?recordDto.getRecordVoList():null);
    		model.addAttribute("totalPage", recordDto!=null?recordDto.getTotalPage():0);
        	return "weixin/myRecord";
        } 
        
        /**
         * 我参与的众筹列表(上滑加载)
         */
        @RequestMapping(value = { "myRecordJson" }, method = RequestMethod.POST)
    	public void myRecordJson(HttpServletRequest request, HttpServletResponse response,ModelMap model
    			,Long raiseId,Integer pageNum){
        	RecordDto recordDto = null;
    		try {
    			BaseForm baseForm = (BaseForm) request.getSession().getAttribute("baseForm");
    			RecordForm recordForm = new RecordForm();
    			recordForm.setOpenid(baseForm.getOpenid());
    			if(pageNum!=null){
     				recordForm.setPageNum(pageNum);
     			}
    			String returnDataJson = httpUtils.post(PropertyUtil.getString("pre_raise_order_record_url"),JSONObject.toJSONString(recordForm)) ;
    			logger.error("returnDataJson="+returnDataJson);
    			recordDto = JSON.parseObject(returnDataJson,RecordDto.class);
    			if(recordDto!=null){
        			WriteUtil.outObject(response, JSONObject.toJSONString(recordDto));
        			return;
        		}
    		} catch (Exception e) {
    			 e.printStackTrace();
    		}
			 BaseDto baseDto = new BaseDto("fail","10001","查询失败");
			 WriteUtil.outObject(response, JSONObject.toJSONString(baseDto));
    		return;
        } 
        
        /**
         * 众筹下单
         */
        @RequestMapping(value = { "order" }, method = RequestMethod.POST)
    	public void order(HttpServletRequest request, HttpServletResponse response,ModelMap model,Long raiseId){
        	BaseDto baseDto = null;
        	try {
    			BaseForm baseForm = (BaseForm) request.getSession().getAttribute("baseForm");
    			RecordForm recordForm = new RecordForm();
    			recordForm.setEncryOpenid(baseForm.getEncryOpenid());
    			recordForm.setSign(baseForm.getSign());
    			recordForm.setRaiseId(raiseId);
    			String returnDataJson = httpUtils.post(PropertyUtil.getString("pre_raise_order_url"),JSONObject.toJSONString(recordForm)) ;
    			logger.error("returnDataJson="+returnDataJson);
    			baseDto = JSON.parseObject(returnDataJson,BaseDto.class);
    			if(baseDto!=null){
    				 WriteUtil.outObject(response, JSONObject.toJSONString(baseDto));
    				 return;
    			}
    		} catch (Exception e) {
    			 e.printStackTrace();
    		}
        	baseDto = new BaseDto("fail","10001","下单失败");
			WriteUtil.outObject(response, JSONObject.toJSONString(baseDto));
			return;
        } 
        
        /**
         * 积分攻略
         */
        @RequestMapping(value = { "scoreStrategy" }, method = RequestMethod.GET)
    	public String scoreStrategy(HttpServletRequest request, HttpServletResponse response,ModelMap model){
        	return "weixin/score_strategy";
        }
        
        /**
         * 积分攻略
         */
        @RequestMapping(value = { "getPrize" }, method = RequestMethod.POST)
    	public void getPrize(HttpServletRequest request, HttpServletResponse response,ModelMap model){
        	String raiseId = request.getParameter("raiseId");
        	String orderId = request.getParameter("orderId");
        	String userId = request.getParameter("userId");
        	String userName = request.getParameter("userName");
        	String deliveryAddress = request.getParameter("deliveryAddress");
        	String phone = request.getParameter("phone");
        	
        	Map<String, String> params = new HashMap<String, String>();
        	params.put("raiseId", raiseId);
        	params.put("orderId", orderId);
        	params.put("userId", userId);
        	params.put("userName", userName);
        	params.put("deliveryAddress", deliveryAddress);
        	params.put("phone", phone);
        	
        	String returnDataJson = httpUtils.post(PropertyUtil.getString("pre_raise_get_prize_url"),JSONObject.toJSONString(params)) ;
        	logger.info("returnDataJson=" + returnDataJson);
        	BaseDto dto = JSONObject.parseObject(returnDataJson, BaseDto.class);
    		String json = JSONObject.toJSONString(dto);
    		WriteUtil.outObject(response, json);
        }
        
}
