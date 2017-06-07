package com.luckcloud.h5.form;

import java.util.Date;

/**		
 * @ClassName: BatchVipMail 
 * @Description: TODO 
 * @author pxzhao
 * @date 2016-8-3
 *
 */
public class BatchVipMail {

	private String order_no; //订单号
	private String sender_CUST_Code;//客服编号45010104213000WX
	private Date import_time; //导入时间，发货时间
	private String name; //收件人姓名
	private String phone; //收件人电话
	private String address; //收货地址
	private Date ordertime; //订单生成时间
	private String internals; //物品名称
	private String note; //众筹
	private Integer test; //1为测试数据，0或者空为真实生产数
	private String validateKey;//ip验证密钥

	
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

	public Date getImport_time() {
		return import_time;
	}

	public void setImport_time(Date import_time) {
		this.import_time = import_time;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getOrdertime() {
		return ordertime;
	}

	public void setOrdertime(Date ordertime) {
		this.ordertime = ordertime;
	}

	public String getInternals() {
		return internals;
	}

	public void setInternals(String internals) {
		this.internals = internals;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	
	
	public Integer getTest() {
		return test;
	}

	public void setTest(Integer test) {
		this.test = test;
	}

	public String getValidateKey() {
		return validateKey;
	}

	public void setValidateKey(String validateKey) {
		this.validateKey = validateKey;
	}
	
	

	
	
}
