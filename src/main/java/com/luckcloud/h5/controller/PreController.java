package com.luckcloud.h5.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.luckcloud.h5.dto.RaiseQueryDto;
import com.luckcloud.h5.form.BaseForm;
import com.luckcloud.h5.util.HttpUtils;
import com.luckcloud.h5.util.PropertyUtil;



/**
 * 
 * 类名称: PreController
 * 类描述: 跳转静态页面的类
 * 创建人: zdh
 * 创建时间:2017年4月10日 上午10:24:07
 */
@Controller
@RequestMapping(value = "/pre")
public class PreController{
	
	HttpUtils httpUtils = new HttpUtils();
    private final Logger logger = Logger.getLogger(getClass());
	 
	/** 
	 * 个人中心
	 */
	@RequestMapping(value = "/personCenter", method = { RequestMethod.GET , RequestMethod.POST })
	public String personCenter(HttpServletRequest request, HttpServletResponse response){
		BaseForm baseForm = (BaseForm) request.getSession().getAttribute("baseForm");
		if(baseForm!=null){
			logger.info("进入请求的后端方法");
			String returnDataJson = httpUtils.post(PropertyUtil.getString("pre_raise_list_url"),JSONObject.toJSONString(baseForm)) ;
			RaiseQueryDto raiseQueryDto = JSON.parseObject(returnDataJson,RaiseQueryDto.class);
			if(raiseQueryDto.getResultType().equals("success") && raiseQueryDto.getResultCode().equals("10000")){
				request.setAttribute("raiseList", raiseQueryDto.getRaiseList());
			}
		}
		return "front/personCenter";
	}

//	/** 
//	 * zhongj
//	 */
//	@RequestMapping(value = "/personCenter")
//	public String persons(HttpServletRequest request, HttpServletResponse response){
//		System.out.println("方法进入");
//		return "zhongchong/personCenter";
//	}
}
