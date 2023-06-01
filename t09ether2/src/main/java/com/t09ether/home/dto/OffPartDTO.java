package com.t09ether.home.dto;

public class OffPartDTO {
	private int off_j_no;
	private int off_no;
	private String userid;
	private String username;
	private String tel;
	
	private String off_subject;
    private String off_content;
    private String location;
    private int group_num;
    private int current_num; 
    private String app_time;
    private String deaddate;
    private int off_hit;
    private String writedate;
    private int status;
	
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
	public String getOff_subject() {
		return off_subject;
	}
	public void setOff_subject(String off_subject) {
		this.off_subject = off_subject;
	}
	public String getOff_content() {
		return off_content;
	}
	public void setOff_content(String off_content) {
		this.off_content = off_content;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getGroup_num() {
		return group_num;
	}
	public void setGroup_num(int group_num) {
		this.group_num = group_num;
	}
	public int getCurrent_num() {
		return current_num;
	}
	public void setCurrent_num(int current_num) {
		this.current_num = current_num;
	}
	public String getApp_time() {
		return app_time;
	}
	public void setApp_time(String app_time) {
		this.app_time = app_time;
	}
	public String getDeaddate() {
		return deaddate;
	}
	public void setDeaddate(String deaddate) {
		this.deaddate = deaddate;
	}
	public int getOff_hit() {
		return off_hit;
	}
	public void setOff_hit(int off_hit) {
		this.off_hit = off_hit;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "OffPartDTO [off_j_no=" + off_j_no + ", off_no=" + off_no + ", userid=" + userid + ", username="
				+ username + ", tel=" + tel + ", off_subject=" + off_subject + ", off_content=" + off_content
				+ ", location=" + location + ", group_num=" + group_num + ", current_num=" + current_num + ", app_time="
				+ app_time + ", deaddate=" + deaddate + ", off_hit=" + off_hit + ", writedate=" + writedate
				+ ", status=" + status + "]";
	}
}