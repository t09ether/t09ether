package com.t09ether.home.dto;

public class OfflineCommentDTO {
	private int comment_no;
	private int off_no;//원글번호
	private String comment09;//댓글
	private String writedate;//작성일
	private String userid;//작성자
	
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public int getOff_no() {
		return off_no;
	}
	public void setOff_no(int off_no) {
		this.off_no = off_no;
	}
	public String getComment09() {
		return comment09;
	}
	public void setComment09(String comment09) {
		this.comment09 = comment09;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	@Override
	public String toString() {
		return "OfflineCommentDTO [comment_no=" + comment_no + ", off_no=" + off_no + ", comment09=" + comment09
				+ ", writedate=" + writedate + ", userid=" + userid + "]";
	}
}
