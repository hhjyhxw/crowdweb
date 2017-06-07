package com.luckcloud.h5.dto;

import java.util.List;

import com.luckcloud.h5.model.Raise;


public class RaiseListDto extends BaseDto{
	
	private List<Raise> raiseList;
	
	public RaiseListDto(){}
	
	public RaiseListDto(String resultType, String resultCode){
		super(resultType, resultCode);
	}
	
	public RaiseListDto(String resultType, String resultCode, String errorMsg){
		super(resultType, resultCode, errorMsg);
	}

	public List<Raise> getRaiseList() {
		return raiseList;
	}

	public void setRaiseList(List<Raise> raiseList) {
		this.raiseList = raiseList;
	}
	
}
