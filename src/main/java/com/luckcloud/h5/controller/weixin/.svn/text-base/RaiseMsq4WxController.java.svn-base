package com.luckcloud.h5.controller.weixin;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSONObject;
import com.luckcloud.h5.model.RaiseMsq;
import com.luckcloud.h5.util.HttpUtils;
import com.luckcloud.h5.util.PropertyUtil;
import com.luckcloud.h5.util.WriteUtil;

@Controller
@RequestMapping(value = "/raise4wx")
public class RaiseMsq4WxController {
	HttpUtils httpUtils = new HttpUtils();
    private final Logger logger = Logger.getLogger(getClass());

    /**
	 * 提醒发货
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping(value = "/notify",method = { RequestMethod.GET , RequestMethod.POST })
	public void notifyDelivery(HttpServletRequest request,  HttpServletResponse response,
			RaiseMsq record) throws Exception {
		
//		record.setMsgContent("提醒发货");
//		RaiseMsq record1 = new RaiseMsq();
		record.setCreateDate(new Date());
//		record.setOrderId(100001L);
//		record.setRaiseId(10001L);
//		record.setUserId(1001L);
		record.setMsgContent("提醒发货");
		record.setReadStatus("0");
		
		String paramJson = JSONObject.toJSONString(record);
		logger.error(paramJson);
		String returnDataJson = httpUtils.post(PropertyUtil.getString("notifyDelivery_url"),paramJson);
		
		WriteUtil.outObject(response, returnDataJson);
	}
}
