package com.luckcloud.h5.vo;

/**
 * EMS物流信息接收VO
 * @author chencl
 * @date 2017-04-19
 */
public class VipTrackInfoVo {

	private String address; // 官网：处理地点
	private String date; // 官网：处理时间
	private String ems_no; // 邮件号码
	private String finished;// 处理完成为：W,U,Z等其它标示，未完成 为0
	private String order_no;//客户订单号
	// private String cust_data_id; //EMS提供的唯一标识 --通过邮件号码+track字段即可得到了
	private String sender_CUST_Code;//客户代码
	private String status_p;// 官网：邮件状态
	/* 本人W 他人M 收发章N 退回妥投U Z */
	private Integer track; // 现在是第几条信息(邮件流转到第几步)
	
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getEms_no() {
		return ems_no;
	}
	public void setEms_no(String ems_no) {
		this.ems_no = ems_no;
	}
	public String getFinished() {
		return finished;
	}
	public void setFinished(String finished) {
		this.finished = finished;
	}
	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}
	public String getSender_CUST_Code() {
		return sender_CUST_Code;
	}
	public void setSender_CUST_Code(String sender_CUST_Code) {
		this.sender_CUST_Code = sender_CUST_Code;
	}
	public String getStatus_p() {
		return status_p;
	}
	public void setStatus_p(String status_p) {
		this.status_p = status_p;
	}
	public Integer getTrack() {
		return track;
	}
	public void setTrack(Integer track) {
		this.track = track;
	}
}
