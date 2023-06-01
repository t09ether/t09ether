package com.t09ether.home.dto;

public class OfflineReviewDTO {
	private int off_r_no;//일련번호
	private int off_no;//원글(공구)번호
	private String userid;//작성자
	private String target_id;//칭찬대상
	private String subject;//제목
	private String content;//내용
	private String writedate;//작성일
	
	public int getOff_r_no() {
		return off_r_no;
	}
	public void setOff_r_no(int off_r_no) {
		this.off_r_no = off_r_no;
	}
	public int getOff_no() {
		return off_no;
	}
	public void setOff_no(int off_no) {
		this.off_no = off_no;
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
	
	public String getTarget_id() {
		return target_id;
	}
	public void setTarget_id(String target_id) {
		this.target_id = target_id;
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
	@Override
	public String toString() {
		return "OfflineReviewDTO [off_r_no=" + off_r_no + ", off_no=" + off_no + ", userid=" + userid + ", target_id="
				+ target_id + ", subject=" + subject + ", content=" + content + ", writedate=" + writedate + "]";
	}
	
	
	
}
