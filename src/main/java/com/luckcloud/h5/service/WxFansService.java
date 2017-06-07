package com.luckcloud.h5.service;

import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.luckcloud.h5.dto.BaseDto;
import com.luckcloud.h5.form.WxFansForm;
import com.luckcloud.h5.util.HttpUtils;
import com.luckcloud.h5.util.PropertyUtil;

/**
 * @filename      : WxFansService.java
 * @description   : 
 * @author        : zdh
 * @create        : 2017-5-6 下午1:26:25   
 * @copyright     : zhumeng.com@crowdweb
 *
 * Modification History:
 * Date             Author       Version
 * --------------------------------------
 */

public class WxFansService {
	
	HttpUtils httpUtils = new HttpUtils();
    private final Logger logger = Logger.getLogger(getClass());
    
    /**
     * 保存或者修改粉丝
     * @author   : zdh
     * @date     : 创建时间：2017年4月13日 上午11:12:35  
     * @version  : 1.0  
     * @return
     */
    	public BaseDto saveFans(WxFansForm wxFansForm){
    		BaseDto baseDto = new BaseDto("fail","100010","处理失败");
		try {
			String returnDataJson = httpUtils.post(PropertyUtil.getString("pre_wxFans_wxFansAdd_url"),JSONObject.toJSONString(wxFansForm)) ;
			logger.info("returnDataJson="+returnDataJson);
			baseDto = JSON.parseObject(returnDataJson,BaseDto.class);
		} catch (Exception e) {
			 e.printStackTrace();
		}
		return baseDto;
    }
}
