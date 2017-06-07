package com.luckcloud.h5.dto;

import java.util.ArrayList;
import java.util.List;

import com.luckcloud.h5.vo.VipTrackInfoVo;

public class EmsTrackInfoDto extends BaseDto {
	
	private String resultType;//请求结果类型
	private String resultCode;//返回结果码
	private String errorMsg;//错误提示信息
	private String ems_no;
	private List<VipTrackInfoVo> vipTrackInfoVos = new ArrayList<VipTrackInfoVo>();
	
	public EmsTrackInfoDto(){
		
	}
	
	public EmsTrackInfoDto(String resultType, String resultCode, String ems_no, List<VipTrackInfoVo> vipTrackInfoVos) {
		super(resultType, resultCode);
		this.resultType = resultType;
		this.resultCode = resultCode;
		this.ems_no = ems_no;
		this.vipTrackInfoVos = vipTrackInfoVos;
	}

	public EmsTrackInfoDto(String resultType, String resultCode, String errorMsg) {
		super(resultType, resultCode, errorMsg);
		this.resultType = resultType;
		this.resultCode = resultCode;
		this.errorMsg = errorMsg;
	}
	
	public EmsTrackInfoDto(String resultType, String resultCode, String errorMsg, String ems_no,
			List<VipTrackInfoVo> vipTrackInfoVos) {
		super(resultType, resultCode);
		this.resultType = resultType;
		this.resultCode = resultCode;
		this.errorMsg = errorMsg;
		this.ems_no = ems_no;
		this.vipTrackInfoVos = vipTrackInfoVos;
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
	public String getEms_no() {
		return ems_no;
	}
	public void setEms_no(String ems_no) {
		this.ems_no = ems_no;
	}
	public List<VipTrackInfoVo> getVipTrackInfoVos() {
		return vipTrackInfoVos;
	}
	public void setVipTrackInfoVos(List<VipTrackInfoVo> vipTrackInfoVos) {
		this.vipTrackInfoVos = vipTrackInfoVos;
	}
	
}
