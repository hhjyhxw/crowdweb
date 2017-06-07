package com.luckcloud.h5.dto.zlProductShow;

import com.luckcloud.h5.dto.BaseDto;
import com.luckcloud.h5.model.zlProductShow.ZlProduct;

/**
 * 
 * @author chencl
 * @date 2017-05-11
 */
public class ZlProductQueryDto extends BaseDto {

	private String resultType;//请求结果类型
	private String resultCode;//返回结果码
	private String errorMsg;//错误提示信息
	private ZlProduct zlProduct;
	
	public ZlProductQueryDto(){
		
	}
	public ZlProductQueryDto(String resultType, String resultCode, String errorMsg) {
		super(resultType, resultCode, errorMsg);
		this.resultType = resultType;
		this.resultCode = resultCode;
		this.errorMsg = errorMsg;
	}
	public ZlProductQueryDto(String resultType, String resultCode,ZlProduct zlProduct) {
		super(resultType, resultCode);
		this.resultType = resultType;
		this.resultCode = resultCode;
		this.zlProduct = zlProduct;
	}


	public String getResultType() {
		return resultType;
	}
	public void setResultType(String resultType) {
		this.resultType = resultType;
	}
	public String getResultCode() {
		return resultCode;
	}
	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}
	public String getErrorMsg() {
		return errorMsg;
	}
	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}
	public ZlProduct getZlProduct() {
		return zlProduct;
	}
	public void setZlProduct(ZlProduct zlProduct) {
		this.zlProduct = zlProduct;
	}
	
}
