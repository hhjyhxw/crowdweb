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
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.luckcloud.h5.dto.AddressEditSucessDto;
import com.luckcloud.h5.dto.WxFansQueryDto;
import com.luckcloud.h5.dto.WxFansRaiseInfoDto;
import com.luckcloud.h5.form.BaseForm;
import com.luckcloud.h5.model.WxFans;
import com.luckcloud.h5.util.HttpUtils;
import com.luckcloud.h5.util.PropertyUtil;
import com.luckcloud.h5.util.WriteUtil;

@Controller
@RequestMapping(value = "/wxFans")
public class WxFans4WxController{

	HttpUtils httpUtils = new HttpUtils();
	private final Logger logger = Logger.getLogger(getClass());
	
	@RequestMapping(value = "/findWxFansByOpenid", method = { RequestMethod.GET , RequestMethod.POST })
	public String findWxFansByOpenid(HttpServletRequest request, HttpServletResponse response,
			ModelMap model, @RequestParam(value = "openid", required = false) String openid) throws Exception {
		
		BaseForm baseForm = (BaseForm) request.getSession().getAttribute("baseForm");
		String openID = "";
		if(baseForm == null){
			logger.error("---------------获取openid失败-----------------");
			logger.error("---------------获取openid失败-----------------");
		}else{
			openID = baseForm.getOpenid();
			logger.error("---------------"+openid+"-----------------");
		}
		WxFansQueryDto dto = null;
		String returnDataJson = httpUtils.post(PropertyUtil.getString("find_wxFans_byOpenid_url"),openID);
		dto = JSON.parseObject(returnDataJson,WxFansQueryDto.class);
		
		model.addAttribute("wxFans", dto == null ? null : dto.getWxFans());
		return "forward:/weixin/updateAddress.jsp";
	}
	
	@RequestMapping(value = "/updateWxFansAddress", method = { RequestMethod.GET , RequestMethod.POST })
	public void updateWxFans(HttpServletRequest request, HttpServletResponse response, WxFans wxFans) throws Exception {
		
		String paramJson = JSONObject.toJSONString(wxFans);
		System.out.println(paramJson);
		String returnDataJson = httpUtils.post(PropertyUtil.getString("update_wxFans_address_url"),paramJson);
		AddressEditSucessDto dto = null;
		dto = JSON.parseObject(returnDataJson,AddressEditSucessDto.class);
		
		BaseForm baseForm = (BaseForm) request.getSession().getAttribute("baseForm");
		String openid = "";
		if(baseForm == null){
			logger.error("---------------获取openid失败-----------------");
			logger.error("---------------获取openid失败-----------------");
		}else{
			openid = baseForm.getOpenid();
			logger.error("---------------"+openid+"-----------------");
		}
//		String openid = "ooku7jkVI0KweN5SV3iJjuR8A0Fk";
		dto.setOpenid(openid);
		
		WriteUtil.outObject(response, JSONObject.toJSONString(dto));
	}
	
	@RequestMapping(value = "/findWxFansInRaise", method = { RequestMethod.GET , RequestMethod.POST })
	public void findWxFansInRaise(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "raiseId", required = true) String raiseId) throws Exception {
		BaseForm baseForm = (BaseForm) request.getSession().getAttribute("baseForm");
		WxFansRaiseInfoDto dto = null;
		Map<String, String> params = new HashMap<String, String>();
		params.put("raiseId", raiseId);
		params.put("openId", baseForm.getOpenid());
		String returnDataJson = httpUtils.post(PropertyUtil.getString("find_wxFans_in_raise_url"), JSONObject.toJSONString(params));
		dto = JSON.parseObject(returnDataJson,WxFansRaiseInfoDto.class);
		WriteUtil.outObject(response, JSONObject.toJSONString(dto));
	}
	
}
