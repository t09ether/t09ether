package com.t09ether.home.dto;

import java.util.List;

public class TempDTO {
	private int tempStop;
	private int writedate;
	private String userid;
	
	//여러개의 레코드 한번에
	private List<String> noList;

	public int getTempStop() {
		return tempStop;
	}

	public void setTempStop(int tempStop) {
		this.tempStop = tempStop;
	}

	public int getWritedate() {
		return writedate;
	}

	public void setWritedate(int writedate) {
		this.writedate = writedate;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public List<String> getNoList() {
		return noList;
	}

	public void setNoList(List<String> noList) {
		this.noList = noList;
	}

}
