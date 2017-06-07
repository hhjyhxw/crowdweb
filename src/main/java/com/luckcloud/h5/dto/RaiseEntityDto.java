package com.luckcloud.h5.dto;

import com.luckcloud.h5.model.Raise;


/**
 * 
 * 类名称: RaiseEntityDto
 * 类描述: 众筹实体
 * 创建人: ldf
 * 创建时间:2017年4月17日 上午11:42:18
 */
public class RaiseEntityDto extends BaseDto {
	private Raise raise;
	
	public RaiseEntityDto() {

	}

	public Raise getRaise() {
		return raise;
	}

	public void setRaise(Raise raise) {
		this.raise = raise;
	}
}
