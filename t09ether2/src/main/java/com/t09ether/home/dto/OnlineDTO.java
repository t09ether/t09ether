package com.t09ether.home.dto;

public class OnlineDTO {
	private int on_no;
	private int pro_code;
	private int on_count;
	private String find_addr;
	private int hit;
	private String userid;
	private String shareaddr;
	private String sharedetail;
	private int rest_count;
	
	private String pro_name;
	private int pro_price;
	private String pro_stock;
	private String image;
	private String detailed;
	
	
	
	
	
	@Override
	public String toString() {
		return "OnlineDTO [on_no=" + on_no + ", pro_code=" + pro_code + ", on_count=" + on_count + ", find_addr="
				+ find_addr + ", hit=" + hit + ", userid=" + userid + ", shareaddr=" + shareaddr + ", sharedetail="
				+ sharedetail + ", rest_count=" + rest_count + ", pro_name=" + pro_name + ", pro_price=" + pro_price
				+ ", pro_stock=" + pro_stock + ", image=" + image + ", detailed=" + detailed + "]";
	}
	public int getOn_no() {
		return on_no;
	}
	public void setOn_no(int on_no) {
		this.on_no = on_no;
	}
	public int getPro_code() {
		return pro_code;
	}
	public void setPro_code(int pro_code) {
		this.pro_code = pro_code;
	}
	public int getOn_count() {
		return on_count;
	}
	public void setOn_count(int on_count) {
		this.on_count = on_count;
	}
	public String getFind_addr() {
		return find_addr;
	}
	public void setFind_addr(String find_addr) {
		this.find_addr = find_addr;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public String getShareaddr() {
		return shareaddr;
	}
	public void setShareaddr(String shareaddr) {
		this.shareaddr = shareaddr;
	}
	public String getSharedetail() {
		return sharedetail;
	}
	public void setSharedetail(String sharedetail) {
		this.sharedetail = sharedetail;
	}
	
	public int getRest_count() {
		return rest_count;
	}

	public void setRest_count(int rest_count) {
		this.rest_count = rest_count;
	}

	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	public String getPro_stock() {
		return pro_stock;
	}
	public void setPro_stock(String pro_stock) {
		this.pro_stock = pro_stock;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getDetailed() {
		return detailed;
	}
	public void setDetailed(String detailed) {
		this.detailed = detailed;
	}
	
	
}
