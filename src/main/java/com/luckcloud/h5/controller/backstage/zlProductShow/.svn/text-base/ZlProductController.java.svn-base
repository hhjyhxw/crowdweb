package com.luckcloud.h5.controller.backstage.zlProductShow;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.luckcloud.h5.dto.BaseDto;
import com.luckcloud.h5.dto.zlProductShow.ZlProductListDto;
import com.luckcloud.h5.dto.zlProductShow.ZlProductQueryDto;
import com.luckcloud.h5.form.zlProductShow.ZlProductListForm;
import com.luckcloud.h5.model.zlProductShow.ZlProduct;
import com.luckcloud.h5.util.HttpUtils;
import com.luckcloud.h5.util.PageUtil;
import com.luckcloud.h5.util.PropertyUtil;
import com.luckcloud.h5.util.WriteUtil;
//import net.coobird.

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping(value = "/zl_product")
public class ZlProductController {
	HttpUtils httpUtils = new HttpUtils();
    private final Logger logger = Logger.getLogger(getClass());
    
    /**
     * 真龙产品后台分页
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/listByPage", method = { RequestMethod.GET , RequestMethod.POST })
    public String listByPage(HttpServletRequest request, HttpServletResponse response, ModelMap model,
    		@RequestParam(value = "currPage", required = false) Integer currPage, 
			@RequestParam(value = "pageSize", required = false)Integer pageSize,
			@RequestParam(value = "productName", required = false)String productName,
			@RequestParam(value = "type", required = false)String type,
			@RequestParam(value = "tarContent", required = false)String tarContent) throws IOException{
    	
    	ZlProductListDto dto = null;
    	PageUtil p = new PageUtil();
    	
    	try {
    		ZlProductListForm form = new ZlProductListForm();
    		if(productName != null && !"".equals(productName)){
				form.setProductName(productName);
			}
			if(type != null && !"".equals(type)){
				form.setCigaretteType(type);
			}
//			if(tarContent != null && !"".equals(tarContent)){
//				form.setTarContent(Double.valueOf(tarContent));
//			}
			form.setPageNum(currPage!=null?currPage:1);
			form.setPageSize(pageSize!=null?pageSize:15);
			String returnDataJson = httpUtils.post(PropertyUtil.getString("zl_product_list_backStage_url"),JSONObject.toJSONString(form)) ;
			logger.info("returnDataJson="+returnDataJson);
			dto = JSON.parseObject(returnDataJson,ZlProductListDto.class);
			if(dto!=null){
				p.setCurrPage(dto.getPageNum());
				p.setNextPage(dto.getPageNum()+1);
				//p.setPrePage(dto.getPageNum()-1, dto.getTotalPage()!=null?dto.getTotalPage().intValue():0);
				p.setPrePage(dto.getPageNum()-1,dto.getTotalPage());
				p.setTotalPage(dto.getTotalPage());
				p.setPageSize(dto.getPageSize());
				p.setTotalNum(dto.getTotalCount());
//				page=new Page<Raise>(raiseQueryDto.getPageNum(),raiseQueryDto.getStartIndex(), raiseQueryDto.getPageSize(), raiseQueryDto.getTotalCount(),raiseQueryDto.getRaiseList());
//				page.setPageCount(raiseQueryDto.getTotalPage().intValue());
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		model.addAttribute("type", type);
		model.addAttribute("productName", productName);
		model.addAttribute("p", p);
		model.addAttribute("list", dto!=null?dto.getZlProducts():null);
    	
		return "backstage/zlProductShow/zlProductList";
    }
    /**
     * 跳转新增页面
     * @throws IOException
     */
    @RequestMapping(value = "/toAdd", method = { RequestMethod.GET , RequestMethod.POST })
    public String toAdd(HttpServletRequest request, HttpServletResponse response) throws IOException{
    	return "backstage/zlProductShow/addZlProduct";
    }
    /**
     * 保存新增
     * @param request
     * @param response
     * @param record
     * @throws IOException
     */
    @RequestMapping(value = "/saveAddProduct", method = { RequestMethod.GET , RequestMethod.POST })
    public String saveAddProduct(HttpServletRequest request, HttpServletResponse response, ZlProduct record,
    		@RequestParam("plFile") MultipartFile plFile,@RequestParam("pdlFile") MultipartFile pdlFile,
    		RedirectAttributes attr) throws IOException{
    	
    	//目标文件保存路径
    	String upload_image_path = PropertyUtil.getString("upload_image_path");
    	String shortTimePath = request.getServletContext().getRealPath("/") + "/" + upload_image_path;
    	
    	//图片上传成功标识
    	boolean uploadSuccess = true;
    	String absolutePath = null;//项目绝对路径
    	String uploadIconPath = null;//文件上传路径 
    	
    	//一.临时文件路径
    	absolutePath = request.getServletContext().getRealPath("/");
    	uploadIconPath = PropertyUtil.getString("upload_icon_path");
    	absolutePath += "/" + uploadIconPath;
    	
    	//二.获取文件名和后缀名
    	//商品图标
    	String plfileName = "";
    	File pltargetFile = null;//目标文件
    	File plSourceFile = null;//源文件
    	if(plFile.getSize() != 0){
    		String fullFileName = plFile.getOriginalFilename();//获取文件名包括后缀
    		int random = new Random().nextInt(10000);//获取4位随机数
    		String extName = fullFileName.substring(fullFileName.lastIndexOf("."));//得到后缀	
    		long timestamp = System.nanoTime();
    		plfileName = timestamp + random + extName;//目标文件
//    		String sourceName = timestamp + random + extName;//源文件(临时文件)
    		//三.创建目标
            pltargetFile = new File(absolutePath, plfileName);//目标文件
            plSourceFile = new File(shortTimePath, plfileName);//源文件(临时文件)
            if(!plSourceFile.exists()){ 
            	plSourceFile.mkdirs();  
            }
    	}
    	//商品详情图片
    	String pdlfileName = "";
    	File pdltargetFile = null;
    	File pdlSourceFile = null;
		if(pdlFile.getSize() != 0){
			String pdlfullFileName = pdlFile.getOriginalFilename();//获取文件名包括后缀
			int pdlrandom = new Random().nextInt(10000);//获取4位随机数
			String pdlextName = pdlfullFileName.substring(pdlfullFileName.lastIndexOf("."));//得到后缀	
			long pdltimestamp = System.nanoTime();
			pdlfileName = pdltimestamp + pdlrandom + pdlextName;
			//三.创建目标
			pdltargetFile = new File(absolutePath, pdlfileName);//目标文件
			pdlSourceFile = new File(shortTimePath, pdlfileName);//源文件(临时文件)
			if(!pdlSourceFile.exists()){  
				pdlSourceFile.mkdirs();  
	        }
		}
        
        try {  
        	//四.保存文件 
        	//商品logo
        	if(plSourceFile != null){
//        		plFile.transferTo(plSourceFile); 
        		plFile.transferTo(pltargetFile);
//            	Thumbnails.of(plSourceFile).scale(0.7f).toFile(pltargetFile);//按比例缩小并保存到目标路径
//        		Thumbnails.of(plSourceFile).size(235,150).toFile(pltargetFile); 
//            	plSourceFile.delete();//删除临时文件
            	record.setProductLogo(uploadIconPath + "/" +plfileName);
        	}
        	//商品详情图片
        	if(pdlSourceFile != null){
        		pdlFile.transferTo(pdlSourceFile);
//        		pdlFile.transferTo(pdltargetFile);
        		Thumbnails.of(pdlSourceFile).scale(0.5f).toFile(pdltargetFile);//按比例缩小并保存到目标路径
//        		Thumbnails.of(pdlSourceFile).size(235,150).toFile(pdltargetFile); 
        		pdlSourceFile.delete();//删除临时文件
            	record.setProductDetailLogo(uploadIconPath + "/" +pdlfileName);
        	}
        } catch (Exception e) {
        	uploadSuccess=false;//图片上传没有成功!
            e.printStackTrace();  
        }
        if(uploadSuccess){
	    	record.setCreateTime(new Date());
	    	String returnDataJson = httpUtils.post(PropertyUtil.getString("add_zlProduct_url"),JSONObject.toJSONString(record)) ;
	    	logger.error(returnDataJson);
//	    	WriteUtil.outObject(response, returnDataJson);
        }else{
        	BaseDto dto = new BaseDto("fail","10001","新增真龙产品失败");
//        	WriteUtil.outObject(response, JSONObject.toJSONString(dto));
        }
        return "redirect:/zl_product/listByPage";
    }
    /**
     * 跳转修改
     */
    @RequestMapping(value = "/toUpdateProduct", method = { RequestMethod.GET , RequestMethod.POST })
    public String toUpdateProduct(HttpServletRequest request, HttpServletResponse response, ModelMap model,
    		@RequestParam(value = "currPage", required = false) Integer currPage, 
			@RequestParam(value = "pageSize", required = false)Integer pageSize,
			@RequestParam(value = "id", required = false)Integer id) throws IOException{
    	
    	ZlProductQueryDto dto = null;
    	String returnDataJson = httpUtils.post(PropertyUtil.getString("find_zlProduct_byId_url"),JSONObject.toJSONString(id)) ;
    	logger.error(returnDataJson);
    	dto = JSON.parseObject(returnDataJson,ZlProductQueryDto.class);
//    	model.addAttribute("p", p);
		model.addAttribute("zlProduct", dto!=null?dto.getZlProduct():null);
    	return "backstage/zlProductShow/addZlProduct";
    }
    /**
     * 保存修改
     * @throws IOException
     */
    @RequestMapping(value = "/saveUpdateProduct", method = { RequestMethod.GET , RequestMethod.POST })
    public String saveUpdateProduct(HttpServletRequest request, HttpServletResponse response, ZlProduct record,
    		@RequestParam("plFile") MultipartFile plFile,@RequestParam("pdlFile") MultipartFile pdlFile,
    		RedirectAttributes attr) throws IOException{
    	//目标文件保存路径
    	String upload_image_path = PropertyUtil.getString("upload_image_path");
    	String shortTimePath = request.getServletContext().getRealPath("/") + "/" + upload_image_path;
    	
    	//图片上传成功标识
    	boolean uploadSuccess = true;
    	String absolutePath = null;//项目绝对路径
    	String uploadIconPath = null;//文件上传路径 
    	
    	//一.临时文件路径
    	absolutePath = request.getServletContext().getRealPath("/");
    	uploadIconPath = PropertyUtil.getString("upload_icon_path");
    	absolutePath += "/" + uploadIconPath;
    	
    	//二.获取文件名和后缀名
    	//商品图标
    	String plfileName = "";
    	File pltargetFile = null;//目标文件
    	File plSourceFile = null;//源文件
    	if(plFile.getSize() != 0){
    		String fullFileName = plFile.getOriginalFilename();//获取文件名包括后缀
    		int random = new Random().nextInt(10000);//获取4位随机数
    		String extName = fullFileName.substring(fullFileName.lastIndexOf("."));//得到后缀	
    		long timestamp = System.nanoTime();
    		plfileName = timestamp + random + extName;//目标文件
//    		String sourceName = timestamp + random + extName;//源文件(临时文件)
    		//三.创建目标
            pltargetFile = new File(absolutePath, plfileName);//目标文件
            plSourceFile = new File(shortTimePath, plfileName);//源文件(临时文件)
            if(!plSourceFile.exists()){ 
            	plSourceFile.mkdirs();  
            }
    	}
    	//商品详情图片
    	String pdlfileName = "";
    	File pdltargetFile = null;
    	File pdlSourceFile = null;
		if(pdlFile.getSize() != 0){
			String pdlfullFileName = pdlFile.getOriginalFilename();//获取文件名包括后缀
			int pdlrandom = new Random().nextInt(10000);//获取4位随机数
			String pdlextName = pdlfullFileName.substring(pdlfullFileName.lastIndexOf("."));//得到后缀	
			long pdltimestamp = System.nanoTime();
			pdlfileName = pdltimestamp + pdlrandom + pdlextName;
			//三.创建目标
			pdltargetFile = new File(absolutePath, pdlfileName);//目标文件
			pdlSourceFile = new File(shortTimePath, pdlfileName);//源文件(临时文件)
			if(!pdlSourceFile.exists()){  
				pdlSourceFile.mkdirs();  
	        }
		}
        
        try {  
        	//四.保存文件 
        	//商品logo
        	if(plSourceFile != null){
//        		plFile.transferTo(plSourceFile); 
        		plFile.transferTo(pltargetFile); 
//            	Thumbnails.of(plSourceFile).scale(0.7f).toFile(pltargetFile);//按比例缩小并保存到目标路径
//        		Thumbnails.of(plSourceFile).size(235,150).toFile(pltargetFile);
//            	plSourceFile.delete();//删除临时文件
            	record.setProductLogo(uploadIconPath + "/" +plfileName);
        	}
        	//商品详情图片
        	if(pdlSourceFile != null){
        		pdlFile.transferTo(pdlSourceFile);
//        		pdlFile.transferTo(pltargetFile);
        		Thumbnails.of(pdlSourceFile).scale(0.5f).toFile(pltargetFile);//按比例缩小并保存到目标路径
//        		Thumbnails.of(pdlSourceFile).size(235,150).toFile(pltargetFile);
        		pdlSourceFile.delete();//删除临时文件
            	record.setProductDetailLogo(uploadIconPath + "/" +pdlfileName);
        	}
        } catch (Exception e) {
        	uploadSuccess=false;//图片上传没有成功!
            e.printStackTrace();  
        }
        if(uploadSuccess){
        	record.setLastModifyTime(new Date());
        	String returnDataJson = httpUtils.post(PropertyUtil.getString("update_zlProduct_url"),JSONObject.toJSONString(record)) ;
        	logger.error(returnDataJson);
//        	WriteUtil.outObject(response, returnDataJson);
        }
        return "redirect:/zl_product/listByPage";
    }
    /**
     * 根据id删除
     * @param request
     * @param response
     * @param id
     * @throws Exception
     */
    @RequestMapping(value = "/deleteById", method = { RequestMethod.GET , RequestMethod.POST })
   	public void deleteById(HttpServletRequest request, HttpServletResponse response,
   		@RequestParam(value = "id", required = true) String id) throws Exception {
    	
    	String returnDataJson = httpUtils.post(PropertyUtil.getString("del_zlProduct_byId_url"),id) ;
    	logger.error(returnDataJson);
    	WriteUtil.outObject(response, returnDataJson);
    }
    /**
     * 批量删除
     * @throws Exception
     */
    @RequestMapping(value = "/deleteAll", method = { RequestMethod.GET , RequestMethod.POST })
   	public void deleteAll(HttpServletRequest request, HttpServletResponse response,
   		@RequestParam(value = "ids", required = true) String ids) throws Exception {
    	String [] stringArr= ids.split(",");
    	BaseDto baseDto = null;
    	try {
			for(int i = 0; i < stringArr.length; i++){
				String id = stringArr[i];
				String returnDataJson = httpUtils.post(PropertyUtil.getString("del_zlProduct_byId_url"),id) ;
				logger.error(returnDataJson);
			}
			baseDto = new BaseDto("success","10000","删除成功");
		} catch (Exception e) {
			e.printStackTrace();
			baseDto = new BaseDto("fail","10001","删除失败");
		}
    	WriteUtil.outObject(response, JSONObject.toJSONString(baseDto));
    }
}
