package com.t09ether.home.dto;

public class MyPageDTO {
	private String userid;
	private String userpwd;
	private String userpwd1;
	private String username;
	
	private String tel;
	private String tel1;
	private String tel2;
	private String tel3;
	
	private String email;
	private String zipcode;
	private String addr;
	private String addrdetail;
	private String rank;
	private String writedate;
	private int report;
	
	@Override
	public String toString() {
		return "MyPageDTO [userid=" + userid + ", userpwd=" + userpwd + ", userpwd1=" + userpwd1 + ", username="
				+ username + ", tel=" + tel + ", tel1=" + tel1 + ", tel2=" + tel2 + ", tel3=" + tel3 + ", email="
				+ email + ", zipcode=" + zipcode + ", addr=" + addr + ", addrdetail=" + addrdetail + ", rank=" + rank
				+ ", writedate=" + writedate + ", report=" + report + "]";
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	
	public String getUserpwd1() {
		return userpwd1;
	}
	public void setUserpwd1(String userpwd1) {
		this.userpwd1 = userpwd1;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTel() {
		tel = tel1 + "-" + tel2 + "-" + tel3;
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
		
		String telCut[] = tel.split("-");
		tel1=telCut[0];
		tel2=telCut[1];
		tel3=telCut[2];
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddrdetail() {
		return addrdetail;
	}
	public void setAddrdetail(String addrdetail) {
		this.addrdetail = addrdetail;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public int getReport() {
		return report;
	}
	public void setReport(int report) {
		this.report = report;
	}	
}
