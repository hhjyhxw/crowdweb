package com.luckcloud.h5.controller.weixin;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
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
import com.luckcloud.h5.dto.BaseDto;
import com.luckcloud.h5.dto.RaiseDetailDto;
import com.luckcloud.h5.dto.RaiseQueryDto;
import com.luckcloud.h5.dto.UserPrizeInfoDto;
import com.luckcloud.h5.form.BaseForm;
import com.luckcloud.h5.form.RaiseForm;
import com.luckcloud.h5.model.Raise;
import com.luckcloud.h5.util.HttpUtils;
import com.luckcloud.h5.util.PageUtil;
import com.luckcloud.h5.util.PropertyUtil;
import com.luckcloud.h5.util.RaiseComparator;
import com.luckcloud.h5.util.WriteUtil;



/**
 * 类名称: RaiseHTController
 * 类描述: 众筹后台页面跳转的类
 * 创建人: ldf
 * 创建时间:2017年4月12日 
 */
@Controller
@RequestMapping(value = "/raisewx")
public class RaiseWxController{
	
	HttpUtils httpUtils = new HttpUtils();
    private final Logger logger = Logger.getLogger(getClass());
    
    
    /**
     * 方法描述: 往期众筹列表,查询所成功创建的众筹活动，并显示中奖的信息
     * 创建时间:2017年4月12日 
     * 修改时间:2017年4月13日 
     */
    @RequestMapping(value = { "/pastList" }, method = RequestMethod.GET)
	public String pastList(HttpServletRequest request, 
			HttpServletResponse response,ModelMap model,
			@RequestParam(value = "currPage", required = false) Integer currPage, 
			@RequestParam(value = "pageSize", required = false) Integer pageSize){
    	
		RaiseQueryDto raiseQueryDto = null;
		PageUtil p = new PageUtil();
		try {
			//一.请求的参数放到构造的form中
			Map<String,Object> map =  new HashMap<String,Object>();
			
			BaseForm baseForm =(BaseForm) request.getSession().getAttribute("baseForm");
			//System.out.println("openid=="+baseForm.getOpenid());
			if(null !=request.getParameter("openid")){
				map.put("openid",request.getParameter("openid"));
			}else if(null!=baseForm){
				map.put("openid",baseForm.getOpenid());
			}else{
				map.put("openid", "ooku7jp9q8QighZTRnqYNRxN9zFU");
			}
			map.put("currPage", 1);
			map.put("pageSize", 30);
			//二.将form转换成json,调用远程端口返回数据
			String returnDataJson = httpUtils.post(PropertyUtil.getString("raise_past_list"),JSONObject.toJSONString(map)) ;
			logger.info("returnDataJson="+returnDataJson);
			
			raiseQueryDto = JSON.parseObject(returnDataJson,RaiseQueryDto.class);
			if(raiseQueryDto!=null){
				p.setCurrPage(raiseQueryDto.getPageNum());
				p.setNextPage(raiseQueryDto.getPageNum()+1);
				p.setPrePage(raiseQueryDto.getPageNum()-1, raiseQueryDto.getTotalPage()!=null?raiseQueryDto.getTotalPage().intValue():0);
				p.setTotalPage(raiseQueryDto.getTotalPage()!=null?raiseQueryDto.getTotalPage().intValue():0);
				p.setPageSize(raiseQueryDto.getPageSize());
				p.setTotalNum(raiseQueryDto.getTotalCount());
			}
		} catch (Exception e) {
			 e.printStackTrace();
		}
		model.addAttribute("p", p);
		model.addAttribute("dtoList", raiseQueryDto!=null?raiseQueryDto.getRaiseList():null);
		return "forward:/weixin/raise_past_list.jsp";
	}
    @RequestMapping(value = { "/pastListAjax" }, method ={RequestMethod.GET,RequestMethod.POST} )
	public void pastListAjax(HttpServletRequest request, 
							 HttpServletResponse response,
							 ModelMap model,
							 @RequestParam(value = "currPage", required = false) Integer currPage, 
							 @RequestParam(value = "pageSize", required = false) Integer pageSize){
    	
		RaiseQueryDto raiseQueryDto = null;
		PageUtil p = new PageUtil();
		String returnDataJson  = null;
		try {
			//一.请求的参数放到构造的form中
			Map<String,Object> map =  new HashMap<String,Object>();
			if(null!=request.getSession().getAttribute("baseForm")){
				map.put("openid", request.getSession().getAttribute("baseForm"));
			}else{
				map.put("openid", "ooku7jp9q8QighZTRnqYNRxN9zFU");
			}
			map.put("currPage", currPage);
			map.put("pageSize", 2);
			//二.将form转换成json,调用远程端口返回数据
			returnDataJson = httpUtils.post(PropertyUtil.getString("raise_past_list"),JSONObject.toJSONString(map)) ;
			logger.info("returnDataJson="+returnDataJson);
			
			raiseQueryDto = JSON.parseObject(returnDataJson,RaiseQueryDto.class);
			if(raiseQueryDto!=null){
				p.setCurrPage(raiseQueryDto.getPageNum());
				p.setNextPage(raiseQueryDto.getPageNum()+1);
				p.setPrePage(raiseQueryDto.getPageNum()-1, raiseQueryDto.getTotalPage()!=null?raiseQueryDto.getTotalPage().intValue():0);
				p.setTotalPage(raiseQueryDto.getTotalPage()!=null?raiseQueryDto.getTotalPage().intValue():0);
				p.setPageSize(raiseQueryDto.getPageSize());
				p.setTotalNum(raiseQueryDto.getTotalCount());
			}
		} catch (Exception e) {
			 e.printStackTrace();
		}
		WriteUtil.outObject(response,JSONObject.toJSONString(raiseQueryDto));
	}    
    /**
     * 众筹活动首页
     * @author   : zdh
     * @date     : 创建时间：2017年4月13日 上午11:12:35  
     * @version  : 1.0  
     * @return
     */
        @RequestMapping(value = { "raiseCenter" }, method = RequestMethod.GET)
    	public String raiseCenter(HttpServletRequest request, HttpServletResponse response,ModelMap model){
		RaiseQueryDto raiseQueryDto = null;
		try {
//			BaseForm baseForm = (BaseForm) request.getSession().getAttribute("baseForm");
			RaiseForm raiseForm = new RaiseForm();
			String returnDataJson = httpUtils.post(PropertyUtil.getString("center_raise_list_url"),JSONObject.toJSONString(raiseForm)) ;
			logger.error("returnDataJson="+returnDataJson);
			raiseQueryDto = JSON.parseObject(returnDataJson,RaiseQueryDto.class);
		} catch (Exception e) {
			 e.printStackTrace();
		}
		model.addAttribute("jsonlist", raiseQueryDto!=null?JSONObject.toJSONString(raiseQueryDto.getRaiseList()):null);
		model.addAttribute("list", raiseQueryDto!=null?raiseQueryDto.getRaiseList():null);
		model.addAttribute("totalPage", raiseQueryDto!=null?raiseQueryDto.getTotalPage():0);
		return "weixin/raiseCenter";
    }
        
        
        /**
         * 众筹活动首页上滑加载
         * @author   : zdh
         * @date     : 创建时间：2017年4月13日 上午11:12:35  
         * @version  : 1.0  
         * @return
         */
            @RequestMapping(value = { "raiseCenterJson" }, method = RequestMethod.POST)
        	public void raiseCenterJson(HttpServletRequest request, HttpServletResponse response,ModelMap model,Integer pageNum){
    		RaiseQueryDto raiseQueryDto = null;
    		try {
    			RaiseForm raiseForm = new RaiseForm();
    			if(pageNum!=null){
    				raiseForm.setPageNum(pageNum);
    			}
    			String returnDataJson = httpUtils.post(PropertyUtil.getString("center_raise_list_url"),JSONObject.toJSONString(raiseForm)) ;
    			logger.error("returnDataJson="+returnDataJson);
    			raiseQueryDto = JSON.parseObject(returnDataJson,RaiseQueryDto.class);
    		} catch (Exception e) {
    			 e.printStackTrace();
    		}
    		if(raiseQueryDto!=null){
    			WriteUtil.outObject(response, JSONObject.toJSONString(raiseQueryDto));
    		}else{
    			 BaseDto baseDto = new BaseDto("fail","10001","查询失败");
				 WriteUtil.outObject(response, JSONObject.toJSONString(baseDto));
    		}
        }
         /**
          * 去除 productSpecifications，避免在页面转化出现错误
          * @author   : zdh
          * @date     : 创建时间：
          * @version  : 1.0  
          * @return
          *
          */
         private RaiseQueryDto getNewRaiseQueryDto(RaiseQueryDto raiseQueryDto){
        	 List<Raise> newlist = new ArrayList<Raise>();
        	 if(raiseQueryDto!=null){
        		 List<Raise> list = raiseQueryDto.getRaiseList();
        		 if(list!=null && list.size()>0){
        			 newlist = new ArrayList<Raise>();
        			 for (int i = 0; i < list.size(); i++) {
        				 Raise raise = list.get(i);
        				 raise.setProductSpecifications("");
        				 raise.setProductDetails("");
        				 newlist.add(raise);
     				}
        			raiseQueryDto.setRaiseList(newlist);
        		 }
        	 }
        	 newlist = raiseQueryDto.getRaiseList();
        	 Collections.sort(newlist,new RaiseComparator());
        	 raiseQueryDto.setRaiseList(newlist);
			return raiseQueryDto;
         }
            
        /**
         * 众筹详情
         * @author   : zdh
         * @return
         */
		@RequestMapping(value = { "raiseDetail" }, method = RequestMethod.GET)
		public String raiseDetail(HttpServletRequest request,HttpServletResponse response, ModelMap model,
				@RequestParam(value = "id") String id) {
			try {
				Map<String, String> map = new HashMap<String, String>();
				map.put("id", id);
				String returnDataJson = httpUtils.post(PropertyUtil.getString("pre_raise_detail_url"),JSONObject.toJSONString(map));
				logger.error("returnDataJson=" + returnDataJson);
				RaiseDetailDto dto = JSONObject.parseObject(returnDataJson, RaiseDetailDto.class);
				request.setAttribute("data", dto);
				if ("3".equals(dto.getCurrentStatus())) // 状态是3表示众筹完成
					return "weixin/raise_completed";
			} catch (Exception e) {
	   			 e.printStackTrace();
			}
			return "weixin/raiseDetail";
		}
            
        /**
         * 更新活动状态
         */
        @RequestMapping(value = { "changeStatus" }, method = RequestMethod.POST)
    	public void changeStatus(HttpServletRequest request, HttpServletResponse response,Long id,String currentStatus){
        	BaseDto baseDto = null;
    		try {
    			if(id==null || currentStatus==null || "".equals(currentStatus)){
    				baseDto = new BaseDto("fail","10001","数据为空");
    				WriteUtil.outObject(response, JSONObject.toJSONString(baseDto));
    			}
    			RaiseForm raiseForm = new RaiseForm();
    			Raise raise = new Raise();
    			raise.setId(id);
    			raise.setCurrentStatus(currentStatus);
    			raiseForm.setRaise(raise);
    			String returnDataJson = httpUtils.post(PropertyUtil.getString("pre_raise_changeStatus_url"),JSONObject.toJSONString(raiseForm)) ;
    			logger.error("returnDataJson="+returnDataJson);
    			baseDto = JSON.parseObject(returnDataJson,BaseDto.class);
    		} catch (Exception e) {
    			 e.printStackTrace();
    			baseDto = new BaseDto("fail","10001","内部异常");
    		}
    		WriteUtil.outObject(response, JSONObject.toJSONString(baseDto));
        } 
        
        /**
         * 积分攻略
         */
        @RequestMapping(value = { "scoreStrategy" }, method = RequestMethod.GET)
    	public String scoreStrategy(HttpServletRequest request, HttpServletResponse response,ModelMap model){
        	return "weixin/score_strategy";
        }
        
        /**
         * 获取会员中奖信息
         */
        @RequestMapping(value = { "getUserPrizeInfo" }, method = RequestMethod.POST)
    	public void getUserPrizeInfo(HttpServletRequest request, HttpServletResponse response,
    			@RequestParam(value="raiseId", required=true) String raiseId){
        	BaseForm baseForm = (BaseForm) request.getSession().getAttribute("baseForm");
        	String openId = baseForm.getOpenid();
        	Map<String, String> params = new HashMap<>();
        	params.put("raiseId", raiseId);
        	params.put("openId", openId);
        	UserPrizeInfoDto dto = null;
        	try{
        		String returnDataJson = httpUtils.post(PropertyUtil.getString("pre_get_user_prize_url"),JSONObject.toJSONString(params));
        		logger.info("returnDataJson="+returnDataJson);
        		dto = JSON.parseObject(returnDataJson, UserPrizeInfoDto.class);
        	}catch(Exception ex){
        		logger.error("getUserPrizeInfo error", ex);
        		dto = new UserPrizeInfoDto("fail","10001","内部异常");
        	}
        	WriteUtil.outObject(response, JSONObject.toJSONString(dto));
        }
}
