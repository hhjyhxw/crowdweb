package com.luckcloud.h5.controller.backstage;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.conn.tsccm.ThreadSafeClientConnManager;
import org.apache.http.message.BasicNameValuePair;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.luckcloud.h5.dto.AwardRecordExportExcleDto;
import com.luckcloud.h5.dto.AwardRecordListDto;
import com.luckcloud.h5.dto.AwardRecordQueryDto;
import com.luckcloud.h5.dto.AwardRecordVoDto;
import com.luckcloud.h5.dto.BaseDto;
import com.luckcloud.h5.dto.EmsTrackInfoDto;
import com.luckcloud.h5.dto.ExportExcleDto;
import com.luckcloud.h5.form.AwardRecordFrom;
import com.luckcloud.h5.form.BatchVipMail;
import com.luckcloud.h5.model.AwardRecord;
import com.luckcloud.h5.util.EmsUtil;
import com.luckcloud.h5.util.ExportExcelUtil;
import com.luckcloud.h5.util.HttpUtils;
import com.luckcloud.h5.util.JsonDateValueProcessor;
import com.luckcloud.h5.util.PageUtil;
import com.luckcloud.h5.util.PropertyUtil;
import com.luckcloud.h5.util.WriteUtil;
import com.luckcloud.h5.vo.AwardRecordVo;
import com.luckcloud.h5.vo.VipTrackInfoVo;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

/**
 * 领奖及发货记录Controller
 * @author chencl
 * @date 2017-4-12
 */
@Controller
@RequestMapping(value = "/award_record")
public class AwardRecordController {

	protected Map<String, Object> session;
	
	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	HttpUtils httpUtils = new HttpUtils();
    private final Logger logger = Logger.getLogger(getClass());
    
    
    /**
     * 导出众筹中奖数据
     * @param request
     * @param response
     * @throws IOException 
     */
    @RequestMapping(value = "/exportAwardRecord", method = { RequestMethod.GET , RequestMethod.POST })
    public void exportAwardRecord(HttpServletRequest request, HttpServletResponse response,
    		@RequestParam(value = "state", required = false)String state,
    		@RequestParam(value = "phone", required = false)String phone) throws IOException{
    	
    	AwardRecordFrom form = new AwardRecordFrom();
		if(state != null && !"".equals(state)){
			form.setDeliveryStatus(state);
		}
		if(phone != null && !"".equals(phone)){
			form.setDeliveryPhone(phone);
		}
		try {
			//excle表格数据
			ExportExcleDto dto = null;
			String returnDataJson = httpUtils.post(PropertyUtil.getString("export_excle_awardRecord"),JSONObject.toJSONString(form));
			dto = JSON.parseObject(returnDataJson,ExportExcleDto.class);
			List<AwardRecordExportExcleDto> dataset = dto.getExportDto();
			
			//设置自动保存路径和保存文件名
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			Date currentDate = new Date();
	    	String fileName = "众筹领奖记录报表" + sdf.format(currentDate) + ".xls";
			response.reset();
			response.setCharacterEncoding("GBK");
			String CONTENT_TYPE_FILE_STREAM = "application/vnd.ms-excel";	// 设置保存的类型
			response.addHeader("Content-Disposition","attachment;filename=" +new String((fileName).getBytes("GBK"), "ISO8859-1"));
			response.setContentType(CONTENT_TYPE_FILE_STREAM);
			
			OutputStream out=response.getOutputStream();
			
			//excle sheet名称
			String title = "众筹领奖及发货记录";
			//excle 表头列名称
			String[] headers = {"订单id","众筹id","领奖人id","领奖人名称","奖品名称","收货地址","状态","快递公司","快递单号","手机号","创建时间"};

			ExportExcelUtil.exportExcel(title, headers, dataset, out, "yyy-MM-dd HH:mm:ss");
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    //
    @RequestMapping(value = "/exportAwardRecordBySelected", method = { RequestMethod.GET , RequestMethod.POST })
    public void exportAwardRecordBySelected(HttpServletRequest request, HttpServletResponse response,
    		@RequestParam(value = "ids", required = true)String ids) throws IOException{
    	
    	List<AwardRecordExportExcleDto> list = new ArrayList<AwardRecordExportExcleDto>();
    	
    	String [] stringArr= ids.split(",");
		for(int i = 0; i < stringArr.length; i++){
			AwardRecordExportExcleDto exportDto = null;
			String returnDataJson = httpUtils.post(PropertyUtil.getString("find_awardRecord_by_id_url"),stringArr[i]) ;
			AwardRecordQueryDto dto = JSON.parseObject(returnDataJson,AwardRecordQueryDto.class);
			AwardRecord record = dto.getAwardRecord();
			
			exportDto = new AwardRecordExportExcleDto(record.getOrderId(),record.getRaiseId(),record.getUserId(),record.getUserNick(),
					record.getProductName(),record.getDeliveryAddress(),record.getDeliveryStatus(),record.getCourierName(),
					record.getCourierNo(),record.getDeliveryPhone(),record.getCreateDate());
			list.add(exportDto);
		}
		
		//设置自动保存路径和保存文件名
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date currentDate = new Date();
    	String fileName = "众筹领奖记录报表" + sdf.format(currentDate) + ".xls";
		response.reset();
		response.setCharacterEncoding("GBK");
		String CONTENT_TYPE_FILE_STREAM = "application/vnd.ms-excel";	// 设置保存的类型
		response.addHeader("Content-Disposition","attachment;filename=" +new String((fileName).getBytes("GBK"), "ISO8859-1"));
		response.setContentType(CONTENT_TYPE_FILE_STREAM);
		
		OutputStream out=response.getOutputStream();
		
		//excle sheet名称
		String title = "众筹领奖及发货记录";
		//excle 表头列名称
		String[] headers = {"订单id","众筹id","领奖人id","领奖人名称","奖品名称","收货地址","状态","快递公司","快递单号","手机号","创建时间"};

		ExportExcelUtil.exportExcel(title, headers, list, out, "yyy-MM-dd HH:mm:ss");
    }
    
	/**
     * 领奖记录及发货后台分页查询
     * @param request
     * @throws Exception
     */
    @RequestMapping(value = "/awardListByPage", method = { RequestMethod.GET , RequestMethod.POST })
	public String listByPage(HttpServletRequest request, HttpServletResponse response,ModelMap model,
			@RequestParam(value = "currPage", required = false) Integer currPage, 
			@RequestParam(value = "pageSize", required = false)Integer pageSize,
			@RequestParam(value = "phone", required = false)String phone,
			@RequestParam(value = "state", required = false)String state) throws Exception {
    	
    	AwardRecordListDto dto = null;
		PageUtil p = new PageUtil();
		try {
			AwardRecordFrom form = new AwardRecordFrom();
			if(state != null && !"".equals(state)){
				form.setDeliveryStatus(state);
			}
			if(phone != null && !"".equals(phone)){
				form.setDeliveryPhone(phone);
			}
			form.setPageNum(currPage!=null?currPage:1);
			form.setPageSize(pageSize!=null?pageSize:15);
			String returnDataJson = httpUtils.post(PropertyUtil.getString("awardRecordList_url"),JSONObject.toJSONString(form)) ;
			logger.info("returnDataJson="+returnDataJson);
			dto = JSON.parseObject(returnDataJson,AwardRecordListDto.class);
			if(dto!=null){
				p.setCurrPage(dto.getPageNum());
				p.setNextPage(dto.getPageNum()+1);
				p.setPrePage(dto.getPageNum()-1, dto.getTotalPage()!=null?dto.getTotalPage().intValue():0);
				p.setTotalPage(dto.getTotalPage().intValue());
				p.setPageSize(dto.getPageSize());
				p.setTotalNum(dto.getTotalCount());
//					page=new Page<Raise>(raiseQueryDto.getPageNum(),raiseQueryDto.getStartIndex(), raiseQueryDto.getPageSize(), raiseQueryDto.getTotalCount(),raiseQueryDto.getRaiseList());
//					page.setPageCount(raiseQueryDto.getTotalPage().intValue());
			}
		} catch (Exception e) {
			 e.printStackTrace();
		}
		model.addAttribute("state", state);
		model.addAttribute("phone", phone);
		model.addAttribute("p", p);
		model.addAttribute("list", dto!=null?dto.getAwardRecords():null);
    	
		return "backstage/awardRecordList";
    }
    /**
     * 跳转发货页面
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/toDeliveryLogistics", method = { RequestMethod.GET , RequestMethod.POST })
   	public String toDeliveryLogistics(HttpServletRequest request, HttpServletResponse response,ModelMap model,
   			@RequestParam(value = "id", required = true) String id,
   			@RequestParam(value = "currPage", required = false) Integer currPage,
   			@RequestParam(value = "pageSize", required = false) Integer pageSize,
   			@RequestParam(value = "state", required = false) Integer state) throws Exception {
    	  	
    	AwardRecordQueryDto dto = null;
    	String returnDataJson = httpUtils.post(PropertyUtil.getString("findAwardRecordById_url"),id) ;
    	dto = JSON.parseObject(returnDataJson,AwardRecordQueryDto.class);

    	model.addAttribute("awardRecord", dto.getAwardRecord());
    	model.addAttribute("currPage", currPage);
    	model.addAttribute("pageSize", pageSize);
    	model.addAttribute("state", state);
    	
    	return "backstage/deliveryLogistics";
    }
    /**
     * 保存修改
     * @throws Exception
     */
    @RequestMapping(value = "/updateAwardRecord", method = { RequestMethod.GET , RequestMethod.POST })
   	public void updateAwardRecord(HttpServletRequest request, HttpServletResponse response,ModelMap model,
   			AwardRecord awardRecord) throws Exception {

    	String returnDataJson2 = httpUtils.post(PropertyUtil.getString("updteAwardRecord_url"),JSONObject.toJSONString(awardRecord)) ;
    	logger.error(returnDataJson2);
    	WriteUtil.outObject(response, returnDataJson2);
    }
    /**
     * 跳转修改
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/toEditAwardRecord", method = { RequestMethod.GET , RequestMethod.POST })
   	public String toEdit(HttpServletRequest request, HttpServletResponse response,ModelMap model,
   			@RequestParam(value = "id", required = true) String id,
   			@RequestParam(value = "currPage", required = false) Integer currPage,
   			@RequestParam(value = "pageSize", required = false)Integer pageSize,
   			@RequestParam(value = "state", required = false) Integer state) throws Exception {
    	
    	AwardRecordQueryDto dto = null;
    	String returnDataJson = httpUtils.post(PropertyUtil.getString("findAwardRecordById_url"),id) ;
    	dto = JSON.parseObject(returnDataJson,AwardRecordQueryDto.class);

    	model.addAttribute("awardRecord", dto.getAwardRecord());
    	model.addAttribute("currPage", currPage);
    	model.addAttribute("pageSize", pageSize);
    	model.addAttribute("state", state);
    	
    	return "backstage/editAwardRecord";
    }
    
    /**
     * 根据id删除
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/deleteById", method = { RequestMethod.GET , RequestMethod.POST })
   	public void deleteById(HttpServletRequest request, HttpServletResponse response,
   		@RequestParam(value = "id", required = true) String id) throws Exception {
    	
    	String returnDataJson = httpUtils.post(PropertyUtil.getString("delAwardRecordById_url"),id) ;
    	logger.error(returnDataJson);
    	WriteUtil.outObject(response, returnDataJson);
    }
    
    /**
     * 批量发送订单到EMS
     * @throws ClientProtocolException
     * @throws IOException
     * @throws ParseException 
     */
    @RequestMapping(value = "/batchDeliveryLostics", method = { RequestMethod.GET , RequestMethod.POST })
    public void batchDeliveryLostics(HttpServletResponse response,
    		@RequestParam(value = "ids", required = true) String ids) throws ClientProtocolException, IOException, ParseException{
    	BaseDto baseDto = null;
    	try {
    		String [] stringArr= ids.split(",");
			for(int i = 0; i < stringArr.length; i++){
				String id = stringArr[i];
				//根据id查询出领奖记录数据
				String returnDataJson = httpUtils.post(PropertyUtil.getString("findAwardRecordVoById_url"),id) ;
				AwardRecordVoDto dto = JSON.parseObject(returnDataJson,AwardRecordVoDto.class);
				AwardRecordVo awardRecord = dto.getAwardRecordVo();
				String deliveryType = awardRecord.getDeliveryType();
				if(deliveryType.equals("0") && awardRecord.getDeliveryStatus().equals("0")){
//					String url = "http://120.76.25.35/qjlup/singleVipMailServlet";
					String url = PropertyUtil.getString("send_single_order_to_ems_url");
					String ip = PropertyUtil.getString("server_ip");
					String reverseIp = new StringBuilder(ip).reverse().toString();
					
					SimpleDateFormat df = new SimpleDateFormat("yy-MM-dd");
					SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					
					BatchVipMail vbm = new BatchVipMail();
					vbm.setAddress(awardRecord.getDeliveryAddress());//收货地址
					vbm.setImport_time(df.parse(df.format(new Date())));//收货地址
					vbm.setInternals(awardRecord.getProductName()); //
					vbm.setName(awardRecord.getUserNick());//收货地址
					vbm.setNote("真龙众筹");//
					//订单id（为了避免和EMS其他订单的冲突，加前缀“ZLZC”）
					vbm.setOrder_no(PropertyUtil.getString("order_prefix")+String.valueOf(awardRecord.getOrderId()));
					vbm.setOrdertime(df2.parse(df2.format(awardRecord.getCreateDate())));//订单创建时间
					vbm.setPhone(awardRecord.getDeliveryPhone());//收货电话
					vbm.setSender_CUST_Code(PropertyUtil.getString("sender_cust_code"));//客服编号
					vbm.setTest(Integer.valueOf(PropertyUtil.getString("send_type")));//1为测试数据，0或者空为真实生产数
					vbm.setValidateKey(EmsUtil.getMd5String(reverseIp));
					
					
					JsonConfig jsonConfig = new JsonConfig();  
					jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor()); 
					net.sf.json.JSONObject jo = net.sf.json.JSONObject.fromObject(vbm, jsonConfig);
					
					String json = jo.toString();
					String jsonstr = EmsUtil.post2Server_GetJsonData(url, json);
					//打印出发货接口调用返回结果
					logger.error("--------------EMS发货接口返回结果："+jsonstr);
					net.sf.json.JSONObject jsonObject = net.sf.json.JSONObject.fromObject(jsonstr);
					//处理结果异常的情况
					if(jsonObject.get("status").equals("error")){
						baseDto = new BaseDto("fail","10001","发货失败");
					}
					if(jsonObject.get("status").equals("success")){
						//保存发货状态
						awardRecord.setDeliveryStatus("1");
						String returnDataJson2 = httpUtils.post(PropertyUtil.getString("updteAwardRecord_url"),JSONObject.toJSONString(awardRecord));
						baseDto = new BaseDto("success","10000","发货成功");
					}
				}
			}
//			baseDto = new BaseDto("success","10000","发货成功");
		} catch (Exception e) {
			e.printStackTrace();
		}
    	String jObj = JSONObject.toJSONString(baseDto);
    	WriteUtil.outObject(response, jObj);
    }
    
    /**
     * 客户发送单个订单到EMS
     * @throws ClientProtocolException
     * @throws IOException
     * @throws ParseException 
     */
    @RequestMapping(value = "/sendOrderIdToEms", method = { RequestMethod.GET , RequestMethod.POST })
    public void sendOrderIdToEms(HttpServletResponse response,
    		@RequestParam(value = "id", required = true) String id) throws ClientProtocolException, IOException, ParseException{
    	//根据id查询出领奖记录数据
    	String returnDataJson = httpUtils.post(PropertyUtil.getString("findAwardRecordById_url"),id) ;
    	AwardRecordQueryDto dto = JSON.parseObject(returnDataJson,AwardRecordQueryDto.class);
    	AwardRecord awardRecord = dto.getAwardRecord();
    	
//		String url = "http://120.76.25.35/qjlup/singleVipMailServlet";
		String url = PropertyUtil.getString("send_single_order_to_ems_url");
		String ip = PropertyUtil.getString("server_ip");
		String reverseIp = new StringBuilder(ip).reverse().toString();
		
		SimpleDateFormat df = new SimpleDateFormat("yy-MM-dd");
		SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		BatchVipMail vbm = new BatchVipMail();
		
		vbm.setAddress(awardRecord.getDeliveryAddress());//收货地址
		vbm.setImport_time(df.parse(df.format(new Date())));//收货地址
		vbm.setInternals(awardRecord.getProductName()); //
		vbm.setName(awardRecord.getUserNick());//收货地址
		vbm.setNote("真龙众筹");//收货地址
		//订单id（为了避免和EMS其他订单的冲突，加前缀“ZLZC”）
		vbm.setOrder_no(PropertyUtil.getString("order_prefix")+String.valueOf(awardRecord.getOrderId()));
		vbm.setOrdertime(df2.parse(df2.format(awardRecord.getCreateDate())));//订单创建时间
		vbm.setPhone(awardRecord.getDeliveryPhone());//收货电话
		vbm.setSender_CUST_Code(PropertyUtil.getString("sender_cust_code"));//客服编号
		vbm.setTest(Integer.valueOf(PropertyUtil.getString("send_type")));//1为测试数据，0或者空为真实生产数
		vbm.setValidateKey(EmsUtil.getMd5String(reverseIp));
		
		JsonConfig jsonConfig = new JsonConfig();  
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor()); 
		net.sf.json.JSONObject jo = net.sf.json.JSONObject.fromObject(vbm, jsonConfig);
		
		String json = jo.toString();
		String jsonstr;
		BaseDto baseDto = null;
		try {
			jsonstr = EmsUtil.post2Server_GetJsonData(url, json);
			//打印出发货接口调用返回结果
			logger.error("------------EMS发货接口返回结果："+jsonstr+"------------");
			logger.error("------------EMS发货接口返回结果："+jsonstr+"------------");
			net.sf.json.JSONObject jsonObject = net.sf.json.JSONObject.fromObject(jsonstr);
			//处理结果异常的情况
			if(jsonObject.get("status").equals("error")){
				baseDto = new BaseDto("fail","10001","发货失败");
			}
			if(jsonObject.get("status").equals("success")){
				//保存发货状态
				awardRecord.setDeliveryStatus("1");
				String returnDataJson2 = httpUtils.post(PropertyUtil.getString("updteAwardRecord_url"),JSONObject.toJSONString(awardRecord));
				baseDto = new BaseDto("success","10000","发货成功");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		String jObj = JSONObject.toJSONString(baseDto);
    	WriteUtil.outObject(response, jObj);
	}
    
    /**
     * 查看物流接口(通过订单号)
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "/logisticsByOrderId",method = { RequestMethod.GET , RequestMethod.POST })
	public void searchLogisticsByOrderId(HttpServletRequest request,  HttpServletResponse response, 
			ModelMap model, @RequestParam(value = "orderId", required = false) String orderId) throws Exception {
    	//查询物流的url(通过订单号查询)
//    	String url = "http://120.76.25.35/qjlup/batchTrackInfoByOrdernoServlet";
    	String url = PropertyUtil.getString("search_ems_logistics_information_by_orderNo_url");
		//物流编号
//    	String ordernoList = "20170420001";
    	String ordernoList = PropertyUtil.getString("order_prefix")+orderId;
    	String returnDataJson;
    	EmsTrackInfoDto dto = null;
		try {
			returnDataJson = EmsUtil.post2Server_GetJsonDataByOrderId(url, ordernoList);
			//打印出发货接口调用返回结果
			logger.error("------------EMS查看物流接口返回结果："+returnDataJson+"------------");
			logger.error("------------EMS查看物流接口返回结果："+returnDataJson+"------------");
			//处理查询异常
	    	if(returnDataJson.contains("message")){
	    		logger.error(returnDataJson);
	    		dto = new EmsTrackInfoDto("success","10000",null,null);
	    	}else{
	    		//无异常情况
	    		//转换成Json数组对象
	        	JSONArray jsonArray=JSONArray.fromObject(returnDataJson);
	    		List<VipTrackInfoVo> vipTrackInfoVos = new ArrayList<VipTrackInfoVo>();
	    		for(int i = jsonArray.size()-1; i>=0; i--){
	    			Object o=jsonArray.get(i);
	    			net.sf.json.JSONObject jsonObject2=net.sf.json.JSONObject.fromObject(o);
	    			VipTrackInfoVo vipTrackInfoVo=(VipTrackInfoVo) net.sf.json.JSONObject.toBean(jsonObject2, VipTrackInfoVo.class);
	    			vipTrackInfoVos.add(vipTrackInfoVo);
	    		}
	    		//获取邮件编号
	    		Object obj1=jsonArray.get(0);
	    		net.sf.json.JSONObject jsonObj= net.sf.json.JSONObject.fromObject(obj1);
				VipTrackInfoVo vipTrackInfoVo=(VipTrackInfoVo) net.sf.json.JSONObject.toBean(jsonObj, VipTrackInfoVo.class);
				String ems_no = vipTrackInfoVo.getEms_no();
				
				dto = new EmsTrackInfoDto("success","10000",null,vipTrackInfoVos);
	    	}
		} catch (Exception e) {
			e.printStackTrace();
			dto = new EmsTrackInfoDto("fail","10001","查询失败");
		}
    	String jObj = JSONObject.toJSONString(dto);
    	
    	WriteUtil.outObject(response, jObj);
    }
    
    /**
     * 通过订单号获取邮件编号
     * @throws ClientProtocolException
     * @throws IOException
     */
    @RequestMapping(value = "/getEmsNoByOrderId",method = { RequestMethod.GET , RequestMethod.POST })
    public void getEmsNoByOrderId(HttpServletRequest request,  HttpServletResponse response, 
			ModelMap model, @RequestParam(value = "ids", required = false) String ids) throws Exception{
    	
    	BaseDto baseDto = null;
    	try {
			String [] stringArr= ids.split(",");
			for(int i = 0; i < stringArr.length; i++){
				String id = stringArr[i];
				//根据id查询出领奖记录数据
				String returnDataJson = httpUtils.post(PropertyUtil.getString("findAwardRecordById_url"),id) ;
				AwardRecordQueryDto dto = JSON.parseObject(returnDataJson,AwardRecordQueryDto.class);
				AwardRecord awardRecord = dto.getAwardRecord();
				if(awardRecord.getDeliveryStatus().equals("1") &&
						(awardRecord.getCourierNo() == null || awardRecord.getCourierNo().equals(""))){
					
					//获取邮件号码--通过订单
//			    	String url = "http://120.76.25.35/qjlup/batchEmsnoByOrdernoServlet";
			    	String url = PropertyUtil.getString("get_ems_no_by_orderNO_url");
					List<NameValuePair> nvps = new ArrayList<NameValuePair>();
					
					String ip = PropertyUtil.getString("server_ip");
					String reverseIp = new StringBuilder(ip).reverse().toString();
					
					String ordernoList = PropertyUtil.getString("order_prefix")+String.valueOf(awardRecord.getOrderId());
					
					nvps.add(new BasicNameValuePair("validateKey",EmsUtil.getMd5String(reverseIp)));
					nvps.add(new BasicNameValuePair("ordernoList", ordernoList));
					String jsonstr = EmsUtil.post2Server_GetJsonData(url, nvps);
					//打印出EMS接口调用返回结果
					logger.error("------------"+jsonstr+"------------");
					logger.error("------------"+jsonstr+"------------");
					JSONArray JsonArray = JSONArray.fromObject(jsonstr);//先转化成json数组
					net.sf.json.JSONObject jsonObject = net.sf.json.JSONObject.fromObject(JsonArray.get(0).toString());
					
					//处理查询结果异常的情况
					
//					if(jsonObject.get("status").equals("error")){
					if(jsonObject.containsKey("status")){
						baseDto = new BaseDto("fail","10001","获取邮件号码失败");
					}else{
						JSONArray arr = JSONArray.fromObject(jsonstr);//先转化成json数组
						//获取数组第一个json的字符串 并转化成json对象
						net.sf.json.JSONObject jObj = net.sf.json.JSONObject.fromObject(arr.get(0).toString());
						String emsNo = jObj.getString("ems_no");
						//保存邮件单号
						if(!"".equals(emsNo) && emsNo != null){
							awardRecord.setCourierNo(emsNo);
							awardRecord.setCourierName("EMS");
							String returnDataJson2 = httpUtils.post(PropertyUtil.getString("updteAwardRecord_url"),JSONObject.toJSONString(awardRecord)) ;
							baseDto = new BaseDto("success","10000","获取邮件号码成功");
						}else{
							baseDto = new BaseDto("success","10002","暂无邮件号码");
						}
					}				
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    	String jObj = JSONObject.toJSONString(baseDto);
    	WriteUtil.outObject(response, jObj);
    }
    
}
