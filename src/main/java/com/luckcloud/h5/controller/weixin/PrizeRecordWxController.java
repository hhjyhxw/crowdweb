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
@RequestMapping(value = "/prizewx")
public class PrizeRecordWxController{
	
	HttpUtils httpUtils = new HttpUtils();
    private final Logger logger = Logger.getLogger(getClass());
            
    /**
     * 积分攻略
     */
    @RequestMapping(value = { "/prizelistAjax" }, method = RequestMethod.POST)
	public void prizelistAjax(String  raiseId, 
			                  HttpServletResponse response){
    	String returnDataJson = httpUtils.post(PropertyUtil.getString("prize_list_ajax_url"),raiseId) ;
    	WriteUtil.outObject(response, returnDataJson);
    }     
}
