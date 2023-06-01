package com.t09ether.home.dto;

public class PaymentDTO {
	private String imp_uid;
	private String r_merchant_uid;
	private int ord_no;
	private int total_amount;
	private int discount_amount;
	private int final_amount;
	
	private String pro_name;
	private String image;
	private String pay_no;
	private int total_amouont;
	private String payment_date;
	private int pro_code;
	private String userid;
	private int ord_count;
	private int status;
	private int on_no;
	private String orderdate;
	
	public String getImp_uid() {
		return imp_uid;
	}
	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}
	public String getR_merchant_uid() {
		return r_merchant_uid;
	}
	public void setR_merchant_uid(String r_merchant_uid) {
		this.r_merchant_uid = r_merchant_uid;
	}
	public int getOrd_no() {
		return ord_no;
	}
	public void setOrd_no(int ord_no) {
		this.ord_no = ord_no;
	}
	public int getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(int total_amount) {
		this.total_amount = total_amount;
	}
	public int getDiscount_amount() {
		return discount_amount;
	}
	public void setDiscount_amount(int discount_amount) {
		this.discount_amount = discount_amount;
	}
	public int getFinal_amount() {
		return final_amount;
	}
	public void setFinal_amount(int final_amount) {
		this.final_amount = final_amount;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getPay_no() {
		return pay_no;
	}
	public void setPay_no(String pay_no) {
		this.pay_no = pay_no;
		this.imp_uid = pay_no;
	}
	public int getTotal_amouont() {
		return total_amouont;
	}
	public void setTotal_amouont(int total_amouont) {
		this.total_amouont = total_amouont;
	}
	public String getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}
	public int getPro_code() {
		return pro_code;
	}
	public void setPro_code(int pro_code) {
		this.pro_code = pro_code;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getOrd_count() {
		return ord_count;
	}
	public void setOrd_count(int ord_count) {
		this.ord_count = ord_count;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getOn_no() {
		return on_no;
	}
	public void setOn_no(int on_no) {
		this.on_no = on_no;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	

	
	
	
}
