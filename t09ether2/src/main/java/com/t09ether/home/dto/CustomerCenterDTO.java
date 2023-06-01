package com.t09ether.home.dto;

public class CustomerCenterDTO {
	private int cus_b_num; // 글번호
	private String category; // 말머리 종류
	private String userid; // 아이디
	private String subject; // 제목
	private String content; // 내용
	private String writedate; // 작성일

	
	

	@Override
	public String toString() {
		return "CustomerCenterDTO [cus_b_num=" + cus_b_num + ", category=" + category + ", userid=" + userid
				+ ", subject=" + subject + ", content=" + content + ", writedate=" + writedate + "]";
	}


	public int getCus_b_num() {
		return cus_b_num;
	}


	public void setCus_b_num(int cus_b_num) {
		this.cus_b_num = cus_b_num;
	}
	
	
	public String getCategory() {
		return category;
	}

	
	public void setCategory(String category) {
		this.category = category;
	}

	
	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getSubject() {
		return subject;
	}


	public void setSubject(String subject) {
		this.subject = subject;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getWritedate() {
		return writedate;
	}


	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	

}
