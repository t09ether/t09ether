package com.t09ether.home.dto;


//오프라인 공동구매 참가자 정보
public class OfflineParticipantDTO {
	private int off_j_no; // 일련번호
	private int off_no;//원글번호
	private String userid; // 참가자 아이디
	private String username;//참가자 이름
	private String tel;//참가자 연락처	
	
	public int getOff_j_no() {
		return off_j_no;
	}
	public void setOff_j_no(int off_j_no) {
		this.off_j_no = off_j_no;
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
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
	
	@Override
	public String toString() {
		return "OfflineParticipantDTO [off_j_no=" + off_j_no + ", off_no=" + off_no + ", userid=" + userid
				+ ", username=" + username + ", tel=" + tel  + "]";
	}
	
	
	
}
