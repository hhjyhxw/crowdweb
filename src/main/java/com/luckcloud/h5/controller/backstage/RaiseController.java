package com.luckcloud.h5.controller.backstage;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.luckcloud.h5.util.DateUtil;
import com.luckcloud.h5.dto.BaseDto;
import com.luckcloud.h5.dto.LuckyNoListDto;
import com.luckcloud.h5.dto.PrizeRecordEntityDto;
import com.luckcloud.h5.dto.PrizeRecordListDto;
import com.luckcloud.h5.dto.RaiseDetailDto;
import com.luckcloud.h5.dto.RaiseEntityDto;
import com.luckcloud.h5.dto.RaiseOrderListDto;
import com.luckcloud.h5.dto.RaiseQueryDto;
import com.luckcloud.h5.form.RaiseForm;
import com.luckcloud.h5.model.Raise;
import com.luckcloud.h5.util.ExportExcelUtil;
import com.luckcloud.h5.util.HttpUtils;
import com.luckcloud.h5.util.PageUtil;
import com.luckcloud.h5.util.PropertyUtil;
import com.luckcloud.h5.util.WriteUtil;


/**
 * 
 * 类名称: RaiseController
 * 类描述: 众筹活动后台管理
 * 创建人: 
 * 创建时间:2017年4月11日 下午5:38:03
 */
@Controller
@RequestMapping(value = "/raise")
public class RaiseController {
	

	HttpUtils httpUtils = new HttpUtils();
    private final Logger logger = Logger.getLogger(getClass());

	/** 
	 * 众筹列表
	 */
    @RequestMapping(value = { "/raiseList" }, method = {RequestMethod.POST,RequestMethod.GET})
	public String raiseList(Raise raise,
							HttpServletRequest request, 
							HttpServletResponse response,
							ModelMap model,
							@RequestParam(value = "currPage", required = false) Integer currPage, 
							@RequestParam(value = "pageSize", required = false) Integer pageSize){
    	
		RaiseQueryDto raiseQueryDto = null;
		PageUtil p = new PageUtil();
		try {
			RaiseForm raiseForm = new RaiseForm();
			raiseForm.setPageNum(currPage!=null && !"".equals(currPage)?currPage:1);
			raiseForm.setPageSize(pageSize!=null&& !"".equals(currPage)?pageSize:15);
			//添加分页查询
			raiseForm.setRaise(raise);
			String returnDataJson = httpUtils.post(PropertyUtil.getString("pre_raise_list_url"),JSONObject.toJSONString(raiseForm)) ;
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
		model.addAttribute(raise);
		model.addAttribute("list", raiseQueryDto!=null?raiseQueryDto.getRaiseList():null);
		return "backstage/raise/raiseList";
	}
	
	/** 
	 * raise添加众筹活动
	 */
    @RequestMapping(value = { "/raiseAdd" }, method = RequestMethod.GET)
	public String raiseAdd(@RequestParam(value="id",required=false) String id,ModelMap model){
    	if(null!=id && !"".equals(id)){
        	//通过id查询获取实体信息通过id查询获取实体信息
    		Map<String, String> map = new HashMap<String, String>();
    		map.put("id", id);
    		String returnDataJson = httpUtils.post(PropertyUtil.getString("raise_get_by_id"),JSONObject.toJSONString(map));
    		logger.info("returnDataJson=" + returnDataJson);
    		RaiseEntityDto dto = JSONObject.parseObject(returnDataJson, RaiseEntityDto.class); 
    		if(null!=dto && "10000".equals(dto.getResultCode())){
    			Raise raise = dto.getRaise();
    			model.addAttribute(raise);
    		}    		
    	}
		return "forward:/backstage/raise/raiseAdd.jsp";
	}
    
    @RequestMapping(value = { "/raiseAddDo" }, method = RequestMethod.POST)
	public String raiseAddDo(Raise raise,
			               @RequestParam("file") MultipartFile file,
						   HttpServletRequest request,
			               HttpServletResponse response){
    	//图片上传成功标识
    	boolean uploadSuccess = true;
    	BaseDto  baseDto = null;//服务端返回类型
    	String   absolutePath = null;//项目绝对路径
    	String   uploadIconPath = null;//文件上传路径 
    	//设置日期时间
    	try {
    		raise.setStartDate(DateUtil.yyyy_MM_ddHHmmss.parse(raise.getStartDateStr()));
    		raise.setEndDate(DateUtil.yyyy_MM_ddHHmmss.parse(raise.getEndDateStr()));
			raise.setOutTime(DateUtil.yyyy_MM_ddHHmmss.parse(raise.getOutTimeStr()));
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
    	
    	if("".equals(raise.getRaiseIcon()) || null ==raise.getRaiseIcon()){
        	//一.从配置文件获取路径
        	absolutePath = request.getServletContext().getRealPath("/");
        	uploadIconPath = PropertyUtil.getString("upload_icon_path");
        	absolutePath += "/" + uploadIconPath;
        	
        	//二.获取文件名和后缀名
    		String fullFileName = file.getOriginalFilename();//获取文件名包括后缀
    		int random = new Random().nextInt(10000);//获取4位随机数
    		String extName = fullFileName.substring(fullFileName.lastIndexOf("."));//得到后缀	
    		long timestamp = System.nanoTime();
    		String fileName = timestamp + random + extName;
    		
        	//三.创建目标
            File targetFile = new File(absolutePath, fileName);  
            if(!targetFile.exists()){  
                targetFile.mkdirs();  
            }
            try {  
            	//四.保存文件 
                file.transferTo(targetFile);  
                raise.setRaiseIcon(uploadIconPath + "/" +fileName);
            } catch (Exception e) {
            	uploadSuccess=false;//图片上传没有成功!
                e.printStackTrace();  
            }
    	}
    	if(uploadSuccess){
            //五.图片保存成功不报错,调用后台服务的方法
			RaiseForm raiseForm = new RaiseForm();
			
			raiseForm.setRaise(raise);
			String returnDataJson = httpUtils.post(PropertyUtil.getString("raise_add_do"),JSONObject.toJSONString(raiseForm)) ;
			logger.info("returnDataJson="+returnDataJson); 
			//六.返回的json数据转化
			baseDto  = JSON.parseObject(returnDataJson,BaseDto.class);
			//七.解析返回的数据,判断是否插入成功
			//WriteUtil.outObject(response, returnDataJson);   		
    	}
        return "redirect:/raise/raiseList";
	}    
	/** 
	 * raise修改众筹活动
	 */
    @RequestMapping(value = { "/raiseUpdate" }, method = RequestMethod.GET)
	public String raiseUpdate(@RequestParam(value = "id") String id, 
							  ModelMap model){
    	//通过id查询获取实体信息通过id查询获取实体信息
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		String returnDataJson = httpUtils.post(PropertyUtil.getString("raise_get_by_id"),JSONObject.toJSONString(map));
		logger.info("returnDataJson=" + returnDataJson);
		RaiseEntityDto dto = JSONObject.parseObject(returnDataJson, RaiseEntityDto.class); 
		if(null!=dto && "10000".equals(dto.getResultCode())){
			Raise raise = dto.getRaise();
			model.addAttribute(raise);
			return "forward:/backstage/raise/raiseUpdate.jsp";
		}
    	return null;
	}
    
    @RequestMapping(value = {"/raiseUpdateDo"}, method = RequestMethod.POST)
	public String raiseUpdateDo(Raise raise,
							  @RequestParam(required=false) MultipartFile file,
			                  HttpServletRequest request,
                              HttpServletResponse response){
    	BaseDto  baseDto = null;//服务端返回类型
    	String   absolutePath = null;//项目绝对路径
    	String   uploadIconPath = null;//文件上传路径 
    	try {
    		raise.setStartDate(DateUtil.yyyy_MM_ddHHmmss.parse(raise.getStartDateStr()));
    		raise.setEndDate(DateUtil.yyyy_MM_ddHHmmss.parse(raise.getEndDateStr()));
			raise.setOutTime(DateUtil.yyyy_MM_ddHHmmss.parse(raise.getOutTimeStr()));
		} catch (ParseException e1) {
			e1.printStackTrace();
		}    	
		RaiseForm raiseForm = new RaiseForm();
		raiseForm.setRaise(raise);
		boolean falg = true;
        	//一.如果上传文件不为空
        	if(null !=file){
        		if(null != file.getOriginalFilename() && !"".equals(file.getOriginalFilename())){
            		//1.1保存现在的文件
                	//1.1.1从配置文件获取路径
                	absolutePath = request.getServletContext().getRealPath("/");
                	uploadIconPath = PropertyUtil.getString("upload_icon_path");
                	absolutePath += "/" + uploadIconPath;        		
                	//1.1.2.获取文件名和后缀名
            		String fullFileName = file.getOriginalFilename();//获取文件名包括后缀
            		int random = new Random().nextInt(10000);//获取4位随机数
            		String extName = fullFileName.substring(fullFileName.lastIndexOf("."));//得到后缀	
            		long timestamp = System.nanoTime();
            		String fileName = timestamp + random + extName; 
            		//1.1.3.创建目标
                    File targetFile = new File(absolutePath, fileName);  
                    if(!targetFile.exists()){  
                        targetFile.mkdirs();  
                    }
                    try {
                    	//1.1.4.保存文件 
    					file.transferTo(targetFile);
    					//1.2删除原有的文件
    				    File oldFile = new File(absolutePath,raise.getRaiseIcon());  
    				    // 路径为文件且不为空则进行删除  
    				    if (oldFile.isFile() && oldFile.exists()) {  
    				    	oldFile.delete();  
    				    }  
    					//1.3保存新的众筹图标字段   
    				    raise.setRaiseIcon(uploadIconPath + "/" +fileName);
    				    
    				} catch (IllegalStateException | IOException e) {
    					//如果在文件上传和删除阶段爆出异常,数据库数据不更新
    					falg = false;
    					e.printStackTrace();
    				} 
            	}       			
        	}

        	//二.更新服务端的数据
        	if(falg){
    			String returnDataJson = httpUtils.post(PropertyUtil.getString("raise_update_do"),JSONObject.toJSONString(raiseForm)) ;
    			logger.info("returnDataJson="+returnDataJson); 
    			baseDto  = JSON.parseObject(returnDataJson,BaseDto.class);
    			//WriteUtil.outObject(response, returnDataJson);        		
        	}else{
        		//返回更新失败的dto
        	}
        	return "redirect:/raise/raiseList";
	}    
	/** 
	 * raise删除一个众筹活动
	 */    
    @RequestMapping(value ={"/raiseDelOne"}, method={RequestMethod.POST,RequestMethod.GET})
	public void raiseDelOne(@RequestParam(value = "id") String id,HttpServletResponse response){
    	BaseDto  baseDto = null;//服务端返回类型
		String returnDataJson = httpUtils.post(PropertyUtil.getString("raise_del_one"),id) ;
		logger.info("returnDataJson="+returnDataJson); 
		baseDto  = JSON.parseObject(returnDataJson,BaseDto.class);
		if(null != baseDto){
			if("10000".equals(baseDto.getResultCode())){
				WriteUtil.outObject(response, "SUCCESS");
			}else{
				WriteUtil.outObject(response,"ERROR");
			}			
		}
	} 
    /**
     * raise删除多个众筹活动
     */
    @RequestMapping(value = { "/raiseDelMore" }, method = RequestMethod.POST)
	public void raiseDelMore(HttpServletRequest request, HttpServletResponse response){
    	//异步返回数据页面重定向
	}   
    
    /**
     * raise详情页面
     */
    @RequestMapping(value = { "/raiseDetail" }, method = RequestMethod.GET)
	public String raiseDetail(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="id") String id){
    	Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		String returnDataJson = httpUtils.post(PropertyUtil.getString("pre_raise_detail_url"),JSONObject.toJSONString(map));
		logger.info("returnDataJson=" + returnDataJson);
		RaiseDetailDto dto = JSONObject.parseObject(returnDataJson, RaiseDetailDto.class);
		request.setAttribute("data", dto);
		if (null != dto && "10000".equals(dto.getResultCode())) {
			request.setAttribute("raise", dto);
			return "backstage/raise/raiseDetail";
		}
		return null;
	}
    
    /**
     * 参与众筹的会员列表
     */
    @RequestMapping(value = { "/raiseMemberList" }, method = RequestMethod.POST)
	public void raiseMemberList(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="id", required=true) String id, 
			@RequestParam(value="pageNum", required=true) String pageNum,
			@RequestParam(value="nickName", required=false) String nickName,
			@RequestParam(value="luckyNo", required=false) String luckyNo){
    	Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pageNum", pageNum);
		map.put("nickName", nickName);
		map.put("luckyNo", luckyNo);
		String returnDataJson = httpUtils.post(PropertyUtil.getString("raise_order_list_url"),JSONObject.toJSONString(map));
		logger.info("returnDataJson=" + returnDataJson);
		RaiseOrderListDto dto = JSONObject.parseObject(returnDataJson, RaiseOrderListDto.class);
		String json = JSONObject.toJSONString(dto);
		System.out.println("output json="+json);
		WriteUtil.outObject(response, json);
	}
    
    /**
     * 众筹的幸运号
     */
    @RequestMapping(value = { "/raiseLuckyNo" }, method = RequestMethod.POST)
	public void raiseLuckyNo(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="id", required=true) String id){
    	Map<String, String> map = new HashMap<String, String>();
		map.put("raiseId", id);
		String returnDataJson = httpUtils.post(PropertyUtil.getString("raise_lucky_no_url"),JSONObject.toJSONString(map));
		logger.info("returnDataJson=" + returnDataJson);
		PrizeRecordListDto dto = JSONObject.parseObject(returnDataJson, PrizeRecordListDto.class);
		String json = JSONObject.toJSONString(dto);
		WriteUtil.outObject(response, json);
	}
    
    /**
     * 众筹开奖列表
     */
    @RequestMapping(value = { "/prizeRecordList" }, method = RequestMethod.GET)
	public String raiseCompletedList(HttpServletRequest request, HttpServletResponse response){
    	String pageNum = request.getParameter("pageNum");
    	String pageSize = request.getParameter("pageSize");
    	String period = request.getParameter("period");
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("pageNum", pageNum);
    	map.put("pageSize", pageSize);
    	map.put("period", period);
		String returnDataJson = httpUtils.post(PropertyUtil.getString("raise_prize_record_url"), JSONObject.toJSONString(map));
		logger.info("returnDataJson=" + returnDataJson);
		PrizeRecordListDto dto = JSONObject.parseObject(returnDataJson, PrizeRecordListDto.class);
		request.setAttribute("data", dto);
		if (null != dto && "10000".equals(dto.getResultCode())) {
			request.setAttribute("raise", dto);
			return "backstage/raise/prizeRecordList";
		}
		return null;
	}
    
    /**
     * 导出众筹开奖列表
     */
    @RequestMapping(value = { "/exportPrizeRecord" }, method = RequestMethod.GET)
	public void exportPrizeRecord(HttpServletRequest request, HttpServletResponse response){
    	String period = request.getParameter("period");
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("period", period);
		String returnDataJson = httpUtils.post(PropertyUtil.getString("export_prize_record_url"), JSONObject.toJSONString(map));
		logger.info("returnDataJson=" + returnDataJson);
		PrizeRecordListDto dto = JSONObject.parseObject(returnDataJson, PrizeRecordListDto.class);
		List<PrizeRecordEntityDto> prizeRecordList = dto.getPrizeRecordList();
		String[] headers = {"期数", "期号", "幸运号", "用户昵称", "开奖时间", "领奖状态"};
		OutputStream out = null;
		try {
			response.setContentType("application/vnd.ms-excel");
			response.setCharacterEncoding("utf-8");
			response.setHeader("content-disposition", "attachment;filename=" + new String("开奖信息".getBytes(), "ISO8859-1") + ".xls");
			out = response.getOutputStream();
			ExportExcelUtil.exportPrizeRecordExcel("开奖信息", headers, prizeRecordList, out);
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
    
    /** 
	 * 众筹列表
	 */
    @RequestMapping(value = { "/raiseCompletedList" }, method = {RequestMethod.POST,RequestMethod.GET})
	public String raiseCompletedList(Raise raise,
							HttpServletRequest request, 
							HttpServletResponse response,
							ModelMap model,
							@RequestParam(value = "currPage", required = false) Integer currPage, 
							@RequestParam(value = "pageSize", required = false) Integer pageSize){
    	
		RaiseQueryDto raiseQueryDto = null;
		PageUtil p = new PageUtil();
		try {
			RaiseForm raiseForm = new RaiseForm();
			raiseForm.setPageNum(currPage!=null && !"".equals(currPage)?currPage:1);
			raiseForm.setPageSize(pageSize!=null&& !"".equals(currPage)?pageSize:10);
			raiseForm.setRaise(raise);
			//添加分页查询
			String returnDataJson = httpUtils.post(PropertyUtil.getString("raise_completed_list_url"),JSONObject.toJSONString(raiseForm)) ;
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
		model.addAttribute(raise);
		model.addAttribute("list", raiseQueryDto!=null?raiseQueryDto.getRaiseList():null);
		return "backstage/raise/raiseCompletedList";
	}
}
