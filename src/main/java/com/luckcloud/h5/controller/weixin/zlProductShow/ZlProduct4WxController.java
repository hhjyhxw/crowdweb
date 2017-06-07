package com.luckcloud.h5.controller.weixin.zlProductShow;

import java.io.IOException;

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
import com.luckcloud.h5.dto.zlProductShow.ZlProductListDto;
import com.luckcloud.h5.form.zlProductShow.ZlProductListForm;
import com.luckcloud.h5.util.HttpUtils;
import com.luckcloud.h5.util.PropertyUtil;
import com.luckcloud.h5.util.WriteUtil;

@Controller
@RequestMapping(value = "/zl_product4wx")
public class ZlProduct4WxController {

	HttpUtils httpUtils = new HttpUtils();
    private final Logger logger = Logger.getLogger(getClass());
    
    /**
     * 真龙产品微信端分页
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/listByPage4Wx", method = { RequestMethod.GET , RequestMethod.POST })
    public String listByPage(HttpServletRequest request, HttpServletResponse response, ModelMap model,
			@RequestParam(value = "type", required = false)String type,
			@RequestParam(value = "priceOrderType", required = false)String priceOrderType,
			@RequestParam(value = "tarContent", required = false)String tarContent) throws IOException{
    	
    	ZlProductListDto dto = null;
    	
    	try {
    		ZlProductListForm form = new ZlProductListForm();
    		if(type != null && !"".equals(type)){
				form.setCigaretteType(type);
			}
			if(priceOrderType != null && !"".equals(priceOrderType)){
				form.setPriceOrderType(priceOrderType);;
			}
			if(tarContent != null && !"".equals(tarContent)){
				form.setTarContent(tarContent);
			}
			form.setPageNum(1);
			form.setPageSize(6);
			String returnDataJson = httpUtils.post(PropertyUtil.getString("zl_product_list_4wx_url"),JSONObject.toJSONString(form)) ;
			logger.info("returnDataJson="+returnDataJson);
			if(returnDataJson != null){
				dto = JSON.parseObject(returnDataJson,ZlProductListDto.class);
			}
			
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		model.addAttribute("type", type);
		model.addAttribute("tarContent", tarContent);
		model.addAttribute("priceOrderType", priceOrderType);
		if(dto != null){
			model.addAttribute("currPage", dto.getPageNum());
			model.addAttribute("totalPage", dto.getTotalPage());
			model.addAttribute("totalCount", dto.getTotalCount());
			model.addAttribute("list", dto!=null?dto.getZlProducts():null);
		}else{
			model.addAttribute("currPage", 0);
			model.addAttribute("totalPage", 0);
			model.addAttribute("totalCount", 0);
			model.addAttribute("list", null);
		}
   	
		return "weixin/zlProductShow/zlProductWxList";
    }
    
    @RequestMapping(value = "/listByPageJson", method = { RequestMethod.GET , RequestMethod.POST })
    public void listByPageJson(HttpServletRequest request, HttpServletResponse response, ModelMap model,
    		@RequestParam(value = "currPage", required = false) Integer currPage,
    		@RequestParam(value = "totalCount", required = false) Long totalCount,
			@RequestParam(value = "type", required = false)String type,
			@RequestParam(value = "priceOrderType", required = false)String priceOrderType,
			@RequestParam(value = "tarContent", required = false)String tarContent) throws IOException{
    	
    	String returnDataJson = null;
    	try {
    		ZlProductListForm form = new ZlProductListForm();
			if(type != null && !"".equals(type)){
				form.setCigaretteType(type);
			}
			if(priceOrderType != null && !"".equals(priceOrderType)){
				form.setPriceOrderType(priceOrderType);;
			}
			if(tarContent != null && !"".equals(tarContent)){
				form.setTarContent(tarContent);
			}
			form.setPageNum(currPage);
			form.setPageSize(6);
//			form.setTotalCount(totalCount);
			returnDataJson = httpUtils.post(PropertyUtil.getString("zl_product_list_4wx_url"),JSONObject.toJSONString(form));
			logger.info("returnDataJson="+returnDataJson);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
    	
    	WriteUtil.outObject(response, returnDataJson);
    }
    
    /**
     * 查看详情
     */
    @RequestMapping(value = "/toDetail", method = { RequestMethod.GET , RequestMethod.POST })
    public String toDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model,
			@RequestParam(value = "id", required = false)Integer id,
			@RequestParam(value = "productDeatailLogo", required = false)String productDeatailLogo) throws IOException{
    	
    	model.addAttribute("productDeatailLogo", productDeatailLogo);
    	return "weixin/zlProductShow/productDetail";
    }
    
}
