package com.t09ether.home.dto;

public class ReplyDTO {
	private Integer reply_num;
	private int cus_b_num;
	private String userid;
	private String content;
	private String writedate;
	
	
	


	@Override
	public String toString() {
		return "ReplyDTO [reply_num=" + reply_num + ", cus_b_num=" + cus_b_num + ", userid=" + userid + ", content="
				+ content + ", writedate=" + writedate + "W]";
	}


	public Integer getReply_num() {
		return reply_num;
	}


	public void setReply_num(Integer reply_num) {
		this.reply_num = reply_num;
	}


	public int getCus_b_num() {
		return cus_b_num;
	}


	public void setCus_b_num(int cus_b_num) {
		this.cus_b_num = cus_b_num;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
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
