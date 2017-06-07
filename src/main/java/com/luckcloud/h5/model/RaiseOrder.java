package com.luckcloud.h5.model;

import java.util.Date;

import com.luckcloud.h5.util.DateUtil;

public class RaiseOrder {
    private Long id;

    private String userNick;

    private Long userId;

    private Long raiseId;

    private Long totalLedou;

    private Long totalShare;

    private Date createDate;
    
    private String createDateStr;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getRaiseId() {
		return raiseId;
	}

	public void setRaiseId(Long raiseId) {
		this.raiseId = raiseId;
	}

	public Long getTotalLedou() {
		return totalLedou;
	}

	public void setTotalLedou(Long totalLedou) {
		this.totalLedou = totalLedou;
	}

	public Long getTotalShare() {
		return totalShare;
	}

	public void setTotalShare(Long totalShare) {
		this.totalShare = totalShare;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getCreateDateStr() {
		return null!=createDateStr?createDateStr:DateUtil.yyyy_MM_ddHHmmss.format(createDate);
	}

	public void setCreateDateStr(String createDateStr) {
		this.createDateStr = createDateStr;
	}

}