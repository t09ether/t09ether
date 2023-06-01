package com.t09ether.home.dto;

public class DataVO {
	private String month;
	private int cnt;
	private String pro_name;
	
	@Override
	public String toString() {
		return "DataVO [month=" + month + ", cnt=" + cnt + ", pro_name=" + pro_name + "]";
	}
	
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
}
