package com.t09ether.home.dto;

import java.util.List;

//오프라인 공동구매 게시판 글 정보
public class OfflineDTO {
	private int off_no; //글번호
	private String userid;//작성자
	private String off_subject;//글제목
	private String off_content;//글내용
	private String location;//위치
	private int group_num;//모집인원
	private int current_num;//현재인원
	private String app_time;//만남시간
	private String deaddate;//모집마감일
	private int off_hit;//조회수
	private String writedate;//작성일

	private int status;//진행상태 (1: 진행중, 그외 : 완료)

	//여러개의 레코드 한번에 삭제할 때 필요한 레코드 번호
	private List<Integer> noList;
	
	public List<Integer> getNoList() {
		return noList;
	}
	public void setNoList(List<Integer> noList) {
		this.noList = noList;
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
		return "OfflineDTO [off_no=" + off_no + ", userid=" + userid + ", off_subject=" + off_subject + ", off_content="
				+ off_content + ", location=" + location + ", group_num=" + group_num + ", current_num=" + current_num
				+ ", app_time=" + app_time + ", deaddate=" + deaddate + ", off_hit=" + off_hit + ", writedate="
				+ writedate + ", status=" + status + "]";
	}
}
